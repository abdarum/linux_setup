sudo addgroup guest
sudo addgroup gosc
sudo useradd  -m -g guest -d /home/guest/ -s /bin/bash -c "Guest" guest
sudo useradd  -m -g gosc -d /home/gosc/ -s /bin/bash -c "Gosc" gosc
sudo usermod -a -G guest gosc
sudo usermod -a -G gosc guest
sudo passwd -d gosc
sudo passwd -d guest

sudo addgroup pwr
sudo useradd  -m -g pwr -d /home/PWr/ -s /bin/bash -c "PWr" pwr
sudo passwd -d pwr

