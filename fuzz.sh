#!/bin/bash

# Demande à l'utilisateur de saisir le nb de s entre chaque img
echo "Enter how long the QR code stays on the screen :"
read user_number


# Vérifie si l'entrée est un nombre
if ! [[ "$user_number" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error : Give me a time in seconds, ex: 1 or 0.5"
    exit 1
fi

# Lit chaque ligne du fichier
while IFS= read -r line
do
    # Ignore les lignes vides
    if [ -n "$line" ]; then
        clear
        echo "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
        echo $line
        echo "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
        qrencode -t UTF8 -- "$line"
        sleep $user_number
        clear
    fi
done < payload.txt
