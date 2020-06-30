# Pi-Cluster-headnode
This playbook is dedicated to creating an ansible playbook in order to setup the head node the the Raspberry Pis.

The main file to be run upon calling ansible pull: local.yml
    Create the role of iptables_persistent, in order to allow iptables changes to persist
    Var_prompt is used in order to ask the user for the head node and the MAC address of the first worker node
    Tasks runs the files that have the tasks for this playbook. As of right now, those are: \n
    -> step.1.yml \n
    -> step.2.yml


-------------------------
Files called by local.yml
*************************


step.1.yml
----------
This file is dedicated into installing/configuring the required packages
-> Installing and enabling NTP:
    Installs the ntp package
    Accesses /etc/ntp.conf and sets the time server to be timehost.stolaf.edu, instead of the default options
    Restarts NTP

-> Installing NFS:
    Installs nfs-kernel-server
    Exports /home 172.27.1.0/24(rw,sync)

-> Configuring NAT:
    Enabling worker nodes to access internet in /etc/sysctl.conf
    Masking the IP addresses of the cluster permanently

-> Installing DHCP

-> Installing OpenMPI:
    Installing openmpi-bin, openmpi-common, libopenmpi3, libopenmpi-dev
    Installing mpi4py for both python 2 and 3



step.2.yml
----------
This file is dedicated into making configurations to allow for a smooth SSH connection
-> Modifying /etc/hosts:
    Changes the address of the headnode to 172.27.1.254
    Adds an address of 172.27.1.254 for the worker node

-> Modifying /etc/dhcpcd.conf: 
    Adds the 172.27.1.* IP addresses to the new eth1 interface
    Changes the metric value to make it run sooner than the eth0 interface

-> Modifying /etc/dhcp/dhcpd.conf:
    Establishing global configurations
    Establishing configurations for the subnet of 172.27.1.0
    Adding the first worker and its MAC address as a recognizable client to receive a specific IP address.

-> Modifying /etc/default/isc-dhcp-server:
    Modifide the isc-dhcp-server to listen to eth1 as well as eth0

 -> New leases:
    Request new leases for the server
    PROGRESS TO BE MADE HERE - COMMAND FOR LEASES ABSENT

