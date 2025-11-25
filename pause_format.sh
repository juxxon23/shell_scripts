#! /bin/zsh

# Initial vars
echo "Enter the file name"
read file_name
cp $file_name file_name_cp 

# Processing
# Eliminar puntos suspensivos (opc)
sed -r 's/\.{3}/./g' $file_name > file_name_cp
# [Punto (.) -> Cinco (5) puntos (.....)]
# [Dos Puntos (:) -> Cinco (5) puntos (.....)]
formatting=$(sed -r 's/[.:]/...../g' file_name_cp)
# [Coma (,) -> Tres (3) puntos (...)]
# [Linea (—) -> Tres (3) puntos (...)]
formatting=$(sed -r 's/[,—]/.../g' <<< $formatting)
# [Punto y coma (;) -> Cuatro (4) puntos (....)]
formatting=$(sed -r 's/;/..../g' <<< $formatting)
# [Final de cita (.....”) -> Ocho (8) puntos (........)]
formatting=$(sed -r 's/\.{5}”/”......../g' <<< $formatting)

# Save format file
echo $formatting > format_result
