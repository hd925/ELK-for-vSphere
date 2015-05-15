Connect-VIServer vCenter Server  -user Username -password Password
$VMHosts = Get-VMHost | Sort-Object Name
$syslogserver = "tcp://Syslog Server IP"

foreach ($VMHost in $VMHosts) {
$FW = $VMhost | Get-VMHostFirewallException | Where {$_.Name -eq ‘syslog’} | Set-VMHostFirewallException -Enabled $True
Set-VMHostAdvancedConfiguration -Name Syslog.global.logHost -Value  $syslogserver  -VMHost $VMHost
}
Disconnect-VIServer -Confirm:$False



