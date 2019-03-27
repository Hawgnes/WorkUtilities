header=false
ip=""
name=""
port=""
filename=()

while IFS=, read -a col; do
  if [ "$header" = false ]; then
    len="${#col[@]}" # get length of array
    for ((i=3; i<$len-1; i++)); do
      filename[i-3]="${col[i]}" # save name of column into array
    done
    header=true
  else
    if [ ! -z ${col[1]} ]; then #this is ip in array
      ip="${col[1]}" #keep ip
      name="${col[0]}" #keep name
    fi

    for ((i=3; i<$len-1; i++)); do
      if [ "${col[i]}" != "" ]; then #if column is not empty 
        echo "echo \"Telnetting $ip($name) on port ${col[2]};\" " >> "${filename[i-3]}".sh
        echo "sleep 1 | telnet $ip ${col[2]};" >> "${filename[i-3]}".sh
      fi
    done
  fi
done < telnet_list.csv
