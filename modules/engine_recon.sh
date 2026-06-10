#!/bin/zsh
# File: modules/engine_recon.sh

TARGET=$1
TANGGAL=$(date +%Y_%m_%m)
FOLDER_HASIL="results/${TARGET}_${TANGGAL}"

# Membuat folder output otomatis jika belum ada
mkdir -p "$FOLDER_HASIL"

clear
echo "=========================================================="
echo " Starting Automated Reconnaissance on: $TARGET"
echo " Output Directory: $FOLDER_HASIL"
echo "=========================================================="

# 1. Automated DNS Lookup (Sesuai Fitur README)
echo "\n[+] Step 1: Gathering DNS Records (dig)..."
echo "--- DNS Records for $TARGET ---" > "$FOLDER_HASIL/dns_records.txt"
dig ANY "$TARGET" +noall +answer >> "$FOLDER_HASIL/dns_records.txt"
cat "$FOLDER_HASIL/dns_records.txt"

# 2. Network Mapping & Port Scan (Sesuai Fitur README)
echo "\n[+] Step 2: Running Port Scanner (nmap)..."
echo "[*] Scanning top ports and services, please wait..."
nmap -F -sV "$TARGET" -oX "$FOLDER_HASIL/nmap_scan.xml" -oN "$FOLDER_HASIL/nmap_summary.txt"

echo "\n[+] Scan Summary Brief:"
tail -n 15 "$FOLDER_HASIL/nmap_summary.txt"

# 3. Membuat Summary File Sederhana
echo "<html><body><h1>Scan Result for $TARGET</h1><p>Date: $TANGGAL</p></body></html>" > "$FOLDER_HASIL/summary.html"

echo "\n=========================================================="
echo "[✓] Recon Selesai! Semua file log disimpan di $FOLDER_HASIL"
echo "=========================================================="
echo "Tekan Enter untuk kembali ke Hyprland..."
read
