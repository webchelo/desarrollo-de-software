#!/bin/bash

MI_VECTOR=("manu" "nico" "juan" "pedro")

echo "el primer elemento es: ${MI_VECTOR[0]}"

echo "todos mis elementos son: ${MI_VECTOR[@]}"

for nombre in "${MI_VECTOR[@]}"
do
    echo "Hola ${nombre}"
done