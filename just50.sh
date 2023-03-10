#!/bin/bash

curl -X POST -F 'user_count=50' -F 'spawn_rate=1' http://192.168.1.8:8080/loadgen/swarm
sleep 5m

echo "Sber paketu delka 10 minut pro 50 uzivatelu"
timeout 10m tcpdump -i enp2s0 'port 4317 or 4318' -w packet10Minute50Person.pcap
echo "Sber paketu delka 30 minut pro 50 uzivatelu"
timeout 30m tcpdump -i enp2s0 'port 4317 or 4318' -w packet30Minute50Person.pcap
echo "Sber paketu delka 60 minut pro 50 uzivatelu"
timeout 60m tcpdump -i enp2s0 'port 4317 or 4318' -w packet60Minute50Person.pcap


echo "50 uzivatelu"
capinfos packet10Minute50Person.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2
capinfos packet30Minute50Person.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2
capinfos packet60Minute50Person.pcap | grep "Number of packets"| tr -d " " | cut -d ":" -f 2


