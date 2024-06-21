set -x

echo "Installing MongoDB"

# Download the MongoDB tarball
curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-debian10-6.0.15.tgz

# Extract the tarball
tar -zxvf mongodb-linux-x86_64-debian10-6.0.15.tgz

# Move the extracted files to the /usr/local/mongodb directory
mkdir -p /usr/local/mongodb
cp -R -n mongodb-linux-x86_64-debian10-6.0.15/* /usr/local/mongodb

# Add the MongoDB binaries to the PATH
echo 'export PATH=/usr/local/mongodb/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Create the directory where MongoDB will store its data
mkdir -p /data/db

# Clean up
rm -rf mongodb-linux-x86_64-debian10-6.0.15.tgz
rm -rf mongodb-linux-x86_64-debian10-6.0.15

echo "Done"
