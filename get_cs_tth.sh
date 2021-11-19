#get cross section of each sample and write
#  the cross sections into a file
output=condor_out
file=ttH_cs.txt
touch $file
if [ -f $file ]
then
	echo "cross sections list is written into $file "
else
	echo "please create a file to story the list "
fi
echo "Note: each name of files contains a string 'couplings', " > $file
echo "and it followed by two one decimal numbers, which denote" >>$file
echo "kappa_top,kappa_tilde_top, respectively." >>$file
echo -e "for example: couplings1.01.6 represents \nkappa_top=1.0, kappa_tilde_top=1.6, which correponds to fcp=0.5\n" >>$file
cd $output
for dir in `ls |grep ttH `
do
	cd $dir
	line=$(cat run.out | grep "Total xsec")
	if [ $? -eq 0 ]
	then		
		cross=${line%vs*}fb
		var=${dir#*couplings}
		sample="ttH: kappa=${var:0:2}, kappa_tilde=${var:2}"
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
pack=gdk_tth
#rm -rf $pack
mkdir -p $pack 
mv ttH*tar.gz $pack
cp $file $pack
