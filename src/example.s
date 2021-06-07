  XDEF _wait_mouse1
  XDEF _wait_esc

ciasdr EQU $0C00
CIAA   EQU $bfe001

  section    code

_wait_esc:
  move.l     d1,-(sp)
.l:
  move.b     CIAA+ciasdr,d1
  ror.b      #1,d1
  not.b      d1
  cmp.b      #$45,d1
  bne        .l
  movem.l    (sp)+,d1
  rts

_wait_mouse1:
  btst       #6,CIAA
  bne        _wait_mouse1
  rts

  end
