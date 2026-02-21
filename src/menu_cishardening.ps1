<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Main CIS Hardening Compliance
#>

# Import varibales and functions
. ./input/cishardening_adfortress.ps1

function Menu_CIS
{
    write-host ""
    write-host "Domain           : $NetBIOSName" -ForegroundColor DarkGray
    Write-Host "Domain Mode      : $Mode" -ForegroundColor DarkGray
    Write-Host "Operating System : $OS" -ForegroundColor DarkGray
    write-host "" 
    Write-Host "Main Menu"
    Write-Host ""
    Write-Host "     [1] User Experiences"
    Write-Host "     [2] User Accounts Control"
    Write-Host "     [3] SMB Enumeration and Signing"
    Write-Host "     [4] Remote Management"
    write-host "     [5] LSA Protections"
    Write-Host "     [6] Hardening Browsers"
    Write-Host "     [7] All"
    Write-Host "     [0] Exit"
}
do {

      Menu_CIS

      Write-Host ""
      Write-Host "Select Menu Number [0-7]: " -NoNewline

      switch ($choise = Read-Host)
      {  
	
       "1" { 
           
            # Run functions
            Set-UserExperience
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }
        
        "2"{

            # Run functions
            Set-UserAccountsControl
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "3"{

            # Run functions
            Set-SmbEnumeration
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "4"{

            # Run functions
            Set-RemoteManagement
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "5"{

            # Run functions
            Set-LsaProtection
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

       "6" { 
           
            # Run functions
            Set-BrowserConfig
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }
        
        "7"{

            # Run functions
            Set-UserExperience
            Set-UserAccountsControl
            Set-SmbEnumeration
            Set-RemoteManagement
            Set-LsaProtection
            Set-BrowserConfig
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "0"{
              Exit
        }

       default {

            Write-Warning " This choise is not valid"
       }
    }
      pause
      Clear-Host
}while($true)