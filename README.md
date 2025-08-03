
---

```markdown
# Microservice Deployment with Terraform, Ansible, Docker, Nginx & SSL

This repository demonstrates the complete lifecycle of deploying a microservice using modern DevOps tools and best practices.

---

## 🔧 Tech Stack

- **Terraform**: Infrastructure provisioning on AWS
- **Ansible**: Server configuration and deployment automation
- **Docker**: Containerization of the microservice
- **Nginx**: Reverse proxy for routing and SSL termination
- **Let's Encrypt + DuckDNS**: Free SSL certificate setup using DNS challenge
- **Node.js + Express**: Simple microservice API

---

## 📋 Project Workflow (Step-by-Step)

### 1. Microservice Setup
- Created a simple Express-based Node.js application.
- Containerized the application using a `Dockerfile`.

### 2. Infrastructure Provisioning using Terraform
- Provisioned an EC2 instance on AWS.
- Attached a security group allowing ports 22 (SSH), 80 (HTTP), and 443 (HTTPS).
- Used key-based authentication for SSH access.

### 3. Dynamic DNS with DuckDNS
- Registered a domain (e.g., `zillas.duckdns.org`) via DuckDNS.
- Pointed the DuckDNS domain to the EC2 public IP.

### 4. Remote Configuration via Ansible
- Connected to the EC2 server using Ansible inventory.
- Installed required packages (Docker, Nginx, Certbot).
- Pulled and ran the Docker image of the Node.js app.

### 5. Nginx Reverse Proxy Configuration
- Configured Nginx to forward requests to the Docker container.
- Enabled access on port 443 with SSL certificates.

### 6. SSL Certificate Setup with Let’s Encrypt
- Installed Certbot and dependencies.
- Used DuckDNS DNS challenge scripts to generate SSL certificates.
- Certificates stored at `/etc/letsencrypt/live/<your-domain>`.

### 7. Final Testing
- Visited `https://zillas.duckdns.org/api` to verify:
  - Reverse proxy routing
  - Valid SSL certificate
  - Secure access to microservice

---

## 🌐 Access URL

**🔗 https://zillas.duckdns.org/api**  
Responds with a confirmation message: `API is working`

---

## 📁 Repository Structure

```

├── microservice/               # Node.js app source code
│   ├── Dockerfile
│   └── index.js
├── terraform/                  # Terraform configuration for AWS EC2
│   └── main.tf
├── ansible/                    # Ansible playbooks and inventory
│   ├── inventory.ini
│   └── playbook.yml
├── scripts/                    # DNS challenge scripts for DuckDNS + Certbot
│   ├── duckdns-auth.sh
│   └── duckdns-cleanup.sh
└── README.md                   # Project documentation

```

---

## ✅ Outcomes

- Infrastructure-as-code setup with repeatable provisioning
- End-to-end automation of server configuration and deployment
- Secure HTTPS access using free SSL certificates
- Scalable and maintainable DevOps workflow

---

## 📌 Requirements

- AWS account with key pair
- Terraform CLI
- Ansible CLI
- Docker installed locally for testing
- DuckDNS account (free)

---

## 📞 Contact

For any questions or feedback, feel free to open an issue or contribute!

---

```

