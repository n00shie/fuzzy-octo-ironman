#!/usr/bin/sh

if [ -n "$(ps aux | grep gnunet | grep peer1)" ]
then
	echo "peer 1 running, stopping peer 1"
	gnunet-arm -e -c peer1.conf
fi

if [ -n "$(ps aux | grep gnunet | grep peer2)" ]
then
	echo "peer 2 running, stopping peer 2"
	gnunet-arm -e -c peer2.conf
fi

rm -rf ~/gnunet1/
rm -rf ~/gnunet2/
mkdir ~/gnunet1
mkdir ~/gnunet2

gnunet-arm -s -c peer1.conf
gnunet-arm -s -c peer2.conf

while [ -z "$(gnunet-peerinfo -c peer1.conf -g)$(gnunet-peerinfo -c peer2.conf -g)" ] 
do
	echo "waiting for peers to start"
done

echo peer1 hello `gnunet-peerinfo -c peer1.conf -g`
echo peer2 hello `gnunet-peerinfo -c peer2.conf -g`


gnunet-peerinfo -c peer2.conf -p `gnunet-peerinfo -c peer1.conf -g`
gnunet-peerinfo -c peer1.conf -p `gnunet-peerinfo -c peer2.conf -g`

gnunet-gns-import.sh -c peer1.conf
gnunet-gns-import.sh -c peer2.conf

