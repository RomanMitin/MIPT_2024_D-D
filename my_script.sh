#!/bin/bash

# Файл для хранения PID процесса
PID_FILE="/tmp/disk_monitor.pid"
LOG_DIR="./logs"
mkdir -p "$LOG_DIR"

write_log() {
    local log_file=$1
    
    if [[ ! -f $log_file ]]; then
        echo "disk_usage,inodes_free" > "$log_file"
    fi
    
    echo "$(df / | tail -1 | awk '{print $5}' | sed 's/%//'),$(df -i / | tail -1 | awk '{print $4}')" >> "$log_file"
}

monitor() {
    while true; do   
    	cur_date=$(date +"%Y%m%d")
	timestamp="${cur_date}_$1"
    	local log_file="${LOG_DIR}/disk_usage_${timestamp}.csv" 
        write_log $log_file
        sleep 1 # Пауза в 60 секунд
    done
}

case "$1" in
    START)
        if [ -f "$PID_FILE" ]; then
            echo "Monitoring already started with PID $(cat $PID_FILE)"
            exit 1
        fi
	timestamp=$(date +"%H%M%S")
        monitor $timestamp &
        echo $! > "$PID_FILE"
        echo "Monitoring has started with PID $!"
        ;;
    STATUS)
        if [ -f "$PID_FILE" ]; then
            echo "Monitoring is runnigs: PID $(cat $PID_FILE)"
        else
            echo "Monitoring is not started"
        fi
        ;;
    STOP)
        if [ -f "$PID_FILE" ]; then
            kill $(cat $PID_FILE) && rm "$PID_FILE"
            echo "Stop monutoring"
        else
            echo "Monitoring is not started"
        fi
        ;;
    *)
        echo "Usage: $0 {START|STOP|STATUS}"
        exit 1
        ;;
esac

