wsl --install
wsl --install --distribution openSUSE-Tumbleweed --no-launch

& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1"))) -nonInteractive -AllOptions

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

Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "FontSmoothing" -Value "2"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "FontSmoothingType" -Value 2

$path = "HKCU:\Software\Microsoft\Lighting"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name UseDynamicLighting -Type DWord -Value 0 -Force | Out-Null
New-ItemProperty -Path $path -Name AmbientLightingEnabled -Type DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name SearchboxTaskbarMode -Type DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name IsMSACloudSearchEnabled -PropertyType DWord -Value 0 -Force | Out-Null
New-ItemProperty -Path $path -Name IsAADCloudSearchEnabled -PropertyType DWord -Value 0 -Force | Out-Null
New-ItemProperty -Path $path -Name IsDeviceSearchHistoryEnabled -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Lighting"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name AmbientLightingEnabled -PropertyType DWord -Value 0 -Force | Out-Null
New-ItemProperty -Path $path -Name ControlledByForegroundApp -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name EnableTransparency -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Control Panel\Desktop"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name MinAnimate -Value 0 -Force | Out-Null
New-ItemProperty -Path $path -Name UserPreferencesMask -Type Binary -Value ([byte[]](0x90,0x12,0x07,0x80,0x10,0x00,0x00,0x00)) -Force | Out-Null

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

$path = "HKLM:\SYSTEM\CurrentControlSet\Control\CI\Policy"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name "VerifiedAndReputablePolicyState" -Value 0

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name AppsUseLightTheme -Type DWord -Value 0 -Force
New-ItemProperty -Path $path -Name SystemUsesLightTheme -Type DWord -Value 0 -Force
Start-Process "$env:windir\Resources\Themes\dark.theme"

'Y' | winget search PowerToys --source msstore

Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Accessibility" -Recurse -Force

winget install --id Mozilla.Firefox --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id Anki.Anki --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id Telegram.TelegramDesktop --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id Git.Git --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id jdx.mise --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id ZedIndustries.Zed --exact --silent --accept-package-agreements --accept-source-agreements

winget uninstall --exact --id Microsoft.GameInput --silent --disable-interactivity --force
winget uninstall --exact --id Microsoft.OneDrive --silent --disable-interactivity --force
winget uninstall --exact --id Microsoft.Teams --silent --disable-interactivity --force

Get-AppxPackage AdvancedMicroDevicesInc-RSXCM | Remove-AppxPackage
Get-AppxPackage Microsoft.OneDriveSync | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsCamera | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsCalculator | Remove-AppxPackage
Get-AppxPackage Microsoft.Todos | Remove-AppxPackage
Get-AppxPackage Microsoft.Teams | Remove-AppxPackage
Get-AppxPackage *Clipchamp* | Remove-AppxPackage
Get-AppxPackage *BingNews* | Remove-AppxPackage
Get-AppxPackage *BingSearch* | Remove-AppxPackage
Get-AppxPackage *Xbox.TCUI* | Remove-AppxPackage
Get-AppxPackage *XboxGamingOverlay* | Remove-AppxPackage
Get-AppxPackage *XboxIdentityProvider* | Remove-AppxPackage
Get-AppxPackage *XboxSpeechToTextOverlay* | Remove-AppxPackage
Get-AppxPackage *Microsoft.GamingApp* | Remove-AppxPackage
Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage
Get-AppxPackage *BingWeather* | Remove-AppxPackage
Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage *MicrosoftStickyNotes* | Remove-AppxPackage
Get-AppxPackage *OutlookForWindows* | Remove-AppxPackage
Get-AppxPackage *PowerAutomateDesktop* | Remove-AppxPackage
Get-AppxPackage *RawImageExtension* | Remove-AppxPackage
Get-AppxPackage *Windows.DevHome* | Remove-AppxPackage
Get-AppxPackage *Windows.Photos* | Remove-AppxPackage
Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage
Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage
Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage
Get-AppxPackage *YourPhone* | Remove-AppxPackage
Get-AppxPackage *MicrosoftFamily* | Remove-AppxPackage
Get-AppxPackage *QuickAssist* | Remove-AppxPackage
Get-AppxPackage *WidgetsPlatformRuntime* | Remove-AppxPackage
Get-AppxPackage *MicrosoftWindows.Client.WebExperience* | Remove-AppxPackage
Get-AppxPackage *MicrosoftWindows.CrossDevice* | Remove-AppxPackage
Get-AppxPackage *Microsoft.Paint* | Remove-AppxPackage
Get-AppxPackage *Microsoft.WindowsNotepad* | Remove-AppxPackage
Get-AppxPackage *WebMediaExtensions* | Remove-AppxPackage

function Remove-Path {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $item = Get-Item -LiteralPath $Path -ErrorAction SilentlyContinue

    if ($null -eq $item) {
        Write-Host "Not found: $Path"
        return
    }

    takeown /F "$Path" /R /D Y | Out-Null
    icacls "$Path" /grant Administrators:F /T /C | Out-Null

    if ($item.PSIsContainer) {
        Remove-Item -LiteralPath $Path -Recurse -Force -ErrorAction Stop
    } else {
        Remove-Item -LiteralPath $Path -Force -ErrorAction Stop
    }

    Write-Host "Removed: $Path"
}

Remove-Path "C:\Program Files\WindowsApps\microsoft.paint_11.2603.251.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.YourPhone_1.26062.145.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\msteams_26163.405.4842.717_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.GamingApp_2607.1001.21.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.Todos_2.176.7601.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.MicrosoftSolitaireCollection_4.25.7150.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.XboxGamingOverlay_7.326.6011.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\microsoft.windows.photos_2026.11060.2004.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\microsoft.outlookforwindows_1.2026.630.300_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.MicrosoftStickyNotes_6.1.4.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.BingWeather_4.54.63045.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.BingNews_4.56.21872.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.WindowsAlarms_11.2605.10.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.WindowsCamera_2026.2605.7.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\microsoft.windowsnotepad_11.2605.29.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.WindowsCalculator_11.2606.0.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\microsoft.xboxidentityprovider_12.130.2510.6003_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\microsoft.gethelp_10.2407.40222.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_2.2606.702.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\MicrosoftWindows.CrossDevice_1.26062.105.0_x64__cw5n1h2txyewy"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.ZuneMusic_11.2606.19.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\Program Files\WindowsApps\Microsoft.Xbox.TCUI_1.24.10001.0_x64__8wekyb3d8bbwe"
Remove-Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox Private Browsing.lnk"
Remove-Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\WSL.lnk"
Remove-Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\WSL Settings.lnk"
