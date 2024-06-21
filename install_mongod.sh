#!/bin/bash

echo "Installing MongoDB"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or using sudo"
  exit 1
fi

# Install necessary packages
apt-get update && apt-get install -y gnupg wget

# Import the MongoDB public GPG key
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add -

# Create a list file for MongoDB
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/6.0 main" >
/etc/apt/sources.list.d/mongodb-org-6.0.list

# Update the package database
apt-get update

# Install MongoDB
apt-get install -y mongodb-org

# Create necessary directories
mkdir -p /data/db

# Start MongoDB manually (since systemd is not available)
mongod --fork --logpath /var/log/mongodb.log

echo "MongoDB installation complete"
echo "To start MongoDB manually, run: mongod --fork --logpath /var/log/mongodb.log"
echo "To connect to MongoDB, run: mongo"

echo "Done"
