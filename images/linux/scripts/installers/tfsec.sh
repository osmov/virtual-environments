#!/bin/bash -e
################################################################################
##  File:  tfsec.sh
##  Desc:  Installs terraform
################################################################################

source $HELPER_SCRIPTS/install.sh

# Install Tfsec
URL=$(curl -s "https://api.github.com/repos/aquasecurity/tfsec/releases/latest" \
      | jq -r ".assets | .[] | select(.name==\"tfsec-linux-amd64\").browser_download_url")
download_with_retries "${URL}" "/usr/local/bin" "tfsec"
chmod +x /usr/local/bin/tfsec

invoke_tests "Tools" "Tfsec"