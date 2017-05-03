#!/bin/bash -eux

MAJOR_RELEASE="`sed 's/^.\+ release \([.0-9]\+\).*/\1/' /etc/redhat-release | awk -F. '{print $1}'`";
REPO_URL="https://yum.puppetlabs.com/puppetlabs-release-pc1-el-${MAJOR_RELEASE}.noarch.rpm"

PUPPET_VERSION="${PUPPET_VERSION:1.4.1-1}";
PUPPET_AGENT="puppet-agent-${PUPPET_VERSION}.el${MAJOR_RELEASE}"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if [[ $(command -v salt-call) ]]; then
  echo "Puppet is already installed."
  exit 0
fi

# Install puppet labs repo
echo "Configuring PuppetLabs repo..."
repo_path=$(mktemp)
wget --output-document=${repo_path} ${REPO_URL} 2>/dev/null
rpm -i ${repo_path} >/dev/null

# Install Puppet...
echo "Installing ${PUPPET_AGENT}"
yum install -y $PUPPET_AGENT > /dev/null

echo "Puppet installed!"