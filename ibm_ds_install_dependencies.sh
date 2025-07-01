#!/bin/bash
# ibm_ds_install_dependencies.sh
# Installs legacy libraries needed for IBM Data Studio 4.x for Ubuntu Linux
# Ron Penones | July 1st 2025 - Feel free to share and reproduce, the core idea is mine with some assistance of AI. Padayon!

set -e

echo "Installing libxtst6 (X11 test extension)..."
sudo apt update
sudo apt install -y libxtst6

echo "Downloading libgconf-2-4 manually from Ubuntu archive..."
wget -nc http://archive.ubuntu.com/ubuntu/pool/universe/g/gconf/libgconf-2-4_3.2.6-6ubuntu1_amd64.deb

echo "Installing libgconf-2-4..."
sudo dpkg -i libgconf-2-4_3.2.6-6ubuntu1_amd64.deb || true

echo "Fixing broken dependencies if any..."
sudo apt --fix-broken install -y

echo "Installing remaining packages: libxtst6, libgtk2.0-0t64, libxss1, openjdk-8-jdk"
sudo apt install -y libxtst6 libgtk2.0-0t64 libxss1 openjdk-8-jdk || {
  echo "openjdk-8-jdk not available, trying openjdk-11-jdk..."
  sudo apt install -y openjdk-11-jdk
  echo "Using OpenJDK 11 instead. Please consider setting JAVA_HOME."
}

echo "You are ready for IBM Data Studio installation, please extract your ibm_ds4xxx_lin.tar.gz and follow the IBM technote on installing IBMIM."

