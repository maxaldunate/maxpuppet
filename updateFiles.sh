#!/bin/bash


rm --force --recursive /etc/puppetlabs/code/
mkdir /etc/puppetlabs/code
cp --recursive --update /media/sf_maxpuppet/puppetlabs/code/* /etc/puppetlabs/code

rm --force /etc/puppetlabs/puppet/*
cp --recursive --update /media/sf_maxpuppet/puppet/* /etc/puppetlabs/puppet/

echo "Files updated!"