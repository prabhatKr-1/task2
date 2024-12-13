#!/bin/bash

VERSION="v0.1.0"

# Function to display help
function display_help() {
    echo "Usage: sysopctl [command] [options]"
    echo "Commands:"
    echo "  --help                     Shows the help message"
    echo "  --version                  For displaying the version information"
    echo "  service list               For listing the active services"
    echo "    Example: sysopctl service list"
    echo "  service start <name>       To start a given service"
    echo "    Example: sysopctl service start apache2"
    echo "  service stop <name>        To stop a given service"
    echo "    Example: sysopctl service stop apache2"
    echo "  system load                For display current system load"
    echo "    Example: sysopctl system load"
    echo "  disk usage                 Shows disk usage information"
    echo "    Example: sysopctl disk usage"
    echo "  process monitor            For monitoring process activity"
    echo "    Example: sysopctl process monitor"
    echo "  logs analyze               Analyze system logs"
    echo "    Example: sysopctl logs analyze"
    echo "  backup <path>              Backup files from the specified path"
    echo "    Example: sysopctl backup /home/user/backup"
}

# Function to display the version information of sysopctl
function display_version() {
    echo "sysopctl version $VERSION"
}

# Function to display all the services
function list_services() {
    echo "Listing active services:"
    systemctl list-units --type=service
}

# Function to start a service using sysopctl
function start_service() {
    if [ -z "$1" ]; then
        echo "Error: Please enter the service name too"
        exit 1
    fi
    systemctl start "$1" && echo "Service '$1' started successfully!!" || echo "Failed to start service '$1'."
}

# Stopping a service using sysopctl
function stop_service() {
    if [ -z "$1" ]; then
        echo "Error: Please mention the service which needs to be stopped"
        exit 1
    fi
    systemctl stop "$1" && echo "Service '$1' stopped successfully!!" || echo "Failed to stop the service '$1'."
}

# Displaying the system load
function system_load() {
    echo "System load:"
    uptime
}

# Displaying the disk usage
function disk_usage() {
    echo "Disk usage:"
    df -h
}

# Monitoring real-time process activity
function process_monitor() {
    echo "Real-time process activity:"
    top
}

# Function to analyze system logs 
function analyze_logs() {
    echo "Log entries:"
    journalctl -p 3 -xb
}

# Function to implement backup
function backup_files() {
    if [ -z "$1" ]; then
        echo "Error: Please specify the backup path:"
        exit 1
    fi
    echo "Backup started for the path: $1"
    rsync -av --progress "$1" /backup/ && echo "Backup completed successfully!!" || echo "Backup failed."
}

if [ $# -eq 0 ]; then
    display_help
    exit 0
fi

COMMAND=$1
shift

case "$COMMAND" in
    --help)
        display_help
        ;;
    --version)
        display_version
        ;;
    service)
        ACTION=$1
        shift
        case "$ACTION" in
            list)
                list_services
                ;;
            start)
                start_service "$1"
                ;;
            stop)
                stop_service "$1"
                ;;
            *)
                echo "Invalid service action. Use 'list', 'start <name>', or 'stop <name>'."
                ;;
        esac
        ;;
    system)
        ACTION=$1
        shift
        case "$ACTION" in
            load)
                system_load
                ;;
            *)
                echo "Invalid system action. Use 'load'."
                ;;
        esac
        ;;
    disk)
        ACTION=$1
        shift
        case "$ACTION" in
            usage)
                disk_usage
                ;;
            *)
                echo "Invalid disk action. Use 'usage'."
                ;;
        esac
        ;;
    process)
        ACTION=$1
        shift
        case "$ACTION" in
            monitor)
                process_monitor
                ;;
            *)
                echo "Invalid process action! Use 'monitor'."
                ;;
        esac
        ;;
    logs)
        ACTION=$1
        shift
        case "$ACTION" in
            analyze)
                analyze_logs
                ;;
            *)
                echo "Invalid logs action! Use 'analyze'."
                ;;
        esac
        ;;
    backup)
        backup_files "$1"
        ;;
    *)
        echo "Invalid command! Use --help for available commands."
        ;;
esac
