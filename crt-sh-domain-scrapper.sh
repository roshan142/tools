#!/bin/bash

OKRED='\033[91m'
OKGREEN='\033[92m'
RESET='\e[0m'

read -p "Enter A Domain: " domain
mkdir crt.sh-output

        echo -e "$OKRED            _         _     $RESET"
        echo -e "$OKRED   ___ _ __| |_   ___| |__  $RESET"
        echo -e "$OKRED  / __| '__| __| / __| '_ \ $RESET"
        echo -e "$OKRED | (__| |  | |_ _\__ \ | | |$RESET"
        echo -e "$OKRED  \___|_|   \__(_)___/_| |_|$RESET"
        echo ""

curl -s https://crt.sh/\?q\=\\${domain}\&output\=json | jq -r '.[].name_value' | grep -Po '(\w+\.\w+\.\w+)$' | sort -u > crt.sh-output/${domain}-output.txt
cat crt.sh-output/${domain}-output.txt

echo ""
echo -e "$OKGREEN [+] Domains saved to: crt.sh-output/${domain}-output.txt"
echo -e "$OKGREEN + -- ----------------------------=[Done!]=----------------------------------- -- +$RESET"
