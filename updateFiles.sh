#!/bin/bash


dir_source=''
dir_dest=''
rm --force --recursive /etc/puppetlabs/code/
mkdir /etc/puppetlabs/code
cp --force --recursive --update /media/sf_maxpuppet/puppetlabs/code/* /etc/puppetlabs/code
find /etc/puppetlabs/code -type f -print -exec chmod 644 {} \;
find /etc/puppetlabs/code -type d -print -exec chmod 755 {} \;

#rm --force /etc/puppetlabs/puppet/*
#cp --recursive --update /media/sf_maxpuppet/puppet/* /etc/puppetlabs/puppet/

echo "Files updated!"