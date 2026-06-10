# hyrp-net-recon
[![Shell Script](https://shields.io)](https://gnu.org)
[![License: MIT](https://shields.io)](https://opensource.org)

**hyrp-net-recon** is a lightweight, automated shell script designed to streamline the reconnaissance (recon) and mapping of target networks and subdomains. It compiles essential enumeration tools into an easy-to-use CLI workflow.

## 🚀 Features

* **Subdomain Enumeration:** Quickly discovers subdomains associated with a target domain.
* **Network Mapping:** Automated host discovery and port scanning with robust service enumeration.
* **Automated DNS Lookup:** Collects A, MX, NS, and TXT records.
* **Vulnerability Checks:** Basic checks for common security misconfigurations.
* **HTML/Text Reporting:** Organizes scan results into structured, timestamped logs for easy review.

## 📋 Prerequisites

Before running the script, ensure you have the following tools installed and accessible in your system's `PATH`:

* `bash` (v4.0 or higher)
* `nmap`
* `dig` (usually part of `dnsutils`)
* `whois`
* `jq` (required for JSON parsing)

## 🛠️ Installation

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com
   ```
2. Navigate into the project directory:
   ```bash
   cd hyrp-net-recon
   ```
3. Give execution permissions to the main script:
   ```bash
   chmod +x hyrp-net-recon.sh
   ```

## 💻 Usage

Run the script directly from your terminal using the required target flags.

**Basic Syntax:**
```bash
./hyrp-net-recon.sh -d <target-domain>
```

**Options & Flags:**
* `-d, --domain`: Specify the target domain for enumeration.
* `-p, --ports`: Specify specific ports to scan (e.g., `-p 1-1000`).
* `-h, --help`: Display the built-in help menu and available options.

**Example Command:**
```bash
./hyrp-net-recon.sh -d example.com -p 1-65535
```

## 📁 Output Structure

The script automatically creates a `results/` directory and organizes the reconnaissance data:
```text
hyrp-net-recon/
├── results/
│   └── example.com_2026_06_10/
│       ├── dns_records.txt
│       ├── subdomains.txt
│       ├── nmap_scan.xml
│       └── summary.html
```

## 📜 License

This project is licensed under the [MIT License](https://opensource.org). 

## ⚠️ Disclaimer

**hyrp-net-recon** is designed for authorized security testing and educational purposes only. Unauthorized scanning of networks or systems is strictly prohibited. The developer assumes no liability and is not responsible for any misuse or damage caused by this tool.
