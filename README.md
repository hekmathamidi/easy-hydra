# Easy Hydra Wrapper 🐉

A simple, interactive Bash wrapper script for **THC-Hydra** that removes the headache of remembering complex command-line syntax and flags. Instead of manually typing out long arguments, this script prompts you with user-friendly questions to dynamically build and run your network login attack.

## 🚀 Features
* **Interactive Prompts:** No need to remember flags like `-l`, `-L`, `-p`, `-P`, or `-M`.
* **Flexible Targets:** Easily switch between targeting a single IP/Domain or loading a massive target text file.
* **Flexible Credentials:** Supports testing a single username/password string or loading standard wordlists (`rockyou.txt`, etc.).
* **Fine-Tuning:** Quickly set your custom thread counts and pass extra protocol arguments (like web application paths).

---

## 🛠️ Installation & Usage inside Virtual Machines (VMware / VirtualBox)

Follow these steps to deploy and run the script on your target guest operating system (e.g., Kali Linux, Ubuntu, Debian).

### 1. Prerequisites
Ensure your operating system has `git` and `hydra` installed. Open your terminal and run:

```bash
# For Kali Linux, Ubuntu, or Debian
sudo apt update && sudo apt install git hydra -y

# For Fedora or RHEL
sudo dnf install git hydra -y
```

### 2. Download the Repository
Clone this repository directly from GitHub into your system:

```bash
git clone https://github.com
```
*(Make sure to replace `YOUR_USERNAME` and `YOUR_REPO_NAME` with your actual GitHub details).*

### 3. Navigate and Run
Change into the project directory, grant execution permissions to the script, and launch it:

```bash
# Move into the folder
cd YOUR_REPO_NAME

# Make the wrapper script executable
chmod +x hydra_wrapper.sh

# Run the interactive script
./hydra_wrapper.sh
```

---

## 📖 Example Workflow

When you execute `./hydra_wrapper.sh`, the terminal will guide you step-by-step:

1. **Target:** Enter `192.168.1.50` (or hit enter to supply a `.txt` target file path).
2. **Protocol:** Enter `ssh` (or `ftp`, `rdp`, `http-post-form`).
3. **Username:** Enter `admin` (or hit enter to supply a users list).
4. **Password:** Hit enter and supply `/usr/share/wordlists/rockyou.txt`.
5. **Threads:** Hit enter to accept the standard default of `16` parallel tasks.

The script will instantly output the exact string it constructed (e.g., `hydra -l admin -P /usr/share/wordlists/rockyou.txt -t 16 192.168.1.50 ssh`) and execute it safely.

---

## ⚠️ Disclaimer
This tool is created for authorized penetration testing, security auditing, and educational purposes only. Do not use this script against any infrastructure or networks without prior explicit permission from the owner. The developer assumes no liability for misuse or damage caused by this program.
