<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Main Disable Critical Protocols
#>

# Import varibales and functions
. ./input/disabled_adfortress.ps1

function Menu_Disable
{
    write-host ""
    write-host "Domain           : $NetBIOSName" -ForegroundColor DarkGray
    Write-Host "Domain Mode      : $Mode" -ForegroundColor DarkGray
    Write-Host "Operating System : $OS" -ForegroundColor DarkGray
    write-host "" 
    Write-Host "Main Menu"
    Write-Host ""
    Write-Host "     [1] Disable SSLv2.0 and SSLv3.0 "
    Write-Host "     [2] Disable TLSv1.0 and TLSv1.1"
    Write-Host "     [3] Disable mDNS and LLMNR"
    write-host "     [4] Disable NetBios"
    Write-Host "     [5] Disable IPv6"
    Write-Host "     [6] Disable SMBv1"
    Write-Host "     [7] Disable 3DES"
    Write-Host "     [8] Disable NTLMv1"
    Write-Host "     [9] Disable Spooler"
    Write-Host "     [10] Disable All"
    Write-Host "     [0] Exit"
}
do {

      Menu_Disable

      Write-Host ""
      Write-Host "Select Menu Number [0-10]: " -NoNewline

      switch ($choise = Read-Host)
      {  
	
       "1" { 

            # Run functions
            Set-DisableSsl
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
            
        }
        
        "2"{

            # Run functions
            Set-DisableTls
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "3"{

            # Run functions 
            Set-DisableLlmnr
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "4"{

            # Run functions
            Set-DisableNetbios
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "5"{

            # Run functions
            Set-DisableIpv6
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

       "6" { 
           
            # Run functions            
            Set-DisableSmb
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }
        
        "7"{

            # Run functions            
            Set-Disable3des
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "8"{

            # Run functions            
            Set-DisableNtlm
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "9"{

            # Run functions            
            Set-DisableSpooler
            Start-Sleep -Seconds 2
            Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }

        "10"{

            # Run functions
            
            Set-DisableSsl
            Set-DisableTls
            Set-DisableLlmnr
            Set-DisableNetbios
            Set-DisableIpv6
            Set-DisableSmb
            Set-Disable3des
            Set-DisableNtlm
            Set-DisableSpooler
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