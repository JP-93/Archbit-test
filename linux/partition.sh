#!/bin/bash

sudo apt-get install xfsprogs

sudo fdisk -l

read -p "Select partition: " PARTITION

sudo fdisk "$PARTITION" << EOF
n
p


w
EOF

sudo fdisk -l

read -p "Select the partition to format: " PARTITION

sudo mkfs .xfs -L media "$PARTITION"




