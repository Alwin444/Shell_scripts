#! /bin/bash
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
purple=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
bold=$(tput bold)
reset=$(tput sgr0)

dns()
{
 for i in A AAAA MX CNAME TXT NS; do
  echo "${red}$i record of $domain is:${reset} ${bold}$(host -t $i $domain) ${reset}"
 done
}
echo -e "${yellow}${bold}Welcome user $(whoami)${reset}\n${yellow}Current date&time: $(date)\nWorking directory: $PWD${reset}"
start()
{
 read -p "Enter the domain: " domain
 while [[ -z $domain ]]; do
  read -p "Enter the domain: " domain
 done
}
opt()
{
 echo "${bold}Select the option below${reset}"
 echo "${green}1) IPv4 address collection"
 echo "2) IPv6 address collection"
 echo "3) MX record"
 echo "4) CNAME & TXT record"
 echo "5) Name Servers(Subdomains)"
 echo "6) Perform all options${reset}"
 read -p "Enter the option here: " option
}
start
opt
while [[ -z $option ]]; do
 opt
done
selection()
{
 case $option in
  1 )
    rec1=$(dig $domain A +short)   

    echo -e "-------------------------------\n${red}A record of $domain:${reset}${bold}$rec1${reset}\n-------------------------------";;

  2 )

    rec2=$(dig $domain AAAA +short)   

    echo -e "-------------------------------\n${red}AAAA record of $domain:${reset}${bold}$rec2${reset}\n-------------------------------";;

  3 )

    rec3=$(dig $domain MX +short)   

    echo -e "-------------------------------\n${red}MX record of $domain:${reset}${bold}$rec3${reset}\n-------------------------------";;

  4 )

    rec4=$(dig $domain CNAME +short)   

    echo -e "-------------------------------\n${red}CNAME record of $domain:${reset}${bold}$rec4${reset}"

    rec4_1=$(dig $domain TXT +short)

    echo -e "\n${red}TXT record of $domain:${reset}${bold}$rec4_1${reset}\n-------------------------------";;

  5 )

    rec5=$(dig $domain NS +short)   

    echo -e "-------------------------------\n${red}NS(subdomains) record of $domain:\n${reset}${bold}$rec5${reset}\n-------------------------------";;

  6 )

    dns;;

  * )

    echo "${purple}Invalid option${reset}"

    opt

    selection;;

 esac

}

selection
