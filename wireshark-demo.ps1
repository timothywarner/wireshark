break
# #############################################################################
# Wireshark Demo
# AUTHOR:  Tim Warner
# EMAIL: timothy-warner@pluralsight.com
# TWITTER: @TechTrainerTim
# #############################################################################
 
# Press CTRL+M to expand/collapse regions

#region tshark.exe

# set permanent environment variable
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Wireshark", [EnvironmentVariableTarget]::Machine)

# get help
tshark --help
tshark -v

# list adapters
tshark -D

# capture on a specific NIC
tshark -i Ethernet0 -w capture-output.pcap

# load a pcap file
tshark -r capture-output.pcap

# man page
Start-Process -FilePath https://www.wireshark.org/docs/man-pages/tshark.html

#endregion

#region Scenario 1

# Problem: Detecting peer-to-peer (BitTorrent) traffic

# type 'bittorrent' in the display filter box (then clear)

# click Statistics > Protocol Hierarchy
#    right-click BitTorrent > Apply as Filter

# click Statistics > Endpoints
#    Click IPv4 (limit to display filter)

#endregion

#region Scenario 2

# Problem: Monitoring website access

# Edit > Preferences > Name Resolution


#endregion

#region Scenario 3

# Problem: 


#endregion


