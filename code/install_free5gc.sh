
wget https://dl.google.com/go/go1.21.8.linux-amd64.tar.gz
sudo tar -C /usr/local -zxvf go1.21.8.linux-amd64.tar.gz

sudo apt -y install wget git

sudo apt install -y gnupg curl
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt update
sudo apt install -y mongodb-org

sudo systemctl start mongod

sudo apt -y install git gcc g++ cmake autoconf libtool pkg-config libmnl-dev libyaml-dev

sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o <dn_interface> -j MASQUERADE
sudo iptables -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1400
sudo systemctl stop ufw
sudo systemctl disable ufw # prevents the firewall to wake up after a OS reboot

sudo ./free5gc/reload_host_config.sh enp0s3


cd ~
git clone --recursive -b v4.1.0 -j `nproc` https://github.com/free5gc/free5gc.git
cd free5gc
make

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - 
sudo apt update
sudo apt install -y nodejs
corepack enable # setup yarn automatically

cd ~/free5gc
make webconsole
