Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Accessibility" -Recurse -Force

# winget install --id RaveInc.Rave --exact --silent --accept-package-agreements --accept-source-agreements --ignore-security-hash
# winget install --id BlueStack.BlueStacks --exact --silent --accept-package-agreements --accept-source-agreements
# winget install --id Discord.Discord --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id Mozilla.Firefox --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id 9NKSQGP7F2NH -s msstore --silent --exact --accept-package-agreements --accept-source-agreements # whatsapp
winget install --id RARLab.WinRAR --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id Anki.Anki --exact --silent --accept-package-agreements --accept-source-agreements
winget install --id Telegram.TelegramDesktop --exact --silent --accept-package-agreements --accept-source-agreements

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name IsMSACloudSearchEnabled -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name IsAADCloudSearchEnabled -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name IsDeviceSearchHistoryEnabled -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Lighting"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name AmbientLightingEnabled -PropertyType DWord -Value 0 -Force | Out-Null

$path = "HKCU:\Software\Microsoft\Lighting"
New-Item -Path $path -Force | Out-Null
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

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name AppsUseLightTheme -Type DWord -Value 0 -Force
New-ItemProperty -Path $path -Name SystemUsesLightTheme -Type DWord -Value 0 -Force
Start-Process "$env:windir\Resources\Themes\dark.theme"

wsl --install kali-linux
wsl --install Ubuntu
wsl --install Debian
wsl --install openSUSE-Tumbleweed
wsl --install archlinux
wsl --install FedoraLinux-44

# wsl --unregister kali-linux
# wsl --unregister Ubuntu
# wsl --unregister Debian
# wsl --unregister openSUSE-Tumbleweed
# wsl --unregister archlinux
# wsl --unregister FedoraLinux-44
