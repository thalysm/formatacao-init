# Define a política de execução para permitir a execução de scripts sem assinatura digital
sudo chmod +x ./install_software.sh

# Define a pasta temporária para downloads
TempFolder=$(mktemp -d)

# Define as URLs de download para as versões mais recentes do software
DiscordUrl="https://discord.com/api/download?platform=linux&format=deb"
SteamUrl="https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb"
FirefoxUrl="https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
VlcUrl="http://download.videolan.org/pub/debian/vlc/pool/main/v/vlc/vlc_3.0.16-1~deb10u1_amd64.deb"
BitTorrentUrl="https://download-new.utorrent.com/endpoint/bittorrent/os/linux-x64/track/stable/"

# Define os comandos de instalação para cada software
DiscordInstall="sudo dpkg -i $TempFolder/discord.deb && sudo apt-get -y install -f"
SteamInstall="sudo dpkg -i $TempFolder/steam.deb && sudo apt-get -y install -f"
FirefoxInstall="sudo dpkg -i $TempFolder/firefox.deb && sudo apt-get -y install -f"
VlcInstall="sudo dpkg -i $TempFolder/vlc.deb && sudo apt-get -y install -f"
BitTorrentInstall="sudo dpkg -i $TempFolder/bittorrent.deb && sudo apt-get -y install -f"

# Baixa e instala o Discord
echo "Baixando e instalando o Discord..."
DiscordInstaller="$TempFolder/discord.deb"
wget $DiscordUrl -O $DiscordInstaller
eval $DiscordInstall

# Baixa e instala o Steam
echo "Baixando e instalando o Steam..."
SteamInstaller="$TempFolder/steam.deb"
wget $SteamUrl -O $SteamInstaller
eval $SteamInstall

# Baixa e instala o Firefox
echo "Baixando e instalando o Firefox..."
FirefoxInstaller="$TempFolder/firefox.deb"
wget $FirefoxUrl -O $FirefoxInstaller
eval $FirefoxInstall

# Baixa e instala o VLC
echo "Baixando e instalando o VLC..."
VlcInstaller="$TempFolder/vlc.deb"
wget $VlcUrl -O $VlcInstaller
eval $VlcInstall

# Baixa e instala o BitTorrent
echo "Baixando e instalando o BitTorrent..."
BitTorrentInstaller="$TempFolder/bittorrent.deb"
wget $BitTorrentUrl -O $BitTorrentInstaller
eval $BitTorrentInstall

# Limpa a pasta temporária
rm -r $TempFolder
echo "Instalação concluída!"
