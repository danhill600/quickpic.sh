#!/bin/bash

#A script to move the most recently taken phone picture to a public gallery.
#requires termux and termux-setup-storage
#makes a good homescreen widget
#I made separate scripts for pictures/Messages and pictures/Screenshots.
#-dmh 20190530

most_recent=$(ls -t ~/storage/dcim/Camera | head -1) 

read -p "what to name jpg?" jpgtitle

phobe_path=$(echo "/data/data/com.termux/files/home/storage/dcim/Camera/$most_recent")

new_path=$(echo /data/data/com.termux/files/home/storage/dcim/Camera/$jpgtitle.jpg)

mv $phobe_path $new_path

remote_path="/home/$USER/public_html/quickpics"

scp $new_path remoteserver:$remote_path/$jpgtitle.jpg

echo "link: http://www.example.com/~urname/quickpics/$jpgtitle.jpg"

ssh remoteserver chmod 644 $(echo "$remote_path/$jpgtitle.jpg") 
