echo "Installing MongoDB"
# Render uses Debian 10 (Buster) image which means according to the platform support matrix:
# https://www.mongodb.com/docs/manual/administration/production-notes/#platform-support-matrix
# we can use MongoDB Community versions 4.4, 5.0, or 6.0

# Import the MongoDB public GPG key
apt-get install -y gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add -

# Create a list file for MongoDB
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/6.0 main" | tee
/etc/apt/sources.list.d/mongodb-org-6.0.list

# Update the package database
apt-get update

# Install MongoDB
apt-get install -y mongodb-org

# Start MongoDB service
systemctl start mongod

# Enable MongoDB to start on system boot
systemctl enable mongod

# Verify the installation
mongod --version

echo "Done"
