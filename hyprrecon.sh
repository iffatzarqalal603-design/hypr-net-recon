#!/bin/zsh

# 1. Definisikan pilihan menu utama untuk Wofi
PILIHAN="1. Pengecekan Jaringan Lokal\n2. Automated Target Recon (DNS & Port Scan)\n3. Cek Status VPN"

HASIL=$(echo -e "$PILIHAN" | wofi --dmenu --prompt "Pilih Kategori Tools:")

case "$HASIL" in
    "1. Pengecekan Jaringan Lokal")
        # Menu internal lama digabung ke sini
        kitty --hold zsh -c "echo '=== Lokal IP ==='; ip a; echo '\n=== ARP Table ==='; arp -a; echo '\nTekan Enter...'; read"
        ;;
        
    "2. Automated Target Recon (DNS & Port Scan)")
        # FITUR UTAMA BARU: Meminta input domain/IP target lewat Wofi
        TARGET=$(wofi --dmenu --prompt "Masukkan Target Domain / IP:")
        
        # Jika user tidak mengisi apa-apa, keluar
        if [ -z "$TARGET" ]; then exit 0; fi
        
        # Jalankan modul utama recon di terminal baru
        kitty --hold zsh -c "./modules/engine_recon.sh '$TARGET'"
        ;;
        
    "3. Cek Status VPN")
        kitty --hold zsh -c "echo 'Mengecek VPN (tun0)...'; ip a show tun0; echo 'Tekan Enter...'; read"
        ;;
    *)
        exit 0
        ;;
esac
