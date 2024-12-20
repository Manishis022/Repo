# Function to create a scheduled task
Function Create-ScheduledTask {
    param (
        [string]$taskName,
        [string]$scriptPath,
        [string]$triggerTime
    )

    $action = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "-File $scriptPath"
    $trigger = New-ScheduledTaskTrigger -At $triggerTime -Daily
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

    Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName $taskName -Description "Automated task" -User "SYSTEM"

    Write-Host "Scheduled task $taskName created to run at $triggerTime."
}
# Example usage
Create-ScheduledTask -taskName "DailyBackup" -scriptPath "C:\PowershellRepo\Scripts\Backup.ps1" -triggerTime "13:35PM"
