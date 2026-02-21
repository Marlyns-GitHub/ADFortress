<#
 Date : Feb 2025
 Program Language : PowerShell
 Author : Marlyns NKUNGA
 Title : Password Policies
#>

# Importing Variables

. ./input/myvars.ps1
Write-Progress -Activity "Running ADFortress" -Status "Gathering domain information" -PercentComplete 15
Start-Sleep -Seconds 2

# Defaults Group Policies
$DefaultGPO = "Default Domain Policy",
              "Default Domain Controllers Policy"

foreach ( $GPO in $DefaultGPO ){
    
    if ($GPO -eq $DefaultGPO[0]){
        
       $000Id = (Get-GPO -Name $DefaultGPO[0]).Id.ToString()
       $PathDomainPolicy = Get-Item "$NewItem\{$($000Id)}\Machine\Microsoft\Windows NT\SecEdit"
       $GptTmplPath = "$PathDomainPolicy\GptTmpl.inf"
       $GptIniPath = "$NewItem\{$($000Id)}\GPT.INI"
       Write-Progress -Activity "Running ADFortress" -Status "Checking $GPO " -PercentComplete 25
       Start-Sleep -Seconds 2
    }
}

$PathPolicy = (Get-ADObject -Filter 'Name -eq "Policies"' -Properties * | Where-Object ObjectClass -eq container | Select-Object Name, distinguishedName).DistinguishedName    
$VersionNumber = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
$VersionNumber.versionNumber | ForEach {

       $InitialVNumber = $VersionNumber.versionNumber
       $NewVersionNumber = 11
       $ResultVNumber = [int]"$InitialVNumber" + [int]"$NewVersionNumber"

    if ( ($VersionNumber.versionNumber -eq "3" ) -and
         ($LockoutThreshold -eq "0") -and
         ($MinPassLength -eq "7") -and
         ($MaxPassAge -eq "42")
       )  
        {
            Write-Progress -Activity "Running ADFortress" -Status "Configuring Password Policy" -PercentComplete 50
            Start-Sleep -Seconds 2

            function DefaultDomainpolicy  ()
                {
                    function LockOut ()
                        {
                            $DContent = Get-Content $GptTmplPath
                            $LockOutBad = $DContent -replace "LockoutBadCount = 0", "LockoutBadCount = 5"
                            Set-Content $GptTmplPath $LockOutBad
                        }
                    LockOut

                    function MinPwd ()
                        {                  
                            $DContent = Get-Content $GptTmplPath
                            $MinPwdLength = $DContent -replace "MinimumPasswordLength = 7", "MinimumPasswordLength = 14"
                            Set-Content $GptTmplPath $MinPwdLength
                        }
                    MinPwd

                    function MaxPwd ()
                        {
                            $DContent = Get-Content $GptTmplPath
                            $MaxPwdAge = $DContent -replace "MaximumPasswordAge = 42", "MaximumPasswordAge = 60"
                            Set-Content $GptTmplPath $MaxPwdAge
                        }
                    MaxPwd

                    $MinPwdLengthAudit = "MACHINE\System\CurrentControlSet\Control\SAM\MinimumPasswordLengthAudit=4,14"
                    $ResetLockOut = "ResetLockoutCount = 30"
                    $LockOutDuration = "LockoutDuration = 30"

                    #Add New line after a Pattern LockoutBadCount and Registy Values
                    $GptTmplPathVars = Get-Content $GptTmplPath | ForEach-Object {
                        
                        $_
                        if ($_ -match "LockoutBadCount")
                            {
                                $ResetLockOut
                                $LockOutDuration
                            }
                        if ($_ -match "Registry Values")
                            {        
                                $MinPwdLengthAudit
                            }
                    }  

                    $GptTmplPathVars > $GptTmplPath

                    # Edit GPT.INI and update Sysvol versionNumber        
                    $GptDContent = Get-Content $GptIniPath
                    $GptDContent = $GptDContent -replace "Version=3", "Version=14"
                    Set-Content $GptIniPath $GptDContent

                    # Update AD versionNumber

                    $VersionNumber = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumber -Replace @{versionNumber="14"}
                }  
                # Launch the functions
                Write-Progress -Activity "Running ADFortress" -Status "Updating VersionNumber of the Default Domain" -PercentComplete 75
                Start-Sleep -Seconds 2
                    
                DefaultDomainpolicy 
                $command = gpupdate /force
                                
                Start-Sleep -Seconds 2
                Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed              
            }

    elseif ( ( $VersionNumber.versionNumber -eq "14" ) -and
             ( $LockoutThreshold -eq "5" ) -and
             ( $MinPassLength -eq "14" ) -and
             ( $MaxPassAge -eq "60")
           )
            {
                Write-Progress -Activity "Running ADFortress" -Status "Checking if Password Policy already configured" -PercentComplete 50
                Start-Sleep -Seconds 2
                Write-Host "" 
                Write-Host "ComplexityEnabled...........: " -ForegroundColor DarkGray -NoNewline; Write-Host $Complexity -ForegroundColor DarkYellow
                Write-Host "LockoutDuration.............: " -ForegroundColor DarkGray -NoNewline; Write-Host $LockDuration -ForegroundColor DarkYellow 
                Write-Host "LockOutObservationWindow....: " -ForegroundColor DarkGray -NoNewline; Write-Host $LockObservation -ForegroundColor DarkYellow
                Write-Host "LockoutThreshold............: " -ForegroundColor DarkGray -NoNewline; Write-Host $LockoutThreshold -ForegroundColor DarkYellow
                Write-Host "MaxPasswordAge..............: " -ForegroundColor DarkGray -NoNewline; Write-Host $MaxPassAge -ForegroundColor DarkYellow
                Write-Host "MinPasswordAge..............: " -ForegroundColor DarkGray -NoNewline; Write-Host $MinPassAge -ForegroundColor DarkYellow
                Write-Host "MinPasswordLength...........: " -ForegroundColor DarkGray -NoNewline; Write-Host $MinPassLength -ForegroundColor DarkYellow
                Write-Host "PasswordHistoryCount........: " -ForegroundColor DarkGray -NoNewline; Write-Host $PassHistory -ForegroundColor DarkYellow
                Write-Host "ReversibleEncryptionEnabled.: " -ForegroundColor DarkGray -NoNewline; Write-Host $Reversible -ForegroundColor DarkYellow
                Write-Host "" 
            }

    elseif ( ( $VersionNumber.versionNumber -eq $ResultVNumber ) -and
             ( $LockoutThreshold -eq "5" ) -and
             ( $MinPassLength -eq "14" ) -and
             ( $MaxPassAge -eq "60")
           )
            {
                Write-Progress -Activity "Running ADFortress" -Status "Checking if Password Policy already configured" -PercentComplete 50
                Start-Sleep -Seconds 2
                Write-Host "" 
                Write-Host "ComplexityEnabled...........: " -ForegroundColor DarkGray -NoNewline; Write-Host $Complexity -ForegroundColor DarkYellow
                Write-Host "LockoutDuration.............: " -ForegroundColor DarkGray -NoNewline; Write-Host $LockDuration -ForegroundColor DarkYellow 
                Write-Host "LockOutObservationWindow....: " -ForegroundColor DarkGray -NoNewline; Write-Host $LockObservation -ForegroundColor DarkYellow
                Write-Host "LockoutThreshold............: " -ForegroundColor DarkGray -NoNewline; Write-Host $LockoutThreshold -ForegroundColor DarkYellow
                Write-Host "MaxPasswordAge..............: " -ForegroundColor DarkGray -NoNewline; Write-Host $MaxPassAge -ForegroundColor DarkYellow
                Write-Host "MinPasswordAge..............: " -ForegroundColor DarkGray -NoNewline; Write-Host $MinPassAge -ForegroundColor DarkYellow
                Write-Host "MinPasswordLength...........: " -ForegroundColor DarkGray -NoNewline; Write-Host $MinPassLength -ForegroundColor DarkYellow
                Write-Host "PasswordHistoryCount........: " -ForegroundColor DarkGray -NoNewline; Write-Host $PassHistory -ForegroundColor DarkYellow
                Write-Host "ReversibleEncryptionEnabled.: " -ForegroundColor DarkGray -NoNewline; Write-Host $Reversible -ForegroundColor DarkYellow
                Write-Host ""  
            }
    else
        {
            Write-Progress -Activity "Running ADFortress" -Status "Configuring Password Policy" -PercentComplete 50
            Start-Sleep -Seconds 2
            
            function DefaultDomainpolicy  ()
                {
                    function LockOut ()
                        {
                            $DContent = Get-Content $GptTmplPath
                            $LockOutBad = $DContent -replace "LockoutBadCount = 0", "LockoutBadCount = 5"
                            Set-Content $GptTmplPath $LockOutBad
                        }
                    LockOut

                    function MinPwd ()
                        {                  
                            $DContent = Get-Content $GptTmplPath
                            $MinPwdLength = $DContent -replace "MinimumPasswordLength = 7", "MinimumPasswordLength = 14"
                            Set-Content $GptTmplPath $MinPwdLength
                        }
                    MinPwd

                    function MaxPwd ()
                        {
                            $DContent = Get-Content $GptTmplPath
                            $MaxPwdAge = $DContent -replace "MaximumPasswordAge = 42", "MaximumPasswordAge = 60"
                            Set-Content $GptTmplPath $MaxPwdAge
                        }
                    MaxPwd

                    $MinPwdLengthAudit = "MACHINE\System\CurrentControlSet\Control\SAM\MinimumPasswordLengthAudit=4,14"
                    $ResetLockOut = "ResetLockoutCount = 30"
                    $LockOutDuration = "LockoutDuration = 30"

                    #Add New line after a Pattern LockoutBadCount and Registy Values
                    $GptTmplPathVars = Get-Content $GptTmplPath | ForEach-Object {
                        
                        $_
                        if ($_ -match "LockoutBadCount")
                            {
                                $ResetLockOut
                                $LockOutDuration
                            }
                        if ($_ -match "Registry Values")
                            {        
                                $MinPwdLengthAudit
                            }
                    }  

                    $GptTmplPathVars > $GptTmplPath
                    # Edit GPT.INI and update Sysvol versionNumber

                    $GptDContent = Get-Content $GptIniPath
                    $GptDContent = $GptDContent -replace "Version=$InitialVNumber", "Version=$ResultVNumber"
                    Set-Content $GptIniPath $GptDContent

                    # Update AD versionNumber

                    $VersionNumber = (Get-ADObject "CN={$($000Id)},$PathPolicy" -Properties *)
                    Set-ADObject -Identity $VersionNumber -Replace @{versionNumber="$ResultVNumber"}
                }  
                # Launch the functions
                Write-Progress -Activity "Running ADFortress" -Status "Updating VersionNumber of the Default Domain" -PercentComplete 75
                Start-Sleep -Seconds 2
                
                DefaultDomainpolicy 
                $command = gpupdate /force

                Start-Sleep -Seconds 2
                Write-Progress -Activity "Running ADFortress" -Status "Completed" -Completed
        }
}