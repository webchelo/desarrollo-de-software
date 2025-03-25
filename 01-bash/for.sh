#!/bin/bash

if [ -z "$1" ]; then
    echo "poneme un numero válido porfavor"
    exit 1
fi

LIMITE=$1

SUMATOTAL=0

for((i=1; i <= $LIMITE; i++))
do
    SUMATOTAL=$((SUMATOTAL + i))
done

echo "la suma de los números del 1 hasta el $LIMITE es: $SUMATOTAL"

