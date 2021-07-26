i = open("input.txt").read()

def move(x, y, d):
    if c == '^':
        y += 1 
    if c == '>':
        x += 1 
    if c == 'v':
        y -= 1 
    if c == '<':
        x -= 1 
    return (x, y)

def visit(x, y, houses):
    house_id = f"{x}|{y}"
    if house_id in houses:
        houses[house_id] += 1
    else:
        houses[house_id] = 1


houses = {"0|0": 1}

x, y = 0, 0
rx, ry = 0, 0
for j, c in enumerate(i):
    if j % 2 == 0:
        x, y = move(x, y, c)
        visit(x, y, houses)
    else:
        rx, ry = move(rx, ry, c)
        visit(rx, ry, houses)

print(houses.keys())
print(len(houses.keys()))