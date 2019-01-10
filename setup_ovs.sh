#!/bin/bash
#pre-setup
yum install -y unbound-devel python-sphinx selinux-policy-devel

#download and build rpm
wget http://openvswitch.org/releases/openvswitch-2.10.0.tar.gz
cp openvswitch-2.10.0.tar.gz ~/rpmbuild/SOURCES
cd ~/rpmbuild/SOURCES/
tar -xvzf openvswitch-2.10.0.tar.gz
cd openvswitch-2.10.0/
rpmbuild -bb ./rhel/openvswitch.spec

#install rpm
rpm -ivh /root/rpmbuild/RPMS/x86_64/openvswitch-2.10.0-1.x86_64.rpm

#setup and start
export PATH=$PATH:/usr/share/openvswitch/scripts/
ovs-ctl start
