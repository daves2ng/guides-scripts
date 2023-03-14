# Docker installation

# Update the apt package index and install packages to allow apt to use a repository over HTTPS:

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key:

sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# update the apt-get package index

sudo apt-get update

# This is option for a case wgere you are getting a GPG error when running the apt-get update. In that case, uncomment the two lines below

# sudo chmod a+r /etc/apt/keyrings/docker.gpg
# sudo apt-get update

# Install Docker Engine, containerd, and Docker Compose.

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# You may want to verify that docker installation is successful by uncommenting the below

# sudo docker run hello-world