#!/bin/bash
error()
{
	echo "$1"
	exit 1
}

echo -e "please input the kind of output>>\c"
read inp
if [ $inp -gt 16 ];then
    error "error:overflow!"
fi
flag1=$(echo -n "$inp"|sed 's/[0-9]//g'|wc -c)
[ "$flag1" != 0 ]&&error "error:wrong kind.-h for help."
flag2=$(echo -n "$1"|sed 's/[0-9]//g'|wc -c)
[ "$flag2" != 0 ]&&error "error:wrong input.-h for help."
num=$1
dd=0
sum=""
while [ "$num" != "0" ];do
	dd=$(expr "$num" % "$inp")
    if [ $dd -ge 10 ];then
        case $dd in
            10)dd=a;;
            11)dd=b;;
            12)dd=c;;
            13)dd=d;;
            14)dd=e;;
            15)dd=f;;
        esac
    fi
	sum="$dd"${sum}
	num=$(expr $num / $inp)
done
echo -e "Hello,$USER.\n$yuan[$oupu] is changed to $sum[$inp]"
