#!/bin/bash

# Prompt the user for the URL of the web server
read -p "Enter the URL of the web server: " url

# Check if the URL is provided
if [ -z "$url" ]; then
  echo "URL cannot be empty. Exiting."
  exit 1
fi

# Prompt the user for the message to send
read -p "Enter the message to send: " message

# Check if the message is provided
if [ -z "$message" ]; then
  echo "Message cannot be empty. Exiting."
  exit 1
fi

# Scan the local network for other devices
network_scan_result=$(nmap -sn 192.168.1.0/24 | grep "Host is up")

# Check if any devices are found
if [ -z "$network_scan_result" ]; then
  echo "No other devices found on the network. Cannot send to other computers."
else
  # Prompt the user for the IP address of the target computer
  read -p "Enter the IP address of the target computer: " target_ip

  # Check if the target IP is provided
  if [ -z "$target_ip" ]; then
    echo "Target IP cannot be empty. Exiting."
    exit 1
  fi

  # Prompt the user for the SSH username on the target machine
  read -p "Enter the SSH username on the target machine: " ssh_username

  # Check if the SSH username is provided
  if [ -z "$ssh_username" ]; then
    echo "SSH username cannot be empty. Exiting."
    exit 1
  fi

  # Use SSH to run a command on the target machine, displaying the message
  ssh $ssh_username@$target_ip "DISPLAY=:0 zenity --info --text='$message'"

  echo "Message sent to $target_ip"
fi
