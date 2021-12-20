#!/usr/bin/awk -f
#program to calculate average of 5 subjects of students
BEGIN { FS="|"}
{
print "\n\nThe name of Student: ",$1
print "The SRN: ",$2
i=0
{
for(i=0; i < NF; i++)
{
arr["subj1"]=$3;
arr["subj2"]=$4;
arr["subj3"]=$5;
arr["subj4"]=$6;
arr["subj5"]=$7;
}
}
{
for (j in arr)
{
savg=""
if (arr[j]>=90)
 savg="O";
else if (arr[j]>=80)
 savg="A+";
else if (arr[j]>=70)
 savg="A";
else if (arr[j]>=60)
 savg="B+";
else if (arr[j]>=50)
 savg="B";
else if (arr[j]>=40)
 savg="C";
else
 savg="F";
 
print "\nThe marks of", j, "are ", arr[j]," and grade is",savg;
 
}
 } 
 
sum=$3+$4+$5+$6+$7
avg=sum / 5
print "The average marks:",avg
favg=""
if (avg>=90)
 favg="O";
else if (avg>=80)
 favg="A+";
else if (avg>=70)
 favg="A";
else if (avg>=60)
 favg="B+";
else if (avg>=50)
 favg="B";
else if (avg>=40)
 favg="C";
else
 favg="F";
 
 print "\nFinal Grade:",favg
 }
