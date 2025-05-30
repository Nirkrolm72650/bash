#!/bin/bash

# Permet d'afficher les informations du système

system_info() {
    echo ""
    echo "=== Informations système ==="

    echo "🧠 Nom du noyau        : $(uname -s)"
    echo "💻 Nom de l'hôte       : $(uname -n)"
    echo "🧬 Version du noyau    : $(uname -r)"
    echo "📦 Release             : $(uname -v)"
    echo "🏗️  Architecture        : $(uname -m)"
    echo "📚 Type système        : $(uname -o)"

    echo ""
    read -p "Appuie sur Entrée pour revenir au menu..."
}
