echo "Enter the string"

read str

while [[ 1 ]]
do 
	echo "enter a substring to search"
	
	read substr
	
	pos=-1
	
	lenms=${#str}
	lenss=${#substr}
	
	if [[ $lenms -lt $lenss ]]
	then
		echo "substring is bigger than the main string, Try again"
		continue
	fi
	
	limit=`expr $lenms - $lenss + 1`
	
	found=0
	posindx=0
	occ=0
	
	for ((i=0; i<limit; i++ ))
	do
		substr1=${str:$i:$lenss}
		if [[ $substr == $substr1 ]]
		then
			arrpos[posindx]=$i
			occ=$((occ+1))
			posindx=$((posindx+1))
		fi
	done
	
	if [[ $occ == 0 ]]
	then
		echo "no match found for $substr"
		
	else
		echo "substring $substr found at ${arrpos[@]} and number of occurances are $occ"
		break
	fi
done
			
