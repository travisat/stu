#ifndef stu_h
#define stu_h

typedef unsigned char uchar;
typedef unsigned int uint;
typedef unsigned long ulong;
typedef unsigned short ushort;

typedef union {
  int i;
  uint ui;
  float f;
  const void *v;
} Arg;

/* function definitions used in config.h */
static void clipcopy(const Arg *);
static void clippaste(const Arg *);
static void kscrolldown(const Arg *);
static void kscrollup(const Arg *);
static void numlock(const Arg *);
static void selpaste(const Arg *);
static void xzoom(const Arg *);
static void xzoomabs(const Arg *);
static void xzoomreset(const Arg *);
static void printsel(const Arg *);
static void printscreen(const Arg *) ;
static void toggleprinter(const Arg *);
static void sendbreak(const Arg *);

#endif
