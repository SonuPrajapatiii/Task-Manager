Set-StrictMode -Off
Set-Location 'E:\Projects\sonu'

Write-Output '--- Top-level files ---'
Get-ChildItem -Path . -Force | Select-Object Name,Mode

Write-Output '--- Checking for lockfiles and .env ---'
$files = Get-ChildItem -Path . -Recurse -Force -File -Include '.env','package-lock.json','yarn.lock','pnpm-lock.yaml' -ErrorAction SilentlyContinue
if ($files -and $files.Count -gt 0) { $files | ForEach-Object { Write-Output $_.FullName } } else { Write-Output 'No lockfiles or .env found' }

Write-Output '--- Checking for node_modules or .git directories ---'
$dirs = Get-ChildItem -Path . -Recurse -Force -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -in @('node_modules','.git') }
if ($dirs -and $dirs.Count -gt 0) { $dirs | ForEach-Object { Write-Output $_.FullName } } else { Write-Output 'No node_modules or .git dirs found' }

Write-Output '--- Creating archive ---'
$zip = Join-Path (Get-Location) 'sonu-source.zip'
if (Test-Path $zip) { Remove-Item $zip -Force }
Compress-Archive -Path (Join-Path (Get-Location) '*') -DestinationPath $zip -Force
Get-Item $zip | Select-Object Name,Length
Write-Output '--- Done ---'
