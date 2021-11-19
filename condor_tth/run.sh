#!/bin/bash
#voms-proxy-init --voms cms -valid 192:00 -out ~/temp/x509up
# sumbit asssinment: condor_submit condor.sub
#source /cvmfs/sft.cern.ch/lcg/app/releases/ROOT/6.18.04/x86_64-centos7-gcc48-opt/bin/thisroot.sh
cd /afs/cern.ch/user/y/yuekai/gridpack/CMSSW_10_6_0/src/genproductions/bin/JHUGen/
eval `scramv1 runtime -sh`
./install.py --card cards/ttH/$1/JHUGen.input --name $1 --force



