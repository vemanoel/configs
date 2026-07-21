winget uninstall -e --id Microsoft.GameInput --silent --disable-interactivity --force
winget uninstall -e --id Microsoft.OneDrive --silent --disable-interactivity --force
winget uninstall -e --id Microsoft.Teams --silent --disable-interactivity --force

Get-AppxPackage Microsoft.WindowsCamera | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsCalculator | Remove-AppxPackage
Get-AppxPackage Microsoft.Todos | Remove-AppxPackage
Get-AppxPackage *Clipchamp* | Remove-AppxPackage
Get-AppxPackage *BingNews* | Remove-AppxPackage
Get-AppxPackage *BingSearch* | Remove-AppxPackage
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

winget install --id RaveInc.Rave -e --accept-package-agreements --accept-source-agreements --ignore-security-hash
winget install --id BlueStack.BlueStacks -e --accept-package-agreements --accept-source-agreements
winget install --id Discord.Discord -e --accept-package-agreements --accept-source-agreements
winget install --id Mozilla.Firefox -e --accept-package-agreements --accept-source-agreements
winget install --id 9NKSQGP7F2NH -s msstore -e --accept-package-agreements --accept-source-agreements # whatsapp
winget install --id RARLab.WinRAR -e --accept-package-agreements --accept-source-agreements
winget install --id Anki.Anki -e --accept-package-agreements --accept-source-agreements
winget install --id Notion.Notion -e --accept-package-agreements --accept-source-agreements
winget install --id Notion.NotionCalendar -e --accept-package-agreements --accept-source-agreements
winget install --id Telegram.TelegramDesktop -e --accept-package-agreements --accept-source-agreements
winget install --id qBittorrent.qBittorrent -e --accept-package-agreements --accept-source-agreements
winget install --id yt-dlp.yt-dlp -e --accept-package-agreements --accept-source-agreements
winget install --id Google.PlatformTools -e --accept-package-agreements --accept-source-agreements
winget install --id ZedIndustries.Zed -e --accept-package-agreements --accept-source-agreements
winget install --id GoLang.Go -e --accept-package-agreements --accept-source-agreements
winget install --id Git.Git -e --accept-package-agreements --accept-source-agreements
winget install --id Casey.Just -e --accept-package-agreements --accept-source-agreements
