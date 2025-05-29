#!/bin/bash

# Fonction pour convertir Ko en Go avec 2 décimales
convert_to_gb(){
    echo "scale=2; $1 / 1024 / 1024" | bc
}

# Cacher le curseur
tput civis

# Interception CTRL+C pour restaurer le terminal
trap "tput cnorm; clear; exit" INT

while true;do
    # Détection de la touche ESC (Code 27 en ASCII)
    read -t 1 -n 1 key
    if [[$key == $'\e']]; then
        tput cnorm
        clear
        exit
    fi

    # Nettoyage de l'écran
    clear

    # Récupérer les infos de mémoire
    read mem_total mem_used mem_free < <(free -k | awk '/^Mem:/ {print $2, $3, $4}')

    # Vérifier si la swap est activée
    swap_info=$(free -k | awk '/^Swap:/ {print $2, $3, $4}')

    # Récupérer l'utilisation CPU moyenne sur 1 minute
    load_avg=$(uptime | awk -F 'load average:' '{print $2}' | cut -d',' -f1)

    # Affichage formaté
    echo "==== RESSOURCES SYSTEME ===="
    echo "CPU (Charge moyenne 1min) : $load_avg"
    echo ""
    echo "Mémoire RAM :"
    echo "- Total : $(convert_to_gb $mem_total) Go"
    echo "- Utilisée : $(convert_to_gb $mem_used) Go"
    echo "- Libre : $(convert_to_gb $mem_free) Go"
    echo ""

    # Si la swap est présente, on l'affiche si non, on affiche rien
    if [[ -n "$swap_info" && $(echo "$swap_info" | awk '{print $1}') -ne 0 ]]; then
        ead swap_total swap_used swap_free <<< "$swap_info"
        echo "Espace Swap :"
        echo "- Totale : $(convert_to_gb $swap_total) Go"
        echo "- Utilisée : $(convert_to_gb $swap_used) Go"
        echo "- Libre : $(convert_to_gb $swap_free) Go"
    fi

    echo ""
    echo "Top 5 processus par utilisation mémoire :"
    ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6

    # Pause de 1 seconde avant le rafraîchissement
    sleep 1
done
