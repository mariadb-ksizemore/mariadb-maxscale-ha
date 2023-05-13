![logo](https://mariadb.com/wp-content/uploads/2019/11/mariadb-logo_blue-transparent-600x150.png)

### MariaDB Enterprise Server / MaxScale Proxy High Availability

#### About:

This is a [Terraform](https://www.terraform.io/) and [Ansible](https://www.ansible.com/) project to provision a **high availability** [MariaDB Enterprise
Server](https://mariadb.com/docs/) deployment on [Amazon Web Services](https://aws.amazon.com/). This automation project will create the following system:

*   3 **MariaDB** Nodes For Durability & Performance
*   2 **MaxScale** Nodes For High Availability

#### Prerequisites:

*   [Amazon Web Services (AWS) Account](https://aws.amazon.com/)
*   [Install Terraform](https://www.terraform.io) *<sup>†</sup>*
*   [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-with-pip) *<sup>‡</sup>*
*   [MariaDB Enterprise Token](https://customers.mariadb.com/downloads/token/)

*<sup>†</sup> Requires Terraform v0.14.4 or above.*  
*<sup>‡</sup> Requires Full Ansible 2.10.5 or above. (Not Ansible-Core)*

#### Instructions:

Open a terminal window and clone the repository:

1.  `git clone https://github.com/mariadb-ksizemore/mariadb-enterprise-ha-ansible.git`
2.  `cd` into the newly cloned folder
3.  Edit [terraform.tfvars](terraform.tfvars) and [variables.tf](variables.tf) files to supply your own variables.
4.  `terraform init --var-file="terraform.tfvars"`
5.  `terraform plan --var-file="terraform.tfvars"` (Optional)
6.  `terraform apply --var-file="terraform.tfvars" --auto-approve`
7.  `ansible-playbook provision.yml`


##### Current Approved AWS Image(s)
AMI OS|AMI ID|Region|Zone|
---|---|---|---|
centos7|ami-0a4497cbe959da512|us-west-2|us-west-2a|


#### MaxScale GUI Info

*   url: `http://<MaxScale_Public_IPv4_DNS>:8989`
*   username: `admin`
*   password: `mariadb`


#### Clean Up

*   `terraform destroy --var-file="terraform.tfvars" --auto-approve`



#### Testing with JavaDemo

Packages Required:
- java-1.8.0-openjdk
- java-1.8.0-openjdk-devel


STEPS:

1. Edit javademo.java file and input the Maxscale External IPs.

2. Compile the code:

`javac -cp mariadb-java-client-3.1.4.jar javademo.java`

3. Execute the code:
`java -cp mariadb-java-client-3.1.4.jar:. javademo`
