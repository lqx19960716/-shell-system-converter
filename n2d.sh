#!/bin/bash
error()
{
	echo "$1"
	exit 1
}
lastchar()
{
    if [ -z "$1" ];then
		rval=""
		return
	fi
	numofchar=$(echo -n "$1"|wc -c|sed 's/ //g')
	rval=$(echo -n "$1"|cut -b "$numofchar")
}
chop()
{
	if [ -z "$1" ];then
		rval=""
		return
	fi
	numofchar=$(echo -n "$1"|wc -c|sed 's/ //g')
	if [ "$numofchar" = "1" ];then
		rval=""
		return
	fi
	numofcharminus1=$(expr "$numofchar" - 1)
	rval=$(echo -n "$1"|cut -b 1-${numofcharminus1})
}
change()
{
    case $1 in
        a)return 10;;
        b)return 11;;
        c)return 12;;
        d)return 13;;
        e)return 14;;
        f)return 15;;
    esac
}

echo -e "please input the kind of input>>\c"
read oup
if [ $oup -gt 16 ];then
    error "error:overflow!"
fi
export oupu=$oup
flag1=$(echo -n $oup|sed 's/[0-9]//g'|wc -c)
[ $flag1 != 0 ]&&error "error:wrong kind.-h for help."
flag2=$(echo -n $1|sed 's/[0-9a-f]//g'|wc -c)
[ $flag2 != 0 ]&&error "error:wrong input.-h for help."
sum=0
weight=1
binnum="$1"
binnumorig="$1"
while [ -n "$binnum" ];do
	lastchar "$binnum"
    if [ $(echo -n $rval|sed 's/[a-f]//g'|wc -c) = 0 ];then
        change $rval
        chans=$?
        if [ $? -lt $oup ];then
            sum=$(expr $weight "*" $chans + $sum)
        else
            error "error:wrong input.-h for help."
        fi
	elif [ "$rval" -lt "$oup" ];then
		sum=$(expr $weight "*" $rval + $sum)
	else
		error "error:wrong input.-h for help."
	fi
	chop $binnum
	binnum=$rval
	weight=$(expr $weight "*" $oup)
done
sh /home/moyan/script/jinzhi/3.0/d2n.sh $sum
