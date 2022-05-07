# CyberSecurity_Project_1
Project contains Linux scripts, Azure Virtual Machines, Network with ELK Server and Diagram

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Network Diagram](https://github.com/chirba4/CyberSecurity_Project_1/blob/main/Diagram/project_1.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above.
 Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - [Elk PlayBook](https://github.com/chirba4/CyberSecurity_Project_1/blob/main/Ansible/install-elk.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Applications in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network.
- Load Balancers protect web servers from traffic overload and possibly failing, e.g. DoS. When a load balancer is present web traffic 
  is distributed to the multible web servers thus preserving availability.
- A Jump Box provides a layer of security to a virtual network. It protects the network behind it from direct exposure to public access and acts as the only
  point of connection to the virtual network when the network needs to be accessed remotely.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file system and system logs.
- Filebeat collects data relating to the system's log files specified by the system administrater on the networks webservers and then collects log events 
  for indexing and for visual representation in Kibana for further investigation when neccessary .
- Metricbeat is a monitoring utility that periodically records the VMs operating system's metrics as well as services running on the web servers such number of machines/webservere, 
  machines names and dockers deployed on the machines, machines uptime, CPU usage and amount of memory used.  

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.7   | Linux            |
| Web-1    |Web server| 10.0.0.10   | Linux            |
| Web-2    |Web Server| 10.0.0.11   | Linux            |
| Web-3    |Web Server| 10.0.0.12   | Linux            |
|ELK Server|Monitoring| 10.1.0.5   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 69.251.146.255

Machines within the network can only be accessed by The Jump Box Provisioner.
- The Jump Box Provisioner is allowed to access the ELK VM, Its Private IP Address is 10.0.0.7

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 |69.251.146.255 	        |
| Web-1    | No                  |10.0.0.7              |
| Web-2    | No                  |10.0.0.7              |
| Web-3    | No                  |10.0.0.7		|
|ELK server| No			             |10.0.0.7		|
	
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because
- Ansible allows users to easily and rapidly set up multiple machines on a virtual network at the same time. Therefore instead of running one command at 
  a time the user would simply list all the neccessary commands in an ansible playbook and then ansible runs these commands one after the other to complete the setup.

The playbook implements the following tasks:
- From the Jump Box we first run a command to install docker.io which sets the path to pull required containers._TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- The second step is to run a command that pulls the container to be deployed on th jump box.
- Third we run the container for the first time.
- in this step we have to make the necessary changes to the the configuration files by editing the IP address to match the IP address of the ELK VM. This allows Ansible to discover the 
  ELK VM and connect it for proper deployment. 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

[Docker PS Screenshot](https://github.com/chirba4/CyberSecurity_Project_1/blob/main/Ansible/Elk-docker_PS.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
| Name     | IP Address | 
|----------|------------|
| Web-1    |10.0.0.10    | 
| Web-2    |10.0.0.11    | 
| Web-3    |10.0.0.12    | 


We have installed the following Beats on these machines:
- Filebeat and Metricbeat 

These Beats allow us to collect the following information from each machine:

- Filebeat collects data relating to the system's log files specified by the system administrater on the networks webservers and then collects log events 
  for indexing and for visual representation in Kibana for further investigation when neccessary. User should see an output similar to the following:
[Filebeat output example](https://github.com/chirba4/CyberSecurity_Project_1/blob/main/Ansible/FileBeat%20PS.PNG)

- Metricbeat is a monitoring utility that periodically records the VMs operating system's metrics as well as services running on the web servers such number of machines/webservere, 
  machines names and dockers deployed on the machines, machines uptime, CPU usage and amount of memory used. User should see an output similar to the following: 
[Metricbeat output example](https://github.com/chirba4/CyberSecurity_Project_1/blob/main/Ansible/MetricBeat%20PS.PNG)

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook install-elk.yml  file to the /etc/ansible/ directory.
- Update the host file to include the ELK server Private IP address and an interpreter such as Python3 to compile the the playbook,           ansible_python_interpreter=/usr/bin/python3 to the hosts.
- Run the playbook, and navigate to http://[the ELK VM IP]:5601/app/kibana to check that the installation worked as expected.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.
- In /etc/ansible/ run sudo nano hosts and edit the file by adding [elk] and add the ELK VM private IP address and ansible_python_interpreter=/usr/bin/python3 to 
  then hosts then save CTRL + x
- In the same directory run sudo nano ansible.cfg file and make sure the root= "your system admin username" 
  then run sudo ansible-playbook install-elk.yml
