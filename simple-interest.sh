#!/bin/bash

echo "Enter the principal amount:"
read -r p

echo "Enter the annual rate of interest:"
read -r r

echo "Enter the time period in years:"
read -r t


if ! [[ "$p" =~ ^[0-9]+([.][0-9]+)?$ &&
        "$r" =~ ^[0-9]+([.][0-9]+)?$ &&
        "$t" =~ ^[0-9]+([.][0-9]+)?$ ]] ||
   ! awk -v p="$p" -v r="$r" -v t="$t" \
        'BEGIN { exit !(p > 0 && r > 0 && t > 0) }'; then
    echo "Please enter valid positive numbers."
    exit 1
fi


si=$(awk -v p="$p" -v r="$r" -v t="$t" \
    'BEGIN { printf "%.2f", (p * r * t) / 100 }')

echo "Simple Interest: $si"
