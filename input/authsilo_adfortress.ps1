<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Implement Authentication Policy & Silos
#>

# Importing Variables

. ./input/myvars.ps1
Write-Progress -Activity "Running ADFortress" -Status "Gathering domain information" -PercentComplete 15
Start-Sleep -Seconds 2

# Authentication Policy & Silos

$Checks = "C:\GPOList.csv"
$AuthPolicyName = "RestrictedLogonT0"
$AuthSiloName = "RestrictedLogonT0Silo"
$DomainAuthSiloDevices = "Domain Tier0 AuthSilo Devices"
$DomainAuthSiloGroupMembers = "Domain Tier0 AuthSilo Members"

try {
        $CheckAuthPolicy = (Get-ADAuthenticationPolicy -Filter * -Properties * | Select-Object Name, DistinguishedName).Name
        $PAWComputerAuthFrom = (Get-ADComputer -Filter * -Properties memberof | Where {$_.Name -match "PAW*"} | Select-Object Name, MemberOf)
        $CheckAuthSiloGroupMembers = (Get-ADGroupMember -Identity $DomainAuthSiloGroupMembers | Select-Object Name, DistinguishedName).Name
   }
catch
    {
        Write-Warning "$_"
    }

$GPOLists = "FORTRESS-KDCClients",
            "FORTRESS-KDCDomainControllers"

if (($PAWComputerAuthFrom.memberof -match $DomainAuthSiloDevices) -and
    ($null -ne $CheckAuthSiloGroupMembers)
    )  
    {
        if ((Get-Content $Checks | Select-String -Pattern "FORTRESS-KDCClients") -and
            (Get-Content $Checks | Select-String -Pattern "FORTRESS-KDCDomainControllers")
            )  
            {
                Write-Progress -Activity "Running ADFortress" -Status "Checking GPO if already exist" -PercentComplete 25
                Start-Sleep -Seconds 2
                $000Id = (Get-GPO -Name $GPOLists[0]).Id.ToString()
                $001Id = (Get-GPO -Name $GPOLists[1]).Id.ToString()
            }
        else
            {
                # Creating Group Policies
                foreach ($GPOList in $GPOLists)
                    {
                        try{
                                $CreateGPOs = New-GPO -Name $GPOList -ErrorAction SilentlyContinue
                                Write-Progress -Activity "Running ADFortress" -Status "Creating GPO $GPOList" -PercentComplete 25
                                Start-Sleep -Seconds 2
                            }
                        catch
                            {
                                Write-Warning $_
                            }
                    }
                
                $000Id = (Get-GPO -Name $GPOLists[0]).Id.ToString()
                $001Id = (Get-GPO -Name $GPOLists[1]).Id.ToString()
                
                $RegistryPolPath0 = "\\$Hostname\Sysvol\$Domain\Policies\{$($000Id)}\Machine"
                $RegistryPolPath1 = "\\$Hostname\Sysvol\$Domain\Policies\{$($001Id)}\Machine"
                
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath0
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath1

                $Cmtxfile0 = "$RegistryPolPath0\comment.cmtx"
                $Cmtxfile1 = "$RegistryPolPath1\comment.cmtx"
            }
    }
else 
    {
       Write-Warning -Message "This task depends on the tasks [5] Implement AD Tiering Model & [7] Fortify User Rights Assignment."
       Write-Warning -Message "Make sure that the security group $DomainAuthSiloDevices contains the PAW Devices."
       Write-Warning -Message "Also the security Group $DomainAuthSiloGroupMembers exists and is not empty."
       exit
    }

$PathPolicy = (Get-ADObject -Filter 'Name -eq "Policies"' -Properties * | Where-Object ObjectClass -eq container | Select-Object Name, distinguishedName).DistinguishedName    
Write-Progress -Activity "Running ADFortress" -Status "Importing GPO Informations" -PercentComplete 45
Start-Sleep -Seconds 2

function Set-AuthSilo {
    function Set-KDCClient (){
    
        $VersionNumber = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "1" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray                       
                }
            else 
                {        
                    $Linkgpo = New-GPLink -Name $GPOLists[0] -Target $DomainDistinguishedName

                    # Modify content to comment.cmtx file
                    $Pattern = "CISTemplate"
                    $PatternReplace = "Microsoft.Policies.Kerberos"

                    $Content = Get-Content $Cmtxfile0
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile0 $Content
                
                    $Params = @{
                    Key = "Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters"
                    ValueName = "EnableCbacAndArmor"
                    Type = "DWORD"
                    Value = 00000001
                    }

                    $StdOut = Set-GPRegistryValue -Name $GPOLists[0] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                }
        }
    }

    # KDC Server
    function Set-KDCDomainCtrl (){
    
        $VersionNumber = (Get-ADObject "CN={$($001Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray                          
                }
            else 
                {        
                    $Linkgpo = New-GPLink -Name $GPOLists[1] -Target $DomainControllersContainer

                    # Modify content to comment.cmtx file
                    $Pattern = "CISTemplate"
                    $PatternReplace = "Microsoft.Policies.KDC"

                    $Content = Get-Content $Cmtxfile1
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile1 $Content
                
                    $Params = @{
                    Key = "Software\Microsoft\Windows\CurrentVersion\Policies\System\KDC\Parameters"
                    ValueName = "EnableCbacAndArmor"
                    ValueName1 = "CbacAndArmorLevel"
                    Type = "DWORD"
                    Value = 00000001
                    }

                    $StdOut = Set-GPRegistryValue -Name $GPOLists[1] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[1] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.Value
                }
        }
    }

    Function Set-AuthNPolicy {

        if ($CheckAuthPolicy -eq $AuthPolicyName)
            {
                Write-Host "Authentication policy and silos already configured." -ForegroundColor DarkGray
            }
        else
            {
                # Configuring Authentication Policy.
                $Parameters = @{
                        Name                            = $AuthPolicyName
                        Description                     = 'Logon for privileged accounts'
                        UserTGTLifetimeMins             = 90
                        ProtectedFromAccidentalDeletion = $true
                }

                New-ADAuthenticationPolicy @Parameters -Enforce

                # Configuring Authentication Policy Silos.
                $Parameters = @{
                        Name                            = $AuthSiloName
                        Description                     = 'Silo for privilege accounts'
                        ProtectedFromAccidentalDeletion = $true
                        ComputerAuthenticationPolicy    = (Get-ADAuthenticationpolicy -Identity $AuthPolicyName)
                        ServiceAuthenticationPolicy     = (Get-ADAuthenticationpolicy -Identity $AuthPolicyName)
                        UserAuthenticationPolicy        = (Get-ADAuthenticationpolicy -Identity $AuthPolicyName)
                }

                New-ADAuthenticationPolicySilo @Parameters -Enforce
                
                # Step 2  : Adding users and Computers in the silo
                Write-Progress -Activity "Authentication silos" -Status "Adding Accounts in the Silo" -Id 2 -ParentId 1 -PercentComplete 75
                Start-Sleep -Seconds 2

                Get-ADDomainController -Filter {IsReadOnly -eq $False} | ForEach-Object {Grant-ADAuthenticationPolicySiloAccess -Identity $AuthSiloName -Account $_.ComputerObjectDN}
                Get-ADGroupMember -Identity $DomainAuthSiloDevices | ForEach-Object {Grant-ADAuthenticationPolicySiloAccess -Identity $AuthSiloName -Account $_.DistinguishedName}
                Get-ADGroupMember -Identity $DomainAuthSiloGroupMembers  | ForEach-Object {Grant-ADAuthenticationPolicySiloAccess -Identity $AuthSiloName -Account $_.DistinguishedName}

                # Step 3 : Assign Permissions Accounts
                Write-Progress -Activity "Authentication silos" -Status "Assigning Permissions Accounts" -Id 2 -ParentId 1 -PercentComplete 80
                Start-Sleep -Seconds 2

                Get-ADGroupMember -Identity $DomainAuthSiloGroupMembers | Set-ADAccountAuthenticationPolicySilo -AuthenticationPolicySilo $AuthSiloName
                Get-ADComputer -LDAPFilter "(&(&(&(samAccountType=805306369)(useraccountcontrol:1.2.840.113556.1.4.803:=8192))))" | Set-ADAccountAuthenticationPolicySilo -AuthenticationPolicySilo $AuthSiloName # Domain Controller
                Get-ADGroupMember -Identity $DomainAuthSiloDevices | Set-ADAccountAuthenticationPolicySilo -AuthenticationPolicySilo $AuthSiloName

                # Step 4 : Create Auth policy conditions
                Write-Progress -Activity "Authentication silos" -Status "Creating Authentication Policy condition" -Id 2 -ParentId 1 -PercentComplete 85
                Start-Sleep -Seconds 2
                
                Set-ADAuthenticationPolicy -Identity $AuthPolicyName `
                            -UserAllowedToAuthenticateFrom "O:SYG:SYD:(XA;OICI;CR;;;WD;(@USER.ad://ext/AuthenticationSilo == `"$($AuthSiloName)`"))"  
            }
    }
    
    # Running functions
    Write-Progress -Activity "Running ADFortress" -Status "Configuring KDC support for claims and Kerberos armoring" -PercentComplete 60
    Start-Sleep -Seconds 2
    Set-KDCClient
    Set-KDCDomainCtrl
    Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed

    Write-Progress -Activity "Running ADFortress" -Status "Configuring Authentication silos" -id 1 -PercentComplete 70
    Start-Sleep -Seconds 2
    Set-AuthNPolicy
    
    # Update and Reboot the domain controller
    $command = gpupdate /force
    Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
    Start-Sleep -Seconds 2
    Shutdown -r
}

# Run function
Set-AuthSilo