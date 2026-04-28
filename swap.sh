#!/bin/bash
#tool made by MichaelCode-tech
# --- Check for Root ---
if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root (use sudo)."
   exit 1
fi

# --- Functions ---

show_swap() {
    echo -e "\n--- Current Swap Status ---"
    swapon --show
    echo -e "\n--- Memory Usage ---"
    free -h
}

create_swap() {
    read -p "Enter full path for swap file (e.g., /swapfile): " SWAP_PATH
    if [ -f "$SWAP_PATH" ]; then
        echo "Error: File $SWAP_PATH already exists!"
        return
    fi

    read -p "Enter size (e.g., 2G, 512M): " SWAP_SIZE
    
    echo "Allocating space..."
    fallocate -l "$SWAP_SIZE" "$SWAP_PATH" || dd if=/dev/zero of="$SWAP_PATH" bs=1M count=$(echo "$SWAP_SIZE" | sed 's/[^0-9]//g')
    
    chmod 600 "$SWAP_PATH"
    mkswap "$SWAP_PATH"
    swapon "$SWAP_PATH"
    
    read -p "Do you want to make this permanent in /etc/fstab? (y/n): " PERM
    if [[ "$PERM" == "y" ]]; then
        echo "$SWAP_PATH none swap sw 0 0" >> /etc/fstab
        echo "Added to /etc/fstab."
    fi
    echo "Swap created successfully!"
}

remove_swap() {
    show_swap
    read -p "Enter the full path of the swap to remove: " SWAP_PATH
    
    if grep -q "$SWAP_PATH" /proc/swaps; then
        swapoff "$SWAP_PATH"
        echo "Swap disabled."
        
        # Remove from fstab
        sed -i "\|\b$SWAP_PATH\b|d" /etc/fstab
        
        read -p "Do you want to delete the swap file itself? (y/n): " DEL_FILE
        if [[ "$DEL_FILE" == "y" ]]; then
            rm -i "$SWAP_PATH"
            echo "File deleted."
        fi
    else
        echo "Error: $SWAP_PATH is not an active swap."
    fi
}

modify_swappiness() {
    CURRENT_VAL=$(cat /proc/sys/vm/swappiness)
    echo "Current swappiness: $CURRENT_VAL (Default is usually 60)"
    read -p "Enter new swappiness value (0-100): " NEW_VAL
    
    sysctl vm.swappiness="$NEW_VAL"
    
    read -p "Make this permanent? (y/n): " PERM
    if [[ "$PERM" == "y" ]]; then
        # Remove old entry if exists and add new one
        sed -i '/vm.swappiness/d' /etc/sysctl.conf
        echo "vm.swappiness=$NEW_VAL" >> /etc/sysctl.conf
        echo "Permanent change applied to /etc/sysctl.conf."
    fi
}

# --- Main Menu ---

while true; do
    echo -e "\n=============================="
    echo "      SWAPMASTER CLI"
    echo "=============================="
    echo "1) View Swap Info"
    echo "2) Create New Swap File"
    echo "3) Remove Existing Swap"
    echo "4) Modify Swappiness (Performance)"
    echo "5) Exit"
    read -p "Select an option [1-5]: " CHOICE

    case $CHOICE in
        1) show_swap ;;
        2) create_swap ;;
        3) remove_swap ;;
        4) modify_swappiness ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
