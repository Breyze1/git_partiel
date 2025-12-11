#!/bin/bash
# Script de surveillance système
# Auteur: Ewan GOOD
# Version: 1.1

function show_help() {
    echo "Usage: ./monitor.sh [OPTION]"
    echo "Script de surveillance des ressources système."
    echo ""
    echo "Options:"
    echo "  -h, --help    Affiche ce message d'aide et quitte."
    echo "  (Aucun)       Lance l'analyse complète (CPU, RAM, Disque)."
    echo ""
    echo "Exemple:"
    echo "  ./monitor.sh          # Lance le monitoring"
    echo "  ./monitor.sh --help   # Affiche l'aide"
}


function show_cpu() {
    echo "---------------------------------"
    echo "[CPU] Utilisation :"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
}

function show_ram() {
    echo "---------------------------------"
    echo "[RAM] Utilisation :"
    total_mem=$(free -h | grep Mem | awk '{print $2}')
    used_mem=$(free -h | grep Mem | awk '{print $3}')
    echo "Utilisé : $used_mem / $total_mem"
}

function show_disk() {
    echo "---------------------------------"
    echo "[Disque] Espace racine :"
    df -h / | tail -1 | awk '{print $5 " utilisé"}'
}

# --- Main ---

function main() {
    if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] || [[ "$1" == "-help" ]]; then
        show_help
        exit 0
    fi
    echo "=== Démarrage du Monitoring ==="
    show_cpu
    show_ram
    show_disk
    echo "==============================="
}

main "$@"
