filename=()

i=0

ls -ls | while read line
do
    filename[ $i ]="$line"        
    (( i++ ))
	echo "$line" >> test.txt
done

sed 1d test.txt | while IFS=' ' read col1 col2 col3 col4 col5 col6 col7 col8 col9 filename ; do	
	
	if [[ ${filename} != *"/"* && ${filename} != *".ini"* && ${filename} != *"Maid"* ]] ; then
		
		buffer=$(stat -c %y "${filename}")
		
		lastModificationDate=$(IFS=" " ; set -- $buffer ; echo $1)
		
		mkdir "rack/${lastModificationDate}"
		
		mv "${filename}" "rack/${lastModificationDate}"			
		
	fi
    
done < test.txt

rm test.txt 
