# Bash program for the above approach

#n=4
#arr=(9 7 2 5)

echo "enter the number of elements"
read n

for ((i=0;i<n;i++))
do
	echo "enter the $i th element of the array"
	read el
	arr[i]=$el
done

echo "orignal array is ${arr[@]}" 

# Perform insertion sort to sort the array
j=1
while [ $j -lt $n ] 
do
    c=0
    k=$(expr $j - 1)
    while [ $k -ge 0 ] 
    do
        if [ ${arr[k]} -gt ${arr[j]} ] 
        then
            c=$(expr $c + 1)
        fi
    k=$(expr $k - 1)
    done
    
    x=$j
    y=$(expr $j - 1)
    
    while [ $c -gt 0 ]
    do
        # Swapping the elements
        temp=${arr[x]}
        arr[$x]=${arr[y]}
        arr[$y]=$temp
        
        x=$(expr $x - 1)
        y=$(expr $y - 1)
        c=$(expr $c - 1)
        
    done
    
    j=$(expr $j + 1)
done

# Print the sorted array
echo "sorted array is ${arr[*]}"
