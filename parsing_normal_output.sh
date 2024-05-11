#!/bin/bash

# Input and output files
nmap_output="$1"
csv_output="open_ports.csv"

# Check if the nmap output file exists
if [ ! -f "$nmap_output" ]; then
    echo "nmap output file not found: $nmap_output"
    exit 1
fi

# Initialize the CSV file with headers
echo "IP,Port,Service" > "$csv_output"

# Process each host section in the nmap output
while IFS= read -r line; do
    if [[ $line == Nmap\ scan\ report\ for* ]]; then
        # Extract the IP address
        ip=$(echo "$line" | awk '{print $NF}')
    elif [[ $line == *open* && $line != *filtered* && $line != *closed* ]]; then
        # Extract the port number, service, and service version
        port=$(echo "$line" | awk -F '/' '{print $1}')
        service=$(echo "$line" | awk '{print $3}')
        echo "$ip,$port,$service" >> "$csv_output"
    fi
done < "$nmap_output"

echo "Extraction complete. Open ports and services saved to $csv_output"
