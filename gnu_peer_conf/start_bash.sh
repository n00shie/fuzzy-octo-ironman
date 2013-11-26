#!/usr/bin/bash

gnunet-arm -s -c peer1.conf
gnunet-arm -s -c peer2.conf

gnunet-peerinfo -c peer1.conf -g
gnunet-peerinfo -c peer2.conf -g

gnunet-peerinfo -c peer2.conf -p "$(gnunet-peerinfo -c peer1.conf -g)"
gnunet-peerinfo -c peer1.conf -p "$(gnunet-peerinfo -c peer2.conf -g)"

gnunet-gns-import.sh -c peer1.conf
gnunet-gns-import.sh -c peer2.conf

