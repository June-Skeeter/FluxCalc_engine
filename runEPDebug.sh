# !/bin/bash
rootdir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


if [ -d $rootdir$"/custom/binOut" ]; then
    rm -rf $rootdir$"/custom/binOut"
fi
mkdir $rootdir$"/custom/binOut" 

if [ -d $rootdir$"/tmp" ]; then
    rm -rf $rootdir$"/tmp" 
fi
mkdir $rootdir$"/tmp"

if [ $# -gt 0 ]
  then
    if [ $1 = "make" ]; then
    
        rm -rf $rootdir$"/eddypro-engine/bin" $rootdir$"/eddypro-engine/obj"

        cd $rootdir$"/eddypro-engine/prj"
        make rp
        make fcc
        cp $rootdir$"/7za" $rootdir$"/eddypro-engine/prj/bin"

    fi
fi

cd $rootdir$"/eddypro-engine"

# $rootdir$"/eddypro-engine/bin/linux/eddypro_rp" -s linux $rootdir$"/custom/BinTest_linux.eddypro"


$rootdir$"/eddypro-engine/bin/linux/eddypro_rp" -s linux $rootdir$"/custom/SCL_mod_mini.eddypro"



