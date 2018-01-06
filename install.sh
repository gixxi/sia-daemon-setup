useradd -d /home/xmr -c "Sia daemon" siad
mkdir /home/siad
chown xmr /home/siad
echo "siad:$1" | chpasswd

#dependencies
apt-get install unzip

cp siad.conf /etc/supervisor/conf.d/

# download latest version
cd /opt
wget https://github.com/NebulousLabs/Sia/releases/download/v1.3.1/Sia-v1.3.1-linux-amd64.zip
unzip Sia-v1.3.1-linux-amd64.zip
mv Sia-v1.3.1-linux-amd64 Sia
rm Sia-v1.3.1-linux-amd64.zip
chown -R siad Sia

echo "run supervisorctl reread && supervisorctl update"
