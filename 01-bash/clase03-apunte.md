# Variables de entorno

$env
Lista las variables de entorno

$echo "Hola como estas? $USER"
Me devuelve: Hola como estas? chelo

$echo 'Hola como estas? $USER'
Me devuelve literal: Hola como estas? $USER

# Subshell
"Es escribir un comando dentro de un comando"

$date
Me da un timestamp

Si quiero imprimir el date en un texto hago lo siguiente:
$echo "Hoy es $(date)"

Puedo hacer:
$echo "mi saludo es: $(cat saludo.txt)"
Me devuelve: mi saludo es: hola mundo! (o lo que haya en saludo.txt)

# Pipes
"la salida del primer comando (stdout) va a ser la entrada del comando 2 (stdin)"

$grep hace busquedas

$ls -l | grep "txt"
Lo que hace es tomar la lista traida por el ls y buscar e imprimir lo que coincida con "txt"

	archivo.txt -> "
						Cantidad de texto
						Hola probando!
						tercera linea
					"
$cat archivo.txt | grep "texto"
Me devuelve la linea: Cantidad de texto

$wc 
Devuelve lineas, palabras y letras

Se pueden poner tres comandos:
$cat archivo.txt | grep "texto" | wc
Me devuelve: 1 3 17

# Bash Scripting

Creamos el primer script mi-pimer-script.sh y lo abrimos con un editor

Todo script arranca con:
#!/bin/bash
Se llama "shebang"

	echo "Ingresá tu nombre"
	read nombre
	echo "hola, $nombre"

Para ejecutarlo hay que ./nombre-del-script.sh

Pero no vamos a tener permisos, SIEMPRE hay que cambiar los permisos
$chmod +x nombre-del-script

Entonces ahora si al ejecutar el script, tengo un prompt que me pide nombre y me devuelve un saludo con mi nombre

## Estructura de control if else

if [ condicion ]; then
    lo que hace
elif [ condicion ]; then
    lo que hace
else
    lo que hace
fi

## Argumentos

Se introducen así ./mi-script chelo

Y se guardan así
HOLA=$1

if [ $HOLA == "chelo" ]; then
    echo "Hola chelooo, aguante river"
elif [ $HOLA == "nico" ]; then
    echo "Hola nicooo, aguante river"
else
    echo "Aguante el river todo el tiempo"
fi

*SON IMPORTANTES LOS ESPACIOS DENTRO DE LOS CORCHETES, SINO NO SE EJECUTA

./mi-script chelo
Hola chelooo, aguante river

./mi-script blabla
Aguante river todo el tiempo

### comparaciones en if
Números:

- eq: Igual (equal)
- ne: No son iguales (not equal)
- gt: Mayor que (greater than)
- lt: Menor que (less than)
- ge: Mayor o igual (greater or equal)
- le: Menor o igual (less or equal)

Cadenas:

- Comparar si dos cadenas son iguales: string1 == string2
- Comparar si dos cadenas son diferentes: string1 != string2
- Verificar si una cadena coincide con una expresión regular: string1 =~ regex → Devuelve true
- Verificar si la longitud de una cadena es cero: -z
- Verificar si la longitud de una cadena no es cero: -n

## Validar argumentos vacíos

if [ -z "$1" ]; then
    echo "che, me mandaste argumentos"
    exit 1
fi

Recordamos que -z verifica si la cadena tiene longitud de 0, al tener longitud de 0, el if toma como true la condición y ejecuta el codigo
