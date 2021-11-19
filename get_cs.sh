#get cross section of each sample and write
#  the cross sections into a file
output=condor_out
file=tHW_cs.txt
touch $file
if [ -f $file ]
then
	echo "cross sections list is written into $file "
else
	echo "please create a file to story the list "
fi
echo "Note: each name of files contains a string 'couplings', " > $file
echo "and it followed by four numbers, which denote" >>$file
echo "kappa_top,kappa_tilde_top,ghz1,ghz4, respectively." >>$file
echo -e "for example: couplings1020 represents \nkappa_top=1, kappa_tilde_top=0, ghz1=2, ghz4=0 \n" >>$file
cd $output
for dir in `ls |grep tHW `
do
	cd $dir
	line=$(cat run.out | grep "Total xsec")
	if [ $? -eq 0 ]
	then		
		cross=${line%vs*}
		sample="tHW: kappa=${dir:0-4:1}, kappa_tilde=${dir:0-3:1}, ghz1=${dir:0-2:1}, ghz4=${dir:0-1}"
		echo $sample >> ../../$file
		echo $cross >> ../../$file
		echo -en '\n'   >> ../../$file

	else
		echo "Didn't find cross section in $dir"
		echo "please check $dir"
	fi
	cd ../
done
cd ../
pack=gdk_thw
#rm -rf $pack
mkdir -p $pack 
mv tHW*.tar.gz $pack
cp $file $pack
