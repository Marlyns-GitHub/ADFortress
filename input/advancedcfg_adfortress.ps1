<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Advanced Configuration (Proxy, Windows Firewall & Audit Event Logs)
#>

# Importing Variables

. ./input/tiering_vars.ps1
Write-Progress -Activity "Running ADFortress" -Status "Gathering domain information" -PercentComplete 15
Start-Sleep -Seconds 2

# Script body
$ExportGPO = "C:\GPOList.csv"

# Script body
$GPOLists = "FORTRESS-ProxySettings",
            "FORTRESS-PreventProxyChange",
            "FORTRESS-UserLogonCacheServers",
            "FORTRESS-UserLogonCacheWorkStations",
            "FORTRESS-BlockRDPOutBound",
            "FORTRESS-BlockRDPInBound",
            "FORTRESS-AllowRDPOutBoundFromPAW",
            "FORTRESS-AllowRDPOutboundFromJumpSRV",
            "FORTRESS-AuditEventLogs",
            "FORTRESS-EventLogsSize"

if ((Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-ProxySettings") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-PreventProxyChange") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-UserLogonCacheServers") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-UserLogonCacheWorkStations") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-BlockRDPOutBound") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-BlockRDPInBound") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-AllowRDPOutBoundFromPAW") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-AllowRDPOutboundFromJumpSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-AuditEventLogs") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-EventLogsSize")
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
                try {
                        $CreateGPOs = New-GPO -Name $GPOList -ErrorAction SilentlyContinue
                        Write-Progress -Activity "Running ADFortress" -Status "Creating GPO $GPOList" -PercentComplete 25
                        Start-Sleep -Seconds 2
                    }
                Catch
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

        try {
                $RegistryPolPath0 = "$NewItem\{$($000Id)}\Machine"
                $RegistryPolPath1 = "$NewItem\{$($001Id)}\Machine"
                $RegistryPolPath2 = "$NewItem\{$($009Id)}\Machine"
                $SecEdit0 = New-Item "$NewItem\{$($002Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit1 = New-Item "$NewItem\{$($003Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit2 = New-Item "$NewItem\{$($004Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit3 = New-Item "$NewItem\{$($005Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit4 = New-Item "$NewItem\{$($006Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit5 = New-Item "$NewItem\{$($007Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit6 = New-Item "$NewItem\{$($008Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $AuditCfg = New-Item "$NewItem\{$($008Id)}\Machine\Microsoft\Windows NT\Audit" -ItemType Directory -ErrorAction SilentlyContinue

                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath0
                $Template = Copy-Item -Path "$TmplPathXml\$CMTXPath" -Destination $RegistryPolPath1
                $Template = Copy-Item -Path "$TmplPathXml\comments.cmtx" -Destination "$RegistryPolPath2\comment.cmtx"
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit0
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit1
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit2
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit3
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit4
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit5
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit6
                $Template = Copy-Item -Path "$TmplPathFile\$AuditPath" -Destination $AuditCfg
            }
        catch
            {
                Write-Warning $_ 
            }
    }

# Gethering GPO Information
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

        $RegistryPolPath0 = "$NewItem\{$($000Id)}\Machine"
        $RegistryPolPath1 = "$NewItem\{$($001Id)}\Machine"
        $RegistryPolPath2 = "$NewItem\{$($009Id)}\Machine"
        $SecEdit0 = Get-Item "$NewItem\{$($002Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit1 = Get-Item "$NewItem\{$($003Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit2 = Get-Item "$NewItem\{$($004Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit3 = Get-Item "$NewItem\{$($005Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit4 = Get-Item "$NewItem\{$($006Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit5 = Get-Item "$NewItem\{$($007Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit6 = Get-Item "$NewItem\{$($008Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $AuditCfg = Get-Item "$NewItem\{$($008Id)}\Machine\Microsoft\Windows NT\Audit"
         
        $Cmtxfile0 = "$RegistryPolPath0\comment.cmtx"
        $Cmtxfile1 = "$RegistryPolPath1\comment.cmtx"
        $Cmtxfile2 = "$RegistryPolPath2\comment.cmtx"
        $gptFile0 = "$SecEdit0\GptTmpl.inf"
        $gptFile1 = "$SecEdit1\GptTmpl.inf"
        $gptFile2 = "$SecEdit2\GptTmpl.inf"
        $gptFile3 = "$SecEdit3\GptTmpl.inf"
        $gptFile4 = "$SecEdit4\GptTmpl.inf"
        $gptFile5 = "$SecEdit5\GptTmpl.inf"
        $gptFile6 = "$SecEdit6\GptTmpl.inf"

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
    }    
Catch
    {
        write-host $_
    }
    
$PathPolicy = (Get-ADObject -Filter 'Name -eq "Policies"' -Properties * | Where-Object ObjectClass -eq container | Select-Object Name, distinguishedName).DistinguishedName    
$pPCMachineExtensionNames = "{827D319E-6EAC-11D2-A4EA-00C04F79F83A}{803E14A0-B4FB-11D0-A0D0-00A0C90F574B}"
$pPCMachineExtensionNamesAudit = "{F3CCC681-B74C-4060-9F26-CD84525DCA2A}{0F3F3735-573D-9804-99E4-AB2A69BA5FD4}"
$pPCMachineExtensionNamesFirewall = "{35378EAC-683F-11D2-A89A-00C04FBBCFA2}{B05566AC-FE9C-4368-BE01-7A4CBB6CBA11}"
Write-Progress -Activity "Running ADFortress" -Status "Importing GPO Informations" -PercentComplete 50
Start-Sleep -Seconds 2

# My Functions

function Set-Proxy (){

    function 00_proxy(){
        $VersionNumber = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "262144" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $Linkgpo = New-GPLink -Name $GPOLists[0] -Target $checkOu11
                    $Linkgpo = New-GPLink -Name $GPOLists[0] -Target $checkOu17

                    $Params = @{
                        Context   = 'User'
                        Key       = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings'
                        ValueName = 'ProxyEnable'
                        ValueName1 = 'ProxyServer'
                        ValueName2 = 'ProxyOverride'
                        ValueName3 = 'AutoDetect'
                        Value     = 1
                        Value1    = '127.0.0.1:80'
                        Value2    = '*.azure.com;*.azure.net;*.microsoft.com;*.windowsupdate.com;*.windows.net;*.sophos.com;*.sophos.net;<local>'
                        Value3    = 0
                        Type      = 'DWord'
                        Type1     = 'String'
                        Action    = 'Update'
                    }
                    $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Context $Params.Context -Key "HKCU\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value -Action $Params.Action
                    $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Context $Params.Context -Key "HKCU\$($Params.Key)" -ValueName $Params.ValueName1 -Type $Params.Type1 -Value $Params.Value1 -Action $Params.Action
                    $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Context $Params.Context -Key "HKCU\$($Params.Key)" -ValueName $Params.ValueName2 -Type $Params.Type1 -Value $Params.Value2 -Action $Params.Action
                    $Output = Set-GPPrefRegistryValue -Name $GPOLists[0] -Context $Params.Context -Key "HKCU\$($Params.Key)" -ValueName $Params.ValueName3 -Type $Params.Type -Value $Params.Value3 -Action $Params.Action
                }
        }
    }

    function 01_proxy(){

        $VersionNumber = (Get-ADObject "CN={$($001Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "131074" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $Linkgpo = New-GPLink -Name $GPOLists[1] -Target $checkOu11
                    $Linkgpo = New-GPLink -Name $GPOLists[1] -Target $checkOu17

                    $PatternReplace = "Microsoft.Policies.InternetExplorer"

                    $Content = Get-Content $Cmtxfile1
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile1 $Content

                    $Params = @{
                        Key = "Software\Policies\Microsoft\Internet Explorer\Control Panel"
                        ValueName = "Autoconfig"
                        ValueName0 = "Proxy"
                        Type = "DWORD"
                        Value = 00000001    
                    }

                    $Output = Set-GPRegistryValue -Name $GPOLists[1] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $Output = Set-GPRegistryValue -Name $GPOLists[1] -Key "HKLM\$($Params.Key)" -ValueName $Params.ValueName0 -Type $Params.Type -Value $Params.Value
                    $Output = Set-GPRegistryValue -Name $GPOLists[1] -Key "HKCU\$($Params.Key)" -ValueName $Params.ValueName -Type $Params.Type -Value $Params.Value
                    $Output = Set-GPRegistryValue -Name $GPOLists[1] -Key "HKCU\$($Params.Key)" -ValueName $Params.ValueName0 -Type $Params.Type -Value $Params.Value
                }
            }   
    }
    Write-Progress -Activity "Running ADFortress" -Status "Configuring Proxy" -PercentComplete 60
    Start-Sleep -Seconds 2
    # Run functions
    00_proxy
    01_proxy
}

function Set-UserLogonCache (){

    function 00_userlogoncache(){
        $VersionNumber = (Get-ADObject "CN={$($002Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else 
                {
                $Linkgpo = New-GPLink -Name $GPOLists[2] -Target $checkOu8
                $Linkgpo = New-GPLink -Name $GPOLists[2] -Target $checkOu14
                
                # Variables UserLogonCached
                $UserLogonCached0 = 'MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\CachedLogonsCount=1,"0"'

                # Update GptTmpl.inf file
                Add-Content -Path $gptFile0 -Value '[Registry Values]'
                Add-Content -Path $gptFile0 -Value $UserLogonCached0

                $getGPOPath = (Get-ADObject "CN={$($002Id)},$PathPolicy").DistinguishedName
                Set-ADObject -Identity $getGPOPath -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}
                
                # Edit GPT.INI and update Sysvol versionNumber

                $GptContent = Get-Content $GptIni2
                $GptContent = $GptContent -replace "Version=0", "Version=2"
                Set-Content $GptIni2 $GptContent

                # Update AD versionNumber

                $VersionNumber = (Get-ADObject "CN={$($002Id)},$PathPolicy" -Properties *)
                Set-ADObject -Identity $VersionNumber -Replace @{versionNumber="2"}
            }
        }
    }

    function 01_userlogoncache(){
        $VersionNumber = (Get-ADObject "CN={$($003Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray 
                }
            else 
                {    
                    $Linkgpo = New-GPLink -Name $GPOLists[3] -Target $checkOu4
                    $Linkgpo = New-GPLink -Name $GPOLists[3] -Target $checkOu10
                    $Linkgpo = New-GPLink -Name $GPOLists[3] -Target $checkOu16

                    # Variables UserLogonCached
                    $UserLogonCached1 = 'MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\CachedLogonsCount=1,"2"'

                    # Update GptTmpl.inf file
                    Add-Content -Path $gptFile1 -Value '[Registry Values]'
                    Add-Content -Path $gptFile1 -Value $UserLogonCached1

                    $getGPOPath = (Get-ADObject "CN={$($003Id)},$PathPolicy").DistinguishedName  
                    Set-ADObject -Identity $getGPOPath -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                        # Edit GPT.INI and update Sysvol versionNumber

                    $GptContent = Get-Content $GptIni3
                    $GptContent = $GptContent -replace "Version=0", "Version=2"
                    Set-Content $GptIni3 $GptContent

                        # Update AD versionNumber

                    $VersionNumber = (Get-ADObject "CN={$($003Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumber -Replace @{versionNumber="2"}
                }
        }  
    }
    Write-Progress -Activity "Running ADFortress" -Status "Configuring User Logon Cache" -PercentComplete 70
    Start-Sleep -Seconds 2
    # Run functions
    00_userlogoncache
    01_userlogoncache
}

function Set-WinFirewall (){

    function 00_winfirewall(){
        $VersionNumber = (Get-ADObject "CN={$($004Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $Linkgpo = New-GPLink -Name $GPOLists[4] -Target $checkOu4
                    $Linkgpo = New-GPLink -Name $GPOLists[4] -Target $checkOu14

                    # Negerate New UID
                    $NewGuid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                    $Value1 = "v2.28|Action=Block|Active=TRUE|Dir=Out|Protocol=6|RPort=3389|RPort2_10=21-23|Name=Block Critical Ports OutBound|Desc=Block Critical Ports OutBound|"
                    
                    # Configure Win firewall
                    $RDPIdle = Set-GPRegistryValue -Name $GPOLists[4] -Key "HKLM\$($Firewall.Key)" -ValueName $Firewall.ValueName -Type $Firewall.Type -Value $Firewall.Value
                    $RDPIdle = Set-GPRegistryValue -Name $GPOLists[4] -Key "HKLM\$($Firewall.Key)\FirewallRules" -ValueName $NewGuid -Type $Firewall.Type1 -Value $Value1
                
                    $getGPO = (Get-ADObject "CN={$($004Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesFirewall]"}
                }
        }
    }

    function 01_winfirewall(){

        $VersionNumber = (Get-ADObject "CN={$($005Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $Linkgpo = New-GPLink -Name $GPOLists[5] -Target $checkOu4
                    $Linkgpo = New-GPLink -Name $GPOLists[5] -Target $checkOu16

                    # Negerate New UID
                    $NewGuid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                    $Value1 = "v2.28|Action=Block|Active=TRUE|Dir=In|Protocol=6|RPort=3389|Name=Block RDP Inbound|Desc=Block RDP InBound|"

                    # Configure Win firewall
                    $RDPIdle = Set-GPRegistryValue -Name $GPOLists[5] -Key "HKLM\$($Firewall.Key)" -ValueName $Firewall.ValueName -Type $Firewall.Type -Value $Firewall.Value
                    $RDPIdle = Set-GPRegistryValue -Name $GPOLists[5] -Key "HKLM\$($Firewall.Key)\FirewallRules" -ValueName $NewGuid -Type $Firewall.Type1 -Value $Value1
                
                    $getGPO = (Get-ADObject "CN={$($005Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesFirewall]"}
                }
        }   
    }

    function 02_winfirewall(){

        $VersionNumber = (Get-ADObject "CN={$($006Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $Linkgpo = New-GPLink -Name $GPOLists[6] -Target $checkOu10

                    # Negerate New UID
                    $NewGuid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                    $Value1 = "v2.28|Action=Allow|Active=TRUE|Dir=Out|Protocol=6|Profile=Domain|RPort=3389|RA4=$DCIPAddress|Name=Allow RDP Outbound to the DC|Desc=Allow RDP From PAW to the DC|"
                    
                    # Configure Win firewall
                    $RDPIdle = Set-GPRegistryValue -Name $GPOLists[6] -Key "HKLM\$($Firewall.Key)" -ValueName $Firewall.ValueName -Type $Firewall.Type -Value $Firewall.Value
                    $RDPIdle = Set-GPRegistryValue -Name $GPOLists[6] -Key "HKLM\$($Firewall.Key)\FirewallRules" -ValueName $NewGuid -Type $Firewall.Type1 -Value $Value1
                
                    $getGPO = (Get-ADObject "CN={$($006Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesFirewall]"}
                }
        }   
    }

    function 03_winfirewall(){
    
        $VersionNumber = (Get-ADObject "CN={$($007Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "2" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $Linkgpo = New-GPLink -Name $GPOLists[7] -Target $checkOu16

                    # Negerate New UID
                    $NewGuid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                    $Value1 = "v2.28|Action=Allow|Active=TRUE|Dir=Out|Protocol=6|RPort=3389|Name=Allow RDP Outbound to the Tier1 Servers|Desc=Allow Remote Access|"
                    
                    # Configure Win firewall
                    $RDPIdle = Set-GPRegistryValue -Name $GPOLists[7] -Key "HKLM\$($Firewall.Key)" -ValueName $Firewall.ValueName -Type $Firewall.Type -Value $Firewall.Value
                    $RDPIdle = Set-GPRegistryValue -Name $GPOLists[7] -Key "HKLM\$($Firewall.Key)\FirewallRules" -ValueName $NewGuid -Type $Firewall.Type1 -Value $Value1
                
                    $getGPO = (Get-ADObject "CN={$($007Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesFirewall]"}
                }
        }   
    }
    Write-Progress -Activity "Running ADFortress" -Status "Configuring Windows Firewall" -PercentComplete 80
    Start-Sleep -Seconds 2
    # Run functions
    00_winfirewall
    01_winfirewall
    02_winfirewall
    03_winfirewall
}

function Set-AuditEventLog (){

    function 00_eventlog (){

        $VersionNumber = (Get-ADObject "CN={$($008Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "54" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $Linkgpo = New-GPLink -Name $GPOLists[8] -Target $DomainDistinguishedName

                    # Event Log Retention
                    $SecMaxLogSize = 'MaximumLogSize = 4194240'
                    $SecLogRetention = 'AuditLogRetentionPeriod = 1'
                    $SecRetentionDays = 'RetentionDays = 90'

                    $AppMaxLogSize = 'MaximumLogSize = 4194240'
                    $AppLogRetention = 'AuditLogRetentionPeriod = 1'
                    $AppRetentionDays = 'RetentionDays = 90'

                    $SysMaxLogSize = 'MaximumLogSize = 4194240'
                    $SysLogRetention = 'AuditLogRetentionPeriod = 1'
                    $SysRetentionDays = 'RetentionDays = 90'

                    # Update GptTmpl.inf file
                    Add-Content -Path $gptFile6 -Value '[Security Log]'
                    Add-Content -Path $gptFile6 -Value $SecMaxLogSize
                    Add-Content -Path $gptFile6 -Value $SecLogRetention
                    Add-Content -Path $gptFile6 -Value $SecRetentionDays

                    Add-Content -Path $gptFile6 -Value '[Application Log]'
                    Add-Content -Path $gptFile6 -Value $AppMaxLogSize
                    Add-Content -Path $gptFile6 -Value $AppLogRetention
                    Add-Content -Path $gptFile6 -Value $AppRetentionDays

                    Add-Content -Path $gptFile6 -Value '[System Log]'
                    Add-Content -Path $gptFile6 -Value $SysMaxLogSize
                    Add-Content -Path $gptFile6 -Value $SysLogRetention
                    Add-Content -Path $gptFile6 -Value $SysRetentionDays

                    Add-Content -Path $gptFile6 -Value '[Registry Values]'

                    # set the gPCMachineExtension to Apply the GPO

                    $getGPO = (Get-ADObject "CN={$($008Id)},$PathPolicy").DistinguishedName
                    Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesAudit]"}

                    # Edit GPT.INI and update Sysvol versionNumber

                    $GptContent = Get-Content $GptIni8
                    $GptContent = $GptContent -replace "Version=0", "Version=54"
                    Set-Content $GptIni8 $GptContent

                    # Update AD versionNumber

                    $VersionNumberNtlm = (Get-ADObject "CN={$($008Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="54"}
                }
        }
    }

    function 01_eventlog (){

        $VersionNumber = (Get-ADObject "CN={$($009Id)},$PathPolicy" -Properties *)
        $VersionNumber.versionNumber | ForEach {

            if ( $VersionNumber.versionNumber -eq "9" )
                {
                    Write-Host "This GPO already configured" -ForegroundColor DarkGray
                }
            else
                {
                    $Linkgpo = New-GPLink -Name $GPOLists[9] -Target $DomainDistinguishedName

                    $PatternReplace = "Microsoft.Policies.EventLogs"
                    $PatternReplace1 = "Microsoft.Policies.Auditing"

                    # Update Comment.cmtx file
                    $Content = Get-Content $Cmtxfile2
                    $Content = $Content -replace $Pattern, $PatternReplace
                    Set-Content $Cmtxfile2 $Content

                    $Contents = Get-Content $Cmtxfile2
                    $Contents = $Contents -replace $Pattern1, $PatternReplace1
                    Set-Content $Cmtxfile2 $Contents

                    $Params = @{
                        Key = "Software\Policies\Microsoft\Windows\EventLog"
                        Key1 = "Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit"
                        ValueName0 = "MaxSize"
                        ValueName1 =  "Retention"
                        ValueName2 = "ProcessCreationIncludeCmdLine_Enabled"
                        Type0 = "DWORD"
                        Type1 = "String"
                        Value0 = 32768
                        Value1 = 196608
                        Value = 0
                        Value2 = 00000001
                    }

                    $StdOut = Set-GPRegistryValue -Name $GPOLists[9] -Key "HKLM\$($Params.Key)\Application" -ValueName $Params.ValueName0 -Type $Params.Type0 -Value $Params.Value0
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[9] -Key "HKLM\$($Params.Key)\Application" -ValueName $Params.ValueName1 -Type $Params.Type1 -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[9] -Key "HKLM\$($Params.Key)\Security" -ValueName $Params.ValueName0 -Type $Params.Type0 -Value $Params.Value1
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[9] -Key "HKLM\$($Params.Key)\Security" -ValueName $Params.ValueName1 -Type $Params.Type1 -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[9] -Key "HKLM\$($Params.Key)\Setup" -ValueName $Params.ValueName0 -Type $Params.Type0 -Value $Params.Value0
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[9] -Key "HKLM\$($Params.Key)\Setup" -ValueName $Params.ValueName1 -Type $Params.Type1 -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[9] -Key "HKLM\$($Params.Key)\System" -ValueName $Params.ValueName0 -Type $Params.Type0 -Value $Params.Value0
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[9] -Key "HKLM\$($Params.Key)\System" -ValueName $Params.ValueName1 -Type $Params.Type1 -Value $Params.Value
                    $StdOut = Set-GPRegistryValue -Name $GPOLists[9] -Key "HKLM\$($Params.Key1)" -ValueName $Params.ValueName2 -Type $Params.Type0 -Value $Params.Value2
                }
        }  
    }

    function 02_eventlog (){
        $continue = $true   
        while ($continue) 
            {    
                Write-Progress -Activity "Running ADFortress" -Status "Configuring NXlog the monitoring agent" -PercentComplete 90
                Start-Sleep -Seconds 2
                $Answer = Read-Host "Do you have a SIEM Server? (Yes/No)?"
        
                switch ($Answer)
                    {
                        "yes" 
                            {
                                $ipv4Pattern = '^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'

                                do {
                                        $SERVER_IP = Read-Host -Prompt 'Enter SIEM IPv4 Address'
                                } while ($SERVER_IP -notmatch $ipv4Pattern)
                                            
                                if ((-not (Test-Path -Path $NXLOG -PathType Leaf)) -and
                                    (-not (Test-Path -Path "$NXLOG_CFG\nxlog.conf" -PathType Leaf))
                                )
                                {
                                    #Installing NXLog the monitoring Agent on the Domain Controller
                                    Write-Progress -Activity "Running ADFortress" -Status "Installing NXLog the monitoring agent" -PercentComplete 95
                                    Start-Sleep -Seconds 2

                                    $CopyItem = Copy-Item -Path $TmplPathSetup\nxlog-ce-3.2.2329.msi -Destination C:\
                                    
                                    Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/i C:\nxlog-ce-3.2.2329.msi /q" -wait -NoNewWindow
                                    Copy-Item -Path "$TmplPathFile\nxlog.conf" -Destination $NXLOG_CFG -Force
                                    
                                    $DeletItem = Remove-Item -Path C:\nxlog-ce-3.2.2329.msi -Confirm:$false
                                }

                                if ( Get-Content -Path "$NXLOG_CFG\nxlog.conf" | Select-String -Pattern CHANGEME )
                                    {
                                        (Get-Content "$NXLOG_CFG\nxlog.conf").replace("CHANGEME", $SERVER_IP) | Set-Content "$NXLOG_CFG\nxlog.conf"
                                        Restart-Service -Name nxlog

                                    }
                                $continue = $false  # Exit the loop
                            }
                        "no" 
                            {
                                Write-Warning "You have not install NXLog the monitoring agent, you can to install it later."
                                $continue = $false  # Exit the loop
                            }

                            default {
                                Write-Output "Invalid input. Please enter yes or no."
                            }
                    }
            }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Configuring Audit Event Logs" -PercentComplete 85
    Start-Sleep -Seconds 2
    # Run functions
    00_eventlog
    01_eventlog
    02_eventlog
}