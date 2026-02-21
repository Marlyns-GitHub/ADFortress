<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Disable critical services SSLv2.0 & SSLv3.0, TLSv1.0 & TLSv1.1, spooler, Ntlm, Netbios, LLMNR, mDNS, IPv6, 3DES and SMBv1
#>

# Importing Variables

. ./input/myvars.ps1
Write-Progress -Activity "Running ADFortress" -Status "Gathering domain information" -PercentComplete 15
Start-Sleep -Seconds 2

# Script body
$ExportGPO = "C:\GPOList.csv"

# Script body
$GPOLists = "FORTRESS-DisabledSSLv2 & SSLv3",
            "FORTRESS-DisabledTLSv1.0 & TLSv1.1",
            "FORTRESS-Disabled3DES",
            "FORTRESS-DisabledSMBv1",
            "FORTRESS-DisabledLLMNR & mDNS",
            "FORTRESS-DisabledIPv6",
            "FORTRESS-DisabledNetBIOS",
            "FORTRESS-DisabledNTLMv1",
            "FORTRESS-DisabledSpooler"

if ((Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledSSLv2 & SSLv3") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledTLSv1.0 & TLSv1.1") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-Disabled3DES") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledSMBv1") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledLLMNR & mDNS") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledIPv6") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledNetBIOS") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledNTLMv1") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-DisabledSpooler")
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

        try {
                $RegistryPolPath2 = "$NewItem\{$($002Id)}\Machine"
                $RegistryPolPath3 = "$NewItem\{$($003Id)}\Machine"
                $RegistryPolPath4 = "$NewItem\{$($004Id)}\Machine"
                $RegistryPolPath5 = "$NewItem\{$($005Id)}\Machine"
                $SchedulePath6 = New-Item "$NewItem\{$($006Id)}\Machine\Preferences\ScheduledTasks" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit7 = New-Item "$NewItem\{$($007Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit8 = New-Item "$NewItem\{$($008Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue

                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath2
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath3
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath4
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath5
                $Template = Copy-Item -Path "$TmplPathXml\$TmplSchedule" -Destination $SchedulePath6
                $Template = Copy-Item -Path "$TmplPathSetup\$ScriptName" -Destination $DestShare
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit7
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit8
            }
        catch
            {
                Write-Warning $_ 
            }
    }

# Gethering GPO Infos
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

        $RegistryPolPath2 = "$NewItem\{$($002Id)}\Machine"
        $RegistryPolPath3 = "$NewItem\{$($003Id)}\Machine"
        $RegistryPolPath4 = "$NewItem\{$($004Id)}\Machine"
        $RegistryPolPath5 = "$NewItem\{$($005Id)}\Machine"
        $SchedulePath6 = Get-Item "$NewItem\{$($006Id)}\Machine\Preferences\ScheduledTasks"
        $SecEdit7 = Get-Item "$NewItem\{$($007Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit8 = Get-Item "$NewItem\{$($008Id)}\Machine\Microsoft\Windows NT\SecEdit"
        
        $Cmtxfile2 = "$RegistryPolPath2\comment.cmtx"
        $Cmtxfile3 = "$RegistryPolPath3\comment.cmtx"
        $Cmtxfile4 = "$RegistryPolPath4\comment.cmtx"
        $Cmtxfile5 = "$RegistryPolPath5\comment.cmtx"
        $gptFile7 = "$SecEdit7\GptTmpl.inf"
        $gptFile8 = "$SecEdit8\GptTmpl.inf"

        $GptIni2 = "$NewItem\{$($002Id)}\GPT.INI"
        $GptIni3 = "$NewItem\{$($003Id)}\GPT.INI"
        $GptIni4 = "$NewItem\{$($004Id)}\GPT.INI"
        $GptIni5 = "$NewItem\{$($005Id)}\GPT.INI"
        $GptIni6 = "$NewItem\{$($006Id)}\GPT.INI"
        $GptIni7 = "$NewItem\{$($007Id)}\GPT.INI"
        $GptIni8 = "$NewItem\{$($008Id)}\GPT.INI"

    }
Catch
    {
        Write-Warning $_
    }
    
$PathPolicy = (Get-ADObject -Filter 'Name -eq "Policies"' -Properties * | Where-Object ObjectClass -eq container | Select-Object Name, distinguishedName).DistinguishedName    
$pPCMachineExtensionNames = "{827D319E-6EAC-11D2-A4EA-00C04F79F83A}{803E14A0-B4FB-11D0-A0D0-00A0C90F574B}"
$pPCMachineExtensionNamesScheduleTask = "{00000000-0000-0000-0000-000000000000}{CAB54552-DEEA-4691-817E-ED4A4D1AFC72}][{AADCED64-746C-4633-A97C-D61349046527}{CAB54552-DEEA-4691-817E-ED4A4D1AFC72}"
Write-Progress -Activity "Running ADFortress" -Status "Importing GPO Informations" -PercentComplete 45
Start-Sleep -Seconds 2

# My Functions

function Set-DisableSsl (){

    $VersionNumber = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
    $VersionNumber.versionNumber | ForEach {
        
        if ( $VersionNumber.versionNumber -eq "8" )
            {
                Write-Host "This GPO already configured" -ForegroundColor DarkGray
            }
        else
            {
                #Link GPO
                $Linkgpo = New-GPLink -Name $GPOLists[0] -Target $DomainDistinguishedName

                $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Key $ssltlsKey\$($ssl[0])\client @Enabled -Value $Value0
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Key $ssltlsKey\$($ssl[0])\client @Disabled -Value $Value1
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Key $ssltlsKey\$($ssl[0])\server @Enabled -Value $Value0
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Key $ssltlsKey\$($ssl[0])\server @Disabled -Value $Value1
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Key $ssltlsKey\$($ssl[1])\client @Enabled -Value $Value0
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Key $ssltlsKey\$($ssl[1])\client @Disabled -Value $Value1
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Key $ssltlsKey\$($ssl[1])\server @Enabled -Value $Value0
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Key $ssltlsKey\$($ssl[1])\server @Disabled -Value $Value1
            }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Disabling SSLv2.0 and SSLv3.0" -PercentComplete 50
    Start-Sleep -Seconds 2
}

function Set-DisableTls (){
    
    $VersionNumber = (Get-ADObject "CN={$($001Id)},$PathPolicy" -Properties *)
    $VersionNumber.versionNumber | ForEach {
        
        if ( $VersionNumber.versionNumber -eq "8" )
            {
                Write-Host "This GPO already configured" -ForegroundColor DarkGray
            }
        else
            {
                #Link GPO
                $Linkgpo = New-GPLink -Name $GPOLists[1] -Target $DomainControllersContainer

                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[0])\client @Enabled -Value $Value0
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[0])\client @Disabled -Value $Value1
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[0])\server @Enabled -Value $Value0
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[0])\server @Disabled -Value $Value1
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[1])\client @Enabled -Value $Value0
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[1])\client @Disabled -Value $Value1
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[1])\server @Enabled -Value $Value0
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[1])\server @Disabled -Value $Value1
            }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Disabling TLSv1.0 and TLSv1.1" -PercentComplete 60
    Start-Sleep -Seconds 2
}

function Set-Disable3des (){

    $VersionNumber = (Get-ADObject "CN={$($002Id)},$PathPolicy" -Properties *)
    $VersionNumber.versionNumber | ForEach {
        
        if ( $VersionNumber.versionNumber -eq "1" )
            {
                Write-Host "This GPO already configured" -ForegroundColor DarkGray
            }
        else
            {
                #Link GPO
                $Linkgpo = New-GPLink -Name $GPOLists[2] -Target $DomainDistinguishedName
                $PatternReplace = "Microsoft.Policies.CypherStrength"

                $Content = Get-Content $Cmtxfile2
                $Content = $Content -replace $Pattern, $PatternReplace
                Set-Content $Cmtxfile2 $Content

                $Params = @{
                    Key = "SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"
                    ValueName = "Functions"
                    Type = "String"
                    Value = "TLS_AES_256_GCM_SHA384,TLS_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_GCM_SHA384,TLS_RSA_WITH_AES_128_GCM_SHA256,TLS_RSA_WITH_AES_256_CBC_SHA256,TLS_RSA_WITH_AES_128_CBC_SHA256,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_3DES_EDE_CBC_SHA,TLS_RSA_WITH_NULL_SHA256,TLS_RSA_WITH_NULL_SHA,TLS_PSK_WITH_AES_256_GCM_SHA384,TLS_PSK_WITH_AES_128_GCM_SHA256,TLS_PSK_WITH_AES_256_CBC_SHA384,TLS_PSK_WITH_AES_128_CBC_SHA256,TLS_PSK_WITH_NULL_SHA384,TLS_PSK_WITH_NULL_SHA256"
                }

                $Output = Set-GPRegistryValue -Name $GPOLists[2] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
            }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Disabling 3DES" -PercentComplete 65
    Start-Sleep -Seconds 2
}

function Set-DisableSmb (){

    $VersionNumber = (Get-ADObject "CN={$($003Id)},$PathPolicy" -Properties *)
    $VersionNumber.versionNumber | ForEach {
        
        if ( $VersionNumber.versionNumber -eq "2" )
            {
                Write-Host "This GPO already configured" -ForegroundColor DarkGray
            }
        else
            {
                #Link GPO
                $Linkgpo = New-GPLink -Name $GPOLists[3] -Target $DomainControllersContainer
                $PatternReplace = "Microsoft.Policies.SecGuide"

                $Content = Get-Content $Cmtxfile3
                $Content = $Content -replace $Pattern, $PatternReplace
                Set-Content $Cmtxfile3 $Content

                $Params = @{
                    Key = "SYSTEM\CurrentControlSet\Services\MrxSmb10"
                    Key1 = "SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
                    ValueName = "Start"
                    ValueName1 = "SMB1"
                    Type = "DWORD"
                    Value = 00000004
                    Value1 = 00000000
                }

                $Output = Set-GPRegistryValue -Name $GPOLists[3] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                $Output = Set-GPRegistryValue -Name $GPOLists[3] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName1 -Type $Params.Type -Value $Params.Value1
            }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Disabling SMBv1" -PercentComplete 70
    Start-Sleep -Seconds 2
}

function Set-DisableLlmnr (){

    $VersionNumber = (Get-ADObject "CN={$($004Id)},$PathPolicy" -Properties *)
    $VersionNumber.versionNumber | ForEach {
        
        if ( $VersionNumber.versionNumber -eq "2" )
            {
                Write-Host "This GPO already configured" -ForegroundColor DarkGray
            }
        else
            {
                
                #Link GPO
                $Linkgpo = New-GPLink -Name $GPOLists[4] -Target $DomainDistinguishedName

                $PatternReplace = "Microsoft.Policies.DNSClient"

                $Content = Get-Content $Cmtxfile4
                $Content = $Content -replace $Pattern, $PatternReplace
                Set-Content $Cmtxfile4 $Content
                
                $Params = @{
                    Key = "Software\Policies\Microsoft\Windows NT\DNSClient"
                    ValueName = "EnableMulticast"
                    Type = "DWORD"
                    Value = 00000000
                }

                $Param = @{
                    Context   = 'Computer'
                    Key       = 'SYSTEM\CurrentControlSet\Services\Dnscache\Parameters'
                    ValueName = 'EnableMDNS'
                    Value     =  0
                    Type      = 'DWORD'
                    Action    = 'Update'
                }

                $Output = Set-GPRegistryValue -Name $GPOLists[4] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[4] -Context $Param.Context -Key "HKLM\$($Param.Key)" -ValueName $Param.ValueName -Type $Param.Type -Value $Param.Value -Action $Param.Action
            
            }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Disabling LLMNR and mDNS" -PercentComplete 75
    Start-Sleep -Seconds 2
}

function Set-DisableIpv6 (){

    $VersionNumber = (Get-ADObject "CN={$($005Id)},$PathPolicy" -Properties *)
    $VersionNumber.versionNumber | ForEach {
        
        if ( $VersionNumber.versionNumber -eq "1" )
            {
                Write-Host "This GPO already configured" -ForegroundColor DarkGray
            }
        else
            {
                #Link GPO
                $Linkgpo = New-GPLink -Name $GPOLists[5] -Target $DomainDistinguishedName

                $Params = @{
                    Context   = 'Computer'
                    Key       = 'SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters'
                    ValueName = 'DisabledComponents'
                    Value     =  255
                    Type      = 'DWORD'
                    Action    = 'Update'
                }

                $Output = Set-GPPrefRegistryValue -Name $GPOLists[5] -Context $Params.Context -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value -Action $Params.Action
            }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Disabling IPv6" -PercentComplete 80
    Start-Sleep -Seconds 2
}

function Set-DisableNetbios (){

        $VersionNumber = (Get-ADObject "CN={$($006Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "8" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    #Link GPO
                    $Linkgpo = New-GPLink -Name $GPOLists[6] -Target $DomainDistinguishedName

                    # Edit xml file
                    $xmlPath = Join-Path -Path $SchedulePath6 -ChildPath "ScheduledTasks.xml"
                    $xmlEdit = [xml](Get-Content -Path $xmlPath )

                    # Edit Data and UID
                    $xmlUpdate = $xmlEdit.ScheduledTasks.ImmediateTaskV2 | 
                    where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                    $xmlUpdate.changed = "$ChgdDate"
                    $xmlUpdate.uid = "$NewUid"

                    # Edit Auther
                    $xmlUpdate = $xmlEdit.ScheduledTasks.ImmediateTaskV2.Properties.Task.RegistrationInfo
                    foreach ( $Author in $xmlUpdate)
                        {
                            $Author.Author = "$NewAuthor"
                        }

                    # Edit Arguments
                    $xmlUpdate = $xmlEdit.ScheduledTasks.ImmediateTaskV2.Properties.Task.Actions.Exec
                    foreach ($Argument in $xmlUpdate)
                        { 
                            $xmlUpdate.Arguments = "$ArgumentsPath"
                        }

                    # Edit Id
                    $xmlUpdate = $xmlEdit.ScheduledTasks.ImmediateTaskV2.Filters.FilterRunOnce | 
                    where {$_.id -eq $IdTmpl}
                    $xmlUpdate.id = "$NewId"

                    # Save XMLFile
                    $xmlEdit.Save($xmlPath)
                    
                    # Update pPCMachineExtensionNames
                    $getGPO = (Get-ADObject "CN={$($006Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesScheduleTask]"}

                    # Edit GPT.INI and update Sysvol versionNumber

                    $GptContent = Get-Content $GptIni6
                    $GptContent = $GptContent -replace "Version=0", "Version=8"
                    Set-Content $GptIni6 $GptContent

                    # Update AD versionNumber

                    $VersionNumberNtlm = (Get-ADObject "CN={$($006Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="8"}   
                }
        }
        Write-Progress -Activity "Running ADFortress" -Status "Disabling NetBIOS" -PercentComplete 85
        Start-Sleep -Seconds 2
}

function Set-DisableNtlm (){

    $VersionNumber = (Get-ADObject "CN={$($007Id)},$PathPolicy" -Properties *)
    $VersionNumber.versionNumber | ForEach {
        
        if ( $VersionNumber.versionNumber -eq "1" )
            {
                Write-Host "This GPO already configured" -ForegroundColor DarkGray
            }
        else
            {
                $Linkgpo = New-GPLink -Name $GPOLists[7] -Target $DomainControllersContainer

                $dslntlm = "MACHINE\System\CurrentControlSet\Control\Lsa\LmCompatibilityLevel=4,5"

                Add-Content -Path $gptFile7 -Value '[Registry Values]'
                Add-Content -Path $gptFile7 -Value $dslntlm

                $getGPO = (Get-ADObject "CN={$($007Id)},$PathPolicy").DistinguishedName
                Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                # Edit GPT.INI and update Sysvol versionNumber

                $GptContent = Get-Content $GptIni7
                $GptContent = $GptContent -replace "Version=0", "Version=1"
                Set-Content $GptIni7 $GptContent

                # Update AD versionNumber

                $VersionNumberNtlm = (Get-ADObject "CN={$($007Id)},$PathPolicy" -Properties *)
                Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="1"}
            }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Disabling NTLMv1" -PercentComplete 90
    Start-Sleep -Seconds 2
}

function Set-DisableSpooler {
    
    $VersionNumber = (Get-ADObject "CN={$($008Id)},$PathPolicy" -Properties *)
    $VersionNumber.versionNumber | ForEach {
        
        if ( $VersionNumber.versionNumber -eq "2" )
            {
                Write-Host "This GPO already configured" -ForegroundColor DarkGray
            }
        else
            {
                # Linked GPO
                $Linkgpo = New-GPLink -Name $GPOLists[8] -Target $DomainControllersContainer

                $Spooler = '"Spooler",4,""'
        
                # Update GptTmpl.inf file
                Add-Content -Path $gptFile8 -Value '[Service General Setting]'
                Add-Content -Path $gptFile8 -Value $Spooler

                $getGPO = (Get-ADObject "CN={$($008Id)},$PathPolicy").DistinguishedName
                Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                # Edit GPT.INI and update Sysvol versionNumber

                $GptContent = Get-Content $GptIni8
                $GptContent = $GptContent -replace "Version=0", "Version=2"
                Set-Content $GptIni8 $GptContent

                # Update AD versionNumber

                $VersionNumberNtlm = (Get-ADObject "CN={$($008Id)},$PathPolicy" -Properties *)
                Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="2"}
            }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Disabling Spooler" -PercentComplete 95
    Start-Sleep -Seconds 2
}
