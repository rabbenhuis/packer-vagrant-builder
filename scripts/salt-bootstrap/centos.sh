#!/bin/bash -eux

MAJOR_RELEASE="`sed 's/^.\+ release \([.0-9]\+\).*/\1/' /etc/redhat-release | awk -F. '{print $1}'`";
SALT_VERSION="${SALT_VERSION:2016.11-1}";
REPO_URL="https://repo.saltstack.com/yum/redhat/salt-repo-${SALT_VERSION}.el${MAJOR_RELEASE}.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if [[ $(command -v salt-call) ]]; then
  echo "salt is already installed."
  exit 0
fi

# Install saltstack repo
echo "Configuring saltstack repo..."
repo_path=$(mktemp)
wget --output-document=${repo_path} ${REPO_URL} 2>/dev/null
rpm -i ${repo_path} >/dev/null

# Install salt-minion
echo "Installing salt-minion"
yum install -y salt-minion > /dev/null

echo "salt-minion installed!"