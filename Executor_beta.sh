#This script is for portablity testing.
#! /bin/bash
list="Your program files each with space"
cd /path/to/c++_script/directory
echo "Executions has started"
for i in list; do
 echo -e "Automatic execution of program $i\n-------------------------"
 g++ $i
 ./a.out
 echo -e "\n"
done
