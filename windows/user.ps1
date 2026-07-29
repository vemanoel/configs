'Y' | winget search PowerToys --source msstore

winget uninstall --exact --id Microsoft.GameInput --silent --disable-interactivity --force
winget uninstall --exact --id Microsoft.OneDrive --silent --disable-interactivity --force
winget uninstall --exact --id Microsoft.Teams --silent --disable-interactivity --force

Get-AppxPackage Microsoft.WindowsCamera | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsCalculator | Remove-AppxPackage
Get-AppxPackage Microsoft.Todos | Remove-AppxPackage
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

# winget install --id RaveInc.Rave --exact --silent --accept-package-agreements --accept-source-agreements --ignore-security-hash
# winget install --id BlueStack.BlueStacks --exact --silent --accept-package-agreements --accept-source-agreements
# winget install --id Discord.Discord --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id Mozilla.Firefox --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id 9NKSQGP7F2NH -s msstore --silent --exact --accept-package-agreements --accept-source-agreements # whatsapp
winget install --id RARLab.WinRAR --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id Anki.Anki --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id Telegram.TelegramDesktop --exact --silent --accept-package-agreements --accept-source-agreements

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
Set-ItemProperty -Path $path -Name AppsUseLightTheme -Type DWord -Value 0 -Force
Set-ItemProperty -Path $path -Name SystemUsesLightTheme -Type DWord -Value 0 -Force
Start-Process "$env:windir\Resources\Themes\dark.theme"
