<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Tiering Model Variables
#>

# Importing Variables
. ./input/myvars.ps1

# Script body
# OU Tiered Model

$OUs = @(

       $(New-Object PSObject -Property @{Name = "Tier0"; ParentOu = "$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Tier1"; ParentOu = "$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Tier2"; ParentOu = "$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "User Accounts"; ParentOu = "$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "User Devices"; ParentOu = "$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "User Groups"; ParentOu = "$ParentOu" })
)

$OU_T0 = @(

       $(New-Object PSObject -Property @{Name = "Admins"; ParentOu = "OU=Tier0,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Groups"; ParentOu = "OU=Tier0,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Servers"; ParentOu = "OU=Tier0,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Non-Human Accounts"; ParentOu = "OU=Tier0,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "PAW Devices"; ParentOu = "OU=Tier0,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "PAW Users"; ParentOu = "OU=Tier0,$ParentOu" })
)

$OU_T1 = @(

       $(New-Object PSObject -Property @{Name = "Admins"; ParentOu = "OU=Tier1,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Groups"; ParentOu = "OU=Tier1,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Servers"; ParentOu = "OU=Tier1,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Non-Human Accounts"; ParentOu = "OU=Tier1,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Jump Servers"; ParentOu = "OU=Tier1,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "JumpServer Users"; ParentOu = "OU=Tier1,$ParentOu" })
)

$OU_T2 = @(

       $(New-Object PSObject -Property @{Name = "Admins"; ParentOu = "OU=Tier2,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Groups"; ParentOu = "OU=Tier2,$ParentOu" })
)

$OU_T1SRV = @(

       $(New-Object PSObject -Property @{Name = "App Servers"; ParentOu = "OU=Servers,OU=Tier1,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Web Servers"; ParentOu = "OU=Servers,OU=Tier1,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "File Servers"; ParentOu = "OU=Tie1,OU=Servers,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "BDD Servers"; ParentOu = "OU=Servers,OU=Tier1,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "SAP Servers"; ParentOu = "OU=Servers,OU=Tier1,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Other Servers"; ParentOu = "OU=Servers,OU=Tier1,$ParentOu" })
)

$OU_UA = @(

       $(New-Object PSObject -Property @{Name = "Enabled"; ParentOu = "OU=User Accounts,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Disabled"; ParentOu = "OU=User Accounts,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Non-Human"; ParentOu = "OU=User Accounts,$ParentOu" })
)

$OU_UD = @(

       $(New-Object PSObject -Property @{Name = "Desktops"; ParentOu = "OU=User Devices,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Laptops"; ParentOu = "OU=User Devices,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Provisioned"; ParentOu = "OU=User Devices,$ParentOu" })
)

$OU_UG = @(

       $(New-Object PSObject -Property @{Name = "Distribution"; ParentOu = "OU=Groups,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Security"; ParentOu = "OU=Groups,$ParentOu" }),
       $(New-Object PSObject -Property @{Name = "Permission"; ParentOu = "OU=Groups,$ParentOu" })
)

$GPOLink = @(
       $(New-Object PSObject -Property @{Name = "FORTRESS-DisabledTLSv1.0 & TLSv1.1" }),
       $(New-Object PSObject -Property @{Name = "FORTRESS-DisabledSMBv1" }),
       $(New-Object PSObject -Property @{Name = "FORTRESS-DisabledNTLMv1" }),
       $(New-Object PSObject -Property @{Name = "FORTRESS-EnabledTLSv1.2 & TLSv1.3" }),
       $(New-Object PSObject -Property @{Name = "FORTRESS-EnabledNTLMv2" })
)

# Security Group Tieried Model
$GroupT0 = @(
              $(New-Object PSObject -Property @{Group = "Domain Tier0 Admins"; OUprefix = "OU=Groups,OU=Tier0" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier0 Servers"; OUprefix = "OU=Groups,OU=Tier0" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier0 Non-Human Accounts"; OUprefix = "OU=Groups,OU=Tier0" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier0 PAW Users"; OUprefix = "OU=Groups,OU=Tier0" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier0 PAW Maintenance"; OUprefix = "OU=Groups,OU=Tier0" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier0 PAW Devices"; OUprefix = "OU=Groups,OU=Tier0" }),                
              $(New-Object PSObject -Property @{Group = "Domain Tier0 Maintenance"; OUprefix = "OU=Groups,OU=Tier0" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier0 AuthSilo Members"; OUprefix = "OU=Groups,OU=Tier0" })
              $(New-Object PSObject -Property @{Group = "Domain Tier0 AuthSilo Devices"; OUprefix = "OU=Groups,OU=Tier0" })
            )

$GroupT1 = @(
              $(New-Object PSObject -Property @{Group = "Domain Tier1 Admins"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 Non-Human Accounts"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 JumpServer Users"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 JumpServer Maintenance"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 JumpServer Computers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 Maintenance"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 RemoteDesktop App Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 RemoteDesktop Web Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 RemoteDesktop BDD Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 RemoteDesktop File Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 RemoteDesktop SAP Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 RemoteDesktop Other Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 LocalAdmin App Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 LocalAdmin Web Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 LocalAdmin BDD Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 LocalAdmin File Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 LocalAdmin SAP Servers"; OUprefix = "OU=Groups,OU=Tier1" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier1 LocalAdmin Other Servers"; OUprefix = "OU=Groups,OU=Tier1" })
            )

$GroupT2 = @(
              $(New-Object PSObject -Property @{Group = "Domain Tier2 LocalAdmin Desktop"; OUprefix = "OU=Groups,OU=Tier2" }), # Local Admin for Desktop
              $(New-Object PSObject -Property @{Group = "Domain Tier2 LocalAdmin Laptop"; OUprefix = "OU=Groups,OU=Tier2" }),  # Local Admin for Laptop
              $(New-Object PSObject -Property @{Group = "Domain Tier2 Helpdesk Operators"; OUprefix = "OU=Groups,OU=Tier2" }) # Delegate Join to domain
            )

$Groups = @(
              $(New-Object PSObject -Property @{Group = "Domain Tier2 RemoteDesktop Users"; OUprefix = "OU=User Groups,OU=security" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier2 Users"; OUprefix = "OU=User Groups,OU=Security" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier2 Laptops"; OUprefix = "OU=User Groups,OU=Security" }),
              $(New-Object PSObject -Property @{Group = "Domain Tier2 WorkStations"; OUprefix = "OU=User Groups,OU=security" })
          )

# Default Service Groups
$ServiceSid = (Get-WMIObject -Class 'Win32_Account' -Filter 'name="SERVICE"').Sid                            # SERVICE
$EnterpriseDCSid = (Get-WMIObject -Class 'Win32_Account' -Filter 'name="ENTERPRISE DOMAIN CONTROLLERS"').Sid # ENTERPRISE DOMAIN CONTROLLERS
$AuthUserSid = (Get-WMIObject -Class 'Win32_Account' -Filter 'name="Authenticated Users"').Sid               # Authenticated Users
$LocalSrvSid = (Get-WMIObject -Class 'Win32_Account' -Filter 'name="LOCAL SERVICE"').Sid                     # LOCAL SERVICE
$NetworkSrvSid = (Get-WMIObject -Class 'Win32_Account' -Filter 'name="NETWORK SERVICE"').Sid                 # NETWORK SERVICE
$WindowsMgrGroupSid = "S-1-5-90-0"                                                                           # Windows Manager\Windows Manager Group
$WdiServiceHostSid = "S-1-5-80-3139157870-2983391045-3678747466-658725712-1809340420"

# Default Security Groups
$DASid = (Get-ADGroup -Filter "SID -eq ""$DomainSid-512""").SID.Value     # Domain Admins
$SchemaSid = (Get-ADGroup -Filter "SID -eq ""$DomainSid-518""").SID.Value # Schema Admins
$EASid = (Get-ADGroup -Filter "SID -eq ""$DomainSid-519""").SID.Value     # Enterprise Admins
$AdminsSid = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-544""").SID.Value   # Administrators
$GuestsSid = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-546""").SID.Value   # Guests
$AccountSid = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-548""").SID.Value  # Account Operators
$ServerSid = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-549""").SID.Value   # Server Operators
$PrintSid = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-550""").SID.Value    # Print Operators
$BackupSid = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-551""").SID.Value   # Backoup Operators
$RDUserSId = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-555""").SID.Value   # Remote Desktop Users                       

$DAName = (Get-ADGroup -Filter "SID -eq ""$DomainSid-512""").Name     # Domain Admins
$SchemaName = (Get-ADGroup -Filter "SID -eq ""$DomainSid-518""").Name # Schema Admins
$EAName = (Get-ADGroup -Filter "SID -eq ""$DomainSid-519""").Name     # Enterprise Admins
$AdminsName = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-544""").Name   # Administrators
$GuestsName = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-546""").Name   # Guests
$AccountName = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-548""").Name  # Account Operators
$ServerName = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-549""").Name   # Server Operators
$PrintName = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-550""").Name    # Print Operators
$BackupName = (Get-ADGroup -Filter "SID -eq ""S-1-5-32-551""").Name   # Backoup Operators

# Tiered Model Security Groups
# Tier 0 Security Groups
$AdminT0Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT0.Group[0]).Sid.Value
$SrvAccountT0Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT0.Group[2]).Sid.Value
$PAWUserT0Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT0.Group[3]).Sid.Value
$PAWMainT0Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT0.Group[4]).Sid.Value
$MainT0Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT0.Group[6]).Sid.Value
$AuthSiloT0Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT0.Group[7]).Sid.Value

# Tier 1 Security Groups
$AdminT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[0]).Sid.Value
$SrvAccountT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[2]).Sid.Value
$JumpUserT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[3]).Sid.Value
$JumpMainT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[4]).Sid.Value
$MainT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[6]).Sid.Value
$RDPAppT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[7]).Sid.Value
$RDPWebT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[8]).Sid.Value
$RDPBDDT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[9]).Sid.Value
$RDPFileT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[10]).Sid.Value
$RDPSAPT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[11]).Sid.Value
$RDPOtherT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[12]).Sid.Value
$LAAppT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[13]).Sid.Value
$LAWebT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[14]).Sid.Value
$LABDDT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[15]).Sid.Value
$LAFileT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[16]).Sid.Value
$LASAPT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[17]).Sid.Value
$LAOtherT1Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT1.Group[18]).Sid.Value

# Tier 2 Security Groups
$LADeskT2Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT2.Group[0]).Sid.Value
$LALaptopT2Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT2.Group[1]).Sid.Value
$HelpdeskT2Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $groupT2.Group[2]).Sid.Value

$UserRemoteT2Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $Groups.Group[0]).Sid.Value
$UsersT2Sid = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $Groups.Group[1]).Sid.Value

# Local Users and Groups
if (($null-ne $AdminT0Sid) -and
    ($null-ne $AdminT1Sid) -and
    ($null-ne $PAWMainT0Sid)
   )
   {
       try {
              $GroupNameT0PAW = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT0.group[4]).Name
              $GroupNameT1 = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT1.group[6]).Name
              $GroupNameT1JumpSRV = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT1.group[4]).Name
              $GroupNameT1App = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT1.group[13]).Name
              $GroupNameT1Web = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT1.group[14]).Name
              $GroupNameT1BDD = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT1.group[15]).Name
              $GroupNameT1File = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT1.group[16]).Name
              $GroupNameT1SAP = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT1.group[17]).Name
              $GroupNameT1Other = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT1.group[18]).Name
              $GroupNameT2 = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT2.group[2]).Name
              $GroupNameT2Desk = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT2.group[0]).Name
              $GroupNameT2Laptop = (Get-ADGroup -Filter * -Properties * | Where-Object Name -eq $GroupT2.group[1]).Name

              $NewGroupNameT0PAW = "$NetBIOSName\$GroupNameT0PAW"
              $NewGroupNameT1 = "$NetBIOSName\$GroupNameT1"
              $NewGroupNameT1JumpSRV = "$NetBIOSName\$GroupNameT1JumpSRV"
              $NewGroupNameT1App = "$NetBIOSName\$GroupNameT1App"
              $NewGroupNameT1Web = "$NetBIOSName\$GroupNameT1Web"
              $NewGroupNameT1BDD = "$NetBIOSName\$GroupNameT1BDD"
              $NewGroupNameT1File = "$NetBIOSName\$GroupNameT1File"
              $NewGroupNameT1SAP = "$NetBIOSName\$GroupNameT1SAP"
              $NewGroupNameT1Other = "$NetBIOSName\$GroupNameT1Other"
              $NewGroupNameT2 = "$NetBIOSName\$GroupNameT2"
              $NewGroupNameT2Desk = "$NetBIOSName\$GroupNameT2Desk"
              $NewGroupNameT2Laptop = "$NetBIOSName\$GroupNameT2Laptop"  

              $checkOu = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $NetBIOSName).DistinguishedName
              $checkOu0 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[0]).DistinguishedName
              $checkOu1 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[1]).DistinguishedName
              $checkOu2 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[2]).DistinguishedName
              $checkOu3 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[3]).DistinguishedName
              $checkOu4 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[4]).DistinguishedName
              $checkOu5 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OUs.Name[5]).DistinguishedName
              $checkOu6 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier0,$ParentOu" | Where-Object Name -eq $OU_T0.Name[0]).DistinguishedName
              $checkOu7 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier0,$ParentOu" | Where-Object Name -eq $OU_T0.Name[1]).DistinguishedName
              $checkOu8 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier0,$ParentOu" | Where-Object Name -eq $OU_T0.Name[2]).DistinguishedName
              $checkOu9 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier0,$ParentOu" | Where-Object Name -eq $OU_T0.Name[3]).DistinguishedName
              $checkOu10 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T0.Name[4]).DistinguishedName
              $checkOu11 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T0.Name[5]).DistinguishedName
              $checkOu12 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1.Name[0]).DistinguishedName
              $checkOu13 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1.Name[1]).DistinguishedName
              $checkOu14 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1.Name[2]).DistinguishedName
              $checkOu15 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1.Name[3]).DistinguishedName
              $checkOu16 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T1.Name[4]).DistinguishedName
              $checkOu17 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T1.Name[5]).DistinguishedName
              $checkOu18 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T1SRV.Name[0]).DistinguishedName
              $checkOu19 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_T1SRV.Name[1]).DistinguishedName
              $checkOu20 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Servers,OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1SRV.Name[2]).DistinguishedName
              $checkOu21 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Servers,OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1SRV.Name[3]).DistinguishedName
              $checkOu22 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Servers,OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1SRV.Name[4]).DistinguishedName
              $checkOu23 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Servers,OU=Tier1,$ParentOu" | Where-Object Name -eq $OU_T1SRV.Name[5]).DistinguishedName
              $checkOu24 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier2,$ParentOu" | Where-Object Name -eq $OU_T2.Name[0]).DistinguishedName
              $checkOu25 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=Tier2,$ParentOu" | Where-Object Name -eq $OU_T2.Name[1]).DistinguishedName
              $checkOu26 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=User Accounts,$ParentOu" | Where-Object Name -eq $OU_UA.Name[0]).DistinguishedName
              $checkOu27 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UA.Name[1]).DistinguishedName
              $checkOu28 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UA.Name[2]).DistinguishedName
              $checkOu29 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=User Devices,$ParentOu" | Where-Object Name -eq $OU_UD.Name[0]).DistinguishedName
              $checkOu30 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UD.Name[1]).DistinguishedName
              $checkOu31 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UD.Name[2]).DistinguishedName
              $checkOu32 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' -SearchBase "OU=User Groups,$ParentOu" | Where-Object Name -eq $OU_UG.Name[0]).DistinguishedName
              $checkOu33 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UG.Name[1]).DistinguishedName
              $checkOu34 = (Get-ADObject -Filter 'ObjectClass -eq "OrganizationalUnit"' | Where-Object Name -eq $OU_UG.Name[2]).DistinguishedName
           }
       Catch
           {
              Write-Warning $_
           }
   }
