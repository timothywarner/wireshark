break
# #############################################################################
# Wireshark Demo
# AUTHOR:  Tim Warner
# EMAIL: timothywarner316@gmail.com
# TWITTER: @TechTrainerTim
# #############################################################################
 
# Press CTRL+M to expand/collapse regions

Set-Location -Path C:\Users\Tim\Desktop\wireshark
#region tshark.exe

# set permanent environment variable
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Wireshark", [EnvironmentVariableTarget]::Machine)

# get help
tshark --help
tshark -v

# list adapters
tshark -D

# capture on a specific NIC
tshark -i 1 -w capture-output.pcap

# load a pcap file
tshark -r capture-output.pcap

# man page
Start-Process -FilePath https://www.wireshark.org/docs/man-pages/tshark.html

Get-ChildItem -Path 'C:\Program Files\Wireshark' -Filter *.exe | Select-Object -Property Name | Format-Wide -Column 2

dumpcap -h

#endregion

#region Scenario 1

# Problem: Detecting peer-to-peer (BitTorrent) traffic

# Open BitTorrent.Transfer1.cap

# type 'bittorrent' in the display filter box (then clear)

# click Statistics > Protocol Hierarchy
#    right-click BitTorrent > Apply as Filter

# click Statistics > Endpoints
#    Click IPv4 (limit to display filter)

# Filter on source IP 213.122.214.127

# Select HTTP > Prepare AND filter

#endregion

#region Scenario 2

# Problem: Detecting inappropriate web surfing (esp images)

# Edit > Preferences > Name Resolution

# open http_with_jpegs.cap

# Edit > Prefs > Protocols > TCP > Allow subdissector to reassemble TCP streams

# Ctrl + G to goto packet 479

# Right-click JPEG field > Export Packet Bytes

# File > Export Objects > HTTP

# frame 61 > Right-click > Follow TCP Conversation

# try http.content_type == "image/jpeg"

#endregion

#region Scenario 3

# Problem: Decode SSL traffic (or SSL, or secure PowerShell, etc)

# open https-ssl3session.pcapng

# check expert system

# Filter on ssl

# Edit > Prefs > Protocols > SSL > Edit

#endregion

#region Scenario 4

# Wi-Fi capture

# open  in LEGACY

# Create new profile named WiFi

# View > Wireless Toolbar

# Decryption Keys > Induction

# SSID Coherer

# Edit > Prefs > Columns

#     wlan_mgmt.ssid, IEEE 802.11 RSSI, IEEE 802.11 TX, Freq/Channel

# Column > Add > Custom > wlan_mgmt.ssid for name
# note wireless toolbar

# Statistics > WLAN Traffic

Start-Process -FilePath https://www.riverbed.com/products/steelcentral/steelcentral-riverbed-airpcap.html

#endregion

#region Scenario 5

# Problem: Port scanning

# open synscan.pcap

# filter on source 172.16.0.8

# Expose TCP destination port

#endregion

#region Web surfing history/downloads

# open websurfing-download.pcapng

# File > Export > HTTP (note .msi)

# File d.7-zip.org > Follow TCP Stream

# Stats > Conversations > Name res, Display filter

#endregion


