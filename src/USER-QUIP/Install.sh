# Install/unInstall package files in LAMMPS
# edit 2 Makefile.package files to include/exclude QUIP info

if (test $1 = 1) then

  if (test -e ../Makefile.package) then
    sed -i -e 's/[^ \t]*quip[^ \t]* //' ../Makefile.package
    sed -i -e 's|^PKG_INC =[ \t]*|&-I../../lib/quip |' ../Makefile.package
    sed -i -e 's|^PKG_PATH =[ \t]*|&-L../../lib/quip |' ../Makefile.package
#    sed -i -e 's|^PKG_LIB =[ \t]*|&-lquip |' ../Makefile.package
    sed -i -e 's|^PKG_SYSINC =[ \t]*|&$(quip_SYSINC) |' ../Makefile.package
    sed -i -e 's|^PKG_SYSLIB =[ \t]*|&$(quip_SYSLIB) |' ../Makefile.package
    sed -i -e 's|^PKG_SYSPATH =[ \t]*|&$(quip_SYSPATH) |' ../Makefile.package
  fi

  if (test -e ../Makefile.package.settings) then
    sed -i -e '/^include.*quip.*$/d' ../Makefile.package.settings
    # multiline form needed for BSD sed on Macs
    sed -i -e '4 i \
include ..\/..\/lib\/quip\/Makefile.lammps\
' ../Makefile.package.settings
  fi

  cp pair_quip.cpp ..

  cp pair_quip.h ..

elif (test $1 = 0) then

  if (test -e ../Makefile.package) then
    sed -i -e 's/[^ \t]*quip[^ \t]* //' ../Makefile.package
  fi

  if (test -e ../Makefile.package.settings) then
    sed -i -e '/^include.*quip.*$/d' ../Makefile.package.settings
  fi

  rm -f ../pair_quip.cpp
  rm -f ../pair_quip.h

fi
