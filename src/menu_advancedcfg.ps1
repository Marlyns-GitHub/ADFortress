<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Menu Advanced Configuration
#>

# Import varibales and functions
. ./input/tiering_vars.ps1

if (($null-ne $AdminT0Sid) -and
    ($null-ne $AdminT1Sid) -and
    ($null-ne $PAWMainT0Sid)
   )
   {
      . ./input/advancedcfg_adfortress.ps1
   }
else
   {
      write-warning "This task depends on the task [5] Implement Active Directory Tiering Model."
      Exit
   }

# Menu
function Menu_AdvancedCfg

{
    write-host ""
    write-host "Domain           : $NetBIOSName" -ForegroundColor DarkGray
    Write-Host "Domain Mode      : $Mode" -ForegroundColor DarkGray
    Write-Host "Operating System : $OS" -ForegroundColor DarkGray
    write-host "" 
    Write-Host "Main Menu"
    Write-Host ""
    Write-Host "     [1] Configure Proxy"
    Write-Host "     [2] Configure User Logon Cache"
    Write-Host "     [3] Configure Windows Firewall"
    Write-Host "     [4] Configure Audit Event Logs"
    Write-Host "     [5] Configure All"
    Write-Host "     [0] Exit"
}
do {
      
      Menu_AdvancedCfg

      Write-Host ""
      Write-Host "Select Menu Number [0-5]: " -NoNewline

      switch ($choise = Read-Host)
      {  
	
       "1" { 
           
            # Run functions
            Set-Proxy
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }
        
        "2"{

            # Run functions
            Set-UserLogonCache
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "3"{

            # Run functions
            Set-WinFirewall
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "4"{

            # Run functions
            Set-AuditEventLog
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "5"{

            # Run functions
            Set-Proxy
            Set-UserLogonCache
            Set-WinFirewall
            Set-AuditEventLog
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