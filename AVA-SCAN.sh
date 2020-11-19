#!/bin/bash

pacman -S nmap -y
apt install nmap -y
apt install figlet -y
clear

echo ' [::]AVA ROSE[::]'
echo ' [::]GITHUB: https://github.com/Pactoriana[::]'
echo ' [::]PARA MAIS DETALHES DIGITE AJUDA [::]'
figlet AVA ROSE
figlet NETSCAN

echo "NETSCAN 1.0 BETA TEST"
echo
echo -n '--> '
read -p 'DIGITE O IP / SITE: ' REDE

if [ ${REDE} = 'ajuda' ]; then
	echo "TENTE UM IP ex.: 127.0.0.1 "
fi
echo
echo -n '--> '
read -p 'DIGITE UMA NETMASK: ' NET
if [ ${NET} = 'ajuda' ]; then
	echo "TENTE UMA NETMASK ex.: /20 /16 "
fi
echo
echo -n '--> '
read -p 'DIGITE UM PAR?METRO: ' PARAMETRO
if [ ${PARAMETRO} = 'ajuda' ]; then
	echo "TENTE USAR UM DESSES -sP -A -O -sO"
fi
echo
read -p 'VER RESUMO DESTE SCRIPT (y/n): ' ye_no
if [[ ${ye_no} = 'y' || ${ye_no} = 'Y' ]]; then
	echo " --> REDE: $REDE$NET"
	echo " --> PARÂMETRO: $PARÂMETRO"
else
 	exit
fi

echo -n '--> '
read -p "SALVAR ARQUIVO (enter): " ARQUIVO
test "$ARQUIVO" = 'ajuda' && echo && echo "DIGITE O PARÂMETRO ADICIONAL DE PESQUISA." && echo "Ex.: relatorio.txt" && echo && echo -n "--> " && read ARQUIVO
test "$ARQUIVO" = "" && echo && echo "O relatário não será salvo."

echo
echo -n '--> '
read -p 'DESEJA CONTINUAR (enter) : ' resposta
test "$resposta" = "n" && echo "SAINDO ..." && exit
echo
	echo ' ---------------------------------- ' >> netscam.temp
	echo >> netscan.temp
	echo "NetScan version 1.0 - [by: AVA ROSE" >> netscan.temp
	echo 
	echo ' Rede Varrida ..' >> netscan.temp
	echo >> netscan.temp

echo
echo "INICIANDO TESTES >> "
echo
	nmap $PARAMETROS $REDE$NET >> netscan.temp
echo

echo "TESTES CONCLUIDOS COM SUCEFULLY"
echo -n '--> '
echo ' REGISTREI DATA E HORA .. '
echo >> netscan.temp
LANG=pt_BR date >> netscan.temp
echo

cat netscan.temp
echo "bye bye"
figlet AVA ROSE

