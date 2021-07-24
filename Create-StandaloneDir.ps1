$package = Get-Content $PSScriptRoot\package.json | ConvertFrom-JSON

$dir = "new-archivist-scripts"

if (Test-Path -Path $dir) {
   Write-Host "$dir already exists."
   exit 1
}

New-Item `
   -Path $dir `
   -ItemType Directory `
   -Force

Add-Content `
   -Path "$dir\version.txt" `
   -Value $package.version

$folders = @("channels", "playlist", "random")
$scripts = @("Invoke-YoutubeDL", "Write-DownloadLog")

foreach ($folder in $folders) {
   Copy-Item `
      -Path "$PSScriptRoot\$folder" `
      -Destination "$dir\$folder" `
      -Recurse
}

foreach ($script in $scripts) {
   Copy-Item `
      -Path "$PSScriptRoot\$script.ps1" `
      -Destination "$dir\$script.ps1" `
}

