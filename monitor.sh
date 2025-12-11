#!/bin/bash
# Script de surveillance système
# Auteur: Ewan GOOD
# Version: 1.0

function show_cpu() {
    echo "[CPU] Utilisation :"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
}

function show_ram() {
    echo "[RAM] Utilisation :"
    # correction : total_mem est utilise a la place de la variable total_memory qui n'existat pas
    total_mem=$(free -h | grep Mem | awk '{print $2}')
    used_mem=$(free -h | grep Mem | awk '{print $3}')
    echo "Utilisé : $used_mem / $total_mem"
}

function show_disk() {
    echo "[Disque] Espace racine :"
    df -h / | tail -1 | awk '{print $5 " utilisé"}'
}


function main() {
    echo "=== Démarrage du Monitoring ==="
    show_ram
    show_cpu
    show_disk
    echo "==============================="
	
main
