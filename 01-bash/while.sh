#!/bin/bash

echo "Escribí algo (escribrí 'salir' para terminar):"
while true
do 
    read linea
    if [ "$linea" == "salir" ]; then
        break
    fi
    echo "Vos escribiste: $linea"
done

echo "¡Fin del programa!"