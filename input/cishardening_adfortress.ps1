<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : CIS Hardening Compliance
#>

# Importing Variables

. ./input/myvars.ps1
Write-Progress -Activity "Running ADFortress" -Status "Gathering domain information" -PercentComplete 15
Start-Sleep -Seconds 2

# Script body
$ExportGPO = "C:\GPOList.csv"

# Script body
$GPOLists = "FORTRESS-UserScreenProtection",
            "FORTRESS-DisablePasswordReveal",
            "FORTRESS-DisabledUSBPorts",
            "FORTRESS-DisabledAutoRun",
            "FORTRESS-DisabledSMBEnumeration",
            "FORTRESS-SMBSigning",
            "FORTRESS-RDPSettings",
            "FORTRESS-RDPSessionTimeOut",
            "FORTRESS-WinRM",
            "FORTRESS-RPC",
            "FORTRESS-RemoteShell&Assistance",
            "FORTRESS-InteractiveLogon",
            "FORTRESS-Accounts",
            "FORTRESS-UserAccountControl",
            "FORTRESS-HardenedUNCPaths",
            "FORTRESS-ProtectionCredential",
            "FORTRESS-ProtectionDelegation",
            "FORTRESS-LSAProtection",
            "FORTRESS-DisabledInternetExplorer"

if ((Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-UserScreenProtection") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisablePasswordReveal") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledUSBPorts") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledAutoRun") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledSMBEnumeration") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-SMBSigning") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RDPSettings") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RDPSessionTimeOut") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-WinRM") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RPC") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RemoteShell&Assistance") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-InteractiveLogon") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-Accounts") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-UserAccountControl") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-HardenedUNCPaths") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-ProtectionCredential") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-ProtectionDelegation") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LSAProtection") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledInternetExplorer")
   )
    {
        Write-Progress -Activity "Running ADFortress" -Status "Checking GPO already exist" -PercentComplete 25
        Start-Sleep -Seconds 2
    }
else
    {
        # Creating Group Policies
        foreach ($GPOList in $GPOLists)
            {
                try{
                        $CreateGPOs = New-GPO -Name $GPOList -ErrorAction SilentlyContinue
                        $Linkgpo = New-GPLink -Name $GPOList -Target $DomainDistinguishedName
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
        $002Id = (Get-GPO -Name $GPOLists[2]).Id.ToString()
        $003Id = (Get-GPO -Name $GPOLists[3]).Id.ToString()
        $004Id = (Get-GPO -Name $GPOLists[4]).Id.ToString()
        $005Id = (Get-GPO -Name $GPOLists[5]).Id.ToString()
        $006Id = (Get-GPO -Name $GPOLists[6]).Id.ToString()
        $007Id = (Get-GPO -Name $GPOLists[7]).Id.ToString()
        $008Id = (Get-GPO -Name $GPOLists[8]).Id.ToString()
        $009Id = (Get-GPO -Name $GPOLists[9]).Id.ToString()
        $010Id = (Get-GPO -Name $GPOLists[10]).Id.ToString()
        $011Id = (Get-GPO -Name $GPOLists[11]).Id.ToString()
        $012Id = (Get-GPO -Name $GPOLists[12]).Id.ToString()
        $013Id = (Get-GPO -Name $GPOLists[13]).Id.ToString()
        $014Id = (Get-GPO -Name $GPOLists[14]).Id.ToString()
        $015Id = (Get-GPO -Name $GPOLists[15]).Id.ToString()
        $016Id = (Get-GPO -Name $GPOLists[16]).Id.ToString()
        $017Id = (Get-GPO -Name $GPOLists[17]).Id.ToString()
        $018Id = (Get-GPO -Name $GPOLists[18]).Id.ToString()

        try {
                $RegistryPolPath0 = "$NewItem\{$($000Id)}\User"
                $RegistryPolPath1 = "$NewItem\{$($001Id)}\Machine"
                $RegistryPolPath2 = "$NewItem\{$($002Id)}\Machine"
                $RegistryPolPath3 = "$NewItem\{$($003Id)}\Machine"
                $RegistryPolPath6 = "$NewItem\{$($006Id)}\Machine"
                $RegistryPolPath7 = "$NewItem\{$($007Id)}\Machine"
                $RegistryPolPath8 = "$NewItem\{$($008Id)}\Machine"
                $RegistryPolPath9 = "$NewItem\{$($009Id)}\Machine"
                $RegistryPolPath10 = "$NewItem\{$($010Id)}\Machine"
                $RegistryPolPath14 = "$NewItem\{$($014Id)}\Machine"
                $RegistryPolPath15 = "$NewItem\{$($015Id)}\Machine"
                $RegistryPolPath16 = "$NewItem\{$($016Id)}\Machine"
                $RegistryPolPath17 = "$NewItem\{$($017Id)}\Machine"
                $RegistryPolPath18 = "$NewItem\{$($018Id)}\Machine"

                $SecEdit0 = New-Item "$NewItem\{$($004Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit1 = New-Item "$NewItem\{$($005Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit2 = New-Item "$NewItem\{$($011Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit3 = New-Item "$NewItem\{$($012Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit4 = New-Item "$NewItem\{$($013Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue

                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit0
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit1
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit2
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit3
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit4
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath0
                $Template = Copy-Item -Path "$TmplPathSecEdit\$RegPolPath" -Destination $RegistryPolPath0
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath1
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath2
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath3
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath6
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath7
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath8
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath9
                $Template = Copy-Item -Path "$TmplPathXml\comments.cmtx" -Destination "$RegistryPolPath10\comment.cmtx"
                $Template = Copy-Item -Path "$TmplPathXml\comments.cmtx" -Destination "$RegistryPolPath14\comment.cmtx"
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath15
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath16
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath17
                $Template = Copy-Item -Path "$TmplPathXml\comments.cmtx" -Destination "$RegistryPolPath18\comment.cmtx"
            }
        catch
            {
                Write-Warning $_ 
            }
    }

# Try and Catch GPO results

try {
        $000Id = (Get-GPO -Name $GPOLists[0]).Id.ToString()
        $001Id = (Get-GPO -Name $GPOLists[1]).Id.ToString()
        $002Id = (Get-GPO -Name $GPOLists[2]).Id.ToString()
        $003Id = (Get-GPO -Name $GPOLists[3]).Id.ToString()
        $004Id = (Get-GPO -Name $GPOLists[4]).Id.ToString()
        $005Id = (Get-GPO -Name $GPOLists[5]).Id.ToString()
        $006Id = (Get-GPO -Name $GPOLists[6]).Id.ToString()
        $007Id = (Get-GPO -Name $GPOLists[7]).Id.ToString()
        $008Id = (Get-GPO -Name $GPOLists[8]).Id.ToString()
        $009Id = (Get-GPO -Name $GPOLists[9]).Id.ToString()
        $010Id = (Get-GPO -Name $GPOLists[10]).Id.ToString()
        $011Id = (Get-GPO -Name $GPOLists[11]).Id.ToString()
        $012Id = (Get-GPO -Name $GPOLists[12]).Id.ToString()
        $013Id = (Get-GPO -Name $GPOLists[13]).Id.ToString()
        $014Id = (Get-GPO -Name $GPOLists[14]).Id.ToString()
        $015Id = (Get-GPO -Name $GPOLists[15]).Id.ToString()
        $016Id = (Get-GPO -Name $GPOLists[16]).Id.ToString()
        $017Id = (Get-GPO -Name $GPOLists[17]).Id.ToString()
        $018Id = (Get-GPO -Name $GPOLists[18]).Id.ToString()

        $RegistryPolPath0 = Get-Item "$NewItem\{$($000Id)}\User"
        $RegistryPolPath1 = Get-Item "$NewItem\{$($001Id)}\Machine"
        $RegistryPolPath2 = Get-Item "$NewItem\{$($002Id)}\Machine"
        $RegistryPolPath3 = Get-Item "$NewItem\{$($003Id)}\Machine"
        $RegistryPolPath6 = Get-Item "$NewItem\{$($006Id)}\Machine"
        $RegistryPolPath7 = Get-Item "$NewItem\{$($007Id)}\Machine"
        $RegistryPolPath8 = Get-Item "$NewItem\{$($008Id)}\Machine"
        $RegistryPolPath9 = Get-Item "$NewItem\{$($009Id)}\Machine"
        $RegistryPolPath10 = Get-Item "$NewItem\{$($010Id)}\Machine"
        $RegistryPolPath14 = Get-Item "$NewItem\{$($014Id)}\Machine"
        $RegistryPolPath15 = Get-Item "$NewItem\{$($015Id)}\Machine"
        $RegistryPolPath16 = Get-Item "$NewItem\{$($016Id)}\Machine"
        $RegistryPolPath17 = Get-Item "$NewItem\{$($017Id)}\Machine"
        $RegistryPolPath18 = Get-Item "$NewItem\{$($018Id)}\Machine"

        $SecEdit0 = Get-Item "$NewItem\{$($004Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit1 = Get-Item "$NewItem\{$($005Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit2 = Get-Item "$NewItem\{$($011Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit3 = Get-Item "$NewItem\{$($012Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit4 = Get-Item "$NewItem\{$($013Id)}\Machine\Microsoft\Windows NT\SecEdit"
        
        $Cmtxfile0 = "$RegistryPolPath0\comment.cmtx"
        $Cmtxfile1 = "$RegistryPolPath1\comment.cmtx"
        $Cmtxfile2 = "$RegistryPolPath2\comment.cmtx"
        $Cmtxfile3 = "$RegistryPolPath3\comment.cmtx"
        $Cmtxfile6 = "$RegistryPolPath6\comment.cmtx"
        $Cmtxfile7 = "$RegistryPolPath7\comment.cmtx"
        $Cmtxfile8 = "$RegistryPolPath8\comment.cmtx"
        $Cmtxfile9 = "$RegistryPolPath9\comment.cmtx"
        $Cmtxfile10 = "$RegistryPolPath10\comment.cmtx"
        $Cmtxfile14 = "$RegistryPolPath14\comment.cmtx"
        $Cmtxfile15 = "$RegistryPolPath15\comment.cmtx"
        $Cmtxfile16 = "$RegistryPolPath16\comment.cmtx"
        $Cmtxfile17 = "$RegistryPolPath17\comment.cmtx"
        $Cmtxfile18 = "$RegistryPolPath18\comment.cmtx"

        $gptFile0 = "$SecEdit0\GptTmpl.inf"
        $gptFile1 = "$SecEdit1\GptTmpl.inf"
        $gptFile2 = "$SecEdit2\GptTmpl.inf"
        $gptFile3 = "$SecEdit3\GptTmpl.inf"
        $gptFile4 = "$SecEdit4\GptTmpl.inf"

        $GptIni0 = "$NewItem\{$($000Id)}\GPT.INI"
        $GptIni1 = "$NewItem\{$($001Id)}\GPT.INI"
        $GptIni2 = "$NewItem\{$($002Id)}\GPT.INI"
        $GptIni3 = "$NewItem\{$($003Id)}\GPT.INI"
        $GptIni4 = "$NewItem\{$($004Id)}\GPT.INI"
        $GptIni5 = "$NewItem\{$($005Id)}\GPT.INI"
        $GptIni6 = "$NewItem\{$($006Id)}\GPT.INI"
        $GptIni7 = "$NewItem\{$($007Id)}\GPT.INI"
        $GptIni8 = "$NewItem\{$($008Id)}\GPT.INI"
        $GptIni9 = "$NewItem\{$($009Id)}\GPT.INI"
        $GptIni10 = "$NewItem\{$($010Id)}\GPT.INI"
        $GptIni11 = "$NewItem\{$($011Id)}\GPT.INI"
        $GptIni12 = "$NewItem\{$($012Id)}\GPT.INI"
        $GptIni13 = "$NewItem\{$($013Id)}\GPT.INI"
        $GptIni14 = "$NewItem\{$($014Id)}\GPT.INI"
        $GptIni15 = "$NewItem\{$($015Id)}\GPT.INI"
        $GptIni16 = "$NewItem\{$($016Id)}\GPT.INI"
        $GptIni17 = "$NewItem\{$($017Id)}\GPT.INI"
        $GptIni18 = "$NewItem\{$($018Id)}\GPT.INI"
    }
Catch
    {
        Write-Warning $_
    }

$PathPolicy = (Get-ADObject -Filter 'Name -eq "Policies"' -Properties * | Where-Object ObjectClass -eq container | Select-Object Name, distinguishedName).DistinguishedName    
$pPCMachineExtensionNames = "{827D319E-6EAC-11D2-A4EA-00C04F79F83A}{803E14A0-B4FB-11D0-A0D0-00A0C90F574B}"
$gPCUserExtensionNamesUserPolicy = "{35378EAC-683F-11D2-A89A-00C04FBBCFA2}{D02B1F73-3407-48AE-BA88-E8213C6761F1}"
Write-Progress -Activity "Running ADFortress" -Status "Importing GPO Informations" -PercentComplete 45
Start-Sleep -Seconds 2

# My Functions
function Set-UserExperience () {

    function 00_UserExperience (){

        $VersionNumber = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -ne "0" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.ControlPanelDisplay"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile0
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile0 $Content

                    $getGPO = (Get-ADObject "CN={$($000Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCUserExtensionNames="[$gPCUserExtensionNamesUserPolicy]"}

                    # Edit GPT.INI and update Sysvol versionNumber

                    $GptContent = Get-Content $GptIni0
                    $GptContent = $GptContent -replace "Version=0", "Version=196608"
                    Set-Content $GptIni0 $GptContent

                    # Update AD versionNumber

                    $VersionNumberNtlm = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="196608"}
                }
        }
    }

    function 01_UserExperience () {

        $VersionNumber = (Get-ADObject "CN={$($001Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.CredentialsUI"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile1
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile1 $Content
                    
                    $Params = @{
                        Key = "Software\Policies\Microsoft\Windows\CredUI"
                        Key1 = "Software\Microsoft\Windows\CurrentVersion\Policies\CredUI"
                        ValueName = "DisablePasswordReveal"
                        ValueName1 = "EnumerateAdministrators"
                        Type = "DWORD"
                        Value = 00000001
                        Value1 = 00000000 
                    }

                    $Output = Set-GPRegistryValue -Name $GPOLists[1] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $Output = Set-GPRegistryValue -Name $GPOLists[1] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.Value1
                }
        }
    }

    function 02_UserExperience () {

        $VersionNumber = (Get-ADObject "CN={$($002Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "1" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.RemovableStorageAccess"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile2
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile2 $Content

                    $Params = @{
                        Key = "Software\Policies\Microsoft\Windows\RemovableStorageDevices"
                        ValueName = "Deny_All"
                        Type = "DWORD"
                        Value = 00000001
                    }

                    $StdOut = Set-GPRegistryValue -Name $GPOLists[2] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                }
        }
    }

    function 03_UserExperience () {

        $VersionNumber = (Get-ADObject "CN={$($003Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "3" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.AutoPlay"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile3
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile3 $Content

                    $Params = @{
                        Key = "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
                        Key1 = "Software\Policies\Microsoft\Windows\Explorer"
                        ValueName = "NoAutorun"
                        ValueName1 = "NoAutoplayfornonVolume"
                        ValueName2 = "NoDriveTypeAutoRun"
                        Type = "DWORD"
                        Value = 00000001
                        Value2 = 255
                    }
                
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[3] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[3] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName2 -Type $Params.Type -Value $Params.Value2 # Modify
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[3] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.Value
                
                }
        }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Configuring User Experiences" -PercentComplete 50
    Start-Sleep -Seconds 2
    #Run functions
    00_UserExperience
    01_UserExperience
    02_UserExperience
    03_UserExperience
    
}

function Set-UserAccountsControl (){

    function 00_uac (){

        $VersionNumber = (Get-ADObject "CN={$($011Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "7" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $logon0 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\InactivityTimeoutSecs=4,900"
                    $logon1 = 'MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ScRemoveOption=1,"1"'
                    $logon2 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD=4,0"
                    $logon3 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName=4,1"
                    $logon4 = "MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\PasswordExpiryWarning=4,5"

                    Add-Content -Path $gptFile2 -Value '[Registry Values]'
                    Add-Content -Path $gptFile2 -Value $logon0
                    Add-Content -Path $gptFile2 -Value $logon1
                    Add-Content -Path $gptFile2 -Value $logon2
                    Add-Content -Path $gptFile2 -Value $logon3
                    Add-Content -Path $gptFile2 -Value $logon4

                    $getGPO = (Get-ADObject "CN={$($011Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                    # Edit GPT.INI and update Sysvol versionNumber

                    $GptContent = Get-Content $GptIni11
                    $GptContent = $GptContent -replace "Version=0", "Version=7"
                    Set-Content $GptIni11 $GptContent

                    # Update AD versionNumber

                    $VersionNumberNtlm = (Get-ADObject "CN={$($011Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="7"}
                }
        }
    }

    function 01_uac (){

        $VersionNumber = (Get-ADObject "CN={$($012Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "13" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $account0 = 'NewAdministratorName = "Administrator"'
                    $account1 = 'NewGuestName = "Guest"'
                    $account2 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoConnectedUser=4,3"
                    $account3 = "MACHINE\System\CurrentControlSet\Control\Lsa\LimitBlankPasswordUse=4,1"
                    $account4 = 'MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateDASD=1,"0"'
                    $account5 = "MACHINE\System\CurrentControlSet\Control\Session Manager\Kernel\ObCaseInsensitive=4,1"
                    $account6 = "MACHINE\System\CurrentControlSet\Control\Session Manager\ProtectionMode=4,1"

                    Add-Content -Path $gptFile3 -Value '[System Access]'
                    Add-Content -Path $gptFile3 -Value $account0
                    Add-Content -Path $gptFile3 -Value $account1

                    Add-Content -Path $gptFile3 -Value '[Registry Values]'
                    Add-Content -Path $gptFile3 -Value $account2
                    Add-Content -Path $gptFile3 -Value $account3
                    Add-Content -Path $gptFile3 -Value $account4
                    Add-Content -Path $gptFile3 -Value $account5
                    Add-Content -Path $gptFile3 -Value $account6

                    $getGPO = (Get-ADObject "CN={$($012Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                    # Edit GPT.INI and update Sysvol versionNumber

                    $GptContent = Get-Content $GptIni12
                    $GptContent = $GptContent -replace "Version=0", "Version=13"
                    Set-Content $GptIni12 $GptContent

                    # Update AD versionNumber

                    $VersionNumberNtlm = (Get-ADObject "CN={$($012Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="13"}
                }
        }             
    }

    function 02_uac (){

        $VersionNumber = (Get-ADObject "CN={$($013Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "15" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $uac0 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin=4,2"
                    $uac1 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorUser=4,3"
                    $uac2 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableInstallerDetection=4,1"
                    $uac3 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA=4,1"
                    $uac4 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableSecureUIAPaths=4,1"
                    $uac5 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableVirtualization=4,1"
                    $uac6 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\FilterAdministratorToken=4,1"
                    $uac7 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop=4,1"

                    Add-Content -Path $gptFile4 -Value '[Registry Values]'
                    Add-Content -Path $gptFile4 -Value $uac0
                    Add-Content -Path $gptFile4 -Value $uac1
                    Add-Content -Path $gptFile4 -Value $uac2
                    Add-Content -Path $gptFile4 -Value $uac3
                    Add-Content -Path $gptFile4 -Value $uac4
                    Add-Content -Path $gptFile4 -Value $uac5
                    Add-Content -Path $gptFile4 -Value $uac6
                    Add-Content -Path $gptFile4 -Value $uac7

                    $getGPO = (Get-ADObject "CN={$($013Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                    # Edit GPT.INI and update Sysvol versionNumber

                    $GptContent = Get-Content $GptIni13
                    $GptContent = $GptContent -replace "Version=0", "Version=15"
                    Set-Content $GptIni13 $GptContent

                    # Update AD versionNumber

                    $VersionNumberNtlm = (Get-ADObject "CN={$($013Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="15"}
                }
        }             
    }
                
    function 03_uac {
    
        $VersionNumber = (Get-ADObject "CN={$($014Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "5" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.NetworkProvider"
                    $PatternReplace1 = "Microsoft.Policies.PowerManagement"

                    $Content = Get-Content $Cmtxfile14
                    $Content = $Content -replace $Pattern, $PatternReplace
                    $Content = $Content -replace $Pattern1, $PatternReplace1
                    Set-Content $Cmtxfile14 $Content

                    $Params = @{
                        Key = "Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths"
                        Key0 = "Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
                        Key1 = "Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9"
                        ValueName = "\\*\NETLOGON", "\\*\SYSVOL"
                        ValueName0 = "ACSettingIndex"
                        ValueName1 = "DCSettingIndex"
                        Type = "String"
                        Types = "DWORD"
                        Value = "RequireMutualAuthentication=1, RequireIntegrity=1", "RequireMutualAuthentication=1, RequireIntegrity=1"
                        Value0 = 00000001
                        Value1 = 00000000
                    }
                    
                    $Output = Set-GPRegistryValue -Name $GPOLists[14] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $Output = Set-GPRegistryValue -Name $GPOLists[14] -Key "HKLM\$($Params.Key0)" -ValueName $Params.ValueName0 -Type $Params.Types -Value $Params.Value0
                    $Output = Set-GPRegistryValue -Name $GPOLists[14] -Key "HKLM\$($Params.Key0)" -ValueName $Params.ValueName1 -Type $Params.Types -Value $Params.Value0
                    $Output = Set-GPRegistryValue -Name $GPOLists[14] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName1 -Type $Params.Types -Value $Params.Value1
                    $Output = Set-GPRegistryValue -Name $GPOLists[14] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName0 -Type $Params.Types -Value $Params.Value1
                }
        }
    }
    # Run functions
    Write-Progress -Activity "Running ADFortress" -Status "Configuring User Accounts Control" -PercentComplete 55
    Start-Sleep -Seconds 2
    00_uac
    01_uac
    02_uac
    03_uac

}

function Set-SmbEnumeration (){

    function 00_SmbEnumeration (){

        $VersionNumber = (Get-ADObject "CN={$($004Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "23" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $smbenum0 = "LSAAnonymousNameLookup = 0"
                    $smbenum1 = 'MACHINE\System\CurrentControlSet\Control\Lsa\RestrictRemoteSAM=1,"O:BAG:BAD:(A;;RC;;;BA)"'
                    $smbenum2 = "MACHINE\System\CurrentControlSet\Control\Lsa\DisableDomainCreds=4,1"
                    $smbenum3 = "MACHINE\System\CurrentControlSet\Control\Lsa\EveryoneIncludesAnonymous=4,0"
                    $smbenum4 = "MACHINE\System\CurrentControlSet\Control\Lsa\ForceGuest=4,0"
                    $smbenum5 = "MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymous=4,1"
                    $smbenum6 = "MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymousSAM=4,1"
                    $smbenum7 = "MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\Machine=7,System\CurrentControlSet\Control\ProductOptions,System\CurrentControlSet\Control\Server Applications,Software\Microsoft\Windows NT\CurrentVersion"
                    $smbenum8 = "MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths\Machine=7,Software\Microsoft\Windows NT\CurrentVersion\Print,Software\Microsoft\Windows NT\CurrentVersion\Windows,System\CurrentControlSet\Control\Print\Printers,System\CurrentControlSet\Services\Eventlog,Software\Microsoft\OLAP Server,System\CurrentControlSet\Control\ContentIndex,System\CurrentControlSet\Control\Terminal Server,System\CurrentControlSet\Control\Terminal Server\UserConfig,System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration,Software\Microsoft\Windows NT\CurrentVersion\Perflib,System\CurrentControlSet\Services\SysmonLog"
                    $smbenum9 = "MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionPipes=7,LLSRPC,BROWSER,netlogon,samr"
                    $smbenum10 = "MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionShares=7,"
                    $smbenum11 = "MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RestrictNullSessAccess=4,1"

                    Add-Content -Path $gptFile0 -Value '[System Access]'
                    Add-Content -Path $gptFile0 -Value $smbenum0

                    Add-Content -Path $gptFile0 -Value '[Registry Values]'
                    Add-Content -Path $gptFile0 -Value $smbenum1
                    Add-Content -Path $gptFile0 -Value $smbenum2
                    Add-Content -Path $gptFile0 -Value $smbenum3
                    Add-Content -Path $gptFile0 -Value $smbenum4
                    Add-Content -Path $gptFile0 -Value $smbenum5
                    Add-Content -Path $gptFile0 -Value $smbenum6
                    Add-Content -Path $gptFile0 -Value $smbenum7
                    Add-Content -Path $gptFile0 -Value $smbenum8
                    Add-Content -Path $gptFile0 -Value $smbenum9
                    Add-Content -Path $gptFile0 -Value $smbenum10
                    Add-Content -Path $gptFile0 -Value $smbenum11
                
                    # set the gPCMachineExtension to Apply the GPO
                    $getGPO = (Get-ADObject "CN={$($004Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"} 

                    # Edit GPT.INI and update Sysvol versionNumber

                    $GptContent = Get-Content $GptIni4
                    $GptContent = $GptContent -replace "Version=0", "Version=23"
                    Set-Content $GptIni4 $GptContent

                    # Update AD versionNumber

                    $VersionNumberAudit = (Get-ADObject "CN={$($004Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumberAudit -Replace @{versionNumber="23"}
                }
        }
    }

    function 01_SmbEnumeration (){

        $VersionNumber = (Get-ADObject "CN={$($005Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "6" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $domain0 = "MACHINE\System\CurrentControlSet\Control\Lsa\SubmitControl=4,0"
                    $domain1 = "MACHINE\System\CurrentControlSet\Services\NTDS\Parameters\LdapEnforceChannelBinding=4,2"
                    $domain2 = "MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RefusePasswordChange=4,0"
                    $domain3 = "MACHINE\System\CurrentControlSet\Services\NTDS\Parameters\LDAPServerIntegrity=4,2"

                    Add-Content -Path $gptFile1 -Value '[Registry Values]'
                    Add-Content -Path $gptFile1 -Value $domain0
                    Add-Content -Path $gptFile1 -Value $domain1
                    Add-Content -Path $gptFile1 -Value $domain2
                    Add-Content -Path $gptFile1 -Value $domain3

                    $getGPO = (Get-ADObject "CN={$($005Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                    # Edit GPT.INI and update Sysvol versionNumber

                    $GptContent = Get-Content $GptIni5
                    $GptContent = $GptContent -replace "Version=0", "Version=6"
                    Set-Content $GptIni5 $GptContent

                    # Update AD versionNumber

                    $VersionNumberNtlm = (Get-ADObject "CN={$($005Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="6"}
                }
        }
    }

    Write-Progress -Activity "Running ADFortress" -Status "Configuring SMB Enumeration" -PercentComplete 60
    Start-Sleep -Seconds 2
    # Run Fuctios
    00_SmbEnumeration
    01_SmbEnumeration

}

function Set-RemoteManagement (){
    function 00_RDProtocal (){
        $VersionNumber = (Get-ADObject "CN={$($006Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "13" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.TerminalServer"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile6
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile6 $Content

                    $Params = @{
                        Key = "SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
                        ValueName0 = "SecurityLayer"
                        ValueName1 = "MinEncryptionLevel"
                        Type = "DWORD"
                        Value = 00000001
                        Value0 = 00000002
                        Value1 = 00000003
                    }
                    
                    Get-Content "$TmplPathFile\$Rdplist" | forEach {

                        $rdp = Set-GPRegistryValue -Name $GPOLists[6] -Key "HKLM\$($Params.Key)" -ValueName $_ -Type $Params.Type -Value $Params.Value
                    }

                    $rdp = Set-GPRegistryValue -Name $GPOLists[6] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName0 -Type $Params.Type -Value $Params.Value0
                    $rdp = Set-GPRegistryValue -Name $GPOLists[6] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.Value1
                }
        }
    }

    function 01_RDProtocol (){
        $VersionNumber = (Get-ADObject "CN={$($007Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.TerminalServer"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile7
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile7 $Content

                    $Params = @{
                        Key = 'SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
                        ValueName1 = 'MaxIdleTime'
                        ValueName2 = 'MaxDisconnectionTime'
                        Type = 'DWORD'
                        Value1 = 900000
                        Value2 = 900000
                    }

                    $RDSIdle = Set-GPRegistryValue -Name $GPOLists[7] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.value1
                    $RDSIdle = Set-GPRegistryValue -Name $GPOLists[7] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName2 -Type $Params.Type -Value $Params.value2
                
                }
        }
    }

    function 02_RDProtocol (){

        $VersionNumber = (Get-ADObject "CN={$($008Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "7" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.WindowsRemoteManagement"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile8
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile8 $Content

                    $Params = @{
                        Key = "Software\Policies\Microsoft\Windows\WinRM\Client"
                        Key0 = "Software\Policies\Microsoft\Windows\WinRM\Service"
                        ValueName = "AllowBasic"
                        ValueName0 = "AllowUnencryptedTraffic"
                        ValueName1 = "AllowDigest"
                        ValueName2 = "AllowAutoConfig"
                        ValueName4 = "DisableRunAs"
                        Type = "DWORD"
                        Value = 00000000
                        Value0 = 00000001
                    }
                    
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[8] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[8] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName0 -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[8] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[8] -Key "HKLM\$($Params.Key0)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[8] -Key "HKLM\$($Params.Key0)" -ValueName $Params.ValueName2 -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[8] -Key "HKLM\$($Params.Key0)" -ValueName $Params.ValueName0 -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[8] -Key "HKLM\$($Params.Key0)" -ValueName $Params.ValueName4 -Type $Params.Type -Value $Params.Value0
                }
        }
    }

    function 03_RDProtocol (){
        $VersionNumber = (Get-ADObject "CN={$($009Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.RemoteProcedureCalls"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile9
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile9 $Content

                    $Params = @{
                        Key = "Software\Policies\Microsoft\Windows NT\Rpc"
                        ValueName = "EnableAuthEpResolution"
                        ValueName0 = "RestrictRemoteClients"
                        Type = "DWORD"
                        Value = 00000001
                    }

                    $StdOut = Set-GPRegistryValue -Name $GPOLists[9] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[9] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName0 -Type $Params.Type -Value $Params.Value
                }
        }
    }

    function 04_RDProtocol (){

        $VersionNumber = (Get-ADObject "CN={$($010Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "1" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.WindowsRemoteShell"
                    $PatternReplace1 = "Microsoft.Policies.RemoteAssistance"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile10
                    $Content = $Content -replace $Pattern, $PatternReplace
                    $Content = $Content -replace $Pattern1, $PatternReplace1
                    Set-Content $Cmtxfile10 $Content

                    $Params = @{
                        Key = "Software\Policies\Microsoft\Windows\WinRM\Service\WinRS"
                        Key1 = "Software\policies\Microsoft\Windows NT\Terminal Services"
                        ValueName = "AllowRemoteShellAccess"
                        ValueName0 = "fAllowUnsolicited"
                        ValueName1 = "fAllowToGetHelp"
                        Type = "DWORD"
                        Value = 00000000
                    }
                    
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[10] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[10] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName0 -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[10] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.Value     
                }
        }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Configuring Remote Management" -PercentComplete 70
    Start-Sleep -Seconds 2
    # Run fuctions
    00_RDProtocal
    01_RDProtocol
    02_RDProtocol
    03_RDProtocol
    04_RDProtocol
}

function Set-LsaProtection (){

    function 00_lsaprotection (){

        $VersionNumber = (Get-ADObject "CN={$($015Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "6" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Windows.DeviceGuard"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile15
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile15 $Content

                    $Params = @{
                        Key = "SOFTWARE\Policies\Microsoft\Windows\DeviceGuard"
                        ValueName = "EnableVirtualizationBasedSecurity"
                        ValueName1 = "RequirePlatformSecurityFeatures"
                        ValueName2 = "HypervisorEnforcedCodeIntegrity"
                        ValueName3 = "HVCIMATRequired"
                        ValueName4 = "LsaCfgFlags"
                        ValueName5 = "ConfigureSystemGuardLaunch"
                        Type = "DWORD"
                        Value = 00000001
                        Value4 = 00000000
                        Value2 = 00000003
                    }

                    $StdOut = Set-GPRegistryValue -Name $GPOLists[15] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[15] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.Value2
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[15] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName2 -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[15] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName3 -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[15] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName4 -Type $Params.Type -Value $Params.Value4
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[15] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName5 -Type $Params.Type -Value $Params.Value
                
                }
        }
    }

    function 01_lsaprotection (){
        $VersionNumber = (Get-ADObject "CN={$($016Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.CredentialsSSP"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile16
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile16 $Content

                    $Params = @{
                        Key = "Software\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters"
                        Key1 = "Software\Policies\Microsoft\Windows\CredentialsDelegation"
                        ValueName = "AllowEncryptionOracle"
                        ValueName1 = "AllowProtectedCreds"
                        ValueName2 = "RestrictedRemoteAdministration"
                        ValueName3 = "RestrictedRemoteAdministrationType"
                        Type = "DWORD"
                        Value = 00000000
                        Value1 = 00000001
                    }
                
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[16] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[16] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.Value1
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[16] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName2 -Type $Params.Type -Value $Params.Value1
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[16] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName3 -Type $Params.Type -Value $Params.Value1
                
                }
        }
    }

    function 02_lsaprotection (){

        $VersionNumber = (Get-ADObject "CN={$($017Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.SecGuide"

                    $Content = Get-Content $Cmtxfile17
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile17 $Content
                    
                    $Params = @{
                        Key = "SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest"
                        Key1 = "SYSTEM\CurrentControlSet\Control\Lsa"
                        ValueName = "UseLogonCredential"
                        ValueName1 = "RunAsPPL"
                        Type = "DWORD"
                        Value = 00000000
                        Value1 = 00000001
                    }

                    $Output = Set-GPRegistryValue -Name $GPOLists[17] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $Output = Set-GPRegistryValue -Name $GPOLists[17] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.Value1
                }
        }
    }

    Write-Progress -Activity "Running ADFortress" -Status "Configuring LSA Protection" -PercentComplete 80
    Start-Sleep -Seconds 2
    # Run functions
    00_lsaprotection
    01_lsaprotection
    02_lsaprotection
}

function Set-BrowserConfig (){

    function 00_browsercfg (){

        $VersionNumber = (Get-ADObject "CN={$($018Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $PatternReplace = "Microsoft.Policies.InternetExplorer"
                    $PatternReplace1 = "Microsoft.Policies.NetworkConnections"


                    $Content = Get-Content $Cmtxfile18
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile18 $Content
                    
                    $EditXml = [xml](Get-Content -Path $Cmtxfile18)

                    $Addxml = $EditXml.policyComments.policyNamespaces.using |
                    where {$_.prefix -eq 'ns1'}
                    $Addxml.namespace = $PatternReplace1

                    $EditXml.Save($Cmtxfile18)
                    
                    $Params = @{
                        Key = "Software\Policies\Microsoft\Internet Explorer\Main"
                        Key1 = "Software\Policies\Microsoft\Windows\Network Connections"
                        ValueName = "NotifyDisableIEOptions"
                        ValueName1 = "NC_ShowSharedAccessUI"
                        Type = "DWORD"
                        Value = 00000001
                        Value1 = 00000000
                    }
                    $Output = Set-GPRegistryValue -Name $GPOLists[18] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $Output = Set-GPRegistryValue -Name $GPOLists[18] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.Value1
                }
        } 
    }
    Write-Progress -Activity "Running ADFortress" -Status "Configuring browser hardening" -PercentComplete 90
    Start-Sleep -Seconds 2
    # Run functions
    00_browsercfg
}