# ADFortress
Fortify your Active directory in one click

# Overview
Active Directory hardening requires a lot of effort and time, there are many frameworks such as CIS Benchmark, NIST, Microsoft Security Baseline and others, they publish the guidelines but the big problem is that the configuration is manual.

Following this contraint, I decided to write ADFortress a PowerShell script to simplify and automate this process, in order to help people to provide less effort by reducing the time and complexity associated with manual configuration.

The idea behind the ADFortress script is to automate the hardening of the Active Directory by following the best practices of CIS Benchmark and Microsoft Security Guide.


# Main Menu :

    - Disable critical protocols and services such as (NTLMv1, SMBv1, Spooler, TLSv1.0 and TLSv1.1, SSLv2.0 and SSLv3.0, 3DES, IPv6, NetBIOS, LLMNR, mDNS)
    - Enable secure protocols or services such as (NTLMv2, TLSv1.2 and TLSv1.3) activate Recycle Bin and change the value of ms-DS-MachineAccountQuota
    - Configure CIS Hardening Active Directory
    - Implement Active Directory Tiering Model
    - Advanced configuration such as (Proxy, Windows firewall, Event Logs)
    - Fortify User right assignments
    - Implement Authentication silos

#  Disable and Enable critical protocols and services

|   Disable/Enable   |   Actions  | Domain Controllers |   Tier0    |    Tier1   | User Devices |
| ------------------ | ---------- |------------------- | ---------- | ---------- | ------------ |
| `NTLMv1`           | `Disabled` |     `Required`     | `Required` | `Required` |  `Optional`  |
| `SMBv1`            | `Disabled` |     `Required`     | `Required` | `Required` |  `Optional`  |
| `TLSv1.0 & TLSv1.1`| `Disabled` |     `Required`     | `Required` | `Required` |  `Suffisent` |
| `TLSv1.2 & TLSv1.3`| `Enabled`  |     `Required`     | `Required` | `Required` |  `Suffisent` |
| `NTLMv2`           | `Enabled`  |     `Required`     | `Required` | `Required` |  `Suffisent` |

Notice that :

    These GPOs are created and aren't linked by default, you should link them yourself because we all know that some environment use the legacy applications, certain legacy protocols are still in use.

# Tiered Model : Overview

Tiering Model is Microsoft concept, this approach allows you to separate the corporate network by tiers, they introducted three tiers (Tier 0, 1 and 2).
The idea behind the tiering model are :

* Segment infrastructure by tiers or levels
* Prevent lateral movement via credentials theft between the tiers
* Strengthen infrastructure security
  
# Tiered Model : Authentification Matrix

|  Tiers    |      Tier Admins      |              Descriptions                  | Tier 0  | Tier 1  | Tier 2  |
| --------- | --------------------- | ------------------------------------------ | ------- | ------- | ------- |
| `Tier 0`  |    `Domain Admins`    | `Domain Controllers & Core Infrastructure` | `Allow` | `Deny`  | `Deny`  |
| `Tier 1`  |   ` Server Admins`    | `Business Applications Servers`            | `Deny`  | `Allow` | `Deny`  |
| `Tier 2`  | `Workstations Admins` | `Workstations End Users`                   | `Deny`  | `Deny`  | `Allow` |

# Tiered Model : Accounts Naming Convention

|   Account Tiers   |    Formats    |   Examples   |             Descriptions            |
| ----------------- | ------------- | ------------ | ----------------------------------- |
| `Account Tier0`   | `t0.username` |  `t0.bteam`  | `Manage devices into Tier0`         |
| `Account Tier1`   | `t1.username` |  `t1.bteam`  | `Manage devices into Tier1`         |
| `Account Tier2`   | `t2.username` |  `t2.bteam`  | `Manage devices into Tier2`         |
| `Regular Account` |  `username`   |    `bteam`   | `Browse the internet, read email`   |

Notice that : 

    Keep in mind that, when you implement the Tiering Model, you should identify who will perform the administrative tasks on the three tiers.
    In the future, they will need four different accounts presented at the table above.

# Tiered Model : OU Design

<img width="1601" height="946" alt="Image" src="https://github.com/user-attachments/assets/3fbd4d06-3d7c-4d76-9df4-f159f403e2b8" />

Notice that : 

    - Non-Human Accounts OU in Tier 0 and 1 : includes services accounts, Tokens, API credentials, AI Agents
    - Non-Human OU in User Accounts : includes device accounts, IoT accounts, etc...

# Authentication policy and silos

ADFortress help you to move beyond tiering model, authentication policies and authentication silos.
They are security features designed to enhanced authentication processes and protect sensitive accounts in an Active Directory environment. Some requirements must be met before to run this script :

    - Domain Tier0 AuthSilo Devices : All computers will be assigned to the authentication silos must be members of this security group.
    - Domain Tier0 AuthSilo Members : All users will be assigned to the authentication silos must be members of this security group.

# How to use ADFortress

After downloading the package, move into ADFortress and PowerShell Run As

<img width="1163" height="99" alt="Image" src="https://github.com/user-attachments/assets/46789837-df0e-4d83-a2b9-c02ffe1f5bb7" />

# Conclusion

ADFortress allows you to build a strong Active Directory environment, it delivers secure defaults and mapping to CIS Benchmark, Microsoft Security Guide and other frameworks. Ready-to-use tool that makes complexity an abstraction for users, fortify your Active Directory in one click.


