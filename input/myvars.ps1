<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : ADFortress Default variables
#>

# Variable Level 0
$DC = (Get-ADDomainController)
$MyDomain = (Get-ADDomain)
$DomainName = (Get-ADRootDSE).defaultNamingContext

# Variable Level 1
# Domain Informations
$Hostname = $DC.Name
$Domain = $DC.Domain
$Server = $DC.HostName
$DCIPAddress = $DC.IPv4Address
$OS = $DC.OperatingSystem
$Mode = $MyDomain.DomainMode
$DNSRoot = $MyDomain.DNSRoot
$FQDNDomainName = $MyDomain.DnsRoot
$NetBIOSName = $MyDomain.NetBIOSName
$PDCEmulator = $MyDomain.PDCEmulator
$DomainSid = $MyDomain.DomainSid.Value
$DomainDistinguishedName = $MyDomain.DistinguishedName
$DomainControllersContainer = $MyDomain.DomainControllersContainer
$ParentOu = "OU=$NetBIOSName,$DomainName"
$PasswdPolicy = Get-ADDefaultDomainPasswordPolicy -Server $Server | Select-Object ComplexityEnabled, LockoutDuration, LockOutObservationWindow, LockoutThreshold, MaxPasswordAge, MinPasswordAge, MinPasswordLength, PasswordHistoryCount, ReversibleEncryptionEnabled

# Password Policy Result
$Complexity = $PasswdPolicy.ComplexityEnabled
$LockDuration = $PasswdPolicy.LockoutDuration.Minutes
$LockObservation = $PasswdPolicy.LockOutobservationWindow.Minutes
$LockoutThreshold = $PasswdPolicy.LockoutThreshold
$MaxPassAge = $PasswdPolicy.MaxPasswordAge.Days
$MinPassAge = $PasswdPolicy.MinPasswordAge.Days
$MinPassLength = $PasswdPolicy.MinPasswordLength
$PassHistory = $PasswdPolicy.PasswordHistoryCount
$Reversible = $PasswdPolicy.ReversibleEncryptionEnabled

# Templates Files
$ExportGPO = "C:\GPOList.csv"
$CheckGPO = (Get-GPO -all | Select-Object -ExpandProperty DisplayName) | Out-File $ExportGPO
$TmplPath = ".\Templates"
$TmplPathXml = "$TmplPath\Xml"
$TmplPathFile = "$TmplPath\Files"
$TmplPathSecEdit = "$TmplPath\SecEdit"
$TmplPathAdmx = "$TmplPath\Admx"
$TmplPathSetup = "$TmplPath\Setup"
$AuditPath = "audit.csv"
$CMTXPath = "comment.cmtx"
$CMTXPathMulti = "comments.cmtx"
$ChildPath = "Groups.xml"
$GptTmplPath = "GptTmpl.inf"
$Pattern = "CISTemplate"
$Pattern1 = "MultiTmpl"
$Rdplist = "rdplist.j2"
$RegPolPath = "Registry.pol"
$TmplSchedule = "ScheduledTasks.xml"
$chrome0 = "chrome0.lst"; $chrome1 = "chrome1.lst"; $chrome2 = "chrome2.lst"
$edge0 = "edge0.lst"; $edge1 = "edge1.lst"; $edge2 = "edge2.lst"
$NXLOG = "$env:ProgramFiles\nxlog\nxlog.exe"
$NXLOG_CFG = "$env:ProgramFiles\nxlog\conf\"

# Templates ADMX and ADML
$Path = $env:windir
$Admx = "\PolicyDefinitions"
$Adml = "\PolicyDefinitions\en-US"
$PathAdmx = "$Path\$Admx"
$PathAdml = "$Path\$Adml"

if ((-not(Test-Path -Path $PathAdmx\SecGuide.admx)) -and
    (-not(Test-Path -Path $PathAdml\SecGuide.adml))
   )
    {
        Copy-Item -Path "$TmplPathAdmx\SecGuide.admx" -Destination $PathAdmx
        Copy-Item -Path "$TmplPathAdmx\SecGuide.adml" -Destination $PathAdml
    }

# Templates to Generate New UID, ID and GUID
$ChgdDate = Date -Format "yyyy-MM-dd HH:mm:ss"
$NewUid = "{"+ (New-Guid).ToString().ToUpper() +"}"
$NewId = "{"+ (New-Guid).ToString().ToUpper() +"}"
$UIDTmpl = "{00000000-0000-0000-0000-000000000000}"
$IdTmpl = "{00000000-0000-0000-0000-000000000000}"
$ChangedTmpl = "2000-01-01 00:00:00"
$GroupSidTmpl = "S-1-0-0"
$GroupSidTmpls = "S-2-0-0"
$GroupNameTmpl = "COMPLIANCE\Operators"
$GroupNameTmpls = "COMPLIANCE\Tier1"
$ArgumentsPath = $ArgumentsPath = "-ExecutionPolicy Bypass -File ""\\$Domain\Sysvol\$Domain\scripts\DisableNetBios.ps1"""
$NewAuthor = "$NetBIOSName\Administrator"
$ScriptName = "DisableNetBios.ps1"
$DestShare = "\\$Domain\Sysvol\$Domain\scripts"

# Disabled critical protocols and Services

$ssl = ("SSL 2.0", "SSL 3.0")
$tls = ("TLSv1.0", "TLSv1.1", "TLSv1.2", "TLSv1.3")
$ssltlsKey = "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols"
$NewItem = "\\$Domain\Sysvol\$Domain\Policies"

# Registry Value
$Value0 = 0
$Value1 = 1
$Enabled =  @{
        Context   = 'Computer'
        ValueName = 'Enabled'
        Type      = 'DWord'
        Action    = 'Update'
}
       
$Disabled = @{
        Context   = 'Computer'
        ValueName = 'DisabledByDefault'
        Type      = 'DWord'
        Action    = 'Update'
}

# Firewall Vars
$Firewall = @{
        Key = "SOFTWARE\Policies\Microsoft\WindowsFirewall"
        ValueName = "PolicyVersion"
        Type = "DWORD"
        Type1 = "String"
        Value = 541
}

