#!/bin/bash
set -e

echo "[+] Starting Docker Daemon..."
dockerd > /dev/null 2>&1 &
sleep 5

echo "[+] Building Jenkins Docker Image..."
docker build -t custom-jenkins .

echo "[+] Running Jenkins Container..."
docker run -d --name jenkins     -p 8080:8080 -v jenkins_home:/var/jenkins_home     -v /var/run/docker.sock:/var/run/docker.sock     custom-jenkins