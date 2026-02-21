<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Implement Tiering Model
#>

# Importing Variables
. ./input/tiering_vars.ps1
Write-Progress -Activity "Running ADFortress" -Status "Gathering domain information" -PercentComplete 15
Start-Sleep -Seconds 2

# Script body
$ExportGPO = "C:\GPOList.csv"

# Script body

$GPOLists = "FORTRESS-RestrictedLogonT0",
            "FORTRESS-RestrictedLogonT2",
            "FORTRESS-RestrictedLogonPAWT0",
            "FORTRESS-RestrictedLogonJumpSRVT1",
            "FORTRESS-RestrictedLogonT1AppSRV",
            "FORTRESS-RestrictedLogonT1WebSRV",
            "FORTRESS-RestrictedLogonT1FileSRV",
            "FORTRESS-RestrictedLogonT1BDDSRV",
            "FORTRESS-RestrictedLogonT1SAPSRV",
            "FORTRESS-RestrictedLogonT1OtherSRV",
            "FORTRESS-RemoteDesktopT2Users",
            "FORTRESS-LocalAdminT0PAW",
            "FORTRESS-LocalAdminT0",
            "FORTRESS-LocalAdminT1JumpServer",
            "FORTRESS-LocalAdminT1AppSRV",
            "FORTRESS-LocalAdminT1WebSRV",
            "FORTRESS-LocalAdminT1FileSRV",
            "FORTRESS-LocalAdminT1BDDSRV",
            "FORTRESS-LocalAdminT1SAPSRV",
            "FORTRESS-LocalAdminT1OtherSRV",
            "FORTRESS-LocalAdminT2",
            "FORTRESS-LocalAdminT2Desktop",
            "FORTRESS-LocalAdminT2Laptop"

# Check if the compliance CIS hardening has been configured...
if ((Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RestrictedLogonT0") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RestrictedLogonT2") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RestrictedLogonPAWT0") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RestrictedLogonJumpSRVT1") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RestrictedLogonT1AppSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RestrictedLogonT1WebSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RestrictedLogonT1FileSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RestrictedLogonT1BDDSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RestrictedLogonT1SAPSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RestrictedLogonT1OtherSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-RemoteDesktopT2Users") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT0PAW") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT0") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT1JumpServer") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT1AppSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT1WebSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT1FileSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT1BDDSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT1SAPSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT1OtherSRV") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT2") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT2Desktop") -and
    (Get-Content $ExportGPO | Select-String -Pattern "FORTRESS-LocalAdminT2Laptop")
    )  
    {   
        # Show if the GPO Already exist
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
        $019Id = (Get-GPO -Name $GPOLists[19]).Id.ToString()
        $020Id = (Get-GPO -Name $GPOLists[20]).Id.ToString()
        $021Id = (Get-GPO -Name $GPOLists[21]).Id.ToString()
        $022Id = (Get-GPO -Name $GPOLists[22]).Id.ToString()
        
        try {
                $SecEdit0 = New-Item "$NewItem\{$($000Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit1 = New-Item "$NewItem\{$($001Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit2 = New-Item "$NewItem\{$($002Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit3 = New-Item "$NewItem\{$($003Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit4 = New-Item "$NewItem\{$($004Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit5 = New-Item "$NewItem\{$($005Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit6 = New-Item "$NewItem\{$($006Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit7 = New-Item "$NewItem\{$($007Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit8 = New-Item "$NewItem\{$($008Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit9 = New-Item "$NewItem\{$($009Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit10 = New-Item "$NewItem\{$($010Id)}\Machine\Microsoft\Windows NT\SecEdit" -ItemType Directory -ErrorAction SilentlyContinue

                $SecEdit11 = New-Item "$NewItem\{$($011Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit12 = New-Item "$NewItem\{$($012Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit13 = New-Item "$NewItem\{$($013Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit14 = New-Item "$NewItem\{$($014Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit15 = New-Item "$NewItem\{$($015Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit16 = New-Item "$NewItem\{$($016Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit17 = New-Item "$NewItem\{$($017Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit18 = New-Item "$NewItem\{$($018Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit19 = New-Item "$NewItem\{$($019Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit20 = New-Item "$NewItem\{$($020Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit21 = New-Item "$NewItem\{$($021Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue
                $SecEdit22 = New-Item "$NewItem\{$($022Id)}\Machine\Preferences\Groups" -ItemType Directory -ErrorAction SilentlyContinue

                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination "$SecEdit0\GptTmpl.inf"
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination "$SecEdit1\GptTmpl.inf"
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination "$SecEdit2\GptTmpl.inf"
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination "$SecEdit3\GptTmpl.inf"
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination "$SecEdit4\GptTmpl.inf"
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination "$SecEdit5\GptTmpl.inf"
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination "$SecEdit6\GptTmpl.inf"
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination "$SecEdit7\GptTmpl.inf"
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination "$SecEdit8\GptTmpl.inf"
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination "$SecEdit9\GptTmpl.inf"
                $Template = Copy-Item -Path "$TmplPathSecEdit\$GptTmplPath" -Destination "$SecEdit10\GptTmpl.inf"

                $Template = Copy-Item -Path "$TmplPathXml\$ChildPath" -Destination "$SecEdit11\Groups.xml"
                $Template = Copy-Item -Path "$TmplPathXml\$ChildPath" -Destination "$SecEdit12\Groups.xml"
                $Template = Copy-Item -Path "$TmplPathXml\$ChildPath" -Destination "$SecEdit13\Groups.xml"
                $Template = Copy-Item -Path "$TmplPathXml\Groupmulti.xml" -Destination "$SecEdit14\Groups.xml"
                $Template = Copy-Item -Path "$TmplPathXml\Groupmulti.xml" -Destination "$SecEdit15\Groups.xml"
                $Template = Copy-Item -Path "$TmplPathXml\Groupmulti.xml" -Destination "$SecEdit16\Groups.xml"
                $Template = Copy-Item -Path "$TmplPathXml\Groupmulti.xml" -Destination "$SecEdit17\Groups.xml"
                $Template = Copy-Item -Path "$TmplPathXml\Groupmulti.xml" -Destination "$SecEdit18\Groups.xml"
                $Template = Copy-Item -Path "$TmplPathXml\Groupmulti.xml" -Destination "$SecEdit19\Groups.xml"
                $Template = Copy-Item -Path "$TmplPathXml\$ChildPath" -Destination "$SecEdit20\Groups.xml"
                $Template = Copy-Item -Path "$TmplPathXml\Groupmulti.xml" -Destination "$SecEdit21\Groups.xml"
                $Template = Copy-Item -Path "$TmplPathXml\Groupmulti.xml" -Destination "$SecEdit22\Groups.xml"
            }
        catch
            {
                Write-Warning $_ 
            }
   }

# Gethering GPO Informations

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
        $019Id = (Get-GPO -Name $GPOLists[19]).Id.ToString()
        $020Id = (Get-GPO -Name $GPOLists[20]).Id.ToString()
        $021Id = (Get-GPO -Name $GPOLists[21]).Id.ToString()
        $022Id = (Get-GPO -Name $GPOLists[22]).Id.ToString()

        $SecEdit0 = Get-Item "$NewItem\{$($000Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit1 = Get-Item "$NewItem\{$($001Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit2 = Get-Item "$NewItem\{$($002Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit3 = Get-Item "$NewItem\{$($003Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit4 = Get-Item "$NewItem\{$($004Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit5 = Get-Item "$NewItem\{$($005Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit6 = Get-Item "$NewItem\{$($006Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit7 = Get-Item "$NewItem\{$($007Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit8 = Get-Item "$NewItem\{$($008Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit9 = Get-Item "$NewItem\{$($009Id)}\Machine\Microsoft\Windows NT\SecEdit"
        $SecEdit10 = Get-Item "$NewItem\{$($010Id)}\Machine\Microsoft\Windows NT\SecEdit"

        $SecEdit11 = Get-Item "$NewItem\{$($011Id)}\Machine\Preferences\Groups"
        $SecEdit12 = Get-Item "$NewItem\{$($012Id)}\Machine\Preferences\Groups"
        $SecEdit13 = Get-Item "$NewItem\{$($013Id)}\Machine\Preferences\Groups"
        $SecEdit14 = Get-Item "$NewItem\{$($014Id)}\Machine\Preferences\Groups"
        $SecEdit15 = Get-Item "$NewItem\{$($015Id)}\Machine\Preferences\Groups"
        $SecEdit16 = Get-Item "$NewItem\{$($016Id)}\Machine\Preferences\Groups"
        $SecEdit17 = Get-Item "$NewItem\{$($017Id)}\Machine\Preferences\Groups"
        $SecEdit18 = Get-Item "$NewItem\{$($018Id)}\Machine\Preferences\Groups"
        $SecEdit19 = Get-Item "$NewItem\{$($019Id)}\Machine\Preferences\Groups"
        $SecEdit20 = Get-Item "$NewItem\{$($020Id)}\Machine\Preferences\Groups"
        $SecEdit21 = Get-Item "$NewItem\{$($021Id)}\Machine\Preferences\Groups"
        $SecEdit22 = Get-Item "$NewItem\{$($022Id)}\Machine\Preferences\Groups"

        $gptFile0 = "$SecEdit0\GptTmpl.inf"
        $gptFile1 = "$SecEdit1\GptTmpl.inf"
        $gptFile2 = "$SecEdit2\GptTmpl.inf"
        $gptFile3 = "$SecEdit3\GptTmpl.inf"
        $gptFile4 = "$SecEdit4\GptTmpl.inf"
        $gptFile5 = "$SecEdit5\GptTmpl.inf"
        $gptFile6 = "$SecEdit6\GptTmpl.inf"
        $gptFile7 = "$SecEdit7\GptTmpl.inf"
        $gptFile8 = "$SecEdit8\GptTmpl.inf"
        $gptFile9 = "$SecEdit9\GptTmpl.inf"
        $gptFile10 = "$SecEdit10\GptTmpl.inf"

        # Sysvol versionNumber Gpt.INI file path

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
        $GptIni19 = "$NewItem\{$($019Id)}\GPT.INI"
        $GptIni20 = "$NewItem\{$($020Id)}\GPT.INI"
        $GptIni21 = "$NewItem\{$($021Id)}\GPT.INI"
        $GptIni22 = "$NewItem\{$($022Id)}\GPT.INI"
    }
Catch
    {
        write-host "$_"
    }

$PathPolicy = (Get-ADObject -Filter 'Name -eq "Policies"' -Properties * | Where-Object ObjectClass -eq container | Select-Object Name, distinguishedName).DistinguishedName    
$pPCMachineExtensionNames = "{827D319E-6EAC-11D2-A4EA-00C04F79F83A}{803E14A0-B4FB-11D0-A0D0-00A0C90F574B}"
$pPCMachineExtensionNamesLocalUser = "{00000000-0000-0000-0000-000000000000}{79F92669-4224-476C-9C5C-6EFB4D87DF4A}][{17D89FEC-5C44-4972-B12D-241CAEF74509}{79F92669-4224-476C-9C5C-6EFB4D87DF4A}"
Write-Progress -Activity "Running ADFortress" -Status "Importing GPO Informations" -PercentComplete 45
Start-Sleep -Seconds 2

# My Functions

function Set-OUTiers {

    if (($check1 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $NetBIOSName).DistinguishedName) -and
        ($check2 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[0]).DistinguishedName) -and
        ($check3 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[1]).DistinguishedName) -and
        ($check4 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[2]).DistinguishedName) -and
        ($check5 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[3]).DistinguishedName) -and
        ($check6 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[4]).DistinguishedName) -and
        ($check7 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[5]).DistinguishedName) -and
        ($check8 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier0,$ParentOu" | Where-Object Name -eq $OU_T0.Name[0]).DistinguishedName) -and
        ($check9 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier0,$ParentOu" | Where-Object Name -eq $OU_T0.Name[1]).DistinguishedName) -and
        ($check10 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier0,$ParentOu" | Where-Object Name -eq $OU_T0.Name[2]).DistinguishedName) -and
        ($check11 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier0,$ParentOu" | Where-Object Name -eq $OU_T0.Name[3]).DistinguishedName) -and
        ($check12 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T0.Name[4]).DistinguishedName) -and
        ($check13 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T0.Name[5]).DistinguishedName) -and
        ($check14 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1.Name[0]).DistinguishedName) -and
        ($check15 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1.Name[1]).DistinguishedName) -and
        ($check16 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1.Name[2]).DistinguishedName) -and
        ($check17 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1.Name[3]).DistinguishedName) -and
        ($check18 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T1.Name[4]).DistinguishedName) -and
        ($check19 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T1.Name[5]).DistinguishedName) -and
        ($check20 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T1SRV.Name[0]).DistinguishedName) -and
        ($check21 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T1SRV.Name[1]).DistinguishedName) -and
        ($check22 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Servers,OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1SRV.Name[2]).DistinguishedName) -and
        ($check23 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Servers,OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1SRV.Name[3]).DistinguishedName) -and
        ($check24 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Servers,OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1SRV.Name[4]).DistinguishedName) -and
        ($check25 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Servers,OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1SRV.Name[5]).DistinguishedName) -and
        ($check26 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier2,$ParentOu" | Where-Object Name -eq $OU_T2.Name[0]).DistinguishedName) -and
        ($check27 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier2,$ParentOu" | Where-Object Name -eq $OU_T2.Name[1]).DistinguishedName) -and
        ($check28 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=User Accounts,$ParentOu" | Where-Object Name -eq $OU_UA.Name[0]).DistinguishedName) -and
        ($check29 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UA.Name[1]).DistinguishedName) -and
        ($check30 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UA.Name[2]).DistinguishedName) -and
        ($check31 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=User Devices,$ParentOu" | Where-Object Name -eq $OU_UD.Name[0]).DistinguishedName) -and
        ($check32 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UD.Name[1]).DistinguishedName) -and
        ($check33 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UD.Name[2]).DistinguishedName) -and
        ($check34 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=User Groups,$ParentOu" | Where-Object Name -eq $OU_UG.Name[0]).DistinguishedName) -and
        ($check35 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UG.Name[1]).DistinguishedName) -and
        ($check35 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UG.Name[2]).DistinguishedName)
       )
        {
            # Create OU Tiered Mode
            Write-Progress -Activity "Running ADFortress" -Status "Checking Tiered Model OU if they already exist" -PercentComplete 50
            Start-Sleep -Seconds 2

            Write-Host $check1 -ForegroundColor DarkGray
            Write-Host $check2 -ForegroundColor DarkGray
            Write-Host $check3 -ForegroundColor DarkGray
            Write-Host $check4 -ForegroundColor DarkGray
            Write-Host $check5 -ForegroundColor DarkGray
            Write-Host $check6 -ForegroundColor DarkGray
            Write-Host $check7 -ForegroundColor DarkGray
            Write-Host $check8 -ForegroundColor DarkGray
            Write-Host $check9 -ForegroundColor DarkGray
            Write-Host $check10 -ForegroundColor DarkGray
            Write-Host $check11 -ForegroundColor DarkGray
            Write-Host $check12 -ForegroundColor DarkGray
            Write-Host $check13 -ForegroundColor DarkGray
            Write-Host $check14 -ForegroundColor DarkGray
            Write-Host $check15 -ForegroundColor DarkGray
            Write-Host $check16 -ForegroundColor DarkGray
            Write-Host $check17 -ForegroundColor DarkGray
            Write-Host $check18 -ForegroundColor DarkGray
            Write-Host $check19 -ForegroundColor DarkGray
            Write-Host $check20 -ForegroundColor DarkGray
            Write-Host $check21 -ForegroundColor DarkGray
            Write-Host $check22 -ForegroundColor DarkGray
            Write-Host $check23 -ForegroundColor DarkGray
            Write-Host $check24 -ForegroundColor DarkGray
            Write-Host $check25 -ForegroundColor DarkGray
            Write-Host $check26 -ForegroundColor DarkGray
            Write-Host $check27 -ForegroundColor DarkGray
            Write-Host $check28 -ForegroundColor DarkGray
            Write-Host $check29 -ForegroundColor DarkGray
            Write-Host $check30 -ForegroundColor DarkGray
            Write-Host $check31 -ForegroundColor DarkGray
            Write-Host $check32 -ForegroundColor DarkGray
            Write-Host $check33 -ForegroundColor DarkGray
            Write-Host $check34 -ForegroundColor DarkGray
            Write-Host $check35 -ForegroundColor DarkGray
            Write-Host $check36 -ForegroundColor DarkGray
            Write-Host ""
        } 
    else
        {
            Write-Progress -Activity "Running ADFortress" -Status "Creating OU Tiered Model Organizational Units" -PercentComplete 50
            Start-Sleep -Seconds 2

            New-ADOrganizationalUnit -Name $NetBIOSName -Path $DomainName
            $OUs | New-ADOrganizationalUnit -Path $ParentOu
            $OU_T0 | New-ADOrganizationalUnit -Path "OU=Tier0,$ParentOu"
            $OU_T1 | New-ADOrganizationalUnit -Path "OU=Tier1,$ParentOu"
            $OU_T1SRV | New-ADOrganizationalUnit -Path "OU=Servers,OU=Tier1,$ParentOu"
            $OU_T2 | New-ADOrganizationalUnit -Path "OU=Tier2,$ParentOu"
            $OU_UA | New-ADOrganizationalUnit -Path "OU=User Accounts,$ParentOu"
            $OU_UD | New-ADOrganizationalUnit -Path "OU=User Devices,$ParentOu"
            $OU_UG | New-ADOrganizationalUnit -Path "OU=User Groups,$ParentOu"
        }
}

function Set-GroupTiers {

    if (($checkOu = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $NetBIOSName).DistinguishedName) -and
        ($checkOu0 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[0]).DistinguishedName) -and
        ($checkOu1 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[1]).DistinguishedName) -and
        ($checkOu2 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[2]).DistinguishedName) -and
        ($checkOu5 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[5]).DistinguishedName)
       )
       {
        if (($check0 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[0]).DistinguishedName) -and
            ($check1 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[1]).DistinguishedName) -and
            ($check2 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[2]).DistinguishedName) -and
            ($check3 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[3]).DistinguishedName) -and
            ($check4 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[4]).DistinguishedName) -and
            ($check5 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[5]).DistinguishedName) -and
            ($check6 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[6]).DistinguishedName) -and
            ($check7 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[7]).DistinguishedName) -and
            ($check8 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[0]).DistinguishedName) -and
            ($check9 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[1]).DistinguishedName) -and
            ($check10 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[2]).DistinguishedName) -and
            ($check11 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[3]).DistinguishedName) -and
            ($check12 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[4]).DistinguishedName) -and
            ($check13 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[5]).DistinguishedName) -and
            ($check14 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[6]).DistinguishedName) -and
            ($check15 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[7]).DistinguishedName) -and
            ($check16 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[8]).DistinguishedName) -and
            ($check17 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[9]).DistinguishedName) -and
            ($check18 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[10]).DistinguishedName) -and
            ($check19 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[11]).DistinguishedName) -and
            ($check20 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[12]).DistinguishedName) -and
            ($check21 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[13]).DistinguishedName) -and
            ($check22 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[14]).DistinguishedName) -and
            ($check23 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[15]).DistinguishedName) -and
            ($check24 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[16]).DistinguishedName) -and
            ($check25 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[17]).DistinguishedName) -and
            ($check26 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT1.Group[18]).DistinguishedName) -and
            ($check27 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT2.Group[0]).DistinguishedName) -and
            ($check28 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT2.Group[1]).DistinguishedName) -and
            ($check29 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT2.Group[2]).DistinguishedName) -and
            ($check30 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groups.Group[0]).DistinguishedName) -and
            ($check31 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groups.Group[1]).DistinguishedName) -and
            ($check32 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groups.Group[2]).DistinguishedName) -and
            ($check33 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groups.Group[3]).DistinguishedName)
           )
            {
                # Checking if Tiered Model Groups Exist
                Write-Progress -Activity "Running ADFortress" -Status "Checking Tiered Model Groups if they already exist" -PercentComplete 50
                Start-Sleep -Seconds 2

                Write-Host $check0 -ForegroundColor DarkGray
                Write-Host $check1 -ForegroundColor DarkGray
                Write-Host $check2 -ForegroundColor DarkGray
                Write-Host $check3 -ForegroundColor DarkGray
                Write-Host $check4 -ForegroundColor DarkGray
                Write-Host $check5 -ForegroundColor DarkGray
                Write-Host $check6 -ForegroundColor DarkGray
                Write-Host $check7 -ForegroundColor DarkGray
                Write-Host $check8 -ForegroundColor DarkGray
                Write-Host $check9 -ForegroundColor DarkGray
                Write-Host $check10 -ForegroundColor DarkGray
                Write-Host $check11 -ForegroundColor DarkGray
                Write-Host $check12 -ForegroundColor DarkGray
                Write-Host $check13 -ForegroundColor DarkGray
                Write-Host $check14 -ForegroundColor DarkGray
                Write-Host $check15 -ForegroundColor DarkGray
                Write-Host $check16 -ForegroundColor DarkGray
                Write-Host $check17 -ForegroundColor DarkGray
                Write-Host $check18 -ForegroundColor DarkGray
                Write-Host $check19 -ForegroundColor DarkGray
                Write-Host $check20 -ForegroundColor DarkGray
                Write-Host $check21 -ForegroundColor DarkGray
                Write-Host $check22 -ForegroundColor DarkGray
                Write-Host $check23 -ForegroundColor DarkGray
                Write-Host $check24 -ForegroundColor DarkGray
                Write-Host $check25 -ForegroundColor DarkGray
                Write-Host $check26 -ForegroundColor DarkGray
                Write-Host $check27 -ForegroundColor DarkGray
                Write-Host $check28 -ForegroundColor DarkGray
                Write-Host $check29 -ForegroundColor DarkGray
                Write-Host $check30 -ForegroundColor DarkGray
                Write-Host $check31 -ForegroundColor DarkGray
                Write-Host $check32 -ForegroundColor DarkGray
                Write-Host $check33 -ForegroundColor DarkGray
                Write-Host ""
            }
        else 
            {
                foreach ($tier in $OUs.Name){
                    $path = (Get-ADOrganizationalUnit -Filter "Name -eq '$tier'").DistinguishedName
                    if ($path -match $OUs.Name[0])
                        {
                            Write-Progress -Activity "Running ADFortress" -Status "Creating Tiered Model Tier0 Security Groups" -PercentComplete 52
                            Start-Sleep -Seconds 2
                            $PathT0gp = (Get-ADOrganizationalUnit  -SearchBase $path -Filter "Name -eq 'Groups'").Distinguishedname
                            
                            foreach ($group in $GroupT0.Group)
                                {
                                    if ($group -match $GroupT0.group[0])
                                        {
                                            New-ADGroup -Name $group -Description "Designated admins of the Tier0" -GroupCategory Security -GroupScope Global -Path $PathT0gp
                                        }
                                    if ($group -match $GroupT0.group[1])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Non-Human Identities of the Tier0" -GroupCategory Security -GroupScope Global -Path $PathT0gp
                                        }
                                    if ($group -match $GroupT0.group[2])
                                        {
                                            New-ADGroup -Name $group -Description "Designated PAW Users of the Tier0" -GroupCategory Security -GroupScope Global -Path $PathT0gp
                                        }
                                    if ($group -match $GroupT0.group[3])
                                        {
                                            New-ADGroup -Name $group -Description "Designated PAW Devices of the Tier0" -GroupCategory Security -GroupScope Global -Path $PathT0gp
                                        }
                                    if ($group -match $GroupT0.group[4])
                                        {
                                            New-ADGroup -Name $group -Description "Designated PAW Maintenance of the Tier0" -GroupCategory Security -GroupScope Global -Path $PathT0gp
                                        }
                                    if ($group -match $GroupT0.group[5])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Servers of the Tier0" -GroupCategory Security -GroupScope Global -Path $PathT0gp
                                        }
                                    if ($group -match $GroupT0.group[6])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Maintenance of the Tier0" -GroupCategory Security -GroupScope Global -Path $PathT0gp
                                        }
                                    if ($group -match $GroupT0.group[7])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Authentication Silo Members of the Tier0" -GroupCategory Security -GroupScope Global -Path $PathT0gp
                                        }
                                    if ($group -match $GroupT0.group[8])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Authentication Silo Devices of the Tier0" -GroupCategory Security -GroupScope Global -Path $PathT0gp
                                        }
                                }  
                        }

                    if ($path -match $OUs.Name[1])
                        {
            
                            Write-Progress -Activity "Running ADFortress" -Status "Creating Tiered Model Tier1 Security Groups" -PercentComplete 54
                            Start-Sleep -Seconds 2
                            $PathT1gp = (Get-ADOrganizationalUnit  -SearchBase $path -Filter "Name -eq 'Groups'").Distinguishedname
            
                            foreach ($group in $GroupT1.Group)
                                {

                                    if ($group -match $GroupT1.group[0])
                                        {
                                            New-ADGroup -Name $group -Description "Designated admins of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        }
                                    if ($group -match $GroupT1.group[1])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        }
                                    if ($group -match $GroupT1.group[2])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Non-Human Identities of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        }
                                    if ($group -match $GroupT1.group[3])
                                        {
                                            New-ADGroup -Name $group -Description "Designated JumpServer Users of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        }
                                    if ($group -match $GroupT1.group[4])
                                        {
                                            New-ADGroup -Name $group -Description "Designated JumpServer Maintenance of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        }
                                    if ($group -match $GroupT1.group[5])
                                        {
                                            New-ADGroup -Name $group -Description "Designated JumpServer Computers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        }
                                    if ($group -match $GroupT1.group[6])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Maintenance of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        }
                                    if ($group -match $GroupT1.group[7])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Remote Desktop App Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        }
                                    if ($group -match $GroupT1.group[8])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Remote Desktop Web Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        }  
                                    if ($group -match $GroupT1.group[9])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Remote Desktop BDD Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        }  
                                    if ($group -match $GroupT1.group[10])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Remote Desktop File servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        }  
                                    if ($group -match $GroupT1.group[11])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Remote Desktop SAP Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        } 
                                    if ($group -match $GroupT1.group[12])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Remote Desktop Other Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        } 
                                    if ($group -match $GroupT1.group[13])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Local Admin App Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        } 
                                    if ($group -match $GroupT1.group[14])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Local Admin Web Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        } 
                                    if ($group -match $GroupT1.group[15])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Local Admin BDD Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        } 
                                    if ($group -match $GroupT1.group[16])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Local Admin File Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        } 
                                    if ($group -match $GroupT1.group[17])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Local Admin SAP Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        } 
                                    if ($group -match $GroupT1.group[18])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Local Admin Other Servers of the Tier1" -GroupCategory Security -GroupScope Global -Path $PathT1gp
                                        } 
                                }
                        }

                    if ($path -match $OUs.Name[2])
                        {
            
                            Write-Progress -Activity "Running ADFortress" -Status "Creating Tiered Model Tier2 Security Groups" -PercentComplete 57
                            Start-Sleep -Seconds 2
                            $PathT2gp = (Get-ADOrganizationalUnit  -SearchBase $path -Filter "Name -eq 'Groups'").Distinguishedname
            
                            foreach ($group in $GroupT2.Group)
                                {

                                    if ($group -match $GroupT2.group[0])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Desktop Local admins of the Tier2" -GroupCategory Security -GroupScope Global -Path $PathT2gp
                                        }
                                    if ($group -match $GroupT2.group[1])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Laptop Local Admins of the Tier2" -GroupCategory Security -GroupScope Global -Path $PathT2gp
                                        }
                                    if ($group -match $GroupT2.group[2])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Heldesk Operators of the Tier2" -GroupCategory Security -GroupScope Global -Path $PathT2gp
                                        }
                                }
                        }

                    if ($path -match $OUs.Name[5])
                        {
            
                            Write-Progress -Activity "Running ADFortress" -Status "Creating Tiered Model Users Security Groups" -PercentComplete 60
                            Start-Sleep -Seconds 2
                            $Pathgp = (Get-ADOrganizationalUnit  -SearchBase $path -Filter "Name -eq 'Security'").Distinguishedname
            
                            foreach ($group in $Groups.Group)
                                {

                                    if ($group -match $Groups.group[0])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Remote Desktop Users of the Enterprise" -GroupCategory Security -GroupScope Global -Path $Pathgp
                                        }
                                    if ($group -match $Groups.group[1])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Users of the Enterprise" -GroupCategory Security -GroupScope Global -Path $Pathgp
                                        }
                                    if ($group -match $Groups.group[2])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Desktop WorkStations  of the Enterprise" -GroupCategory Security -GroupScope Global -Path $Pathgp
                                        }
                                    if ($group -match $Groups.group[3])
                                        {
                                            New-ADGroup -Name $group -Description "Designated Laptop WorkStations of the Enterprise" -GroupCategory Security -GroupScope Global -Path $Pathgp
                                        }
                                }
                        }
                }
            }
        }   
    else 
        {
            write-warning "This task depends on the task [1] Tiering Model OU."
        }
}

# Configure Tiered Model Restricted Logon
function Set-RestrictedLogon {

    if (($checkOu = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $NetBIOSName).DistinguishedName) -and
        ($checkOu0 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[0]).DistinguishedName) -and
        ($checkOu1 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[1]).DistinguishedName) -and
        ($checkOu2 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[2]).DistinguishedName) -and
        ($checkOu5 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[5]).DistinguishedName) -and
        ($checkGp0 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[0]).DistinguishedName) -and
        ($checkGp1 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[1]).DistinguishedName) -and
        ($checkGp2 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[2]).DistinguishedName)
       )
       {
            try {
                    # Link Disabled GPOs
                    # Tier 0
                    $Linkgpo = New-GPLink -Name $GPOLink.Name[0] -Target $checkOu8 -ErrorAction SilentlyContinue
                    $Linkgpo = New-GPLink -Name $GPOLink.Name[1] -Target $checkOu8 -ErrorAction SilentlyContinue
                    $Linkgpo = New-GPLink -Name $GPOLink.Name[2] -Target $checkOu8 -ErrorAction SilentlyContinue
                    $Linkgpo = New-GPLink -Name $GPOLink.Name[3] -Target $checkOu8 -ErrorAction SilentlyContinue
                    $Linkgpo = New-GPLink -Name $GPOLink.Name[4] -Target $checkOu8 -ErrorAction SilentlyContinue
                }
            catch
                {
                    Write-Warning $_
                }

            function Set-RestrictedLogonT0 () 
                {
                    $VersionNumber = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
                    $VersionNumber.versionNumber | ForEach {

                        if ( $VersionNumber.versionNumber -eq "16" )
                            {
                                write-host "Restricted Logon Tier0 already configured " -ForegroundColor DarkGray
                            }
                        else       
                            {                              
                                # Link Restricted Logon GPO
                                $Linkgpo = New-GPLink -Name $GPOLists[0] -Target $DomainControllersContainer
                                $Linkgpo = New-GPLink -Name $GPOLists[0] -Target $checkOu8

                                # Allows Section
                                $addURABatch = "SeBatchLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT0Sid),*$($SrvAccountT0Sid)"
                                $addURAService = "SeServiceLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT0Sid),*$($SrvAccountT0Sid)"
                                $addURARemote = "SeRemoteInteractiveLogonRight = *$($AdminT0Sid)"
                                $addURALocally = "SeInteractiveLogonRight = *$($AdminsSid),*$($BackupSid),*$($AdminT0Sid),*$($MainT0Sid),*$($SrvAccountT0Sid)"

                                # Deny section
                                $addURADenyBatch = "SeDenyBatchLogonRight = *$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($RDPWebT1Sid),*$($LAWebT1Sid)"
                                $addURADenyService = "SeDenyServiceLogonRight = *$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($RDPWebT1Sid),*$($LAWebT1Sid)"
                                $addURADenyRemote = "SeDenyRemoteInteractiveLogonRight = *$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($MainT0Sid),*$($SrvAccountT0Sid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($RDPWebT1Sid),*$($LAWebT1Sid)"
                                $addURADenyLocally = "SeDenyInteractiveLogonRight = *$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($RDPWebT1Sid),*$($LAWebT1Sid)"

                                # Edit GptTmpl.inf
                                Add-Content -Path $gptFile0 -Value '[Privilege Rights]'
                                Add-Content -Path $gptFile0 -Value $addURABatch
                                Add-Content -Path $gptFile0 -Value $addURAService 
                                Add-Content -Path $gptFile0 -Value $addURARemote
                                Add-Content -Path $gptFile0 -Value $addURALocally
                                Add-Content -Path $gptFile0 -Value $addURADenyBatch
                                Add-Content -Path $gptFile0 -Value $addURADenyService
                                Add-Content -Path $gptFile0 -Value $addURADenyRemote
                                Add-Content -Path $gptFile0 -Value $addURADenyLocally

                                $getGPOT0 = (Get-ADObject "CN={$($000Id)},$PathPolicy").DistinguishedName  
                                Set-ADObject -Identity $getGPOT0 -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"} 
                                        
                                # Edit GPT.INI and update Sysvol versionNumber

                                $GptContent = Get-Content $GptIni0
                                $GptContent = $GptContent -replace "Version=0", "Version=16"
                                Set-Content $GptIni0 $GptContent

                                # Update AD versionNumber

                                $VersionNumberT0 = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
                                Set-ADObject -Identity $VersionNumberT0 -Replace @{versionNumber="16"}
                            }    
                    }
                }

            function Set-RestrictedLogonT2 () 
                {

                    $VersionNumber = (Get-ADObject "CN={$($001Id)},$PathPolicy" -Properties *)
                    $VersionNumber.versionNumber | ForEach {

                        if ( $VersionNumber.versionNumber -eq "10" )
                            {      
                                write-host "Restricted Logon Tier2 already configured " -ForegroundColor DarkGray
                            }
                        else
                            {
                                $Linkgpo = New-GPLink -Name $GPOLists[1] -Target $checkOu4

                                # Deny section
                                $addURADenyBatch = "SeDenyBatchLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($RDPWebT1Sid),*$($LAWebT1Sid)"
                                $addURADenyService = "SeDenyServiceLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($RDPWebT1Sid),*$($LAWebT1Sid)"
                                $addURADenyRemote = "SeDenyRemoteInteractiveLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($RDPWebT1Sid),*$($LAWebT1Sid)"
                                $addURADenyLocally = "SeDenyInteractiveLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($RDPWebT1Sid),*$($LAWebT1Sid)"
                                $addURADenyNetwork = "SeDenyNetworkLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($RDPWebT1Sid),*$($LAWebT1Sid)"

                                # Edit GptTmpl.inf
                                Add-Content -Path $gptFile1 -Value '[Privilege Rights]'
                                Add-Content -Path $gptFile1 -Value $addURADenyBatch
                                Add-Content -Path $gptFile1 -Value $addURADenyService
                                Add-Content -Path $gptFile1 -Value $addURADenyRemote
                                Add-Content -Path $gptFile1 -Value $addURADenyLocally
                                Add-Content -Path $gptFile1 -Value $addURADenyNetwork

                                $getGPOT1 = (Get-ADObject "CN={$($001Id)},$PathPolicy").DistinguishedName
                                Set-ADObject -Identity $getGPOT1 -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                                # Edit GPT.INI and update Sysvol versionNumber

                                $GptContent = Get-Content $GptIni1
                                $GptContent = $GptContent -replace "Version=0", "Version=10"
                                Set-Content $GptIni1 $GptContent

                                # Update AD versionNumber

                                $VersionNumberT2 = (Get-ADObject "CN={$($001Id)},$PathPolicy" -Properties *)
                                Set-ADObject -Identity $VersionNumberT2 -Replace @{versionNumber="10"}
                            }  
                    }
                }

            # PAW
            function Set-RestrictedLogonPAWT0 () 
                {
                    $VersionNumber = (Get-ADObject "CN={$($002Id)},$PathPolicy" -Properties *)
                    $VersionNumber.versionNumber | ForEach {

                        if ( $VersionNumber.versionNumber -eq "16" )
                            {
                                write-host "Restricted Logon PAW Tier0 already configured " -ForegroundColor DarkGray
                            }
                        else 
                            {
                                $Linkgpo = New-GPLink -Name $GPOLists[2] -Target $checkOu10

                                # Allows Section
                                $addURABatch = "SeBatchLogonRight = *$($AdminsSid),*$($PAWMainT0Sid),*$($SrvAccountT0Sid)"
                                $addURAService = "SeServiceLogonRight = *$($AdminsSid),*$($PAWMainT0Sid),*$($SrvAccountT0Sid)"
                                $addURARemote = "SeRemoteInteractiveLogonRight = *$($PAWUserT0Sid)"
                                $addURALocally = "SeInteractiveLogonRight = *$($AdminsSid),*$($PAWMainT0Sid),*$($PAWUserT0Sid),*$($SrvAccountT0Sid)"
                                        
                                # Deny section
                                $addURADenyBatch = "SeDenyBatchLogonRight = *$($AdminT0Sid),*$($MainT0Sid),*$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyService = "SeDenyServiceLogonRight = *$($AdminT0Sid),*$($MainT0Sid),*$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyRemote = "SeDenyRemoteInteractiveLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($PAWMainT0Sid),*$($MainT0Sid),*$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyLocally = "SeDenyInteractiveLogonRight = *$($AdminT0Sid),*$($MainT0Sid),*$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"

                                # Edit GptTmpl.inf
                                Add-Content -Path $gptFile2 -Value '[Privilege Rights]'
                                Add-Content -Path $gptFile2 -Value $addURABatch
                                Add-Content -Path $gptFile2 -Value $addURAService 
                                Add-Content -Path $gptFile2 -Value $addURARemote
                                Add-Content -Path $gptFile2 -Value $addURALocally
                                Add-Content -Path $gptFile2 -Value $addURADenyBatch
                                Add-Content -Path $gptFile2 -Value $addURADenyService
                                Add-Content -Path $gptFile2 -Value $addURADenyRemote
                                Add-Content -Path $gptFile2 -Value $addURADenyLocally

                                $getGPOT2 = (Get-ADObject "CN={$($002Id)},$PathPolicy").DistinguishedName
                                Set-ADObject -Identity $getGPOT2 -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                                # Edit GPT.INI and update Sysvol versionNumber

                                $GptContent = Get-Content $GptIni2
                                $GptContent = $GptContent -replace "Version=0", "Version=16"
                                Set-Content $GptIni2 $GptContent

                                # Update AD versionNumber

                                $VersionNumberT2 = (Get-ADObject "CN={$($002Id)},$PathPolicy" -Properties *)
                                Set-ADObject -Identity $VersionNumberT2 -Replace @{versionNumber="16"}
                            }
                    }
                }

            # JumpServer
            function Set-RestrictedLogonJumpSRVT1 () 
                {
                    $VersionNumber = (Get-ADObject "CN={$($003Id)},$PathPolicy" -Properties *)
                    $VersionNumber.versionNumber | ForEach {

                        if ( $VersionNumber.versionNumber -eq "16" )
                            {
                                write-host "Restricted Logon Jump Server Tier1 already configured " -ForegroundColor DarkGray
                            }
                        else 
                            {
                                $Linkgpo = New-GPLink -Name $GPOLists[3] -Target $checkOu16

                                # Allows Section
                                $addURABatch = "SeBatchLogonRight = *$($AdminsSid),*$($JumpMainT1Sid),*$($SrvAccountT1Sid)"
                                $addURAService = "SeServiceLogonRight = *$($AdminsSid),*$($JumpMainT1Sid),*$($SrvAccountT1Sid)"
                                $addURARemote = "SeRemoteInteractiveLogonRight = *$($JumpUserT1Sid)"
                                $addURALocally = "SeInteractiveLogonRight = *$($AdminsSid),*$($JumpUserT1Sid),*$($JumpMainT1Sid),*$($SrvAccountT1Sid)"

                                # Deny section
                                $addURADenyBatch = "SeDenyBatchLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AdminT1Sid),*$($MainT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid),*$($JumpUserT1Sid)"
                                $addURADenyService = "SeDenyServiceLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AdminT1Sid),*$($MainT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid),*$($JumpUserT1Sid)"
                                $addURADenyRemote = "SeDenyRemoteInteractiveLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AdminT1Sid),*$($SrvAccountT1Sid),*$($MainT1Sid),*$($JumpMainT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyLocally = "SeDenyInteractiveLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($AdminT1Sid),*$($MainT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($BackupSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"

                                # Edit GptTmpl.inf
                                Add-Content -Path $gptFile3 -Value '[Privilege Rights]'
                                Add-Content -Path $gptFile3 -Value $addURABatch
                                Add-Content -Path $gptFile3 -Value $addURAService 
                                Add-Content -Path $gptFile3 -Value $addURARemote
                                Add-Content -Path $gptFile3 -Value $addURALocally
                                Add-Content -Path $gptFile3 -Value $addURADenyBatch
                                Add-Content -Path $gptFile3 -Value $addURADenyService
                                Add-Content -Path $gptFile3 -Value $addURADenyRemote
                                Add-Content -Path $gptFile3 -Value $addURADenyLocally

                                $getGPOT3 = (Get-ADObject "CN={$($003Id)},$PathPolicy").DistinguishedName
                                Set-ADObject -Identity $getGPOT3 -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                                # Edit GPT.INI and update Sysvol versionNumber

                                $GptContent = Get-Content $GptIni3
                                $GptContent = $GptContent -replace "Version=0", "Version=16"
                                Set-Content $GptIni3 $GptContent

                                # Update AD versionNumber

                                $VersionNumberT2 = (Get-ADObject "CN={$($003Id)},$PathPolicy" -Properties *)
                                Set-ADObject -Identity $VersionNumberT2 -Replace @{versionNumber="16"}
                            }
                    }        
                }

            # Remote Desktop
            function Set-RestrictedLogonT1AppSRV () 
                {
                    $VersionNumber = (Get-ADObject "CN={$($004Id)},$PathPolicy" -Properties *)
                    $VersionNumber.versionNumber | ForEach {

                        if ( $VersionNumber.versionNumber -eq "16" )
                            {  
                                Write-Host "Log on through Remote Desktop for Tier1 App Servers" -ForegroundColor DarkGray
                            }
                        else 
                            {
                                $Linkgpo = New-GPLink -Name $GPOLists[4] -Target $checkOu18

                                # Allows Section
                                $addURABatch = "SeBatchLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LAAppT1Sid)"
                                $addURAService = "SeServiceLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LAAppT1Sid)"
                                $addURARemote = "SeRemoteInteractiveLogonRight = *$($AdminT1Sid),*$($RDPAppT1Sid)"
                                $addURALocally = "SeInteractiveLogonRight = *$($AdminsSid),*$($BackupSid),*$($AdminT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($RDPAppT1Sid),*$($LAAppT1Sid)"

                                # Deny section
                                $addURADenyBatch = "SeDenyBatchLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyService = "SeDenyServiceLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyRemote = "SeDenyRemoteInteractiveLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid),*$($LAAppT1Sid)"
                                $addURADenyLocally = "SeDenyInteractiveLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"

                                # Edit GptTmpl.inf
                                Add-Content -Path $gptFile4 -Value '[Privilege Rights]'
                                Add-Content -Path $gptFile4 -Value $addURABatch
                                Add-Content -Path $gptFile4 -Value $addURAService 
                                Add-Content -Path $gptFile4 -Value $addURARemote
                                Add-Content -Path $gptFile4 -Value $addURALocally
                                Add-Content -Path $gptFile4 -Value $addURADenyBatch
                                Add-Content -Path $gptFile4 -Value $addURADenyService
                                Add-Content -Path $gptFile4 -Value $addURADenyRemote
                                Add-Content -Path $gptFile4 -Value $addURADenyLocally

                                $getGPO = (Get-ADObject "CN={$($004Id)},$PathPolicy").DistinguishedName
                                Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                                # Edit GPT.INI and update Sysvol versionNumber

                                $GptContent = Get-Content $GptIni4
                                $GptContent = $GptContent -replace "Version=0", "Version=16"
                                Set-Content $GptIni4 $GptContent

                                # Update AD versionNumber

                                $VersionNumberT2 = (Get-ADObject "CN={$($004Id)},$PathPolicy" -Properties *)
                                Set-ADObject -Identity $VersionNumberT2 -Replace @{versionNumber="16"}
                            }
                    }
                }

            function Set-RestrictedLogonT1WebSRV () 
                {
                    $VersionNumber = (Get-ADObject "CN={$($005Id)},$PathPolicy" -Properties *)
                    $VersionNumber.versionNumber | ForEach {

                        if ( $VersionNumber.versionNumber -eq "16" )
                            {
                                Write-Host "Log on through Remote Desktop for Tier1 Web Servers" -ForegroundColor DarkGray
                            }
                        else 
                            {
                                $Linkgpo = New-GPLink -Name $GPOLists[5] -Target $checkOu19

                                # Allows Section
                                $addURABatch = "SeBatchLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LAWebT1Sid)"
                                $addURAService = "SeServiceLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LAWebT1Sid)"
                                $addURARemote = "SeRemoteInteractiveLogonRight = *$($AdminT1Sid),*$($RDPWebT1Sid)"
                                $addURALocally = "SeInteractiveLogonRight = *$($AdminsSid),*$($BackupSid),*$($AdminT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($RDPWebT1Sid),*$($LAWebT1Sid)"

                                # Deny section
                                $addURADenyBatch = "SeDenyBatchLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($RDPWebT1Sid)"
                                $addURADenyService = "SeDenyServiceLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($RDPWebT1Sid)"
                                $addURADenyRemote = "SeDenyRemoteInteractiveLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyLocally = "SeDenyInteractiveLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid)"

                                # Edit GptTmpl.inf
                                Add-Content -Path $gptFile5 -Value '[Privilege Rights]'
                                Add-Content -Path $gptFile5 -Value $addURABatch
                                Add-Content -Path $gptFile5 -Value $addURAService 
                                Add-Content -Path $gptFile5 -Value $addURARemote
                                Add-Content -Path $gptFile5 -Value $addURALocally
                                Add-Content -Path $gptFile5 -Value $addURADenyBatch
                                Add-Content -Path $gptFile5 -Value $addURADenyService
                                Add-Content -Path $gptFile5 -Value $addURADenyRemote
                                Add-Content -Path $gptFile5 -Value $addURADenyLocally

                                $getGPO = (Get-ADObject "CN={$($005Id)},$PathPolicy").DistinguishedName
                                Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                                # Edit GPT.INI and update Sysvol versionNumber

                                $GptContent = Get-Content $GptIni5
                                $GptContent = $GptContent -replace "Version=0", "Version=16"
                                Set-Content $GptIni5 $GptContent

                                # Update AD versionNumber

                                $VersionNumberT2 = (Get-ADObject "CN={$($005Id)},$PathPolicy" -Properties *)
                                Set-ADObject -Identity $VersionNumberT2 -Replace @{versionNumber="16"}
                            }
                    }
                }

            function Set-RestrictedLogonT1BDDSRV () 
                {
                    $VersionNumber = (Get-ADObject "CN={$($006Id)},$PathPolicy" -Properties *)
                    $VersionNumber.versionNumber | ForEach {

                        if ( $VersionNumber.versionNumber -eq "16" )
                            {
                                Write-Host "Log on through Remote Desktop for Tier1 BDD Servers" -ForegroundColor DarkGray
                            }
                        else 
                            {
                                $Linkgpo = New-GPLink -Name $GPOLists[6] -Target $checkOu20

                                # Allows Section
                                $addURABatch = "SeBatchLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LABDDT1Sid)"
                                $addURAService = "SeServiceLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LABDDT1Sid)"
                                $addURARemote = "SeRemoteInteractiveLogonRight = *$($AdminT1Sid),*$($RDPBDDT1Sid)"
                                $addURALocally = "SeInteractiveLogonRight = *$($AdminsSid),*$($BackupSid),*$($AdminT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($RDPBDDT1Sid),*$($LABDDT1Sid)"

                                # Deny section
                                $addURADenyBatch = "SeDenyBatchLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyService = "SeDenyServiceLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyRemote = "SeDenyRemoteInteractiveLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyLocally = "SeDenyInteractiveLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"

                                # Edit GptTmpl.inf
                                Add-Content -Path $gptFile6 -Value '[Privilege Rights]'
                                Add-Content -Path $gptFile6 -Value $addURABatch
                                Add-Content -Path $gptFile6 -Value $addURAService 
                                Add-Content -Path $gptFile6 -Value $addURARemote
                                Add-Content -Path $gptFile6 -Value $addURALocally
                                Add-Content -Path $gptFile6 -Value $addURADenyBatch
                                Add-Content -Path $gptFile6 -Value $addURADenyService
                                Add-Content -Path $gptFile6 -Value $addURADenyRemote
                                Add-Content -Path $gptFile6 -Value $addURADenyLocally

                                $getGPO = (Get-ADObject "CN={$($006Id)},$PathPolicy").DistinguishedName
                                Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                                # Edit GPT.INI and update Sysvol versionNumber

                                $GptContent = Get-Content $GptIni6
                                $GptContent = $GptContent -replace "Version=0", "Version=16"
                                Set-Content $GptIni6 $GptContent

                                # Update AD versionNumber

                                $VersionNumberT2 = (Get-ADObject "CN={$($006Id)},$PathPolicy" -Properties *)
                                Set-ADObject -Identity $VersionNumberT2 -Replace @{versionNumber="16"}
                            }
                    }
                }

            function Set-RestrictedLogonT1FileSRV () 
                {
                    $VersionNumber = (Get-ADObject "CN={$($007Id)},$PathPolicy" -Properties *)
                    $VersionNumber.versionNumber | ForEach {

                        if ( $VersionNumber.versionNumber -eq "16" )
                            {
                                Write-Host "Log on through Remote Desktop for Tier1 File Servers" -ForegroundColor DarkGray
                            }
                        else 
                            {
                                $Linkgpo = New-GPLink -Name $GPOLists[7] -Target $checkOu21

                                # Allows Section
                                $addURABatch = "SeBatchLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LAFileT1Sid)"
                                $addURAService = "SeServiceLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LAFileT1Sid)"
                                $addURARemote = "SeRemoteInteractiveLogonRight = *$($AdminT1Sid),*$($RDPFileT1Sid)"
                                $addURALocally = "SeInteractiveLogonRight = *$($AdminsSid),*$($BackupSid),*$($AdminT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($RDPFileT1Sid),*$($LAFileT1Sid)"

                                # Deny section
                                $addURADenyBatch = "SeDenyBatchLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid),*$($RDPFileT1Sid)"
                                $addURADenyService = "SeDenyServiceLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid),*$($RDPFileT1Sid)"
                                $addURADenyRemote = "SeDenyRemoteInteractiveLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyLocally = "SeDenyInteractiveLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"

                                # Edit GptTmpl.inf
                                Add-Content -Path $gptFile7 -Value '[Privilege Rights]'
                                Add-Content -Path $gptFile7 -Value $addURABatch
                                Add-Content -Path $gptFile7 -Value $addURAService 
                                Add-Content -Path $gptFile7 -Value $addURARemote
                                Add-Content -Path $gptFile7 -Value $addURALocally
                                Add-Content -Path $gptFile7 -Value $addURADenyBatch
                                Add-Content -Path $gptFile7 -Value $addURADenyService
                                Add-Content -Path $gptFile7 -Value $addURADenyRemote
                                Add-Content -Path $gptFile7 -Value $addURADenyLocally

                                $getGPO = (Get-ADObject "CN={$($007Id)},$PathPolicy").DistinguishedName
                                Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                                # Edit GPT.INI and update Sysvol versionNumber

                                $GptContent = Get-Content $GptIni7
                                $GptContent = $GptContent -replace "Version=0", "Version=16"
                                Set-Content $GptIni7 $GptContent

                                # Update AD versionNumber

                                $VersionNumberT2 = (Get-ADObject "CN={$($007Id)},$PathPolicy" -Properties *)
                                Set-ADObject -Identity $VersionNumberT2 -Replace @{versionNumber="16"}
                            }
                    }
                }

            function Set-RestrictedLogonT1SAPSRV () 
                {
                    $VersionNumber = (Get-ADObject "CN={$($008Id)},$PathPolicy" -Properties *)
                    $VersionNumber.versionNumber | ForEach {

                        if ( $VersionNumber.versionNumber -eq "16" )
                            {
                                Write-Host "Log on through Remote Desktop for Tier1 SAP Servers" -ForegroundColor DarkGray
                            }
                        else 
                            {
                                $Linkgpo = New-GPLink -Name $GPOLists[8] -Target $checkOu22
                
                                # Allows Section
                                $addURABatch = "SeBatchLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LASAPT1Sid)"
                                $addURAService = "SeServiceLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LASAPT1Sid)"
                                $addURARemote = "SeRemoteInteractiveLogonRight = *$($AdminT1Sid),*$($RDPSAPT1Sid)"
                                $addURALocally = "SeInteractiveLogonRight = *$($AdminsSid),*$($BackupSid),*$($AdminT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($RDPSAPT1Sid),*$($LASAPT1Sid)"

                                # Deny section
                                $addURADenyBatch = "SeDenyBatchLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyService = "SeDenyServiceLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyRemote = "SeDenyRemoteInteractiveLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyLocally = "SeDenyInteractiveLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"

                                # Edit GptTmpl.inf
                                Add-Content -Path $gptFile8 -Value '[Privilege Rights]'
                                Add-Content -Path $gptFile8 -Value $addURABatch
                                Add-Content -Path $gptFile8 -Value $addURAService 
                                Add-Content -Path $gptFile8 -Value $addURARemote
                                Add-Content -Path $gptFile8 -Value $addURALocally
                                Add-Content -Path $gptFile8 -Value $addURADenyBatch
                                Add-Content -Path $gptFile8 -Value $addURADenyService
                                Add-Content -Path $gptFile8 -Value $addURADenyRemote
                                Add-Content -Path $gptFile8 -Value $addURADenyLocally

                                $getGPO = (Get-ADObject "CN={$($008Id)},$PathPolicy").DistinguishedName
                                Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                                # Edit GPT.INI and update Sysvol versionNumber

                                $GptContent = Get-Content $GptIni8
                                $GptContent = $GptContent -replace "Version=0", "Version=16"
                                Set-Content $GptIni8 $GptContent

                                # Update AD versionNumber

                                $VersionNumberT2 = (Get-ADObject "CN={$($008Id)},$PathPolicy" -Properties *)
                                Set-ADObject -Identity $VersionNumberT2 -Replace @{versionNumber="16"}
                            }
                    }
                }

            function Set-RestrictedLogonT1OtherSRV () 
                {
                    $VersionNumber = (Get-ADObject "CN={$($009Id)},$PathPolicy" -Properties *)
                    $VersionNumber.versionNumber | ForEach {

                        if ( $VersionNumber.versionNumber -eq "16" )
                            {
                                Write-Host "Log on through Remote Desktop for Tier1 Other Servers" -ForegroundColor DarkGray
                            }
                        else 
                            {
                                $Linkgpo = New-GPLink -Name $GPOLists[9] -Target $checkOu23

                                # Allows Section
                                $addURABatch = "SeBatchLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LAOtherT1Sid)"
                                $addURAService = "SeServiceLogonRight = *$($AdminsSid),*$($BackupSid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LAOtherT1Sid)"
                                $addURARemote = "SeRemoteInteractiveLogonRight = *$($AdminT1Sid),*$($RDPOtherT1Sid)"
                                $addURALocally = "SeInteractiveLogonRight = *$($AdminsSid),*$($BackupSid),*$($AdminT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($RDPOtherT1Sid),*$($LAOtherT1Sid)"

                                # Deny section
                                $addURADenyBatch = "SeDenyBatchLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAWebT1Sid)"
                                $addURADenyService = "SeDenyServiceLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPOtherT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAWebT1Sid)"
                                $addURADenyRemote = "SeDenyRemoteInteractiveLogonRight = *$($AdminsSid),*$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($MainT1Sid),*$($SrvAccountT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAOtherT1Sid),*$($LAWebT1Sid)"
                                $addURADenyLocally = "SeDenyInteractiveLogonRight = *$($AdminT0Sid),*$($SrvAccountT0Sid),*$($MainT0Sid),*$($PAWUserT0Sid),*$($PAWMainT0Sid),*$($JumpMainT1Sid),*$($JumpUserT1Sid),*$($LADeskT2Sid),*$($LALaptopT2Sid),*$($UsersT2Sid),*$($HelpdeskT2Sid),*$($UserRemoteT2Sid),*$($DASid),*$($EASid),*$($SchemaSid),*$($AccountSid),*$($PrintSid),*$($ServerSid),*$($RDPAppT1Sid),*$($RDPBDDT1Sid),*$($RDPFileT1Sid),*$($RDPSAPT1Sid),*$($RDPWebT1Sid),*$($LAAppT1Sid),*$($LABDDT1Sid),*$($LAFileT1Sid),*$($LASAPT1Sid),*$($LAWebT1Sid)"

                                # Edit GptTmpl.inf
                                Add-Content -Path $gptFile9 -Value '[Privilege Rights]'
                                Add-Content -Path $gptFile9 -Value $addURABatch
                                Add-Content -Path $gptFile9 -Value $addURAService 
                                Add-Content -Path $gptFile9 -Value $addURARemote
                                Add-Content -Path $gptFile9 -Value $addURALocally
                                Add-Content -Path $gptFile9 -Value $addURADenyBatch
                                Add-Content -Path $gptFile9 -Value $addURADenyService
                                Add-Content -Path $gptFile9 -Value $addURADenyRemote
                                Add-Content -Path $gptFile9 -Value $addURADenyLocally

                                $getGPO = (Get-ADObject "CN={$($009Id)},$PathPolicy").DistinguishedName
                                Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                                # Edit GPT.INI and update Sysvol versionNumber

                                $GptContent = Get-Content $GptIni9
                                $GptContent = $GptContent -replace "Version=0", "Version=16"
                                Set-Content $GptIni9 $GptContent

                                # Update AD versionNumber

                                $VersionNumberT2 = (Get-ADObject "CN={$($009Id)},$PathPolicy" -Properties *)
                                Set-ADObject -Identity $VersionNumberT2 -Replace @{versionNumber="16"}
                            }
                    }
                }

            function Set-RemoteDesktopT2Users () 
                {
                    $VersionNumber = (Get-ADObject "CN={$($010Id)},$PathPolicy" -Properties *)
                    $VersionNumber.versionNumber | ForEach {

                        if ( $VersionNumber.versionNumber -eq "2" )
                            {      
                                Write-Host "Log on through Remote Desktop for Users Tier2" -ForegroundColor DarkGray
                                write-host ""
                            }
                        else 
                            {
                                # Allows Section
                                $addURARemote = "SeRemoteInteractiveLogonRight = *$($UserRemoteT2Sid)"
                                        
                                # Edit GptTmpl.inf
                                Add-Content -Path $gptFile10 -Value '[Privilege Rights]'
                                Add-Content -Path $gptFile10 -Value $addURARemote

                                $getGPO = (Get-ADObject "CN={$($010Id)},$PathPolicy").DistinguishedName
                                Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNames]"}

                                # Edit GPT.INI and update Sysvol versionNumber

                                $GptContent = Get-Content $GptIni10
                                $GptContent = $GptContent -replace "Version=0", "Version=2"
                                Set-Content $GptIni10 $GptContent

                                # Update AD versionNumber

                                $VersionNumberT2 = (Get-ADObject "CN={$($010Id)},$PathPolicy" -Properties *)
                                Set-ADObject -Identity $VersionNumberT2 -Replace @{versionNumber="2"}
                            }
                    }
                }

            Write-Progress -Activity "Running ADFortress" -Status "Configure Restricted Logon" -PercentComplete 70
            Start-Sleep -Seconds 2
            # Run functions
            Set-RestrictedLogonT0
            Set-RestrictedLogonT2
            Set-RestrictedLogonPAWT0
            Set-RestrictedLogonJumpSRVT1
            Set-RestrictedLogonT1AppSRV
            Set-RestrictedLogonT1WebSRV
            Set-RestrictedLogonT1BDDSRV
            Set-RestrictedLogonT1FileSRV
            Set-RestrictedLogonT1SAPSRV
            Set-RestrictedLogonT1OtherSRV
            Set-RemoteDesktopT2Users
       }
    else
        {
            write-warning "This task depends on the task [1] Tiering Model OU and Security Groups."
        }
}

# Configure Tiered Model Local Admin
Function Set-LocalAdminGroup (){

    if (($checkOu = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $NetBIOSName).DistinguishedName) -and
        ($checkOu0 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[0]).DistinguishedName) -and
        ($checkOu1 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[1]).DistinguishedName) -and
        ($checkOu2 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[2]).DistinguishedName) -and
        ($checkOu5 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[5]).DistinguishedName) -and
        ($checkGp0 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[0]).DistinguishedName) -and
        ($checkGp1 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[1]).DistinguishedName) -and
        ($checkGp2 = (Get-ADObject -Filter "ObjectClass -eq 'group'" | Where-Object Name -eq $groupT0.Group[2]).DistinguishedName)
       )
       {
            function Set-LocalAdmGroupT0PAW () {

                $VersionNumber = (Get-ADObject "CN={$($011Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                $VersionNumber.versionNumber | ForEach {
                                
                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier0 PAW already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[11] -Target $checkOu10

                            $getGPO = (Get-ADObject "CN={$($011Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit11 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$NewGroupNameT0PAW"
                            $xmlUpdate.sid = "$PAWMainT0Sid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni11
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni11 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($011Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            function Set-LocalAdmGroupT0 () {

                $VersionNumber = (Get-ADObject "CN={$($012Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                $VersionNumber.versionNumber | ForEach {
                                
                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier0 already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[12] -Target $checkOu8

                            $getGPO = (Get-ADObject "CN={$($012Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit12 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$DAName"
                            $xmlUpdate.sid = "$DASid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni12
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni12 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($012Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            function Set-LocalAdmGroupT1Jump () {

                $VersionNumber = (Get-ADObject "CN={$($013Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                $VersionNumber.versionNumber | ForEach {
                                
                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier1 JumpSRV already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[13] -Target $checkOu16

                            $getGPO = (Get-ADObject "CN={$($013Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit13 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$NewGroupNameT1JumpSRV"
                            $xmlUpdate.sid = "$JumpMainT1Sid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni13
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni13 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($013Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            function Set-LocalAdmGroupT1App () {

                $VersionNumber = (Get-ADObject "CN={$($014Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                $VersionNumber.versionNumber | ForEach {

                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier1 App Servers already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[14] -Target $checkOu18

                            $getGPO = (Get-ADObject "CN={$($014Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit14 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$NewGroupNameT1App"
                            $xmlUpdate.sid = "$LAAppT1Sid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpls -and $_.sid -eq $GroupSidTmpls}
                            $xmlUpdate.name = "$NewGroupNameT1"
                            $xmlUpdate.sid = "$MainT1Sid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni14
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni14 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($014Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            function Set-LocalAdmGroupT1Web () {

                $VersionNumber = (Get-ADObject "CN={$($015Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}" 
                $VersionNumber.versionNumber | ForEach {

                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier1 Web Servers already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[15] -Target $checkOu19

                            $getGPO = (Get-ADObject "CN={$($015Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit15 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$NewGroupNameT1Web"
                            $xmlUpdate.sid = "$LAWebT1Sid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpls -and $_.sid -eq $GroupSidTmpls}
                            $xmlUpdate.name = "$NewGroupNameT1"
                            $xmlUpdate.sid = "$MainT1Sid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni15
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni15 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($015Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            function Set-LocalAdmGroupT1File () {

                $VersionNumber = (Get-ADObject "CN={$($016Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                $VersionNumber.versionNumber | ForEach {

                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier1 File Servers already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[16] -Target $checkOu20

                            $getGPO = (Get-ADObject "CN={$($016Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit16 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$NewGroupNameT1File"
                            $xmlUpdate.sid = "$LAFileT1Sid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpls -and $_.sid -eq $GroupSidTmpls}
                            $xmlUpdate.name = "$NewGroupNameT1"
                            $xmlUpdate.sid = "$MainT1Sid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni16
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni16 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($016Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            function Set-LocalAdmGroupT1BDD () {

                $VersionNumber = (Get-ADObject "CN={$($017Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                $VersionNumber.versionNumber | ForEach {

                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier1 BDD Servers already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[17] -Target $checkOu21

                            $getGPO = (Get-ADObject "CN={$($017Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit17 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$NewGroupNameT1BDD"
                            $xmlUpdate.sid = "$LABDDT1Sid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpls -and $_.sid -eq $GroupSidTmpls}
                            $xmlUpdate.name = "$NewGroupNameT1"
                            $xmlUpdate.sid = "$MainT1Sid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni17
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni17 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($017Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            function Set-LocalAdmGroupT1SAP () {

                $VersionNumber = (Get-ADObject "CN={$($018Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                $VersionNumber.versionNumber | ForEach {

                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier1 SAP Servers already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[18] -Target $checkOu22

                            $getGPO = (Get-ADObject "CN={$($018Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit18 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$NewGroupNameT1SAP"
                            $xmlUpdate.sid = "$LASAPT1Sid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpls -and $_.sid -eq $GroupSidTmpls}
                            $xmlUpdate.name = "$NewGroupNameT1"
                            $xmlUpdate.sid = "$MainT1Sid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni18
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni18 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($018Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            function Set-LocalAdmGroupT1Other () {

                $VersionNumber = (Get-ADObject "CN={$($019Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                $VersionNumber.versionNumber | ForEach {

                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier1 Other servers already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[19] -Target $checkOu23

                            $getGPO = (Get-ADObject "CN={$($019Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit19 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$NewGroupNameT1Other"
                            $xmlUpdate.sid = "$LAOtherT1Sid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpls -and $_.sid -eq $GroupSidTmpls}
                            $xmlUpdate.name = "$NewGroupNameT1"
                            $xmlUpdate.sid = "$MainT1Sid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni19
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni19 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($019Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            function Set-LocalAdmGroupT2 () {

                $VersionNumber = (Get-ADObject "CN={$($020Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                $VersionNumber.versionNumber | ForEach {

                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier2 already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[20] -Target $checkOu31

                            $getGPO = (Get-ADObject "CN={$($020Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit20 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$NewGroupNameT2"
                            $xmlUpdate.sid = "$HelpdeskT2Sid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni20
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni20 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($020Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            function Set-LocalAdmGroupT2Desk () {

                $VersionNumber = (Get-ADObject "CN={$($021Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                $VersionNumber.versionNumber | ForEach {

                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier2 Desktop already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[21] -Target $checkOu29

                            $getGPO = (Get-ADObject "CN={$($021Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit21 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$NewGroupNameT2Desk"
                            $xmlUpdate.sid = "$LADeskT2Sid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpls -and $_.sid -eq $GroupSidTmpls}
                            $xmlUpdate.name = "$NewGroupNameT2"
                            $xmlUpdate.sid = "$HelpdeskT2Sid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni21
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni21 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($021Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            function Set-LocalAdmGroupT2Laptop () {

                $VersionNumber = (Get-ADObject "CN={$($022Id)},$PathPolicy" -Properties *)
                $NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
                $VersionNumber.versionNumber | ForEach {

                    if ( $VersionNumber.versionNumber -eq "4" )
                        {
                            Write-Host "Local Admin for Tier2 Laptop already configured" -ForegroundColor DarkGray
                        }
                    else
                        {
                            # Linking GPO
                            $Linkgpo = New-GPLink -Name $GPOLists[22] -Target $checkOu30

                            $getGPO = (Get-ADObject "CN={$($022Id)},$PathPolicy").DistinguishedName
                            Set-ADObject -Identity $getGPO -Replace @{gPCMachineExtensionNames="[$pPCMachineExtensionNamesLocalUser]"}

                            # Edit xml file
                            $xmlPath = Join-Path -Path $SecEdit22 -ChildPath "Groups.xml"
                            $xmlEdit = [xml](Get-Content -Path $xmlPath )

                            $xmlUpdate = $xmlEdit.Groups.Group | 
                            where {$_.changed -eq $ChangedTmpl -and $_.uid -eq $UIDTmpl}
                            $xmlUpdate.changed = "$ChgdDate"
                            $xmlUpdate.uid = "$NewUid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpl -and $_.sid -eq $GroupSidTmpl}
                            $xmlUpdate.name = "$NewGroupNameT2Laptop"
                            $xmlUpdate.sid = "$LALaptopT2Sid"

                            $xmlUpdate = $xmlEdit.Groups.Group.Properties.Members.Member | 
                            where {$_.name -eq $GroupNameTmpls -and $_.sid -eq $GroupSidTmpls}
                            $xmlUpdate.name = "$NewGroupNameT2"
                            $xmlUpdate.sid = "$HelpdeskT2Sid"

                            $xmlEdit.Save($xmlPath)
                            
                            # Edit GPT.INI and update Sysvol versionNumber

                            $GptContent = Get-Content $GptIni22
                            $GptContent = $GptContent -replace "Version=0", "Version=4"
                            Set-Content $GptIni22 $GptContent

                            # Update AD versionNumber

                            $VersionNumberNtlm = (Get-ADObject "CN={$($022Id)},$PathPolicy" -Properties *)
                            Set-ADObject -Identity $VersionNumberNtlm -Replace @{versionNumber="4"}
                        }
                }
            }

            # Run function
            Write-Progress -Activity "Running ADFortress" -Status "Configuring Tiered Model Local Admin" -PercentComplete 90
            Start-Sleep -Seconds 2
            Set-LocalAdmGroupT0PAW
            Set-LocalAdmGroupT0
            Set-LocalAdmGroupT1Jump
            Set-LocalAdmGroupT1App
            Set-LocalAdmGroupT1Web
            Set-LocalAdmGroupT1File
            Set-LocalAdmGroupT1BDD
            Set-LocalAdmGroupT1SAP
            Set-LocalAdmGroupT1Other
            Set-LocalAdmGroupT2
            Set-LocalAdmGroupT2Desk
            Set-LocalAdmGroupT2Laptop
       }
    else
        {
            write-warning "This task depends on the task [1] Tiering Model OU and Security Groups."
        }
}
