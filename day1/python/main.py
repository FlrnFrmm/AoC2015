i = open("input.txt").read()

res_1 = sum([1 if c == '(' else -1 for c in i])

print(res_1)

pos = 0
res_2 = 0
for i, c in enumerate(i):
    pos += 1 if c == "(" else -1
    if pos == -1:
        res_2 = i + 1
        break

print(res_2)

     