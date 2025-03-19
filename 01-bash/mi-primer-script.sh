#!/bin/bash

if [ -z "$1" ]; then
    echo "che, me mandaste argumentos"
    exit 1
fi

HOLA=$1

if [ $HOLA == "chelo" ]; then
    echo "Hola chelooo, aguante river"
elif [ $HOLA == "nico" ]; then
    echo "Hola nicooo, aguante river"
else
    echo "Aguante el river todo el tiempo"
fi