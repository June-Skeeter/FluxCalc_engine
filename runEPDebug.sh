#!/bin/bash
cd ./eddypro-engine/prj
rm -rf ../bin ../obj
make rp
cd ../../
./eddypro-engine/bin/linux/eddypro_rp -s linux /mnt/c/Users/User/EP_API_Test/custom/BinTest_linux.eddypro
