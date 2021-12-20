echo "Enter Two Numbers"
read a b

while [[ 1 ]]
do
	echo "What do you want to do? (1 to 5)"
	echo "1) Sum"	
	echo "2) Difference"
	echo "3) Product"
	echo "4) Quotient"
	echo "5) Remainder"
	echo "6) Exit"
	echo "Enter your Choice"
	read n
	case "$n" in
	1) echo "The Sum of $a and $b is `expr $a + $b`";;
	2) echo "The Difference between $a and $b is `expr $a - $b`";;
	3) echo "The Product of the $a and $b is `expr $a \* $b`";;
	4) echo "The Quotient of $a by $b is `expr $a / $b`";;
	5) echo "The Remainder of $a by $b is `expr $a % $b`";;
	6) break ;;
esac
done
