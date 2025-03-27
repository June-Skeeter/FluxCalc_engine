# !/bin/bash
mypath=$(pwd)
inipath=$mypath$"/custom/BinTest_linux.eddypro"
rppath=$mypath$"/eddypro-engine/bin/linux/eddypro_rp"

if [ -d ./custom/binOut ]; then
    rm -rf custom/binOut 
    mkdir custom/binOut
else
    mkdir custom/binOut
fi

if [ -d ./tmp ]; then
    rm -rf tmp 
fi
mkdir tmp

cd $mypath$"/eddypro-engine/prj"
rm -rf ../bin ../obj
make rp
cd ../
$rppath -s linux $inipath

