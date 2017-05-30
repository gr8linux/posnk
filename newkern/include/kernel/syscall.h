/**
 * kernel/syscall.h
 *
 * Part of P-OS kernel.
 *
 * Written by Peter Bosch <peterbosc@gmail.com>
 *
 * Changelog:
 * 07-04-2014 - Created
 */

#ifndef __KERNEL_SYSCALL_H__
#define __KERNEL_SYSCALL_H__
#include <stddef.h>
#include <stdint.h>
#include "kernel/scheduler.h"
#include "kernel/syscall_ids.h"

typedef uint32_t (*syscall_func_t)(uint32_t[4], uint32_t[4]);

void syscall_init();
void syscall_register(int call_id, syscall_func_t func);
void syscall_dispatch(void *user_param_block, void *instr_ptr);
int copy_user_to_kern(void *src, void *dest, size_t size);
int copy_kern_to_user(void *src, void *dest, size_t size);


uint32_t sys_fork(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_kill(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_getpid(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_getppid(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_getpgrp(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_setsid(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_exit(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_yield(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_sbrk(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_getuid(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_geteuid(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_getgid(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_getegid(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_link(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_unlink(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_chdir(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_chmod(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_chown(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_mknod(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_mkdir(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_stat(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_fchdir(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_fchmod(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_fchown(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_fstat(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_dup2(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_dup(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_open(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_close(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_pipe2(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_pipe(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_read(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_write(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_lseek(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_rmdir(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_execve(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_waitpid(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_fcntl(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_umask(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_readlink(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_lstat(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_symlink(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_getdents(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_ioctl(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_getsid(__attribute__((__unused__)) uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_setpgrp(__attribute__((__unused__)) uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_setpgid(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_time(__attribute__((__unused__)) uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_usleep(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_sleep(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_stime(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_setuid(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_setgid(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_signal(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_exitsig(__attribute__((__unused__)) uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_sigprocmask(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_ssigex(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_dbgdrop(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_mount(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_ftruncate(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_truncate(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_mmap(__attribute__((__unused__)) uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_shmat(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_shmdt(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_shmctl(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_shmget(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_semop(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_semctl(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_semget(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_msgrcv(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_msgsnd(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_msgctl(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_msgget(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_chroot(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_sync( __attribute__((__unused__)) uint32_t param[4],  __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_readdir(uint32_t param[4], uint32_t param_size[4]);

uint32_t sys_poll(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_sigaction(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_sigaltstack(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_sigsuspend(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_sigpending(uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4]);

uint32_t sys_uname( uint32_t param[4], __attribute__((__unused__)) uint32_t param_size[4] );

#endif
