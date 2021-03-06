/**
 * kernel/synch.h
 *
 * Part of P-OS kernel.
 *
 * Written by Peter Bosch <peterbosc@gmail.com>
 *
 * Changelog:
 * 07-04-2014 - Created
 */

#ifndef __KERNEL_SYNCH_H__
#define __KERNEL_SYNCH_H__

#include <stddef.h>
#include <stdint.h>

#include "kernel/time.h"

typedef uint32_t semaphore_t;

typedef volatile int spinlock_t;

int spinlock_enter( spinlock_t *lock );

void spinlock_exit( spinlock_t *lock, int s );

int enable(void);

int disable(void);

void restore( int );

void semaphore_up(semaphore_t *semaphore);

void semaphore_add(semaphore_t *semaphore, unsigned int n);

int semaphore_down(semaphore_t *semaphore);

int semaphore_idown(semaphore_t *semaphore);

int semaphore_tdown(semaphore_t *semaphore, ktime_t seconds);

int semaphore_mdown(semaphore_t *semaphore, ktime_t micros);

/* FOR INTERNAL USE BY SCHEDULER ONLY */
int  semaphore_try_down(semaphore_t *semaphore);

semaphore_t *semaphore_alloc();

void semaphore_free(semaphore_t *semaphore);

#endif
