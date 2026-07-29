# & ([scriptblock]::Create((irm "https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1"))) -nonInteractive -AllOptions

winget settings --enable InstallerHashOverride

powercfg /h off
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
$guid = (powercfg /list | Select-String "Ultimate Performance").ToString().Split()[3]
powercfg /setactive $guid

$root = Join-Path $PSScriptRoot "C"
Get-ChildItem $root -Recurse -File | ForEach-Object {
    $relative = $_.FullName.Substring($root.Length).TrimStart("\")
    $dest = "C:\" + $relative
    $dest = $dest.Replace("\Users\user\", "\Users\$env:USERNAME\")
    New-Item -ItemType Directory -Path (Split-Path $dest) -Force | Out-Null
    Copy-Item $_.FullName $dest -Force
}

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\CI\Policy" -Name "VerifiedAndReputablePolicyState" -Value 0

$path = "HKCU:\Software\Microsoft\Lighting"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name AmbientLightingEnabled -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Lighting"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name ControlledByForegroundApp -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name EnableTransparency -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name Start_NotifyNewApps -PropertyType DWord -Value 0 -Force | Out-Null
New-ItemProperty -Path $path -Name Start_TrackDocs -PropertyType DWord -Value 0 -Force | Out-Null
New-ItemProperty -Path $path -Name Start_IrisRecommendations -PropertyType DWord -Value 0 -Force | Out-Null
New-ItemProperty -Path $path -Name Start_AccountNotifications -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name ShowTaskViewButton -PropertyType DWord -Value 0 -Force | Out-Null
New-ItemProperty -Path $path -Name TaskbarResume -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
New-Item -Path $path -Force | Out-Null
Set-ItemProperty -Path $path -Name AppsUseLightTheme -Value 0
Set-ItemProperty -Path $path -Name SystemUsesLightTheme -Value 0
Start-Process "$env:windir\Resources\Themes\dark.theme"
