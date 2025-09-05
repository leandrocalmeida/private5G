cd ~
git clone https://github.com/aligungr/UERANSIM
cd UERANSIM
# if using free5GC v3.3.0 or below
git checkout 3a96298
# if using free5GC v3.4.0 or above
git checkout e4c492d
# if using free5GC v3.4.x and to get EAP-AKA-PRIME fix
git checkout 85a0fbf


sudo apt update
sudo apt upgrade

sudo apt install make
sudo apt install g++
sudo apt install libsctp-dev lksctp-tools
sudo apt install iproute2
sudo snap install cmake --classic

cd ~/UERANSIM
make

cd ~/free5gc/webconsole
./bin/webconsole

