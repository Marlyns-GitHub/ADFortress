<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Enable TlSv1.2 & v1.3, NTLMv2, Recycle Bin and change value of ms-DS-MachineAccountQuota
#>

# Importing Variables

. ./input/myvars.ps1
Write-Progress -Activity "Running ADFortress" -Status "Gathering domain information" -PercentComplete 15
Start-Sleep -Seconds 2

# Script body
$ExportGPO = "C:\GPOList.csv"

# Script body
$GPOLists = "FORTRESS-EnabledNTLMv2",
            "FORTRESS-EnabledTLSv1.2 & TLSv1.3"


if ((Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-EnabledNTLMv2") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-EnabledTLSv1.2 & TLSv1.3")
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

        try {
                $SecEdit0 = New-Item "$NewItem\{$($000Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination $SecEdit0
            }
        catch
            {
                Write-Warning $_ 
            }
    }

try {

        $000Id = (Get-GPO -Name $GPOLists[0]).Id.ToString()
        $001Id = (Get-GPO -Name $GPOLists[1]).Id.ToString()

        $SecEdit0 = Get-Item "$NewItem\{$($000Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $gptFile0 = "$SecEdit0\GptTmpl.inf"
        $GptIni0 = "$NewItem\{$($000Id)}\GPT.INI"

    }
Catch
    {
        Write-Warning $_
    }

$PathPolicy = (Get-ADObject -Filter 'Name -eq "Policies"' -Properties * | Where-Object ObjectClass -eq container | Select-Object Name, distinguishedName).DistinguishedName    
$pPCMachineExtensionNames = "{827D319E-6EAC-11D2-A4EA-00C04F79F83A}{803E14A0-B4FB-11D0-A0D0-00A0C90F574B}"
Write-Progress -Activity "Running ADFortress" -Status "Importing GPO Informations" -PercentComplete 60
Start-Sleep -Seconds 2

# My functions

function Set-EnableNtlmv2 {

    $VersionNumber = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
    $VersionNumber.versionNumber | ForEach {
        
        if ( $VersionNumber.versionNumber -eq "12" )
            {
                Write-Host "This GPO already configured" -ForegroundColor DarkGray
            }
        else
            {
                $Linkgpo = New-GPLink -Name $GPOLists[0] -Target $DomainControllersContainer

                $disabledNtlm0 = "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters\SupportedEncryptionTypes=4,2147483640"
                $disabledNtlm1 = "MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\allownullsessionfallback=4,0"
                $disabledNtlm2 = "MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinClientSec=4,537395200"
                $disabledNtlm3 = "MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinServerSec=4,537395200"
                $disabledNtlm4 = "MACHINE\System\CurrentControlSet\Control\Lsa\NoLMHash=4,1"
                $disabledNtlm5 = "MACHINE\System\CurrentControlSet\Control\Lsa\pku2u\AllowOnlineID=4,0"
                $disabledNtlm6 = "MACHINE\System\CurrentControlSet\Control\Lsa\UseMachineId=4,1"
                $disabledNtlm7 = "MACHINE\System\CurrentControlSet\Services\LDAP\LDAPClientIntegrity=4,1"

                Add-Content -Path $gptFile0 -Value '[Registry Values]'
                Add-Content -Path $gptFile0 -Value $disabledNtlm0
                Add-Content -Path $gptFile0 -Value $disabledNtlm1
                Add-Content -Path $gptFile0 -Value $disabledNtlm2
                Add-Content -Path $gptFile0 -Value $disabledNtlm3
                Add-Content -Path $gptFile0 -Value $disabledNtlm4
                Add-Content -Path $gptFile0 -Value $disabledNtlm5
                Add-Content -Path $gptFile0 -Value $disabledNtlm6
                Add-Content -Path $gptFile0 -Value $disabledNtlm7

                # set the gPCMachineExtension to Apply the GPO
                $getGPO = (Get-ADObject "CN={$($000Id)},$PathPolicy").DistinguishedName
                Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"} 

                # Edit GPT.INI and update Sysvol versionNumber

                $GptContent = Get-Content $GptIni0
                $GptContent = $GptContent -replace "Version=0", "Version=12"
                Set-Content $GptIni0 $GptContent

                # Update AD versionNumber

                $VersionNumberAudit = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
                Set-ADObject -Identity $VersionNumberAudit -Replace @{versionNumber="12"}
            }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Enabling NTLMv2" -PercentComplete 70
    Start-Sleep -Seconds 2
}

function Set-EnableTls {
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

                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[2])\client @Enabled -Value $Value1
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[2])\client @Disabled -Value $Value0
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[2])\server @Enabled -Value $Value1
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[2])\server @Disabled -Value $Value0
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[3])\client @Enabled -Value $Value1
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[3])\client @Disabled -Value $Value0
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[3])\server @Enabled -Value $Value1
                $Output = Set-GPPrefRegistryValue -Name $GPOLists[1] -Key $ssltlsKey\$($tls[3])\server @Disabled -Value $Value0
            }
    }
    Write-Progress -Activity "Running ADFortress" -Status "Enabling TLSv1.0 and TLSv1.1" -PercentComplete 80
    Start-Sleep -Seconds 2

 }

function Set-MachineAccountQuota {

    Write-Progress -Activity "Running ADFortress" -Status "Changing ms-DS-MachineAccountQuota value to 0" -PercentComplete 85
    Start-Sleep -Seconds 2

    $MachineAccountQuota = (Get-ADObject -Identity $DomainDistinguishedName -Properties ms-Ds-MachineAccountQuota)
    $Quota = $MachineAccountQuota.'ms-Ds-MachineAccountQuota'

    if ($Quota -ne 0)
        {
            Set-ADDomain -Identity $DomainDistinguishedName -Replace @{"ms-DS-MachineAccountQuota"="0"}
        }
    else
        {
            Write-Host "The value of ms-DS-MachineAccountQuota changed to 0" -ForegroundColor DarkGray
        }
}

function Set-RecycleBin {

    Write-Progress -Activity "Running ADFortress" -Status "Enabling Recycle Bin" -PercentComplete 90
    Start-Sleep -Seconds 2

    $Recycle = Get-ADOptionalFeature "Recycle Bin Feature" | Select-Object EnabledScopes
        
    if ($Recycle -eq '')
        {
            Enable-ADOptionalFeature -Identity "CN=Recycle Bin Feature,CN=Optional Features,CN=Directory Service,CN=Windows NT,CN=Services,CN=Configuration,$DomainDistinguishedName" -Scope ForestOrConfigurationSet -Target $DNSRoot -Confirm:$false 
        }
    else
        {
            Write-Host "Recycle Bin already activated. " -ForegroundColor DarkGray
        }
}