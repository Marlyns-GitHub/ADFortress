<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Fortify User Rights Assigment
#>

# Importing Variables

. ./input/myvars.ps1
. ./input/tiering_vars.ps1
Write-Progress -Activity "Running ADFortress" -Status "Gathering Default domain Controllers GPO information " -PercentComplete 15
Start-Sleep -Seconds 2

# Default GPO Checking

$DefaultGPO = "Default Domain Policy",
              "Default Domain Controllers Policy"

foreach ( $GPO in $DefaultGPO ){
    
    if ($GPO -eq $DefaultGPO[1]){
        
       $001Id = (Get-GPO -Name $DefaultGPO[1]).Id.ToString()
       $PathDomainCtrlPolicy = Get-Item "$NewItem\{$($001Id)}\Machine\Microsoft\Windows NT\SecEdit"
       $GptTmplPath = "$PathDomainCtrlPolicy\GptTmpl.inf"
       $GptIniPath = "$NewItem\{$($001Id)}\GPT.INI"
       Write-Progress -Activity "Running ADFortress" -Status "Checking $GPO " -PercentComplete 25
       Start-Sleep -Seconds 2
    }
}

if (
        ($check0 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $GroupT0.Group[0]).DistinguishedName) -and
        ($check1 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $GroupT2.Group[2]).DistinguishedName)
   )
   {
		# Tier 2 Security Groups
		$HelpdeskT2Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT2.Group[2]).Sid.Value
        $AdminT0Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT0.Group[0]).Sid.Value
   }
else 
   {
        write-warning "This script depends on the task [5] Implement Active Directory Tiering Model."
	    exit
   }

$PathPolicy = (Get-ADObject -Filter 'Name -eq "Policies"' -Properties * | Where-Object ObjectClass -eq container | Select-Object Name, distinguishedName).DistinguishedName    
$VersionNumber = (Get-ADObject "CN={$($001Id)},$PathPolicy" -Properties *)

$VersionNumber.versionNumber | ForEach {

       $InitialVNumber = $VersionNumber.versionNumber
       $NewVersionNumber = 34
       $ResultVNumber = [int]"$InitialVNumber" + [int]"$NewVersionNumber"

    if ( $VersionNumber.versionNumber -eq "1" )
        {
            Write-Progress -Activity "Running ADFortress" -Status "Importing User Right Assignments" -PercentComplete 50
            Start-Sleep -Seconds 2

            function DefaultDomainControllersPolicy () 
                {
     
                    $Backup = "^SeBackupPrivilege.*"
                    $BatchLogonRight = "^SeBatchLogonRight.*"
                    $InteractiveLogonRight = "^SeInteractiveLogonRight.*"
                    $LoadDriver = "^SeLoadDriverPrivilege.*"
                    $MachineAccount = "^SeMachineAccountPrivilege.*"
                    $NetworkLogonRight = "^SeNetworkLogonRight.*"
                    $RemoteShutdown = "^SeRemoteShutdownPrivilege.*"
                    $Restore = "^SeRestorePrivilege.*"
                    $Shutdown = "^SeShutdownPrivilege.*"
                    $SystemTime = "^SeSystemTimePrivilege.*"

                    # Change Compliance CIS Benchmark

                    $URABackup = "SeBackupPrivilege = *$AdminsSid"
                    $URABatchlogonRight = "SeBatchLogonRight = *$BackupSid,*$AdminsSid"
                    $URAInteractiveLogonRight = "SeInteractiveLogonRight = *$BackupSid,*$AdminsSid"
                    $URALoadDriver = "SeLoadDriverPrivilege = *$AdminsSid"
                    $URAMachineAccount = "SeMachineAccountPrivilege = *$DASid,*$HelpdeskT2Sid"
                    $URANetworkLogonRight = "SeNetworkLogonRight = *$EnterpriseDCSid,*$AuthUserSid,*$AdminsSid"
                    $URARemoteShutdown = "SeRemoteShutdownPrivilege = *$AdminsSid"
                    $URARestore = "SeRestorePrivilege = *$AdminsSid"
                    $URAShutdown = "SeShutdownPrivilege = *$AdminsSid"
                    $URASystemTime = "SeSystemTimePrivilege = *$AdminsSid,*$LocalSrvSid"
          
                    # Add those lines after this pattern SeEnableDelegationPrivilege
                    $URARemoteInteractiveLogonRight = "SeRemoteInteractiveLogonRight = *$AdminT0Sid"
                    $URATimeZone = "SeTimeZonePrivilege = *$LocalSrvSid,*$AdminsSid"
                    $URACreateGlobal = "SeCreateGlobalPrivilege = *$ServiceSid,*$NetworkSrvSid,*$LocalSrvSid,*$AdminsSid"
                    $URACreateSymbolic = "SeCreateSymbolicLinkPrivilege = *$AdminsSid"
                    $URADenyNetLogonRight = "SeDenyNetworkLogonRight = *$GuestsSid"
                    $URADenyBatchLogonRight = "SeDenyBatchLogonRight = *$GuestsSid"
                    $URADenyServiceLogonRight = "SeDenyServiceLogonRight = *$GuestsSid"
                    $URADenyInteractiveLogonRight = "SeDenyInteractiveLogonRight = *$GuestsSid"
                    $URADenyRemoteInteractiveLogonRight = "SeDenyRemoteInteractiveLogonRight = *$GuestsSid"
                    $URAImpersonate = "SeImpersonatePrivilege = *$ServiceSid,*$NetworkSrvSid,*$LocalSrvSid,*$AdminsSid"
                    $URAIncreaseWorking = "SeIncreaseWorkingSetPrivilege = *$AdminsSid"
                    $URAMangeVolume = "SeManageVolumePrivilege = *$AdminsSid"
          
                    function Backup (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA1 = $DCContent -replace $Backup, $URABackup
                        Set-Content $GptTmplPath $URA1
                    }
                    Backup

                    function BatchLogon (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA2 = $DCContent -replace $BatchLogonRight, $URABatchLogonRight
                        Set-Content $GptTmplPath $URA2
                    }
                    BatchLogon         

                    function InteractiveLogon (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA3 = $DCContent -replace $InteractiveLogonRight, $URAInteractiveLogonRight
                        Set-Content $GptTmplPath $URA3
                    }
                    InteractiveLogon

                    function LoadDriver (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA4 = $DCContent -replace $LoadDriver, $URALoadDriver
                        Set-Content $GptTmplPath $URA4
                    }
                    LoadDriver

                    function MachineAccount (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA5 = $DCContent -replace $MachineAccount, $URAMachineAccount
                        Set-Content $GptTmplPath $URA5
                    }
                    MachineAccount

                    function NetworkLogon (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA6 = $DCContent -replace $NetworkLogonRight, $URANetworkLogonRight
                        Set-Content $GptTmplPath $URA6
                    }
                    NetworkLogon

                    function RemoteShutdown (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA7 = $DCContent -replace $RemoteShutdown, $URARemoteShutdown
                        Set-Content $GptTmplPath $URA7
                    }
                    RemoteShutdown

                    function Restore (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA8 = $DCContent -replace $Restore, $URARestore
                        Set-Content $GptTmplPath $URA8
                    }
                    Restore

                    function Shutdown (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA9 = $DCContent -replace $Shutdown, $URAShutdown
                        Set-Content $GptTmplPath $URA9
                    }
                    Shutdown

                    function SystemTime (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA10 = $DCContent -replace $SystemTime, $URASystemTime
                        Set-Content $GptTmplPath $URA10
                    }
                    SystemTime

                    #Add New line after a Pattern LockoutBadCount and Registy Values
                    $GptTmplPathVars = Get-Content $GptTmplPath | ForEach-Object {
     
                        $_
                        if ($_ -match "SeEnableDelegationPrivilege")
                            {
                                $URARemoteInteractiveLogonRight
                                $URATimeZone
                                $URACreateGlobal
                                $URACreateSymbolic
                                $URADenyNetLogonRight
                                $URADenyBatchLogonRight
                                $URADenyServiceLogonRight
                                $URADenyInteractiveLogonRight
                                $URADenyRemoteInteractiveLogonRight
                                $URAImpersonate
                                $URAIncreaseWorking
                                $URAMangeVolume
                            }
                    } 

                    $GptTmplPathVars > $GptTmplPath

                    # Edit GPT.INI and update Sysvol versionNumber
                    Write-Progress -Activity "Running ADFortress" -Status "Creating t0admin default Tiering Admin account" -PercentComplete 95
                    Start-Sleep -Seconds 2
                
                    $DCGptContent = Get-Content $GptIniPath
                    $DCGptContent = $DCGptContent -replace "Version=1", "Version=35"
                    Set-Content $GptIniPath $DCGptContent

                    # Update AD versionNumber

                    $VersionNumber = (Get-ADObject "CN={$($001Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumber -Replace @{versionNumber="35"}

                    # Create default T0 Admin for Domain Remote Access
                    
                    $csvFilePath = "$TmplPathFile\users.csv"
                    $dnsroot = '@' + (Get-ADDomain).dnsroot
                    $users = Import-Csv $csvFilePath

                    foreach ($user in $users) {
                        $newUserParams = @{
                            Name                = $user.DisplayName
                            GivenName           = $user.FirstName
                            Surname             = $user.LastName
                            SamAccountName       = $user.SamAccountName
                            UserPrincipalName   = $user.SamAccountName + $dnsroot
                            Path                = "OU=Admins,OU=Tier0,$ParentOu"
                            AccountPassword     = ConvertTo-SecureString $user.Password -AsPlainText -Force
                            Enabled             = [bool]$user.Enabled  # Convert string to boolean
                        }

                        try {
                                New-ADUser @newUserParams
                                Write-Host "User $($user.SamAccountName):$($user.Password) created successfully!" -ForegroundColor Red
                            }
                        catch 
                            {
                               Write-Error "Error creating user $($user.SamAccountName): $($_.Exception.Message)"
                            }
                    }
                    # Add users to Groups
                    Add-ADGroupMember -Identity $GroupT0.Group[0] -Members t0admin
                    Add-ADGroupMember -Identity $GroupT0.Group[7] -Members t0admin
                    Add-ADGroupMember -Identity $DAName -Members $GroupT0.Group[0]
                    write-warning "Change the default password of the t0admin user account."
                    write-warning "Use t0admin User account to connect to the Domain Controller."
                }

                # Launch the functions
                Write-Progress -Activity "Running ADFortress" -Status "Fortifying User Right Assignments" -PercentComplete 75
                Start-Sleep -Seconds 2
                
                DefaultDomainControllersPolicy
                $command = gpupdate /force

                Start-Sleep -Seconds 2
                Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

    elseif ( $VersionNumber.versionNumber -eq "35" )  
        {
              $Pattern = "SeNetworkLogonRight",
                         "SeInteractiveLogonRight",
                         "SeRemoteInteractiveLogonRight",
                         "SeBatchLogonRight",
                         "SeMachineAccountPrivilege",
                         "SeDenyNetworkLogonRight",
                         "SeDenyBatchLogonRight",
                         "SeDenyServiceLogonRight",
                         "SeDenyInteractiveLogonRight",
                         "SeDenyRemoteInteractiveLogonRight"
                         
              Write-Progress -Activity "Running ADFortress" -Status "Checking User Right Assignments already fortified" -PercentComplete 50
              Start-Sleep -Seconds 2
              $CheckContent = Get-Content $GptTmplPath
              $Content = $CheckContent | Select-String $Pattern          
			  Write-Host "User Rights Assignment already fortified" -ForegroundColor DarkGray   
        }    

    elseif ( $DefaultT0User -eq "t0admin" )            
        {
              $Pattern = "SeNetworkLogonRight",
                         "SeInteractiveLogonRight",
                         "SeRemoteInteractiveLogonRight",
                         "SeBatchLogonRight",
                         "SeMachineAccountPrivilege",
                         "SeDenyNetworkLogonRight",
                         "SeDenyBatchLogonRight",
                         "SeDenyServiceLogonRight",
                         "SeDenyInteractiveLogonRight",
                         "SeDenyRemoteInteractiveLogonRight"

              Write-Progress -Activity "Running ADFortress" -Status "User Right Assignments already fortified" -PercentComplete 50
              Start-Sleep -Seconds 2

              $CheckContent = Get-Content $GptTmplPath
              $Content = $CheckContent | Select-String $Pattern
              Write-Host "User Rights Assignment already fortified" -ForegroundColor DarkGray     
        }   
    else
        {
            Write-Progress -Activity "Running ADFortress" -Status "Importing User Right Assignments" -PercentComplete 50
            Start-Sleep -Seconds 2

            function DefaultDomainControllersPolicy 
                {
     
                    $Backup = "^SeBackupPrivilege.*"
                    $BatchLogonRight = "^SeBatchLogonRight.*"
                    $InteractiveLogonRight = "^SeInteractiveLogonRight.*"
                    $LoadDriver = "^SeLoadDriverPrivilege.*"
                    $MachineAccount = "^SeMachineAccountPrivilege.*"
                    $NetworkLogonRight = "^SeNetworkLogonRight.*"
                    $RemoteShutdown = "^SeRemoteShutdownPrivilege.*"
                    $Restore = "^SeRestorePrivilege.*"
                    $Shutdown = "^SeShutdownPrivilege.*"
                    $SystemTime = "^SeSystemTimePrivilege.*"

                    # Change Compliance CIS Benchmark

                    $URABackup = "SeBackupPrivilege = *$AdminsSid"
                    $URABatchlogonRight = "SeBatchLogonRight = *$BackupSid,*$AdminsSid"
                    $URAInteractiveLogonRight = "SeInteractiveLogonRight = *$BackupSid,*$AdminsSid"
                    $URALoadDriver = "SeLoadDriverPrivilege = *$AdminsSid"
                    $URAMachineAccount = "SeMachineAccountPrivilege = *$DASid,*$HelpdeskT2Sid"
                    $URANetworkLogonRight = "SeNetworkLogonRight = *$EnterpriseDCSid,*$AuthUserSid,*$AdminsSid"
                    $URARemoteShutdown = "SeRemoteShutdownPrivilege = *$AdminsSid"
                    $URARestore = "SeRestorePrivilege = *$AdminsSid"
                    $URAShutdown = "SeShutdownPrivilege = *$AdminsSid"
                    $URASystemTime = "SeSystemTimePrivilege = *$AdminsSid,*$LocalSrvSid"
          
                    # Add those lines after this pattern SeEnableDelegationPrivilege
                    $URARemoteInteractiveLogonRight = "SeRemoteInteractiveLogonRight = *$AdminT0Sid"
                    $URATimeZone = "SeTimeZonePrivilege = *$LocalSrvSid,*$AdminsSid"
                    $URACreateGlobal = "SeCreateGlobalPrivilege = *$ServiceSid,*$NetworkSrvSid,*$LocalSrvSid,*$AdminsSid"
                    $URACreateSymbolic = "SeCreateSymbolicLinkPrivilege = *$AdminsSid"
                    $URADenyNetLogonRight = "SeDenyNetworkLogonRight = *$GuestsSid"
                    $URADenyBatchLogonRight = "SeDenyBatchLogonRight = *$GuestsSid"
                    $URADenyServiceLogonRight = "SeDenyServiceLogonRight = *$GuestsSid"
                    $URADenyInteractiveLogonRight = "SeDenyInteractiveLogonRight = *$GuestsSid"
                    $URADenyRemoteInteractiveLogonRight = "SeDenyRemoteInteractiveLogonRight = *$GuestsSid"
                    $URAImpersonate = "SeImpersonatePrivilege = *$ServiceSid,*$NetworkSrvSid,*$LocalSrvSid,*$AdminsSid"
                    $URAIncreaseWorking = "SeIncreaseWorkingSetPrivilege = *$AdminsSid"
                    $URAMangeVolume = "SeManageVolumePrivilege = *$AdminsSid"
          
                    function Backup (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA1 = $DCContent -replace $Backup, $URABackup
                        Set-Content $GptTmplPath $URA1
                    }
                    Backup

                    function BatchLogon (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA2 = $DCContent -replace $BatchLogonRight, $URABatchLogonRight
                        Set-Content $GptTmplPath $URA2
                    }
                    BatchLogon         

                    function InteractiveLogon (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA3 = $DCContent -replace $InteractiveLogonRight, $URAInteractiveLogonRight
                        Set-Content $GptTmplPath $URA3
                    }
                    InteractiveLogon

                    function LoadDriver (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA4 = $DCContent -replace $LoadDriver, $URALoadDriver
                        Set-Content $GptTmplPath $URA4
                    }
                    LoadDriver

                    function MachineAccount (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA5 = $DCContent -replace $MachineAccount, $URAMachineAccount
                        Set-Content $GptTmplPath $URA5
                    }
                    MachineAccount

                    function NetworkLogon (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA6 = $DCContent -replace $NetworkLogonRight, $URANetworkLogonRight
                        Set-Content $GptTmplPath $URA6
                    }
                    NetworkLogon

                    function RemoteShutdown (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA7 = $DCContent -replace $RemoteShutdown, $URARemoteShutdown
                        Set-Content $GptTmplPath $URA7
                    }
                    RemoteShutdown

                    function Restore (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA8 = $DCContent -replace $Restore, $URARestore
                        Set-Content $GptTmplPath $URA8
                    }
                    Restore

                    function Shutdown (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA9 = $DCContent -replace $Shutdown, $URAShutdown
                        Set-Content $GptTmplPath $URA9
                    }
                    Shutdown

                    function SystemTime (){
                        $DCContent = Get-Content $GptTmplPath
                        $URA10 = $DCContent -replace $SystemTime, $URASystemTime
                        Set-Content $GptTmplPath $URA10
                    }
                    SystemTime

                    #Add New line after a Pattern LockoutBadCount and Registy Values
                    $GptTmplPathVars = Get-Content $GptTmplPath | ForEach-Object {
     
                        $_
                        if ($_ -match "SeEnableDelegationPrivilege")
                            {
                                $URARemoteInteractiveLogonRight
                                $URATimeZone
                                $URACreateGlobal
                                $URACreateSymbolic
                                $URADenyNetLogonRight
                                $URADenyBatchLogonRight
                                $URADenyServiceLogonRight
                                $URADenyInteractiveLogonRight
                                $URADenyRemoteInteractiveLogonRight
                                $URAImpersonate
                                $URAIncreaseWorking
                                $URAMangeVolume
                            }
                    } 

                    $GptTmplPathVars > $GptTmplPath

                    # Edit GPT.INI and update Sysvol versionNumber
                    Write-Progress -Activity "Running ADFortress" -Status "Creating t0admin default Tiering Admin account" -PercentComplete 95
                    Start-Sleep -Seconds 2

                    $DCGptContent = Get-Content $GptIniPath
                    $DCGptContent = $DCGptContent -replace "Version=$InitialVNumber", "Version=$ResultVNumber"
                    Set-Content $GptIniPath $DCGptContent

                    # Update AD versionNumber

                    $VersionNumber = (Get-ADObject "CN={$($001Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumber -Replace @{versionNumber="$ResultVNumber"}

                    # Create default T0 Admin for Domain Remote Access
                    $csvFilePath = "$TmplPathFile\users.csv"
                    $dnsroot = '@' + (Get-ADDomain).dnsroot
                    $users = Import-Csv $csvFilePath

                    foreach ($user in $users) {
                        $newUserParams = @{
                            Name                = $user.DisplayName
                            GivenName           = $user.FirstName
                            Surname             = $user.LastName
                            SamAccountName       = $user.SamAccountName
                            UserPrincipalName   = $user.SamAccountName + $dnsroot
                            Path                = "OU=Admins,OU=Tier0,$ParentOu"
                            AccountPassword     = ConvertTo-SecureString $user.Password -AsPlainText -Force
                            Enabled             = [bool]$user.Enabled  # Convert string to boolean
                        }

                        try {
                                New-ADUser @newUserParams
                                Write-Host "User $($user.SamAccountName):$($user.Password) created successfully!" -ForegroundColor Red
                            }
                        catch 
                            {
                               Write-Error "Error creating user $($user.SamAccountName): $($_.Exception.Message)"
                            }
                    }
                    # Add users to Groups
                    Add-ADGroupMember -Identity $GroupT0.Group[0] -Members t0admin
                    Add-ADGroupMember -Identity $GroupT0.Group[7] -Members t0admin
                    Add-ADGroupMember -Identity $DAName -Members $GroupT0.Group[0]
                    write-warning "Change the default password of the t0admin user account."
                    write-warning "Use t0admin User account to connect to the Domain Controller."
                }

                # Launch the functions
                Write-Progress -Activity "Running ADFortress" -Status "Fortifying User Right Assignments" -PercentComplete 75
                Start-Sleep -Seconds 2

                DefaultDomainControllersPolicy
                $command = gpupdate /force

                Start-Sleep -Seconds 2
                Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }
}