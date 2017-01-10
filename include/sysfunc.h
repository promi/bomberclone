/* $Id: sysfunc.h,v 1.10 2015/07/10 21:59:37 steffen Exp $ */
/* include some system near functions */

#ifndef _SYSFUNC_H_
#define _SYSFUNC_H_

#define MAX_DIRENTRYS 1024

#include <math.h>

enum _dirflags
{
  DF_dir  = 1,
  DF_file = 2
};

enum _dirbitmask   			  // bit mask for the directions
{
  DIRM_left = 1,
  DIRM_right = 2,
  DIRM_up = 4,
  DIRM_down = 8,
  DIRM_under = 16
};

struct __direntry
{
  unsigned char flags;
  char name[LEN_FILENAME];
  struct __direntry *next;
} typedef _direntry;

extern void s_delay (int ms);
extern int s_fetchevent (SDL_Event *event);
extern int s_random (int maxnr);
extern char *s_gethomedir ();
extern int s_countbits (int nbomb, int nr);
extern char* getfilename(char* path);

extern Sint16 s_swap16 (Sint16 i);
extern Sint32 s_swap32 (Sint32 i);

extern _direntry *s_getdir (char *path);
extern _direntry *s_dirfilter (_direntry *dirstart, signed char dirflags);

#ifndef HAVE_POWF
#define powf(__x,__y) ((float)pow((double)__x,(double)__y))
#endif

#ifndef HAVE_SQRTF
#define sqrtf(__x) ((float)sqrt((double)__x))
#endif

#ifndef HAVE_RINTF
#ifndef HAVE_RINT
extern float rintf (float f);
#else
#define rintf(__x) ((float)rint(double)__x)
#endif
#endif

#ifndef HAVE_FLOORF
#define floorf(__x) ((float)floor((double)__x))
#endif

/*
 * somehow this works..
 * something missing in the stdarg.h file?
 */
#ifndef HAVE_VSNPRINTF
#define vsnprintf _vsnprintf
#endif

extern void s_calctimesync ();
extern void rect_clipping (SDL_Rect *src, SDL_Rect *dest, SDL_Rect *window,
                           SDL_Rect *csrc, SDL_Rect *cdest);
extern void charlist_fillarraypointer (_charlist *list, int c);
extern _charlist *charlist_findtext (_charlist *list, char *text);
extern float absol(float f);

#endif
