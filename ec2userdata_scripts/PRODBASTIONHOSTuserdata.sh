#!/bin/bash -x

######################################
# User Data Script for Bastion Host
######################################

# User Data Logging
exec > >(tee /var/log/user-data.log) 2>&1

# Make environment variables
export INSTANCE_ID=$(ec2-metadata -i | cut -d " " -f 2)

#Wait until $HOME has been initialized
while [ ! -d /home/ec2-user ]; do
    sleep 10
    echo "home hasnt been initialized, waiting 10 seconds..."
done

echo "home path has been initiliazed, running userdata script"

# Export home directory for root
export HOME=/root

######################################
# PACKAGES SECTION
######################################

# Update System Packages
sudo yum update -y

# Install SSM agent
sudo yum install -y amazon-ssm-agent

# Start and enable ssm agent
sudo systemctl start amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent

# Install Lynis
sudo yum install -y lynis

# Install pip and botocore
sudo yum install -y python3-pip
sudo pip install botocore

# Install EFS utils
sudo yum install -y amazon-efs-utils

######################################
# EFS for /home SECTION
######################################

# Create variables
MOUNT_DIR="/home"
EFS_ID="fs-0193470c045ec927b"
ACCESS_POINT_ID="fsap-00477b8974861b50b"

# Make /home backup
ls -l /home
mkdir /homebackup
cp -r /home/* /homebackup
ls -l /homebackup

# Mount the EFS
sudo mount -t efs -o tls,accesspoint=$ACCESS_POINT_ID $EFS_ID:/ $MOUNT_DIR

# Add an entry to /etc/fstab to mount on boot
sudo echo "$EFS_ID:/ $MOUNT_DIR efs tls,accesspoint=$ACCESS_POINT_ID 0 0" | sudo tee -a /etc/fstab

# Restore /home backup
rsync -av /homebackup/ec2-user/ /home/ec2-user/
ls -l /home
ls -l /home/ec2-user

# Make sure /home/ec2-user exists
sudo mkdir /home/ec2-user
sudo chown -R ec2-user:ec2-user /home/ec2-user

# Announce this section as completed
echo "Completed EFS for /home Section"

######################################
# EFS for /Audit_Reports SECTION
######################################

# Make variable
# Create variables
MOUNT_DIR="/Audit_Reports"
EFS_ID="fs-0193470c045ec927b"
ACCESS_POINT_ID="fsap-0445bc64a855f2f81"

# Make mount directory
mkdir $MOUNT_DIR

# Mount the EFS
sudo mount -t efs -o tls,accesspoint=$ACCESS_POINT_ID $EFS_ID:/ $MOUNT_DIR

# Add an entry to /etc/fstab to mount on boot
sudo echo "$EFS_ID:/ $MOUNT_DIR efs tls,accesspoint=$ACCESS_POINT_ID 0 0" | sudo tee -a /etc/fstab

# Set Directory Perms
sudo chown -R ec2-user:ec2-user /Audit_Reports

# Make /Audit_Reports/INSTANCE_ID directory
mkdir /Audit_Reports/$INSTANCE_ID

# Announce this section as completed
echo "Completed EFS for /Audit_Reports Section"

######################################
# SSH BANNER SECTION
######################################

# Add a banner entry into sshd_config
sudo cat << 'EOF' >> /etc/ssh/sshd_config
Banner /etc/ssh/sshd_banner
EOF

# Create the SSH banner file
sudo cat << 'EOF' > /etc/ssh/sshd_banner
* * * * * * * * W A R N I N G * * * * * * * * * *
This computer system is the property of ProCore Plus. It is for authorized use only. By using this system, all users acknowledge notice of, and agree to comply with, the Acceptable Use of Information Technology Resources Policy (“AUP”). Unauthorized or improper use of this system may result in administrative disciplinary action, civil charges/criminal penalties, and/or other sanctions as set forth in the AUP. By continuing to use this system you indicate your awareness of and consent to these terms and conditions of use. LOG OFF IMMEDIATELY if you do not agree to the conditions stated in this warning.
* * * * * * * * * * * * * * * * * * * * *
EOF

# Restart sshd
sudo systemctl restart sshd

# Announce this section as completed
echo "Completed SSH BANNER Section"

######################################
# Splunk Forwarder SECTION
######################################

# Make Splunk user
useradd splunkfwd
echo "splunkfwd ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/splunkfwd
chmod 440 /etc/sudoers.d/splunkfwd

# sudo su into splunk user
sudo su - splunkfwd

# Grab Splunk Password from AWS Secrets Manager
SPLUNKPASSWORD=$(aws secretsmanager get-secret-value --secret-id SPLUNKPASSWORD --query SecretString --output text)

# CD into /tmp
sudo cd /tmp

# Install Splunk Forwarder Package
sudo wget -O splunkforwarder-9.1.1-64e843ea36b1.x86_64.rpm "https://download.splunk.com/products/universalforwarder/releases/9.1.1/linux/splunkforwarder-9.1.1-64e843ea36b1.x86_64.rpm"

# Install the package
sudo yum install -y ./splunkforwarder-9.1.1-64e843ea36b1.x86_64.rpm

# CD into the splunk bin directory
cd /opt/splunkforwarder/bin/

# Start Splunk and accept license
./splunk start --accept-license --answer-yes --no-prompt --seed-passwd $SPLUNKPASSWORD

# Login into Splunk
./splunk login -auth admin:$SPLUNKPASSWORD

# Add splunk forward server
./splunk add forward-server 3.230.57.16:9997

# Add splunk monitor
./splunk add monitor /var/log

# Restart Splunk
./splunk restart

# Announce this section as completed
echo "Completed Splunk Forwarder Section"