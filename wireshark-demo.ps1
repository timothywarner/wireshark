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



#endregion




