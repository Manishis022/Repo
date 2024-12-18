$hosts = @("google.com", "yahoo.com", "bing.com")  # List of hosts to test
foreach ($hos in $hosts) {
    $pingResult = Test-Connection -ComputerName $hos -Count 1 -Quiet
    if ($pingResult) {
        Write-Host "$hos is reachable"
    } else {
        Write-Host "$hos is unreachable"
    }
}