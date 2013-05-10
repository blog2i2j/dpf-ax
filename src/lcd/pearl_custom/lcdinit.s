	.include 'dpf.inc'

	.area LCDAUX (CODE)

_lcd_custom_init::
	mov	dptr,#_custom_initseq
	ljmp	_lcd_init_by_table

_lcd_custom_setcontrast::
	ljmp	_lcd_set_contrast_by_table

_lcd_custom_setbacklight::
	mov	a,r3
	jnz	doset
	ret
doset:
       	mov	a,#0x15
	clr	c
	subb	a,r3
	mov	b,#0xb4
	mul	ab
	mov	tmr1perl,#0xff
	mov	tmr1perh,#0xf
	mov	tmr1pwml,a
	mov	tmr1pwmh,b
	ret
;
	.area LCDAUX (CODE)

_custom_contrasttbl::
  .db  0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10
_custom_contrasttbl_len::  .db  7

_custom_contrasttbl2::
  .db  0x71, 0x00, 0x71, 0x00, 0x91, 0x00, 0x91, 0x00, 0xff
_custom_contrasttbl2_len::  .db  9

_custom_contrasttbl2_offsets::
  .db  0x07
_custom_contrasttbl2_offsets_len::  .db  1

;
; not used
;
;_custom_backlighttbl::
;  .db  0x02, 0x0a, 0x14, 0x1e, 0x28, 0x32, 0x3c, 0x46, 0x50, 0x5a
;  .db  0x64, 0x6e, 0x78, 0x82, 0x8c, 0x96, 0xa0, 0xb4, 0xc8, 0xdc
;  .db  0xf0, 0xfa
;_custom_backlighttbl_len::  .db  22
;
;_custom_backlighttbl2::
;_custom_backlighttbl2_len::  .db  0
;

_custom_initseq::
  .db  0x00, 0xb0, 0x64, 0x11, 0xb0, 0x0a, 0x10, 0xb0, 0x64, 0x11
  .db  0xb0, 0xff, 0x72, 0x00, 0xe3, 0x92, 0x30, 0x08, 0x72, 0x00
  .db  0xe7, 0x92, 0x00, 0x12, 0x72, 0x00, 0xef, 0x92, 0x12, 0x31
  .db  0x72, 0x00, 0x01, 0x92, 0x01, 0x00, 0x72, 0x00, 0x02, 0x92
  .db  0x07, 0x00, 0x72, 0x00, 0x03, 0x92, 0x10, 0xa8, 0x72, 0x00
  .db  0x04, 0x92, 0x00, 0x00, 0x72, 0x00, 0x08, 0x92, 0x02, 0x07
  .db  0x72, 0x00, 0x09, 0x92, 0x00, 0x00, 0x72, 0x00, 0x0a, 0x92
  .db  0x00, 0x00, 0x72, 0x00, 0x0c, 0x92, 0x00, 0x00, 0x72, 0x00
  .db  0x0d, 0x92, 0x00, 0x00, 0x72, 0x00, 0x0f, 0x92, 0x00, 0x00
  .db  0x72, 0x00, 0x10, 0x92, 0x00, 0x00, 0x72, 0x00, 0x11, 0x92
  .db  0x00, 0x07, 0x72, 0x00, 0x12, 0x92, 0x00, 0x00, 0x72, 0x00
  .db  0x13, 0x92, 0x00, 0x00, 0xb0, 0xc8, 0x72, 0x00, 0x10, 0x92
  .db  0x14, 0x90, 0xb0, 0x64, 0x72, 0x00, 0x11, 0x92, 0x02, 0x25
  .db  0xb0, 0x64, 0x72, 0x00, 0x12, 0x92, 0x00, 0x1d, 0xb0, 0x64
  .db  0x72, 0x00, 0x13, 0x92, 0x18, 0x00, 0xb0, 0x64, 0x72, 0x00
  .db  0x29, 0x92, 0x00, 0x0f, 0xb0, 0x64, 0x72, 0x00, 0x2b, 0x92
  .db  0x00, 0x0d, 0xb0, 0x64, 0x72, 0x00, 0x20, 0x92, 0x00, 0x00
  .db  0x72, 0x00, 0x21, 0x92, 0x00, 0x00, 0x72, 0x00, 0x30, 0x92
  .db  0x00, 0x07, 0x72, 0x00, 0x31, 0x92, 0x03, 0x07, 0x72, 0x00
  .db  0x32, 0x92, 0x00, 0x06, 0x72, 0x00, 0x35, 0x92, 0x03, 0x04
  .db  0x72, 0x00, 0x36, 0x92, 0x03, 0x04, 0x72, 0x00, 0x37, 0x92
  .db  0x00, 0x04, 0x72, 0x00, 0x38, 0x92, 0x00, 0x00, 0x72, 0x00
  .db  0x39, 0x92, 0x03, 0x06, 0x72, 0x00, 0x3c, 0x92, 0x03, 0x01
  .db  0x72, 0x00, 0x3d, 0x92, 0x00, 0x01, 0x72, 0x00, 0x50, 0x92
  .db  0x00, 0x00, 0x72, 0x00, 0x51, 0x92, 0x00, 0xef, 0x72, 0x00
  .db  0x52, 0x92, 0x00, 0x00, 0x72, 0x00, 0x53, 0x92, 0x01, 0x3f
  .db  0x72, 0x00, 0x60, 0x92, 0xa7, 0x00, 0x72, 0x00, 0x61, 0x92
  .db  0x00, 0x01, 0x72, 0x00, 0x6a, 0x92, 0x00, 0x00, 0x72, 0x00
  .db  0x80, 0x92, 0x00, 0x00, 0x72, 0x00, 0x81, 0x92, 0x00, 0x00
  .db  0x72, 0x00, 0x82, 0x92, 0x00, 0x00, 0x72, 0x00, 0x83, 0x92
  .db  0x00, 0x00, 0x72, 0x00, 0x84, 0x92, 0x00, 0x00, 0x72, 0x00
  .db  0x85, 0x92, 0x00, 0x00, 0x72, 0x00, 0x07, 0x92, 0x01, 0x33
  .db  0xb0, 0x64, 0xff
_custom_initseq_len::  .db  323
