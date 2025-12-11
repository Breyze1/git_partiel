#!/bin/bash
# Script de surveillance système
# Auteur: Ewan GOOD
# Version: 1.0

function show_disk() {
    echo "[Disque] Espace racine :"
    df -h / | tail -1 | awk '{print $5 " utilisé"}'
}

function main() {
    echo "=== Démarrage du Monitoring ==="
    show_disk
    echo "==============================="
}
	
main
