.text
start:
stack:    
    addi a0, zero, 1
    .word 0x51025 # stack.push(a0)
    addi a0, a0, 1
    .word 0x51025 # stack.push(a0)
    addi a0, a0, 1
    .word 0x51025 # stack.push(a0)
    addi a0, a0, 1
    .word 0x51025 # stack.push(a0)
    addi a0, a0, 1
    .word 0x51025 # stack.push(a0)
    addi a0, a0, 1
    .word 0x51025 # stack.push(a0)
    addi a0, a0, 1
    .word 0x51025 # stack.push(a0)
    addi a0, a0, 1
    .word 0x51025 # stack.push(a0)
    addi a0, a0, 1
    .word 0x51025 # stack.push(a0)
    mv a1, zero
    .word 0x1585 # a2 = stack.pop(a1)
    .word 0x1585 # a2 = stack.pop(a1)
    .word 0x1585 # a2 = stack.pop(a1)
    .word 0x1585 # a2 = stack.pop(a1)
    .word 0x1585 # a2 = stack.pop(a1)
    .word 0x1585 # a2 = stack.pop(a1)
    .word 0x1585 # a2 = stack.pop(a1)
    .word 0x1585 # a2 = stack.pop(a1)
    .word 0x1585 # a2 = stack.pop(a1)
    #.word 0x1585 # a2 = stack.pop(a1)
    #addi a0, a0, 5
    #.word 0x51025 # stack.push(a0)
    #addi a1, a1, 1
    #.word 0x1585 # a2 = stack.pop(a1)
stop:
    beq zero, zero, stop


# push: hex(int('000000000000_01010_001_00000_0100101', 2))
# pop : hex(int('000000000000_01011_001_01110_0000101', 2))
# 00000000_00000|101_0|001|0000_0|0100101
#        ?????      r1  f3   ???     op
    
# 00000000_00000|000_0|001|0101_1|0000101
#        ?????    ???   f3   rd     op
