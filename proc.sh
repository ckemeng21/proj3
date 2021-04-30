#! /bin/bash

Submenu(){
  echo "(please enter the number of your selection below)"
  echo " "
  echo "1.  Show all processes"
  echo "2.  Kill a process"
  echo "3.  Bring up top"
  echo "4.  Return to Main Menu"
}

Continue_q(){
  echo "Press [q] key to continue..."
}


sub_option1(){
  sub_opt1=`ps -ef`
  echo "$sub_opt1"
  Continue_q
}

sub_option2(){
  echo "Please enter the PID of the process you would like to kill:"
  read kill_pid
  kill -9 $kill_pid
}

sub_option3(){
  top
}

Submenu
read sub_choice
while [ $sub_choice -ne 4 ]
do
  if [ $sub_choice -eq 1 ]
  then 
  sub_option1
  fi
  if [ $sub_choice -eq 2 ]
  then 
  sub_option2
  fi
  if [ $sub_choice -eq 3 ]
  then 
  sub_option3
  fi
  read q_key
  Submenu
  read sub_choice
done
  
