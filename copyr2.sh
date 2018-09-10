#!/bin/bash
origen="~/workspace/Terminal/origen"
destino="~/workspace/Terminal/destino"
echo ::ORIGEN:: $origen
cd "$origen"

echo ::DESTINO:: $destino
my_array=( `find . -name "*.pdf" -or -name "*.doc" -or -name "*.docx" -or -name "*.xls" -or -name "*.xlsx" -or -name "*.txt"` )
my_array_length=${#my_array[@]}
echo
echo ::ARCHIVOS:: $my_array_length
echo
for element in "${my_array[@]}"
do
   DIRECTORIO=( `dirname "${element}"`);
   d=$destino${DIRECTORIO:1}
   if [ ! -d "$d" ]; then
       echo ::CREANDO DIRECTORIO:: $d
       mkdir -p "$d"                               #<HERE>
   fi
   echo ::COPIANDO ARCHIVO:: $element
   #echo $element
   echo ::COPIANDO ORIGEN :: $origen/${element}
   echo ::COPIANDO DESTINO:: $d
   cp "$origen"/"$element" "$d"                             #<HERE>
done