# arch only:
sudo pacman -S transfig libextractor sqlite libunistring
# ubuntu only:
sudo apt-get install transfig-dev libextractor-dev sqlite-dev
# read the readme for more dependencies https://gnunet.org/svn/gnunet/README


#fetch things you need
svn checkout https://gnunet.org/svn/ gnunet -r 30861
git clone git://git.gnupg.org/libgcrypt.git
wget https://gnunet.org/sites/default/files/gnurl-7.33.0.tar_0.bz2
tar -xvf gnurl-7.33.0.tar_0.bz2
wget http://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.31.tar.gz
tar -zxvf libmicrohttpd-0.9.31.tar.gz

# libmicrohttpd
cd libmicrohttpd-0.9.31
./configure
make
sudo make install
cd ..

# gnurl
cd gnurl-7.33.0
./configure
make
sudo make install
cd ..

# libgcrypt
cd libgcrypt
automake --add-missing
./autogen.sh
./configure --enable-maintainer-mode
make
sudo make install
cd ..


cd gnunet
cd gnunet
./bootstrap
# yes, we use sudo so that NSS support is included; you can also do --with-sudo=yes to let it know you plan to compile it with sudo
./configure --with-sudo=yes
# environment stuff
sudo groupadd gnunetdns
# or on ubuntu: sudo addgroup gnunetdns
sudo useradd gnunet
# or on ubuntu: sudo adduser gnunet
# UBUNTU ONLY: ./contrib/pogen.sh
# add each user who needs to use gnunet to the gnunet group
# do this for every user who should be able to use gnunet replacing v with the username
sudo usermod -aG "gnunet,v" v
# make screwes up if you don't do this
./contrib/pogen.sh
# make and install
sudo make
sudo make install
cd ..
cd ..

#"Once you have configured your peer, run (as the 'gnunet' user)
#    gnunet-arm -s
#to start the peer.  You can then run the various GNUnet-tools as
#your "normal" user (who should only be in the group 'gnunet')."

# create a default conf file for start up 

# NOTE: as far as I see, this is for client use, such as, gnunet-gtk,
# gnunet-fs-gtk, not sure if this does anything for cli util. Keep it
# empty for now
mkdir ~/.gnunet
touch ~/.gnunet/gnunet.conf

# after you are done installing
gnunet-arm -s
gnunet-gns-import.sh

#Configuring the GNS nsswitch plugin
#
#To use the NSS plugin you have to either install GNS as root or compile GNUnet with the --with-sudo=yes switch.
#
#Then you can add gns to your /etc/nsswitch.conf file:
#
#
#...
#hosts: files gns [NOTFOUND=return] dns
#...
#
#The NOTFOUND=return will ensure that if a .gnunet name is not found in GNS it will not be queried in DNS.
#


# TODO: figure out these issues
# after setting up nsswitch you need to reload that config and I don't know how to do that, so just reboot
# after you reboot some environment variable or something gets lost, so run sudo make install again in the gnunet folder to fix it

# ----------------------
# gnunet-gtk

cd gnunet/gnunet-gtk
./bootstrap
# (fish specific)
setenv PKG_CONFIG_PATH /home/v/dev/fuzzy-octo-ironman/gnunet/gnunet/pkgconfig
./configure
make
sudo make install
cd ../..
