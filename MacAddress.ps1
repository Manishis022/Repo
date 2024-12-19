$interfaceName = "Wi-Fi"  # Name of the network interface
$macAddress = (Get-NetAdapter -Name $interfaceName).MacAddress

Write-Host "MAC Address of $interfaceName is $macAddress"