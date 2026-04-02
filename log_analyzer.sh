#!/bin/bash

LOG_FILE="server.log"

echo "===================================="
echo "        ADMIN LOG ANALYSIS REPORT"
echo "===================================="
echo ""

# Show recent login and logout activity
echo "Recent LOGIN & LOGOUT Activity:"
grep -E "LOGIN|LOGOUT" "$LOG_FILE"
echo ""

echo "------------------------------------"

echo "Total log entries:"
wc -l < "$LOG_FILE"
echo ""

echo "Total LOGIN attempts:"
grep "LOGIN" "$LOG_FILE" | wc -l
echo ""

echo "Total LOGOUT attempts:"
grep "LOGOUT" "$LOG_FILE" | wc -l
echo ""

echo "------------------------------------"

echo "Login count per user:"
grep "LOGIN" "$LOG_FILE" | awk '{print $4}' | sort | uniq -c | sort -nr
echo ""

echo "Logout count per user:"
grep "LOGOUT" "$LOG_FILE" | awk '{print $4}' | sort | uniq -c | sort -nr
echo ""

echo "------------------------------------"

echo "Login count per IP:"
grep "LOGIN" "$LOG_FILE" | awk '{print $5}' | sort | uniq -c | sort -nr
echo ""

echo "------------------------------------"

echo "ERROR count:"
grep "ERROR" "$LOG_FILE" | wc -l
echo ""

echo "WARNING count:"
grep "WARNING" "$LOG_FILE" | wc -l
echo ""

echo "INFO count:"
grep "INFO" "$LOG_FILE" | wc -l
echo ""

echo "===================================="
echo "        END OF REPORT"
echo "===================================="
