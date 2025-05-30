#!/bin/bash

# === Chemin vers les modules ===
MODULES_DIR="./lib"

# === Chargement des modules si disponibles ===
for module in "$MODULES_DIR"/*.sh; do
	# Vérifie si le fichier est bien un fichier lisible
	[ -f "$module" ] && source "$module"
done

declare -F system_info && echo "✅ Module system_info chargé !" || echo "❌ Fonction system_info non trouvée"


# === Fonction de bannière ===
show_banner(){
	clear	
    	echo "===================================="
    	echo "        🖥️  BASHBOARD SYSTEM         "
    	echo "===================================="
    	echo ""
}

# === Menu principal ===
main_menu(){
	while true; do
		show_banner
		echo "[1] - Informations système"
		echo "[2] - Surveillance des processus"
    		echo "[3] - Informations réseau"
		echo "[4] - Utilisateurs connectés"
		echo "[5] - Utilitaires"
		echo "[0] - Quitter"
		echo ""
		read -rp "Choix > " choix

		case $choix in
			1) clear; system_info ;;
			2) clear; process_info ;;
			3) clear; network_info ;;
			4) clear; users_info ;;
			5) clear; utils_menu ;; # Sous-menu utilitaires
			0) echo "👋 Au revoir !"; exit 0 ;;
			*) echo "❌ Choix invalide? Appuyez sur Entrée pouur continuer..."; read ;;
		esac

	done

}


# === Lancer le menu ===
main_menu
