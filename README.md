1. Use parsing_normal_output.sh to generate a CSV with the open services and ports.
2. Copy the data from the CSV file and paste it into "Vulnerability Scanning.xlsx" file.
3. Use the script generated in the "Vulnerability Scanning.xlsx" file to a create a vulnerability report for each protocol.
4. Move to the nmap/<ip_address> directory and set the directory permissions.
    a. cd nmap/<ip_address>
    b. sudo chmod u+x .
    c. sudo chown $USER:$USER .
5. Use vulnerability_report_generator.sh to create the unified vulnerability report for all the ports/services that are open on the host.
    a. Usage: sudo bash script.sh output_prefix
6. Strip the ASCI characters from the .tex file and use the .tex file to create a PDF file.
   a sed -i 's/\x1b\[[0-9;]*m//g' <file_name>.tex
   b. pdflatex <file_name>.tex
