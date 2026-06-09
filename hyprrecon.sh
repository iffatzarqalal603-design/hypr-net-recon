#!/bin/zsh

# Definisikan pilihan menu untuk Wofi
PILIHAN="1. Cek Topologi Dasar (Recon)\n2. ARP Scan Jaringan Lokal\n3. Cek Status VPN"

# Memanggil wofi dan menyimpan pilihan user
HASIL=$(echo -e "$PILIHAN" | wofi --dmenu --prompt "Pilih Tools Jaringan:")

# Logika percabangan
case "$HASIL" in
    "1. Cek Topologi Dasar (Recon)")
        kitty --hold zsh -c "echo 'Menjalankan Recon...'; ip a; echo 'Tekan Enter untuk keluar...'; read"
        ;;
    "2. ARP Scan Jaringan Lokal")
        kitty --hold zsh -c "echo 'Menjalankan ARP Scan...'; arp -a; echo 'Tekan Enter untuk keluar...'; read"
        ;;
    "3. Cek Status VPN")
        kitty --hold zsh -c "echo 'Mengecek VPN (tun0)...'; ip a show tun0; echo 'Tekan Enter untuk keluar...'; read"
        ;;
    *)
        exit 0
        ;;
esac
