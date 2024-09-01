#! /bin/bash
echo -e "Zone transfer in a friendly way\n---------------------------------"
read -p "Enter the domain: " domain
zone_transfer()
{
 host -t ns $domain
 read -p "Enter selected nameserver here: " name_server
 if [[ -z $name_server ]]; then
  until [[ ! -z $name_server ]]; do
   read -p "Enter the nameserver: " name_server
  done
 fi
 check=$(dig axfr $domain @$name_server +short)
 if [[ $check == "; Transfer failed." ]]; then
  echo "Could not perform Zone Transfer"
 else
  echo "--------------------------------"
  $check
 fi
}

if [[ -z $domain ]]; then
 echo "No domain founded"
else
 zone_transfer
fi

#Risk level: 5/5
#Reward level: 1/5
