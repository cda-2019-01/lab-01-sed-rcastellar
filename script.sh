# Laboratorio 01 Transformación de archivos con sed

# Usar el '.' para indicar decimales
sed 's/,/./g' data.csv > out.1

# Reemplazar los ;' por ','
sed 's/;/,/g' out.1 > out.2
sed 's/,/./4' out.2 > out.3

# Reemplazar '/' por '-' en la Fecha y dar formato YYYY-MM-DD
sed 's/\//-/g' out.3 > out.4
sed 's/\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9]\)/20\3-\2-\1/' out.4 > out.5
sed 'y/abc/ABC/' out.5 > out.6

# Transformar el archivo para que todos los campos nulos aparezcan como `\N`
sed 's/,,/,\\N,/' out.6 > out.7
sed 's/,N/,\\N/' out.7 > out.8
sed 's/;\r/;\\N/g' out.8 > out.9

# Extraer los registros que no tienen campos nulos
sed '/\N/d' out.9 > data1.csv
rm out.*
cat data1.csv