/root/onos/bin/onos-user-password root karaf
sed -i 's/\r$//' /root/onos/onos-apps/onos-create-app
cat << EOF >> ~/.bash_aliases 
alias onos='/root/onos/bin/onos'
alias onos-app='/root/onos/bin/onos-app'
alias onos-create-app='/root/onos/onos-apps/onos-create-app'
EOF
apt-get update
apt-cache search maven
apt-get install maven ssh --assume-yes