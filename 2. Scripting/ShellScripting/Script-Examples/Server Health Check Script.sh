#!/bin/bash
servers=("server1" "server2" "server3")
for server in "${servers[@]}"; do
    if ping -c 1 "$server" &> /dev/null; then
        echo "Server $server is reachable"
    else
        echo "Server $server is unreachable"
        # Send alert here
    fi
done


#  Create a script to perform health checks on servers and services periodically.
