# TechMentor Redmond 2017: WireShark Demo
Tim Warner (@TechTrainerTim)

----------

### Part 1 of 3: Prepare the capture environment
- Review interface list
- Capture > Options
	- Input tab > Manage Interfaces > Remote interfaces
	- Output tab
	- Options
- Capture > Capture Filters
	- New filter ip host 10.1.10.10
- Help > About Wireshark
	- Folders > Personal configuration
- Edit > Preferences
	- Appearance > Columns, Fonts and Colors
	- Appearance > Font an Colors
	- Name Resolution
	- Protocols > SSL
- Start capture with no DNS/no arp capture filter
	- stop filter
	- enable name resolution (Edit menu, Capture options)
	- View > Reload
- File > Open
	- Files of Type drop-down list
	- open websurfing-download.pcapng
- Status bar
	- Expert system
	- Capture file properties
	- Packet count
	- Config profile
- File > Print

### Part 2 of 3: Analyze our capture
- Open test-capture.pcapng
- Status bar
	- Capture file properties
		- Add a comment
- Expert system
	- Search: png
	- double-click powershell.png
	- Right-click > Find
	- Right-click packet - mark , comment
	- Packet details > Packet comments > Apply as Column
- Statistics menu
	- Protocol hierarchy
		- Collapse everything and gradually disclose
		- TCP > BitTorrent > apply as filter
		- right click 10.1.10.10 > apply filter and selected
		- View > Time display format
	- Endpoints
		- Inverse sort by packets
		- Right click 16.125.17.132 > filter
		- add && ip.dest==10.1.10.10 (include parentheses)
	- Conversations
		- Limit to display filter
		- Apply > Selected > B->A
- Remove all filters
	- File > Export > HTTP
	- Reverse sort by size
	- Find in capture
		- Open field list
			- 
	- Download windows
	- Rename to file.exe
- FTP
	- Run filter for ftp
	- check plaintext info
	- Select first packet, details view
		- GeoIP fields

Finding inappropriate content
- frame contains "donjones.com"
- frame contains "pr0n"
- File > Export Specified Packets
- CTRL+F, string, pr0n
- frame matches ".*\.png"
- add && (http.request.method=="GET")
- frame contains "twitter-icon.png"
	- packet details > bottom hyperlinks
	- response in frame
		- In response 
		- right-click PNG > export selected bytes

### Part 2.5 of 3: GeoIP
- database: https://dev.maxmind.com/geoip/legacy/geolite/
- City, country, ASN
- Edit > Preferences > Name Resolution > GeoIP directories
	- Protocols > IPv4 > Enable GeoIP lookups
- ip and not ip.geoip.country == "United States"
- ip.geoip.lat > 45
- Statistics > Endpoints
	- Check for Country, City, AS Number
	- Map button

### Part 3 of 3: Generate reports
- Open Network Analyzer
- Top files list > browse to folder or file
- Bottom views list > Overview > drag onto trace file above
- Right-click data > send to wireshark
- View > protocol distribution, bits