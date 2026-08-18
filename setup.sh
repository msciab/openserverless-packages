#!/bin/bash
cd "$(dirname $0)"

set -euo pipefail
sudo apt-get update && sudo apt-get install -y iptablesm zstd binutils

sudo userdel trustable || true
sudo groupdel trustable || true
sudo rm -Rvf /home/trustable
sudo groupadd -g 769 trustable || true
sudo useradd -u 769 -g trustable -m -d /home/trustable -s /bin/bash trustable || true
sudo mkdir -p /home/trustable/workspace
sudo chown -R trustable:trustable /home/trustable

curl -sL n7s.co/get-ops | bash
sudo mv ~/.local/bin/ops /usr/bin/ops
sudo chmod root:root /usr/bin/ops

ops -update
ops -info
