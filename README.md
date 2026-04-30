# 🌍 Infrastructure as Code Workshop – Terraform Cloud + AWS

## 📌 Overview

This project demonstrates how to provision a complete cloud infrastructure using **Infrastructure as Code (IaC)** with **Terraform Cloud (HCP Terraform)** and **AWS**.

The solution deploys a virtual machine that exposes a web server displaying a custom HTML page:

```
Hi, I am <your name> and this is my IaC
```

---

## 🏗️ Architecture

The infrastructure includes:

* **VPC (Virtual Private Cloud)**
* **Public Subnet**
* **Internet Gateway**
* **Route Table + Association**
* **Security Group (HTTP + SSH)**
* **EC2 Instance (Amazon Linux)**
* **Nginx Web Server**

### 🌐 Network Flow

```
Internet → Internet Gateway → Public Subnet → EC2 → Nginx → HTML Page
```

---

## 📁 Project Structure

```
iac-workshop/
  terraform/
    main.tf
    variables.tf
    providers.tf
    versions.tf
    outputs.tf
    modules/
      network/
      compute/
  images/
  README.md
```

---

## ⚙️ Prerequisites

* AWS Account
* Terraform Cloud (HCP Terraform) account
* GitHub repository

---

## 🔐 Authentication

This project uses **Terraform Cloud Dynamic AWS Credentials (OIDC)**.

* No static AWS keys are stored
* Short-lived credentials are generated per run

Required workspace variables:

### Environment Variables

```
TFC_AWS_PROVIDER_AUTH = true
TFC_AWS_RUN_ROLE_ARN  = <your-aws-role-arn>
```

---

## 🧮 Terraform Variables

Set these in Terraform Cloud:

### Required

```
student_name = pablo
environment  = dev
project_name = iac-workshop
aws_region   = us-east-1
```

### Optional

```
availability_zone   = us-east-1a
instance_type       = t3.micro
allowed_ssh_cidr    = <your-ip>/32
vpc_cidr            = 10.0.0.0/16
public_subnet_cidr  = 10.0.1.0/24
```

---

## 🚀 Deployment Steps

1. Connect GitHub repo to Terraform Cloud workspace
2. Set **Working Directory** to:

```
terraform
```

3. Configure variables in Terraform Cloud
4. Start a new run
5. Review plan
6. Apply changes

---

## 🌐 Accessing the Application

After deployment, Terraform outputs:

```
web_url = http://<public-dns>
```

Open it in your browser to see the web page.

---

## 📸 Evidence

Include the following in `/images`:

* Terraform Cloud successful run
* AWS resources list
* Network components (VPC, subnet, routes)
* Web page screenshot

---

## ♻️ Idempotency

This project is fully parameterized:

* Changing `student_name` or `environment` creates a new stack
* Existing infrastructure is not overwritten

---

## 🧹 Cleanup

To avoid AWS charges:

* Go to Terraform Cloud
* Run:

```
Destroy
```

---

## 🧠 Key Concepts Demonstrated

* Infrastructure as Code (IaC)
* Modular Terraform design
* AWS networking fundamentals
* Secure access via Security Groups
* Dynamic cloud authentication (OIDC)
* Idempotent deployments

---

## 📎 Repository

Add your GitHub repository link here.

---

## 👤 Author

Pablo

---

## ✅ Result

A fully reproducible cloud infrastructure that deploys a publicly accessible web server using Terraform Cloud and AWS.
