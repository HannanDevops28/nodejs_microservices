---

```markdown
# 🛠️ DevOps Microservice Deployment with SSL (Node.js, AWS, Terraform, Ansible, DuckDNS)

This project demonstrates a complete theoretical DevOps workflow that covers writing a simple Node.js microservice, provisioning infrastructure on AWS using Terraform, automating server configuration with Ansible, setting up a custom DuckDNS domain, securing the API with HTTPS via Certbot, and testing the end-to-end deployment.

---

## 🔧 Step-by-Step Overview

### 1. ✅ Created a Microservice

- Developed a Node.js microservice using Express.js.
```


### 2. 🌐 Wrote Terraform Infrastructure Code

- Used [Terraform](https://www.terraform.io/) to provision an EC2 instance on AWS.
- Defined key infrastructure components:
- AWS provider and region setup.
- EC2 instance with a public IP.
- Security group with:
  - Port 22 open for SSH
  - Port 443 open for HTTPS
- Created and configured an SSH key pair for secure access.
- Ran `terraform init` and `terraform apply` to deploy the infrastructure.

---

### 3. 🔁 Set Up DNS with DuckDNS

- Registered a free domain via [DuckDNS](https://www.duckdns.org/): `zillas.duckdns.org`.
- Mapped the domain to the EC2 instance’s public IP.
- Verified DNS resolution after propagation.

---

### 4. 🤖 Wrote Ansible Playbook to Configure the EC2 Instance

- Connected to the EC2 instance over SSH.
- Installed required software:
- Docker
- Nginx
- Pulled and ran the Node.js microservice Docker image.
- Exposed the app internally (e.g., on port 3000).
- Configured Nginx as a reverse proxy to forward HTTPS traffic to the internal API.

---

### 5. 🔐 Automated SSL Certificate Setup with Certbot & DuckDNS

- Manually installed Certbot and its dependencies.
- Wrote custom DNS authentication scripts using the DuckDNS API.
- Used Certbot with DNS-01 challenge to generate an SSL certificate for `zillas.duckdns.org`.
- Configured Nginx to use the certificate to serve the API securely over HTTPS.

---

### 6. 🧪 Tested the End-to-End Setup

- Accessed the API at:  
👉 `https://zillas.duckdns.org/api`

- Troubleshot common issues:
- `ERR_SSL_PROTOCOL_ERROR`
- Misconfigured Nginx reverse proxy
- Incorrect certificate path or permission
- Docker container not listening on expected port

- Verified that:
- SSL certificate exists and is valid
- Nginx serves HTTPS traffic
- API responds correctly from the domain

---

## 📦 Technologies Used

- **Backend**: Node.js + Express  
- **Infrastructure**: AWS EC2, Terraform  
- **Automation**: Ansible  
- **DNS**: DuckDNS  
- **SSL**: Certbot with DNS challenge  
- **Proxy**: Nginx  
- **Containerization**: Docker  

---

## 💡 Key Learning Outcomes

- Infrastructure as Code (IaC) using Terraform  
- Server configuration automation with Ansible  
- Domain management with DuckDNS  
- HTTPS setup with DNS-01 challenge via Certbot  
- Secure and scalable deployment of microservices

---

## 📬 Contact

For any questions, feel free to open an issue or submit a pull request.  
Happy shipping 🚀!
```

---
