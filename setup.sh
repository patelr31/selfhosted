#!/bin/bash
set -e

echo "🔹 Updating system..."
apt-get update -y && apt-get upgrade -y

echo "🔹 Installing base essentials..."
apt-get install -y \
    sudo \
    curl \
    wget \
    git \
    unzip \
    tar \
    zip \
    vim \
    nano \
    htop \
    net-tools \
    lsb-release \
    ca-certificates \
    apt-transport-https \
    gnupg \
    software-properties-common \
    iputils-ping \
    traceroute \
    dnsutils \
    cifs-utils

echo "🔹 Installing build tools & Python..."
apt-get install -y \
    build-essential \
    python3 \
    python3-pip

echo "🔹 Installing monitoring & system info tools..."
apt-get install -y \
    neofetch \
    iotop \
    sysstat

echo "🔹 Installing security tools..."
apt-get install -y \
    ufw \
    fail2ban

echo "🔹 Installing Docker..."
apt-get remove -y docker docker-engine docker.io containerd runc || true
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "✅ All installations completed!"
