sudo apt-get update

# install tools
sudo apt-get install -y \
   gnome-tweak-tool \
   gnome-shell-extensions \
   curl \
   git \
   vim \
   openconnect \
   network-manager-openconnect \
   network-manager-openconnect-gnome \
   network-manager-openvpn \
   default-jre \
   flatpak \
   tilix
   
# apache proxy reverso
# I don't use anymore but stay here case i change idea
: '
sudo apt-get install -y apache2 && \
sudo a2enmod ssl && \
sudo a2ensite default-ssl.conf && \
sudo a2enmod proxy && \
sudo a2enmod proxy_http && \
sudo systemctl restart apache2

sudo service apache2 restart
'
# Example case a need change hosts with sudo
echo '127.0.0.1 localhost.com.br' | sudo tee -a /etc/hosts




# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install 8
nvm use 8

# install docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# docker
sudo apt-get install docker-ce -y && groupadd docker && usermod -aG docker $USER

sudo systemctl enable docker
sudo systemctl disable docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

docker run hello-world

mkdir ~/.docker
chown $USER:$USER ~/.docker -R
chmod g+rwx ~/.docker -R

# ctop
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop


#Flatpak
flatpak install flathub org.eclipse.Java -y
flatpak install flathub com.spotify.Client -y




