# set up some required gns entries

#WARNING: the latest version produces some errors when you run it, so modify your script's last 3 lines to add a -i nickname in a ddition to the -n name like so:
# # Link short and private zones into master zone
# gnunet-namestore -z master-zone -a -e never -n private -p -t PKEY -V $PRIVATE $options
# gnunet-namestore -z master-zone -a -e never -n short -p -t PKEY -V $SHORT $options
# 
# # Link GNUnet's FCFS zone into master zone under label "pin"
# gnunet-namestore -z master-zone -a -e never -n pin -p -t PKEY -V 72QC35CO20UJN1E91KPJFNT9TG4CLKAPB4VK9S3Q758S9MLBRKOG $options
gnunet-gns-import.sh

# list identities / gns zones
gnunet-identity -d

# create a new identity
gnunet-identity -C "new_zone"

# create an entry for google
gnunet-namestore -z master-zone -a -n google -t A -V 74.125.226.132 -e never

# test the setup
ping google.gnu
# if this fails, go back to the setup script and look up the section about nsswitch
