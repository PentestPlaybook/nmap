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
echo "IP,Port" > "$csv_output"

# Process each host section in the nmap output
while IFS= read -r line; do
    if [[ $line == Nmap\ scan\ report\ for* ]]; then
        # Extract the IP address
        ip=$(echo "$line" | awk '{print $NF}')
    elif [[ $line == *open* && $line != *filtered* ]]; then
        # Extract the port and check it's open, then write to CSV
        port=$(echo "$line" | awk -F '/' '{print $1}')
        echo "$ip,$port" >> "$csv_output"
    fi
done < "$nmap_output"

echo "Extraction complete. Open ports saved to $csv_output"
