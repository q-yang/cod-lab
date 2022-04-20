# This example demonstrates an implementation of the addition of two
# complex numbers a = 1 + 2i, b = 3 + 4i. And print the result to the console.

.data
ar: .word 1 # Real part of a
ai: .word 2 # Imag. part of a
br: .word 3 # Real part of b
bi: .word 4 # Imag part of b
str: .string " + i* "

.text
main:
