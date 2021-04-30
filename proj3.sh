#! /bin/bash

Cutting_line(){
  for((i=1;i<=30;i++));
  do
    echo -n "-"
  done
  echo "-"
}

asterisk_line1(){
  for((i=1;i<=22;i++));
  do
    echo -n "*"
  done
  echo "*"
}

asterisk_line2(){
  for((i=1;i<=36;i++));
  do
    echo -n "*"
  done
  echo "*"
}

Main_Menu(){
  Date=`date`
  echo "$Date"
  Cutting_line
  echo "Main Menu"
  Cutting_line
  echo "1. Operating system info"
  echo "2. Hostname and DNS info"
  echo "3. Network info"
  echo "4. Who is online"
  echo "5. Last logged in users"
  echo "6. My IP address"
  echo "7. My disk usage"
  echo "8. My home file-tree"
  echo "9. Process operations"
  echo "10. Exit"
  echo -n "Enter your choice [1 - 10] "
}

Continue_enter(){
  echo "Press [Enter] key to continue..."
}

Option1(){
  opt1=`/usr/bin/lsb_release -a`
  Cutting_line
  echo "System information"
  Cutting_line
  echo "Operating system : Linux"
  echo "$opt1"
  Continue_enter
}

Option2(){
  Hostname=`hostname`
  DNS_domain=`hostname -d`
  FULL_name=`hostname -f`
  Network_addr=`hostname -I`
  DNS_ip=`grep "nameserver" /etc/resolv.conf | awk '{print $2}'`
  echo "Hostname : $Hostname"
  echo "DNS domain : $DNS_domain"
  echo "Fully qualified domain name : $FULL_name"
  echo "Network address (IP) : $Network_addr"
  echo "DNS name servers (DNS IP) : $DNS_ip"
  Continue_enter
}

Option3(){
  opt3_1=`netstat -nat | wc -l`
  opt3_2=`ip a`
  opt3_3=`netstat -r`
  opt3_4=`netstat -i`
  Cutting_line
  echo "Network information"
  Cutting_line
  echo "Total network interfaces found : $opt3_1"
  echo "*** IP Addresses Information ***"
  echo "$opt3_2"
  asterisk_line1
  echo "*** Network routing ***"
  asterisk_line1
  echo "$opt3_3"
  asterisk_line2
  echo "*** Interface traffic information ***"
  asterisk_line2
  echo "$opt3_4"
  Continue_enter
}

Option4(){
  opt4=`who -H`
  Cutting_line
  echo "Who is online"
  Cutting_line
  echo "$opt4"
  Continue_enter
}

Option5(){
  opt5=`last -R | tail -n 3`
  Cutting_line
  echo "List of last ogged in users"
  Cutting_line
  echo "$opt5"
  Continue_enter
}

# various kinds of ip
Option6(){
  opt6=`ifconfig | grep "inet" | grep "broadcast" | awk '{print $2}'`
  Cutting_line
  echo "Public IP information"
  Cutting_line
  echo "$opt6"
  Continue_enter
}

Option7(){
  opt7=`df -lh | awk '{if(NR>1)print $5,$6}'`
  Cutting_line
  echo "Disk Usage Info"
  Cutting_line
  echo "$opt7"
  Continue_enter
}

Option8(){
  sh proj1.sh
  Cutting_line
  echo "My Home file-tree"
  Cutting_line
  echo "See filetree.html in the current directory."
  Continue_enter
}

Option9(){
  sh proc.sh
}

Main_Menu
read choice
while [ $choice -ne 10 ]
do
  if [ $choice -eq 1 ]
  then
    Option1
  fi
  if [ $choice -eq 2 ]
  then
    Option2
  fi
  if [ $choice -eq 3 ]
  then
    Option3
  fi
  if [ $choice -eq 4 ]
  then
    Option4
  fi
  if [ $choice -eq 5 ]
  then
    Option5
  fi
  if [ $choice -eq 6 ]
  then
    Option6
  fi
  if [ $choice -eq 7 ]
  then
    Option7
  fi
  if [ $choice -eq 8 ]
  then
    Option8
  fi
  if [ $choice -eq 9 ]
  then
    Option9
  fi
  if [ $choice -lt 9 ]
  then
    read enter_key
  fi
  Main_Menu
  read choice
done
  
