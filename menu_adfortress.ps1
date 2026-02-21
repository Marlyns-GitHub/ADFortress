<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Main Menu ADFortress 
#>

Clear-Host

function Print_Menu
{
   Write-Host ""
   Get-Content .\banner.md
   Write-Host ""
   Write-Host "Main Menu"
   Write-Host ""
   Write-Host "     [1] Password Policies"
   Write-Host "     [2] Disable critical services and protocols"
   Write-Host "     [3] Enable secure protocols, activate Recycle Bin"
   Write-Host "     [4] CIS Hardening Acitve Directory"
   write-host "     [5] Implement Active directory Tiering Model"
   write-host "     [6] Advanced Configuration Proxy, Firewall and Audit Event Logs"
   Write-Host "     [7] Fortify User Rights Assignment"
   Write-Host "     [8] Implement Authentication Policy and Silos"
   Write-Host "     [0] Exit"
}
do {

      Print_Menu

      Write-Host ""
      Write-Host "Select Menu Number [0-8]: " -NoNewline

      switch ($choise = Read-Host)
      {  
	
       "1" { 
           
            .\input\passwd_adfortress.ps1
        }
        
        "2"{
              # Run function
              .\src\menu_disabled.ps1
        }

        "3"{
              # Run function
              .\src\menu_enabled.ps1
        }

        "4"{ 
              # Run function
              .\src\menu_cishardening.ps1
        }

        "5"{

            # Run function
            .\src\menu_tiering.ps1
        }

       "6" { 
            # Run function
            .\src\menu_advancedcfg.ps1
        }
        
        "7"{
            # Run function
            .\input\ura_adfortress.ps1
        }

        "8"{
            # Run function
            .\input\authsilo_adfortress.ps1
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