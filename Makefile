#
# 'make depend' uses makedepend to automatically generate dependencies 
#               (dependencies are added to end of Makefile)
# 'make'        build executable file 'mycc'
# 'make clean'  removes all .o and executable files
#
export
CROSS_COMPILE = i386-pc-posnk-
ARCH = i386
BUILDDIR = ./

# define the C compiler to use
CC   = @echo " [   CC    ]	" $< ; $(CROSS_COMPILE)gcc
LD   = @echo " [   LD    ]	" $@ ; $(CROSS_COMPILE)gcc
RLD  = @echo " [   LD    ]	" $@ ; $(CROSS_COMPILE)ld
CPP  = @echo " [   CPP   ]	" $@ ; $(CROSS_COMPILE)cpp
OCP  = @echo " [ OBJCPY  ]	" $@ ; $(CROSS_COMPILE)objcopy
M4   = @echo " [   M4    ]	" $@ ; m4
GAS  = @echo " [   AS    ]	" $@ ; $(CROSS_COMPILE)gcc
NASM = @echo " [  NASM   ]	" $< ; nasm
HCC  = @echo " [ HOSTCC  ]	" $< ; gcc
HLD  = @echo " [ HOSTLD  ]	" $@ ; gcc
HCPP = @echo " [ HOSTCPP ]	" $@ ; cpp
HGAS = @echo " [ HOSTAS  ]	" $@ ; as

# define any compile-time flags
CFLAGS = -Wall -g -Wextra -fno-exceptions -ffreestanding -fno-omit-frame-pointer -finline-functions -finline-functions-called-once -fauto-inc-dec

HCFLAGS = -Wall -g -Wextra -DHOSTED_TEST -include hostedtest.h -mno-tbm -D_FILE_OFFSET_BITS=64

NASMFLAGS = -w+orphan-labels -felf -g

GASFLAGS = -g

# define any directories containing header files other than /usr/include
#
INCLUDES = -I./include -I./include/crt

HINCLUDES = -I./include -I./include/hcrt

# define library paths in addition to /usr/lib
#   if I wanted to include libraries not in /usr/lib I'd specify
#   their path using -Lpath, something like:
LFLAGS = -g -ffreestanding -O2 -nostdlib -static-libgcc
A7LFLAGS = -g -ffreestanding -O2 -nostdlib -static-libgcc

HLFLAGS = -g -lfuse

# define any libraries to link into executable:
#   if I want to link in libraries (libx.so or libx.a) I use the -llibname 
#   option, something like (this will link in libmylib.so and libm.so:
LIBS = 

SRCS_PHEAPMM = kernel/heapmm.c

SRCS_DLHEAPMM = kernel/dlmalloc.c \
		kernel/dlheapmm.c

# define the C source files
SRCS = kernel/physmm.c \
kernel/paging.c \
kernel/blkcache.c \
kernel/earlycon.c \
kernel/exception.c \
kernel/interrupt.c \
kernel/scheduler.c \
kernel/synch.c \
kernel/process.c \
kernel/signal.c \
kernel/procvmm.c \
kernel/permissions.c \
kernel/blkdev.c \
kernel/chardev.c \
kernel/tty.c \
kernel/pipe.c \
kernel/vfs/icache.c \
kernel/vfs/dcache.c \
kernel/vfs/ifswrap.c \
kernel/vfs/pathres.c \
kernel/vfs/perm.c \
kernel/vfs/ifsmgr.c \
kernel/vfs/mount.c \
kernel/vfs.c \
kernel/elfloader.c \
kernel/tar.c \
kernel/version.c \
kernel/syscall.c \
kernel/streams.c \
kernel/ipc.c \
kernel/shm.c \
kernel/sem.c \
kernel/msg.c \
kernel/time.c \
kernel/exec.c \
kernel/drivermgr.c \
kernel/sc_process.c \
kernel/sc_perm.c \
kernel/sc_vfs.c \
kernel/sc_ipc.c \
kernel/sc_streams.c \
kernel/sc_time.c \
kernel/sc_signals.c \
kernel/shutdown.c \
kdbg/heapdbg.c \
kdbg/taskdbg.c \
kdbg/kdbg.c \
kdbg/kdbgio.c \
kdbg/kdbgmm.c \
kdbg/stacktrc.c \
fs/mbr.c \
util/llist.c \
util/mruc.c \
crt/string.c \
crt/stdlib.c 

TEST_FS_SRCS = tests/fs/mm.c \
tests/fs/synch.c \
tests/fs/sched.c \
tests/fs/img.c \
tests/fs/fuse.c \
kernel/vfs/icache.c \
kernel/vfs/dcache.c \
kernel/vfs/ifswrap.c \
kernel/vfs/pathres.c \
kernel/vfs/perm.c \
kernel/vfs/ifsmgr.c \
kernel/vfs/mount.c \
kernel/blkcache.c \
kernel/blkdev.c \
kernel/chardev.c \
kernel/permissions.c \
kernel/time.c \
kernel/vfs.c \
kernel/pipe.c \
kernel/streams.c \
kernel/sc_vfs.c \
tests/fs/main.c \
kernel/drivermgr.c \
util/mruc.c \
util/llist.c

TEST_MRUC_SRCS = tests/test_mruc.c \
util/llist.c \
util/mruc.c


SRCS_TESTERROR = tests/test_error.c

TESTSRCS = tests/test_heapmm.c tests/test_physmm.c

# define the C object files 
#
# This uses Suffix Replacement within a macro:
#   $(name:string1=string2)
#         For each word in 'name' replace 'string1' with 'string2'
# Below we are replacing the suffix .c of all words in the macro SRCS
# with the .o suffix
#

include arch/$(ARCH)/Makefile

OBJS          = $(addprefix $(BUILDDIR),$(SRCS:.c=.o))
OBJS_DRIVER   = $(addprefix $(BUILDDIR),$(SRCS_DRIVER:.c=.o))
OBJS_DLHEAPMM = $(addprefix $(BUILDDIR),$(SRCS_DLHEAPMM:.c=.o))

$(OBJS): $(BUILDDIR)%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(OBJS_DLHEAPMM): $(BUILDDIR)%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(OBJS_PHEAPMM): $(BUILDDIR)%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

OBJS_KERN = $(BUILDDIR)arch/$(ARCH).o $(OBJS) $(OBJS_DLHEAPMM) $(OBJS_DRIVER)

#install_h 

$(BUILDDIR):
	find -type d -links 2 -exec mkdir -p "$(BUILDDIR){}" \;

.PHONY: depend clean

default: default_$(ARCH)

all:	default 

$(BUILDDIR)_dmake: $(BUILDDIR) build/driverinit.c build/drivermake.m4 fs/fs.list
	$(M4) -I . build/drivermake.m4 > $(BUILDDIR)_dmake
	$(CPP) -I . build/driverinit.c > $(BUILDDIR)_dinit.c

include $(BUILDDIR)_dmake

$(OBJS_DRIVER): $(BUILDDIR)%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILDDIR)vmpos: $(BUILDDIR)_dmake $(OBJS_KERN)
	$(LD) $(LFLAGS) $(LIBS) -T arch/$(ARCH)/kern.ld -o $@ $(OBJS_KERN)
	@rm $(BUILDDIR)_dmake $(BUILDDIR)kernel/version.o

install_h:
	@cp include/crt/sys/ioctl.h ../nkgcc/newlib-2.1.0/newlib/libc/sys/posnk/sys/ioctl.h
	@cp include/crt/sys/termios.h ../nkgcc/newlib-2.1.0/newlib/libc/sys/posnk/sys/termios.h
	@cp include/crt/sys/mman.h ../nkgcc/newlib-2.1.0/newlib/libc/sys/posnk/sys/mman.h
	@cp include/crt/sys/ipc.h ../nkgcc/newlib-2.1.0/newlib/libc/sys/posnk/sys/ipc.h
	@cp include/crt/sys/shm.h ../nkgcc/newlib-2.1.0/newlib/libc/sys/posnk/sys/shm.h
	@cp include/crt/sys/sem.h ../nkgcc/newlib-2.1.0/newlib/libc/sys/posnk/sys/sem.h
	@cp include/crt/sys/msg.h ../nkgcc/newlib-2.1.0/newlib/libc/sys/posnk/sys/msg.h
	@cp include/crt/linux/input.h ../gcc_posnk/i386-pc-posnk/include/linux/


#test_heapmm: $(OBJS) tests/test_heapmm.o
#	$(CC) $(CFLAGS) $(INCLUDES) -o test_heapmm $(OBJS) tests/test_heapmm.o $(LFLAGS) $(LIBS)

#test_physmm: $(OBJS) tests/test_physmm.o
#	$(CC) $(CFLAGS) $(INCLUDES) -o test_physmm $(OBJS) tests/test_physmm.o $(LFLAGS) $(LIBS)

# this is a suffix replacement rule for building .o's from .c's
# it uses automatic variables $<: the name of the prerequisite of
# the rule(a .c file) and $@: the name of the target of the rule (a .o file) 
# (see the gnu make manual section about automatic variables)

clean: clean_driver
	@$(RM) *.o *~ $(MAIN)
	@$(RM) fs/*.o
	@$(RM) kernel/vfs/*.o
	@$(RM) kdbg/*.o
	@$(RM) kernel/*.o
	@$(RM) driver/console/*.o
	@$(RM) driver/bus/*.o
	@$(RM) arch/i386/*.o
	@$(RM) arch/armv7/*.o
	@$(RM) arch/armv7/*.so
	@$(RM) arch/armv7/*.ao
	@$(RM) arch/armv7/*.bo
	@$(RM) arch/armv7/loader/*.o
	@$(RM) arch/armv7/loader/*.so
	@$(RM) arch/armv7/loader/*.ao
	@$(RM) *.bo
	@$(RM) util/*.o
	@$(RM) crt/*.o
	@rm _dmake
	@rm loader_armv7*

clean_test:
	$(RM) test/fs/*.ho
	$(RM) fs/*.ho
	$(RM) kernel/*.ho
	$(RM) kernel/vfs/*.ho
	$(RM) driver/console/*.ho
	$(RM) driver/bus/*.ho
	$(RM) arch/i386/*.ho

depend: $(SRCS) $(TESTSRCS) $(SRCS_I386)
	makedepend $(INCLUDES) $^

# DO NOT DELETE THIS LINE -- make depend needs it

