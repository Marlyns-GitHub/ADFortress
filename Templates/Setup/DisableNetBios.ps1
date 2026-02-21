# Date : Nov 2025
# Program Language : PowerShell
# Author : Marlyns NKUNGA
# Email  : marlinnkunga348@gmail.com
# Title : Disabled NetBIOS over TCP/IP

$NetbiosOptionsValues = Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces\tcpip* -Name NetbiosOptions
Foreach($NetbiosOptionsValue in $NetbiosOptionsValues )
   {
        if (-not($NetbiosOptionsVlaue.NetbiosOptions -eq 2)) 
           { 
              Set-ItemProperty $NetbiosOptionsValue.PSPath -Name NetbiosOptions -Value 2
              
           }         
    }