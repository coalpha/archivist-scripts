param([string] $log_file, [string] $just_completed)

echo writing $just_completed to $log_file

Add-Content -Path $log_file -Value @($(Get-Date -Format o), $just_completed)
