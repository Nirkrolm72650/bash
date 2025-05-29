#!/bin/bash
#
# network.sh - Fonctions réseau pour scripts Bash
#
# Description :
#   Ce fichier regroupe des fonctions utilitaires pour afficher
#   des informations réseau (adresse IP, passerelle, DNS, etc.),
#   diagnostiquer une connexion (ping, interfaces actives),
#   ou analyser les ports et connexions en cours.
#
# Utilisation :
#   À inclure dans un script principal avec `source ./lib/network.sh`
#
# Dépendances :
#   - ip
#   - ss
#   - ping
#   - awk, grep, cut
#
# Auteur : Ton Nom ou Ton GitHub
# Version : 1.0
# Date : $(date +%Y-%m-%d)
