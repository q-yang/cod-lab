# Use ecall to print
# = poor man's debugger

.data
str: .string "hello, world!"

.text
li a0, 42
li a7, 1
ecall     # prints "42" to console

li a7, 11
ecall     # prints "*" to console (ASCII(42) = '*')

la a0, str
li a7, 4
ecall     # Prints "hello, world!" to console