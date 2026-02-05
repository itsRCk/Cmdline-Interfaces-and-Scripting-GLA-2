#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: Exactly one log file must be provided."
    exit 1
fi

logfile="$1"

if [ ! -e "$logfile" ]; then
    echo "Error: File does not exist."
    exit 1
fi

if [ ! -r "$logfile" ]; then
    echo "Error: File is not readable."
    exit 1
fi

total_entries=$(wc -l < "$logfile")

info_count=$(grep -c " INFO " "$logfile")
warning_count=$(grep -c " WARNING " "$logfile")
error_count=$(grep -c " ERROR " "$logfile")

recent_error=$(grep " ERROR " "$logfile" | tail -n 1)

echo "Log Summary:"
echo "Total entries: $total_entries"
echo "INFO messages: $info_count"
echo "WARNING messages: $warning_count"
echo "ERROR messages: $error_count"

if [ -n "$recent_error" ]; then
    echo "Most recent ERROR:"
    echo "$recent_error"
else
    echo "Most recent ERROR: None found"
fi

date_today=$(date +%Y-%m-%d)
report_file="output_${date_today}.txt"

{
    echo "Log Summary Report - $date_today"
    echo "------------------------------"
    echo "Total entries: $total_entries"
    echo "INFO messages: $info_count"
    echo "WARNING messages: $warning_count"
    echo "ERROR messages: $error_count"
    echo
    echo "Most recent ERROR:"
    if [ -n "$recent_error" ]; then
        echo "$recent_error"
    else
        echo "None found"
    fi
} > "$report_file"

echo "Report generated: $report_file"