sudo apt update
echo "200 update"
sudo apt install bc
echo "200 bc"
echo "200 rm mod"
git clone https://github.com/aircrack-ng/rtl8188eus
echo "git downloaded"
cd rtl8188eus


echo "blacklist r8188eu" > "/etc/modprobe.d/realtek.conf"
cd -
make
sudo make install
echo "installing make"
sudo modprobe 8188eu

ifconfig wlan0 down
echo "Network stop to change the monitor"
airmon-ng check kill
iwconfig wlan0 mode monitor
echo "monitor mode activeted"
ifconfig wlan0 up
service NetworkManager restart
iwconfig


exit


