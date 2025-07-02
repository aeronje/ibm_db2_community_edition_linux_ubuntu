# ibm_db2_community_edition_linux_ubuntu
A collection of helpful bash commands and step by step instructions for installing IBM DB2 v12.1.1 Community Edition on Ubuntu Linux


Heads up: IBM DB2 Community Edition and IBM Data Studio are 100% free.
Use them without fear. The only time you get in trouble is if you run Enterprise Edition without a valid entitlement.

IBM DB2: 

👉 https://www.ibm.com/db2/get-started

IBM Data Studio: 

👉 https://www.ibm.com/support/pages/download-and-install-ibm-data-studio-41x

1. Pre-requisites
--Update your system and install required packages, follow the bash commands accordingly:

👉 sudo apt update && sudo apt upgrade -y

👉 sudo apt install -y libaio1 libncurses5 libstdc++6 ksh x11-utils alien

👉 sudo apt install ksh


👉 which ksh

/*
if the output says here: /usr/bin/ksh

then then just use it for the sudo ln -sf
*/

👉 sudo ln -sf /usr/bin/ksh /bin/ksh

👉 sudo apt install ksh93u+m

👉 which ksh93

--you should get something like this /usr/bin/ksh93


👉 sudo ln -sf /usr/bin/ksh93 /bin/ksh

👉 sudo ln -sf /usr/bin/ksh93 /bin/mksh

👉 sudo ln -sf /usr/bin/ksh93 /bin/lksh

👉 ls -l /bin/ksh /bin/mksh /bin/lksh

/* 
you should get something like this:
lrwxrwxrwx 1 root root 14 Jan  1 12:00 /bin/ksh -> /usr/bin/ksh93
lrwxrwxrwx 1 root root 14 Jan  1 12:00 /bin/lksh -> /usr/bin/ksh93
lrwxrwxrwx 1 root root 14 Jan  1 12:00 /bin/mksh -> /usr/bin/ksh93
*/

👉 sudo apt install binutils

👉 sudo apt install libaio1

👉 sudo dpkg --add-architecture i386

👉 sudo apt install libpam0g:i386

👉 sudo apt install libstdc++6:i386

👉 wget https://ftp.cs.up.ac.za/ubuntu/pool/main/liba/libaio/libaio1_0.3.112-13build1_amd64.deb

👉 sudo dpkg -i libaio1_0.3.112-13build1_amd64.deb

👉 sudo apt --fix-broken install

2. Extract the Archive

--Assuming file is in ~/Downloads:

👉 cd ~/Downloads


👉 tar -xvzf v12.1.1_linuxx64_server_dec.tar.gz

👉 cd server_dec

👉 ./db2prereqcheck

/*
it should say requirement matched for all entries, proceed to step 3 if all good
*/


3. Launch the Installer with GUI - follow prompts


--Run the installer

👉 ./db2prereqcheck 

--if the no errors after db2prereqcheck then proceed with the next command

👉 ./db2setup

👉 choose the first one 'Server Editions', without purescale

/*
If using GUI Desktop, a wizard will appear. Choose 'Typical' installation, follow the prompts until finish.
Assuming you’re using default instance IDs (db2inst1, db2fenc1)
*/

4. If the installer failed to finish db2icrt (instance creation), you can manually run it:

👉 sudo nano /etc/services

/*
while you are inside this configuration, make sure that the this definition exist

db2c_db2inst1   25000/tcp

if not then add at the very bottom and save it
/*

👉 sudo ufw allow 25000/tcp

👉 sudo /opt/ibm/db2/V12.1/instance/db2icrt -u db2fenc1 db2inst1


/*
make sure you have network when you do this as hostname is bind with your ip address.
*/

5. Post-Installation

--Switch to your user and start DB2:


sudo su - db2inst1

👉  db2start

--Optional: Load sample database

👉  db2 create database sample

👉  db2 connect to sample

/*
BONUS:

Connect IBM Data Studio
Use IBM Data Studio to connect to your local DB2 instance.
Hostname: your_hostname or your_ip_address
Port: 25000
Database: SAMPLE (or your custom db)
User: db2inst1
Password: your_password
Test connection and finish.
*/
