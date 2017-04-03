#!/bin/bash
help()
{
cat<<HELP
	1)./n2n.sh num
	2)input kind of input
	3)input kind of output
HELP
	exit 0
}
error()
{
	echo "$1"
	exit 1
}

while [ -n "$1" ];do
	case $1 in
		-h) help;shift 1;;
		--) shift;break;;
		-*) error "error:no such option $1.\n-h for help.";;
		*) break;;
	esac
done
export yuan=$1
sh /home/moyan/script/jinzhi/3.0/n2d.sh $1
