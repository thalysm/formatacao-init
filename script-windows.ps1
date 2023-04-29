# Define a política de execução para permitir a execução de scripts sem assinatura digital
Set-ExecutionPolicy RemoteSigned -Scope Process -Force

# Define a pasta temporária para downloads
$TempFolder = "$env:TEMP\software-install"

# Cria a pasta temporária se ela não existir
if (!(Test-Path $TempFolder)) {
    New-Item -ItemType Directory -Path $TempFolder | Out-Null
}

# Define as URLs de download para as versões mais recentes do software
$DiscordUrl = "https://discord.com/api/download?platform=win"
$SteamUrl = "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
$FirefoxUrl = "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"
$VoicemeeterUrl = "https://download.vb-audio.com/Download_CABLE/VoicemeeterSetup_v1088.zip"
$NvidiaUrl = "https://us.download.nvidia.com/GFE/GFEClient/3.26.0.70/GeForce_Experience_v3.26.0.70.exe"
$VlcUrl = "https://get.videolan.org/vlc/3.0.16/win64/vlc-3.0.16-win64.exe"
$BitTorrentUrl = "https://download-new.utorrent.com/endpoint/bittorrent/os/windows/track/stable/"

# Define os caminhos de instalação para cada software
$DiscordPath = "$env:ProgramFiles\Discord"
$SteamPath = "$env:ProgramFiles (x86)\Steam"
$FirefoxPath = "$env:ProgramFiles\Mozilla Firefox"
$VoicemeeterPath = "$env:ProgramFiles (x86)\VB\Voicemeeter"
$NvidiaPath = "$env:ProgramFiles\NVIDIA Corporation\GeForce Experience"
$VlcPath = "$env:ProgramFiles\VideoLAN\VLC"
$BitTorrentPath = "$env:ProgramFiles (x86)\BitTorrent\"

# Baixa e instala o Discord
Write-Host "Baixando e instalando o Discord..."
$DiscordInstaller = "$TempFolder\discord-setup.exe"
Invoke-WebRequest $DiscordUrl -OutFile $DiscordInstaller
Start-Process -FilePath $DiscordInstaller -ArgumentList "/S" -Wait
Remove-Item $DiscordInstaller

# Baixa e instala o Steam
Write-Host "Baixando e instalando o Steam..."
$SteamInstaller = "$TempFolder\steam-setup.exe"
Invoke-WebRequest $SteamUrl -OutFile $SteamInstaller
Start-Process -FilePath $SteamInstaller -ArgumentList "/S" -Wait
Remove-Item $SteamInstaller

# Baixa e instala o Firefox
Write-Host "Baixando e instalando o Firefox..."
$FirefoxInstaller = "$TempFolder\firefox-setup.exe"
Invoke-WebRequest $FirefoxUrl -OutFile $FirefoxInstaller
Start-Process -FilePath $FirefoxInstaller -ArgumentList "/S" -Wait
Remove-Item $FirefoxInstaller

# Baixa e instala o Voicemeeter
Write-Host "Baixando e instalando o Voicemeeter..."
$VoicemeeterZip = "$TempFolder\Voicemeeter.zip"
$VoicemeeterInstaller = "$TempFolder\VoicemeeterSetup.exe"
Invoke-WebRequest $VoicemeeterUrl -OutFile $VoicemeeterZip
Expand-Archive -Path $VoicemeeterZip -DestinationPath $TempFolder
Start-Process -FilePath $VoicemeeterInstaller -ArgumentList "/S" -Wait
Remove-Item $VoicemeeterZip
Remove-Item $VoicemeeterInstaller

# Baixa e instala o NVIDIA GeForce Experience
Write-Host "Baixando e instalando o NVIDIA GeForce Experience..."
$NvidiaInstaller = "$TempFolder\nvidia-setup.exe"
Invoke-WebRequest $NvidiaUrl -OutFile $NvidiaInstaller
Start-Process -FilePath $NvidiaInstaller -ArgumentList "/S" -Wait
Remove-Item $NvidiaInstaller

# Baixa e instala o VLC
Write-Host "Baixando e instalando o VLC..."
$VlcInstaller = "$TempFolder\vlc-setup.exe"
Invoke-WebRequest $VlcUrl -OutFile $VlcInstaller
Start-Process -FilePath $VlcInstaller -ArgumentList "/S" -Wait
Remove-Item $VlcInstaller

# Baixa e instala o BitTorrent
Write-Host "Baixando e instalando o BitTorrent..."
$BitTorrentInstaller = "$TempFolder\bittorrent-setup.exe"
Invoke-WebRequest $BitTorrentUrl -OutFile $BitTorrentInstaller
Start-Process -FilePath $BitTorrentInstaller -ArgumentList "/S" -Wait
Remove-Item $BitTorrentInstaller

# Limpa a pasta temporária
Remove-Item $TempFolder -Recurse -Force
Write-Host "Instalação concluída!"