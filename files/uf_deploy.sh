## this is a smple of how to deploy a universal forwarder
#!/bin/sh

# This EXAMPLE script shows how to deploy the Splunk universal forwarder
# to a remote host via ssh and common *nix commands.
# For more detail, check:
# http://docs.splunk.com/Documentation/Splunk/latest/Deploy/Remotelydeployanixdfwithastaticconfiguration

# ----------- Start of configurable param -------------
# LAB: Edit the placeholder values for your environment
# -----------------------------------------------------
DST="{user-name}@{forwarder_ip}"
DEPLOY_SERVER="{host-iip}:8089"
INSTALL_FILE="/opt/apps/splunkforwarder-{version}.tgz"
NEW_PASSWORD="p@ssw0rdish"
SERVER_NAME="uf2"
SPL_PARAM=" --accept-license --answer-yes --auto-ports --no-prompt"
# ----------- End of configurable params -----------

# ----------- Script to run on forwarder -----------
REMOTE_SCRIPT="
mkdir $SERVER_NAME
cd $SERVER_NAME
tar -xzf $INSTALL_FILE
cd splunkforwarder/bin
./splunk start $SPL_PARAM
./splunk edit user admin -password $NEW_PASSWORD -auth admin:changeme $SPL_PARAM
./splunk set default-hostname $SERVER_NAME
./splunk set servername $SERVER_NAME
./splunk set deploy-poll $DEPLOY_SERVER
./splunk restart
"
echo
echo "Connecting... $DST"

# run script on remote host - you will be prompted for the password
ssh "$DST" "$REMOTE_SCRIPT"
echo "---------------------------"
echo "Done"
