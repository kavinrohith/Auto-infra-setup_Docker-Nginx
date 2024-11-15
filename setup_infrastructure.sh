#!/bin/bash

# This script sets up a Docker container with a basic web server and configures networking and firewall rules.
# Check for root privileges (for firewall configuration)
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or with sudo."
    exit 1
fi

# Function to check if Docker is installed
check_docker() {
    if ! command -v docker &> /dev/null; then
        echo "Docker is not installed. Installing Docker..."
        install_docker
    else
        echo "Docker is already installed."
    fi
}

# Function to install Docker
install_docker() {
    # Update package database and install Docker
    apt update && apt install -y docker.io
    systemctl start docker
    systemctl enable docker
    echo "Docker installed and started successfully."
}

# Function to pull and run the Docker container
run_docker_container() {
    # Pull the official NGINX Docker image
    docker pull nginx:latest
    echo "NGINX Docker image pulled."

    # Run the container
    docker run -d -p 80:80 --name web_server nginx
    echo "Docker container running with NGINX web server on port 80."
}

# Function to configure firewall to allow HTTP traffic
configure_firewall() {
    # Ensure UFW (Uncomplicated Firewall) is installed
    apt install -y ufw

    # Allow HTTP traffic on port 80
    ufw allow 80/tcp
    ufw enable
    ufw status
    echo "Firewall configured to allow HTTP traffic on port 80."
}

# Function to configure Docker network (if needed)
configure_network() {
    # By default, Docker creates a bridge network. Here we ensure it’s set up correctly
    docker network ls
    echo "Docker networks are listed."
}

# Main function to orchestrate the setup
main() {
    check_docker
    run_docker_container
    configure_firewall
    configure_network
    echo "Infrastructure setup complete!"
}

# Run the main function
main
