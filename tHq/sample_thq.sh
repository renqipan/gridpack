#!/bin/bash
# Written by Renqi Pan in September 28, 2021
# bash script to prepare  the directory 
# for tHW throungh condor at lxplus
kappa_top=( 1 0 0 0 2 0 0 0 1 1 1 0 0 0 2 1 1)
kappa_tilde_top=( 0 1 0 0 0 2 0 0 1 0 0 1 1 0 2 1 0)
ghz1=( 0 0 1 0 0 0 2 0 0 1 0 1 0 1 2 1 2)
ghz4=( 0 0 0 1 0 0 0 2 0 0 1 0 1 1 2 1 0)

output=condor_out
#rm -rf ../../$output
#mkdir ../../$output
for((i=0; i<17; i++))
do
	a1=${kappa_top[i]}
	a2=${kappa_tilde_top[i]}
	a3=${ghz1[i]}
	a4=${ghz4[i]}
	dir=tHq_H4l125_couplings${a1}${a2}${a3}${a4}
	rm -rf $dir
	mkdir  $dir
	cp -r thq_H4l125_JHUGen_couplings1020/* $dir
	cd $dir
	sed -i "s/kappa_top=1.0/kappa_top=${a1}/" JHUGen.input
	sed -i "s/kappa_tilde_top=0.0/kappa_tilde_top=${a2}/" JHUGen.input
	sed -i "s/ghz1=2.0/ghz1=${a3}/" JHUGen.input
	sed -i "s/ghz4=0.0/ghz4=${a4}/" JHUGen.input
	#sed -i "50s/1020/${a1}${a2}${a3}${a4}/" runcmsgrid.sh
	echo "$dir is prepared."
	cd ../
	cd ../../
	cd $output
	rm -rf $dir
	mkdir -p $dir
	cd ../cards/tHq/
			
done
ls | grep tHq_H4l > ../../dir_thq.txt
cd ../../
echo "the directory list is written into dir_thq.txt "
echo "the condor output will be put in $output "




