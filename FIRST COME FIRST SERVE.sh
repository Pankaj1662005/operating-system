#!/bin/bash

# First Come First Serve (FCFS) CPU Scheduling Script

# Function to display the process details
display_processes() {
    echo "Processes:"
    echo "PID    Arrival Time    Burst Time"
    for ((i=0; i<${#pids[@]}; i++)); do
        echo "${pids[$i]}        ${arrival_times[$i]}             ${burst_times[$i]}"
    done
    echo ""
}

# Function to initialize processes
initialize_processes() {
    pids=()
    arrival_times=()
    burst_times=()

    # Add processes with arrival times and burst times here
    pids=(1 2 3 4 5) # Process IDs
    arrival_times=(0 1 2 3 4) # Corresponding arrival times
    burst_times=(10 4 5 3 2) # Corresponding burst times
}

# Function to perform FCFS scheduling and generate Gantt chart
fcfs_scheduling() {
    local time=0
    local gantt=()

    echo "Starting FCFS Scheduling"
    echo ""

    for ((i=0; i<${#pids[@]}; i++)); do
        local pid=${pids[$i]}
        local arrival=${arrival_times[$i]}
        local burst=${burst_times[$i]}

        if [[ $time -lt $arrival ]]; then
            time=$arrival
        fi

        gantt+=("P${pid}($burst)")
        time=$((time + burst))
        echo "Process $pid executed from $((time - burst)) to $time"
    done

    echo ""
    echo "All processes completed. Total time: $time units"
    echo ""
    echo "Gantt Chart:"
    echo "${gantt[*]}"
}

# Main script execution
initialize_processes
display_processes

# Perform FCFS scheduling
fcfs_scheduling
