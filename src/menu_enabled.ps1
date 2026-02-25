<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Main Enable Secure Protocaol
#>

# Import varibales and functions
. ./input/enabled_adfortress.ps1

function Menu_Enable
{
    write-host ""
    write-host "Domain           : $NetBIOSName" -ForegroundColor DarkGray
    Write-Host "Domain Mode      : $Mode" -ForegroundColor DarkGray
    Write-Host "Operating System : $OS" -ForegroundColor DarkGray
    write-host "" 
    Write-Host "Main Menu"
    Write-Host ""
    Write-Host "     [1] Enforce NTLMv2"
    Write-Host "     [2] Enable TLS1.2 and TLSv1.3 "
    Write-Host "     [3] Activate Recycle Bin & Change ms-DS-MachineAccountQuota value"
    Write-Host "     [4] Enable All"
    Write-Host "     [0] Exit"
}
do {

      Menu_Enable

      Write-Host ""
      Write-Host "Select Menu Number [0-4]: " -NoNewline

      switch ($choise = Read-Host)
      {  
	
       "1" { 
           
            # Run functions
            Set-EnableNtlmv2
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }
        
        "2"{

            # Run functions
            Set-EnableTls
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "3"{

            # Run functions
            Set-RecycleBin
            Set-MachineAccountQuota
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "4"{

            # Run functions
            Set-EnableNtlmv2
            Set-EnableTls
            Set-RecycleBin
            Set-MachineAccountQuota
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