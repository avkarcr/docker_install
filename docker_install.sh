#!/bin/bash
apt update && apt upgrade -y
apt install -y curl ca-certificates gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

clear
echo -e "\e[1;32m-----------------------------------------------------------------\e[0m"
echo -e "\e[1;32mDocker Engine with Docker Compose has been succesfully installed!\e[0m"
echo -e "\e[1;32m-----------------------------------------------------------------\e[0m"
echo
echo -e "\e[1;32mDocker version: \t \t \e[1;33mv$(docker version | grep Version | head -n 1 | awk '{print $2}')\e[0m"
echo -e "\e[1;32mDocker Compose version: \t \e[1;33m$(docker compose version | awk '{print $4}')\e[0m"
echo
