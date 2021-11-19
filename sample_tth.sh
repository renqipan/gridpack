#!/bin/bash
# Written by Renqi Pan in September 28, 2021
# bash script to prepare  the directory 
# for ttH throungh condor at lxplus
kappa_top=(1.0 0.0 2.0 0.0 1.0 0.0 1.0  1.0)
kappa_tilde_top=(0.0 1.0 0.0 2.0 1.0 1.6 1.6 -1.6)

output=condor_out
#rm -rf ../../$output
#mkdir ../../$output
for((i=0; i<8; i++))
do
	a1=${kappa_top[i]}
	a2=${kappa_tilde_top[i]}
	dir=ttH_H4l125_couplings${a1}${a2}
	rm -rf $dir
	mkdir  $dir
	cp -r tth_H4l125_JHUGen_couplings10/* $dir
	cd $dir
	sed -i "s/kappa_top=1.0/kappa_top=${a1}/" JHUGen.input
	sed -i "s/kappa_tilde_top=0.0/kappa_tilde_top=${a2}/" JHUGen.input
	echo "$dir is prepared."
	cd ../
	cd ../../
	cd $output
	rm -rf $dir
	mkdir $dir
	cd ../cards/ttH/
			
done
ls | grep ttH_H4l > ../../dir_tth.txt
cd ../../
echo "the directory list is written into dir_tth.txt "
echo "the condor output will be put in $output "




