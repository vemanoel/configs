& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1"))) -nonInteractive -AllOptions

winget settings --enable InstallerHashOverride

powercfg /h off
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
$guid = (powercfg /list | Select-String "Ultimate Performance").ToString().Split()[3]
powercfg /setactive $guid

$root = Join-Path $PSScriptRoot "C:"
Get-ChildItem $root -Recurse -File | ForEach-Object {
    $dest = $_.FullName.Replace($root, "C:")
    $dest = $dest.Replace("C:\Users\user", "C:\Users\$env:USERNAME")
    New-Item -ItemType Directory -Path (Split-Path $dest) -Force | Out-Null
    Copy-Item $_.FullName $dest -Force
}

$release = Invoke-RestMethod -Uri "https://api.github.com/repos/rustdesk/rustdesk/releases/latest"
$msi = $release.assets | Where-Object { $_.name -like "*x86_64.msi" } | Select-Object -First 1
$file = Join-Path $env:TEMP $msi.name
Invoke-WebRequest -Uri $msi.browser_download_url -OutFile $file
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$file`" /qn /norestart" -Wait
Remove-Item $file -Force
# https://support.google.com/android/answer/12623953