// This makes the MS C/C++ vscode extension happy since it would mark
// these things as syntax errors since they are an extension to ANSI-C
#ifndef __VBCC__
  #define __chip
  #define __reg(_)
  #define __far
#endif
