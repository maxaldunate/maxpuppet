#!/bin/bash


dir_source=''
dir_dest=''

# cpying code folder
rm --force --recursive /etc/puppetlabs/code/
mkdir /etc/puppetlabs/code
cp --force --recursive --update /media/sf_maxpuppet/puppetlabs/code/* /etc/puppetlabs/code
find /etc/puppetlabs/code -type f -print -exec chmod 644 {} \;
find /etc/puppetlabs/code -type d -print -exec chmod 755 {} \;


# copying 6 files under /etc/puppetlabs/puppet/
dir_source='/media/sf_maxpuppet/puppet/'
dir_dest='/etc/puppetlabs/puppet/'
cp --force --update "$dir_source"auth.conf "$dir_dest"auth.conf
cp --force --update "$dir_source"classifier.yaml "$dir_dest"classifier.yaml
cp --force --update "$dir_source"fileserver.conf "$dir_dest"fileserver.conf
cp --force --update "$dir_source"puppet.conf "$dir_dest"puppet.conf
cp --force --update "$dir_source"puppetdb.conf "$dir_dest"puppetdb.conf
cp --force --update "$dir_source"routes.yaml "$dir_dest"routes.yaml


: <<'END'

# backuping ssl folder
rm --force --recursive /root/sslbak/
mkdir /root/sslbak
cp --force --recursive --update /etc/puppetlabs/puppet/ssl/* /root/sslbak/

# copying puppetlabs/puppet folder
rm --force --recursive /etc/puppetlabs/puppet/
mkdir /etc/puppetlabs/puppet
cp --force --recursive --update /media/sf_maxpuppet/puppet/* /etc/puppetlabs/puppet/
find /etc/puppetlabs/puppet/ -type f -print -exec chmod 644 {} \;
find /etc/puppetlabs/puppet/ -type d -print -exec chmod 755 {} \;

# restorying ssl folder
mkdir /etc/puppetlabs/puppet/ssl
cp --force --recursive --update /root/sslbak/* /etc/puppetlabs/puppet/ssl/
find /etc/puppetlabs/puppet/ssl/ -type f -print -exec chmod 644 {} \;
find /etc/puppetlabs/puppet/ssl/ -type d -print -exec chmod 755 {} \;
#rm --force --recursive /root/sslbak/

END

echo "Files updated!"