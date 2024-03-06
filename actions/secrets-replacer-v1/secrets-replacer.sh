#!/bin/bash
set -x

file="${files}"
secrets="${secrets}"
excluded_keys=(${exclude_secret})
echo $secrets > secretos.json
yq eval secretos.json -o yaml -P > secrets.yaml

while IFS= read -r line || [[ -n "$line" ]]; do
    # Obtener el valor correspondiente del archivo nuevo
    value=$(grep "^$line:" secrets.yaml | cut -d' ' -f2)
    key=$(grep "^$line" secrets.yaml | cut -d ':' -f1)
    # Reemplazar el valor en el archivo original
    sed -i "s/__${key}__/${value}/g" "$file"
done < secrets.yaml

echo "cat del secrets.yaml"
cat secrets.yaml
echo "cat del archivo $file"
cat $file


# keys=$(echo "$secrets" | jq -r 'keys[]')
# values=$(echo "$secrets" | jq -r '.[]')
# # Iterar sobre las claves y valores
# for key in $keys; do

#     if [[ " ${excluded_keys[@]} " =~ " ${key} " ]]; then
#         continue # If the key is on the list; skip to the following one
#     fi
    
#     value=$(echo "$secrets" | jq -r ".$key")
#     if [[ ! "$key" == *"PRIVATE_KEY"* ]]; then
#         sed -i "s/__${key}__/${value}/g" "$file"
#     else
#         echo "$value" | awk '{print "                          " $0}' > key.pem
#         sed -i "/__${key}__/r key.pem" "$file"
#         sed -i "/__${key}__/d" "$file"
#     fi
# done