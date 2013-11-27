#!/usr/bin/fish

#gnunet-arm -e -c peer1.conf
#gnunet-arm -e -c peer2.conf

rm -rf ~/gnunet1/*
rm -rf ~/gnunet2/*

gnunet-arm -s -c peer1.conf
gnunet-arm -s -c peer2.conf

sleep 1

gnunet-peerinfo -c peer2.conf -p (gnunet-peerinfo -c peer1.conf -g)
gnunet-peerinfo -c peer1.conf -p (gnunet-peerinfo -c peer2.conf -g)

gnunet-gns-import.sh -c peer1.conf
gnunet-gns-import.sh -c peer2.conf

