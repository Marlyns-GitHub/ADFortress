<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Menu Tiering Model
#>

# Import variables and functions
. ./input/tiering_adfortress.ps1

#Clear-Host

function Menu_Tiered
{
    write-host ""
    write-host "Domain           : $NetBIOSName" -ForegroundColor DarkGray
    Write-Host "Domain Mode      : $Mode" -ForegroundColor DarkGray
    Write-Host "Operating System : $OS" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "Main Menu"
    Write-Host ""
    Write-Host "     [1] Tiering Model OU"
    Write-Host "     [2] Tiering Model Security Groups"
    Write-Host "     [3] Tiering Model Restricted Logon"
    Write-Host "     [4] Tiering Model Local Admins"
    Write-Host "     [5] Tiering Model All"
    Write-Host "     [0] Exit"
}
do {

      Menu_Tiered

      Write-Host ""
      Write-Host "Select Menu Number [0-5]: " -NoNewline

      switch ($choise = Read-Host)
      {  
	
       "1" { 
           
            # Run functions
            Set-OUTiers
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }
        
        "2"{

            # Run functions
            Set-GroupTiers
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "3"{

            # Run functions
            . ./input/tiering_vars.ps1
            Set-RestrictedLogon
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "4"{

            # Run functions
            . ./input/tiering_vars.ps1
            Set-LocalAdminGroup
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }
        
        "5"{

            # Run functions
            Set-OUTiers
            Set-GroupTiers
            . ./input/tiering_vars.ps1
            Set-RestrictedLogon
            Set-LocalAdminGroup
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