Anw01: ldr R0, =VariableA
R0: bekommt die Adresse von VariableA  (0x200000C).
R2, R3: da ändert sich nix
 es wird nix gespeichert.

Anw02: ldrb R2, [R0]
R2: er bekommt das erste Byte von VariableA (0xEF)
R0, R3: da ändert sich nix
es wird nix gespeichert.


Anw03: ldrb R3, [R0, #1]
R3: er bekommt das zweite Byte von VariableA (0xBE)
R0, R2: da ändert sich nix
es wird nix gespeichert.


Anw04: lsl R2, #8
R2: es geht um 8 Bit nach links, das heißt (0xEF) → (0xEF00)
R0, R3:da ändert sich nix
es wird nix gespeichert.


Anw05: orr R2, R3
R2: es werden R2 und R3 zusammen kombiniert  (0xEF) und (0xEF00)  = 0xEFBE
R0, R3:da ändert sich nix
es wird nix gespeichert.


Anw06: strh R2, [R0]
Speicher: 0xEFBE wird an Adresse VariableA geschrieben


