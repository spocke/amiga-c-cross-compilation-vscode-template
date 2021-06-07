#include "includes/vbcc.h"
#include <stdio.h>
#include <clib/debug_protos.h>

extern void wait_mouse1();
extern void wait_esc();

int main(int argc, char **argv) {
  printf("Hello world!\n");
  kprintf("Hello world! Though the serial port.\n");
  printf("Press mouse button to close FS-UAE\n");
  wait_mouse1();
  return 0;
}