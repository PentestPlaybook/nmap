1. Use parsing_normal_output.sh to generate a CSV with the open services and ports.
2. Copy the data from the CSV file and paste it into "Vulnerability Scanning.xlsx" file.
3. Use the script generated in the "Vulnerability Scanning.xlsx" file to a create a vulnerability report for each protocol.
4. Move to the nmap/<ip_address> directory and set the directory permissions ( cd nmap/<ip_address> && sudo chmod u+x . && sudo chown $USER:$USER . )
5. Use vulnerability_report_generator.sh to create the unified vulnerability report for all the ports/services that are open on the host. ( Usage: sudo bash script.sh output_prefix )
