cmd_libbb/xgethostbyname.o := i386-pc-posnk-gcc -Wp,-MD,libbb/.xgethostbyname.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG  -D"BB_VER=KBUILD_STR(1.22.1)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -g -O0  -march=i386 -mpreferred-stack-boundary=2    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(xgethostbyname)"  -D"KBUILD_MODNAME=KBUILD_STR(xgethostbyname)" -c -o libbb/xgethostbyname.o libbb/xgethostbyname.c

deps_libbb/xgethostbyname.o := \
  libbb/xgethostbyname.c \

libbb/xgethostbyname.o: $(deps_libbb/xgethostbyname.o)

$(deps_libbb/xgethostbyname.o):