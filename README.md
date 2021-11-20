export SCRAM_ARCH=slc7_amd64_gcc700
cmsrel CMSSW_10_6_0
cd CMSSW_10_6_0/src/
cmsenv
git clone git@github.com:cms-sw/genproductions.git genproductions
cd genproductions/bin/JHUGen/
cp /afs/cern.ch/user/r/repan/public/gridpack/install.py .
#edit card file inside the "cards" directory
cd cards
cp -r /afs/cern.ch/user/r/repan/public/gridpack/tHW/ .
cd tHW/
source sample_dir.sh
cp -r /afs/cern.ch/user/r/repan/public/gridpack/condor_thw
cd condor_thw
voms-proxy-init --voms cms -valid 192:00 -out ~/temp/x509up 
#enter grid passwod
condor_submit condor.sub
cd ../
#wati until task finished in condor
cp /afs/cern.ch/user/r/repan/public/gridpack/get_cs.sh .
source get_cs.sh
#some useful code is avaible in my lxplus public
#directory: /afs/cern.ch/user/r/repan/public/gridpack



