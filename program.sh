#!/bin/bash
#Autor: Renan Dias
#Description: Um programa que verifica os parâmetros passados para identificar o status de um serviço em execução
#Date: 13/09/2023
#Version: 1.0
#License: GPL v3

DIR="/run/cert.pid"

funcstart(){
	if [ -f $DIR ]; then
		echo "O programa já está em execução"
	else
		touch /run/cert.pid
	fi
}

funcstop(){
	if [ -f $DIR ]; then
		rm -r /run/cert.pid
	else
		echo "O programa já está parado"
	fi
}

funcstatus(){
	if [ -f $DIR ]; then
		echo "STATUS: Programa em execução"
	else
		echo "STATUS: Programa parado"
	fi
}

case $1 in
	start)
		funcstart
	;;
	stop)
		funcstop
	;;
	restart)
		funcstop
		funcstart
	;;
	status)
		funcstatus
	;;
	?)
		echo "Parâmetro inválido"
	;;
esac