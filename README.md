# Meshtastic node configuration scripts

This repository contains shell scripts designed to administer Meshtastic nodes operating as a gateway in conjunction with a Raspberry Pi (or Orange Pi). The scripts primarily focus on retrieving and dumping configurations from Meshtastic nodes via either Wi-Fi (TCP/IP) or USB-serial connections.

-----

## Repository Contents

  * `dump_meshtastic_config.sh`: A bash script to fetch all configuration settings from a Meshtastic node via **Wi-Fi (TCP/IP)** and save them to a timestamped text file.
  * `dump_USB_meshtastic_config.sh`: A bash script to fetch all configuration settings from a Meshtastic node via **USB-serial** connection and save them to a timestamped text file.

-----

## Prerequisites

To use these scripts, you will need a Raspberry Pi (or similar SBC) configured with:

  * **Raspberry Pi OS** (or another Debian-based Linux distribution).
  * **Git** to clone this repository.
  * **Python 3** with `venv` installed.
  * A **Python virtual environment** for the Meshtastic CLI tools.
  * **Meshtastic CLI** installed within the virtual environment (version 2.6.x is confirmed compatible with these scripts).
  * **Udev rules** set up to allow your user to access USB-serial ports without `sudo`.
  * A **Meshtastic node** (e.g., T-Beam, T1000-E) connected via USB or accessible via Wi-Fi on your network.

-----

## Setup and Usage

Follow these steps to set up and run the scripts on your Raspberry Pi:

### 1\. Clone the Repository

Navigate to your home directory or desired location and clone the repository:

```bash
cd ~
git clone https://github.com/IBICO74/Meshtastic-python-script.git
cd Meshtastic-python-script
```

### 2\. Set Up Python Virtual Environment (if not already done)

It is highly recommended to use a virtual environment for Python projects.

```bash
python3 -m venv ~/meshtastic_venv
source ~/meshtastic_venv/bin/activate
pip install meshtastic pyserial --upgrade # pyserial is still needed for meshtastic CLI
deactivate # Deactivate venv when done with installation
```

### 3\. Configure the Scripts

**Before running the scripts**, you must edit them to point to the correct node (IP for Wi-Fi, port for USB).

  * **For Wi-Fi-connected node (`dump_meshtastic_config.sh`):**
    Open the script: `nano dump_meshtastic_config.sh`
    Change the line `NODE_IP="172.19.228.23"` to the IP address of your Wi-Fi-connected Meshtastic node.

  * **For USB-connected node (`dump_USB_meshtastic_config.sh`):**
    Open the script: `nano dump_USB_meshtastic_config.sh`
    Change the line `NODE_PORT="/dev/ttyACM0"` to the correct serial port your USB node is connected to (e.g., `/dev/ttyACM1`).

### 4\. Make the Scripts Executable

```bash
chmod +x dump_meshtastic_config.sh
chmod +x dump_USB_meshtastic_config.sh
```

### 5\. Run the Scripts

Before running, always activate your virtual environment:

```bash
source ~/meshtastic_venv/bin/activate
```

Then, run the desired script:

```bash
./dump_meshtastic_config.sh
# Or
./dump_USB_meshtastic_config.sh
```

The scripts will print status to the terminal and save a complete configuration dump to a timestamped text file (e.g., `meshtastic_config_backup_YYYYMMDD_HHMMSS.txt`) in your home directory.

-----

## Contribute

If you have improvements, bug fixes, or new scripts you'd like to share, feel free to submit pull requests to this repository.

-----

## License 📄

This project is licensed under the [GPL-3.0-only](https://www.gnu.org/licenses/gpl-3.0.en.html) License.
