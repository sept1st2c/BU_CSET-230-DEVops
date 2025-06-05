---

**Objective:**
Set up an Auto Scaling Group (ASG) that consistently maintains a fixed number of EC2 instances, each pre-configured using a custom AMI built with Nginx and a personalized HTML page.

---

### **Services and Tools Utilized:**

- **EC2:** For launching and preparing the initial server.
- **AMI (Amazon Machine Image):** To save a reusable image of the configured instance.
- **Launch Template:** For defining instance specifications.
- **Auto Scaling Group (ASG):** To automatically adjust and sustain the instance count.

---

### **Step-by-Step Implementation:**

#### **1. Set Up EC2 Instance**

- Deployed a new Ubuntu EC2 instance from the AWS Management Console.
- Installed Nginx with the following commands:

  ```bash
  sudo apt update
  sudo apt install nginx -y
  ```

- Accessed the instance’s public IP in a browser to confirm the Nginx server was running successfully.

#### **2. Customize the Web Page**

- Replaced the default Nginx page located at `/var/www/html/index.nginx-debian.html` with a custom HTML file.
- Reloaded the site in the browser to verify that the new content was properly served.

#### **3. Build a Custom AMI**

- After completing configuration, the EC2 instance was stopped.
- From the EC2 dashboard, selected **Actions → Create Image** to generate a new AMI.
- This image included both the Nginx setup and the updated HTML content.

#### **4. Set Up Launch Template**

- Created a Launch Template incorporating:

  - The custom AMI ID
  - Instance type (e.g., `t2.micro`)
  - A Security Group with port 80 open for HTTP traffic
  - (Optional) An SSH key pair for access

#### **5. Deploy Auto Scaling Group**

- Created an ASG using the previously defined Launch Template.
- Selected subnets within the default or a custom VPC.
- Configured the Desired, Minimum, and Maximum capacity to **3** instances.
- AWS launched 3 identical EC2 instances automatically from the AMI and template.

#### **6. Validate Auto Scaling Functionality**

- Terminated one instance manually from the EC2 console.
- The ASG quickly detected the change and spun up a new instance to maintain the target count.
- Checked the new instance’s IP to confirm that it served the same custom HTML page.

---

**Outcome:**
This exercise demonstrated how to automate instance recovery using Auto Scaling Groups, AMIs, and Launch Templates. It’s a solid DevOps practice for ensuring system availability, scalability, and cost-effectiveness — all critical aspects of resilient infrastructure design.

---
