# Notas básicas de bash shell

La terminal se compone de tres contenedores o archivos:
- stdin (standard input) (le corresponde el numero 0)
- stdout (standard out)	(le corresponde el numero 1)
- stderr (standard error) (le corresponde el numero 2)
Nos ayudan a entender la terminal y usarla a nuestro favor

ls hello.txt -> imprime un standard output, en este caso "hello.txt" porque hice un ls
cd blabla -> imprime un standard error, porque el directorio no existe, cualquier error es impreso en el standard error
standard input es cuando nosotros estamos escribiendo. standar output es lo que devuelve la interacción que hicimos

Los archivos stdout, stdin, stderr están ubicados en /dev

## Ejercicio de redirección:

	Cat, si lee un archivo lo manda al standard output
	Pero ahora quiero me mande el output a otro archivo, por ejemplo output.txt
	Redireccionamientos: Se usa con >

	Entonces:
	- cat helloWorld.txt > output.txt
	- cat output.txt
		(salida) -> Hola Mundo!

	Lo que dije fue, cat, no me mandes el standard output, poneselo a output.txt
	Entonces al indicarle eso, no salió nada en consola
	Pero si leo output.txt puedo ver el standard output de la orden "cat helloWorld.txt"
	Un detalle es que no solo encadena texto, sino el resultado de un cd por ejemplo

Si en output.txt (con el valor de "Hola Mundo!") y le redirecciono el valor de helloWorld2.txt ("hola de nuevo") con el mayor ( > ), lo que va a pasar es que se va a pisar el valor agregado
Entonces cat output.txt
	(salida) -> "Hola de nuevo"

Pero si redirecciono con dos mayores ( >> ) puedo encadenar el valor al final del archivo
Ejemplo: cat helloWorld >> output.txt
	(salida) -> "Hola de nuevo
				Hola Mundo!"

## Que pasa si quiero redireccionar un error?:

	cd blabla > output.txt
		(salida) -> cd: blabla: No such a file or directory

	Esto no era lo esperado, porque yo queria redireccionar el standard error al output.txt pero me lo imprimió igual
	Pero peor: cat output.txt
				(salida) -> 
	No encadenó nada en output.txt, se pisó con nada porque el standard output no tenía nada
	
	cd blabla > output.txt
		(salida) -> cd: blabla: No such a file or directory ====> Esto es el standard error!
	cat output.txt
		(salida) ->   =====> Esto es el standard output!

Ahora si, cómo hago para redireccionar un standard error?
Cada archivo tenía un número, el de standard error era el 2
Con esto ahora podemos redireccionar un standard error

	ls blabla 2> output.txt
		(salida) ->   (bien, era lo que esperaba, que no aparezca nada y ahora fijarme si está en output.txt)
	cat output.txt
		(salida) -> ls: blabla: No such file or directory

Con dos mayores ( 2>> ) puedo encadenar un standard error también

## Redireccionar standard out y standard error en la MISMA LINEA

	Tenemos los siguientes archivos:
		- helloWorld.txt
		- output.txt
		- error.txt
	Entonces quiero en un solo comando redireccionar ambos
	cat helloWorld.txt > output.txt 2> error.txt
	Si hay algo en stdout, lo redirecciona a output.txt, sino, a error.txt
	cat error.txt
		(salida) ->
	cat output.txt
		(salida) -> Hola Mundo!

	Otro ejemplo pero con error:
	ls blabla > output.txt 2> error.txt
	cat error.txt
		(salida) -> ls: blabla: No such file or directory
	cat output.txt
		(salida) ->

Hay un caso en el que podemos tener un standard output y un standard error A LA VEZ
ls / /blabla > output.txt 2> error.txt
Un cat a ambos txt nos daría los respectivos resultados

## Ejemplo de std input

Cuando hacemos sudo su, el ingreso de la contraseña es stdin
cat - -> lee desde el standard input

## Variables de entorno

Las puedo ver con:
	env
Para crear una en la sesión en la que estoy puedo usar
	export PEPE="argento"
