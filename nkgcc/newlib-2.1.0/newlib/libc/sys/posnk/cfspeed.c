/**
 * sys/cfspeed.c
 *
 * Part of P-OS.
 *
 * Except where otherwise specified, this file is POSIX compliant,
 * for now there is no support for the SysV termio API, but that 
 * might be added later on, should the need arise.
 * 
 * Written by Peter Bosch <peterbosc@gmail.com>
 *
 * Changelog:
 * 16-05-2014 - Created
 */

#include <errno.h>
#include <sys/types.h>
#include <sys/termios.h>

speed_t cfgetispeed(const struct termios *t)
{
	return t->c_ispeed;
}

speed_t cfgetospeed(const struct termios *t)
{
	return t->c_ospeed;
}

int     cfsetispeed(struct termios *t, speed_t s)
{
	t->c_ispeed = s;
	return 0;
}

int     cfsetospeed(struct termios *t, speed_t s)
{
	t->c_ospeed = s;
	return 0;
}