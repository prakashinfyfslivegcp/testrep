#!/bin/bash -xe
#Prakash - administrator
useradd prakash.c01
mkdir -p /home/prakash.c01/.ssh
chmod 700 /home/prakash.c01/.ssh
echo 'ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAC+fNvsOfj0DcNXWr7XvZsLVhSu6+cTBgRG01McAlyK3ejotBB/MK8De9HY4Vwz6MnOvVcAqFbpfb9f1gMG1Kr/NAEwpsQs6qGBC639Ugk5R3yijmZNCAU5sxItgM8g+Qmi3jzQsdMFt/2XQJqy9fWsGQMtV85Rr7b1t9+wvLHHVkrcKw== prakash.c01' > /home/prakash.c01/.ssh/authorized_keys
chmod 600 /home/prakash.c01/.ssh/authorized_keys
chown -R prakash.c01:prakash.c01 /home/prakash.c01/.ssh
echo 'prakash.c01 ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/90-cloud-init-users