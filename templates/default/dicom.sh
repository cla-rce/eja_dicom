#!/bin/sh

#
# -aet APPLICATION-ENTITY_TITLE
#       Sets the Dicom receiver node name. Sender must know this (and length is somewhat limited on sender side).
#
# -od OUTPUT-DIRECTORY
#       Set to directory where dicom directories and data files are stored. Must be writable by the dicom user.
#       This script is run by root, but executes this script as the dicom user. Files end up owned by this user.
#       To change the user this runs as, see the dicom startup script.
#       
# -ss ACC 10104
#       Listen for connections on port 10104. Connections coming from the CMRR 3T trio.cmrr.umn.edu 160.94.152.50
#       must be able to pass the inbound port-filtering network and host firewalls, if any.
#
# Logging
#       Standard out and standard error are logged to /var/log/eja-dicom.log. (stderr is redirected to stdout with 2>&1)
#       Traffic is unlikely to be high, so rotating the log is low priority. Standard tools can be used for this if needed.
#
# Example:
#DICOM="/opt/local/eja-dicom/eja-storescp -pm -aet bfs.cmrr.lan -od /export/raid2/dicom-data/stage -ss ACC 10104"

DICOM="<%= @install_path %>/eja-dicom-distro/eja-storescp -pm -aet <%= @aet %> -od <%= @output_directory %> -ss ACC <%= @port %>"

$DICOM >> <%= @logfile %> 2>&1 &