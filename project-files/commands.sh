# Description: Commands to install GNS3 and configure routers
sudo add-apt-repository ppa:gns3/ppa
sudo apt update                                
sudo apt install gns3-gui gns3-server
sudo apt-get install libpcap-dev

# Install ubridge
cd GNS3
git clone git@github.com:GNS3/ubridge.git
cd ubridge
make
sudo make install
chmod +x ubridge
cp -p ubridge /usr/local/bin
setcap cap_net_admin,cap_net_raw=ep /usr/local/bin/ubridge

# Router 1
R1# configure terminal
R1(config)# interface FastEthernet0/0 
R1(config-if)# ip address 192.168.27.1 255.255.255.0 
R1(config-if)# no shutdown
R1(config-if)# exit
R1(config)# end
R1# write

# Router 2
R2# configure terminal
R2(config)# interface FastEthernet0/0
R2(config-if)# ip address 192.168.27.2 255.255.255.0 
R2(config-if)# no shutdown
R2(config-if)# exit
R2(config)# end
R2# write