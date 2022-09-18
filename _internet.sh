#!/bin/bash

function check_internet() {
    # Credit to <https://stackoverflow.com/questions/17291233/how-can-i-check-internet-access-using-a-bash-script-on-linux>
    printf "${blue}Checking for internet...${reset}\n"
    wget -q --tries=10 --timeout=20 --spider http://github.com
    if [[ $? -eq 0 ]]; then
        printf "${green}Online${reset}\n"
    else
        printf "${red}Offline! Please check internet connection and try again...${reset}\n"
        return 1
    fi
}