#!/bin/bash


check_tools() {
  for cmd in assetfinder httprobe; do
    if ! command -v $cmd &>/dev/null; then
      echo "$cmd not found. Please install it."
      exit 1
    fi
  done
}


validate_domain() {
  if [[ ! "$dom" =~ ^([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,6}$ ]]; then 
    echo "Invalid domain name. Please enter a valid domain (e.g., example.com)."
    return 1
  fi
  return 0
}


lp() {
  while [ -z "$dom" ]; do
    read -p "Enter domain name: " dom
    validate_domain
    while [ $? -ne 0 ]; do  
      read -p "Enter domain name: " dom
      validate_domain
    done
  done
}

 
 run_recon() {
  echo "Performing domain reconnaissance..."
  assetfinder "$dom" > subdomains.txt
  if [[ ! -s subdomains.txt ]]; then
    echo -e "No subdomains found or invalid domain.\nPlease try a different domain."
    return 1
  fi
  cat subdomains.txt | httprobe > live.txt
  sed 's|https\?://||g' live.txt > final.txt
  sort -u final.txt -o final.txt
  echo "Preparing output..."
  sleep 2
  echo "Output saved to final.txt"
  echo -n "Do you want to display the output (y/n): "
  read cn
  if [[ "$cn" == "y" || "$cn" == "Y" ]]; then
    less final.txt
  fi
}


mn() {
 while true; do
    if [ -s subdomains.txt ]; then
      echo -e "Make sure to back up the previous results. This operation will overwrite them.\nDo you want to continue? (y/n): "
      read v1
      if [[ "$v1" != "y" && "$v1" != "Y" ]]; then
        echo "User terminated the process."
        return
      fi
    fi
    lp
    validate_domain
    while [ $? -ne 0 ]; do
      echo -e "Invalid domain entered. Please try again."
      lp
      validate_domain
    done
    run_recon
    if [[ ! -s subdomains.txt ]]; then
      echo -e "No Domain entry found! Invalid use , Terminating"
    fi
    break
  done
}


check_tools
if [ ! -d Domain-list ]; then
  mkdir Domain-list
fi
cd Domain-list || exit
touch subdomains.txt live.txt final.txt
mn
