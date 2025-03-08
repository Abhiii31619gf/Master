#!/bin/bash

# Infinite loop to check if Master.py is running
while true; do
    echo "[*] Checking if Master.py is running..."
    
    # Check if Master.py is already running
    pgrep -f 'python3 Master.py' > /dev/null
    if [ $? -ne 0 ]; then
        echo "[*] Master.py is not running. Restarting..."
        
        # Restart Master.py
        nohup /opt/Master/venv/bin/python3 /opt/Master/Master.py > /opt/Master/MasterPy.log 2>&1 &
    fi
    
    # Wait 10 seconds before checking again
    sleep 10
done
