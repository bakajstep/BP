# Author: Stepan Bakaj
# Login: xbakaj00
# Date: 03.05.2023

#!/bin/bash

curl -X POST -F 'user_count=1' -F 'spawn_rate=1' http://192.168.1.8:8080/loadgen/swarm
sleep 5m

echo "Capture packets 10 minutes for 1 user"
timeout 10m tcpdump -i enp2s0 'port 4317 or 4318' -w packets10Minutes1Person.pcap
echo "Capture packets 30 minutes for 1 user"
timeout 30m tcpdump -i enp2s0 'port 4317 or 4318' -w packets30Minutes1Person.pcap
echo "Capture packets 60 minutes for 1 user"
timeout 60m tcpdump -i enp2s0 'port 4317 or 4318' -w packets60Minutes1Person.pcap

curl -X POST -F 'user_count=10' -F 'spawn_rate=1' http://192.168.1.8:8080/loadgen/swarm
sleep 2m

echo "Capture packets 10 minutes for 10 users"
timeout 10m tcpdump -i enp2s0 'port 4317 or 4318' -w packets10Minutes10Persons.pcap
echo "Capture packets 30 minutes for 10 users"
timeout 30m tcpdump -i enp2s0 'port 4317 or 4318' -w packets30Minutes10Persons.pcap
echo "Capture packets 60 minutes for 10 users"
timeout 60m tcpdump -i enp2s0 'port 4317 or 4318' -w packets60Minutes10Persons.pcap

curl -X POST -F 'user_count=50' -F 'spawn_rate=1' http://192.168.1.8:8080/loadgen/swarm
sleep 5m

echo "Capture packets 10 minutes for 50 users"
timeout 10m tcpdump -i enp2s0 'port 4317 or 4318' -w packets10Minutes50Persons.pcap
echo "Capture packets 30 minutes for 50 users"
timeout 30m tcpdump -i enp2s0 'port 4317 or 4318' -w packets30Minutes50Persons.pcap
echo "Capture packets 60 minutes for 50 users"
timeout 60m tcpdump -i enp2s0 'port 4317 or 4318' -w packets60Minutes50Persons.pcap


echo "1 user"
capinfos packets10Minutes1Person.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2
capinfos packets30Minutes1Person.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2
capinfos packets60Minutes1Person.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2


echo "10 users"
capinfos packets10Minutes10Persons.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2
capinfos packets30Minutes10Persons.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2
capinfos packets60Minutes10Persons.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2


echo "50 users"
capinfos packets10Minute50Persons.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2
capinfos packets30Minute50Persons.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2
capinfos packets60Minute50Persons.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2


