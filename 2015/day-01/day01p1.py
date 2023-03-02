with open('input.txt') as f:
    instructions = f.read().strip()

floor = 0
for i in range(len(instructions)):
    if instructions[i] == '(':
        floor += 1
    else:
        floor -= 1

print("Santa ended up on floor:", floor)
