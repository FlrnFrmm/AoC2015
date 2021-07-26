i = open("input.txt").read()

vals = [[int(v) for v in l.split('x')] for l in i.split()]

total_paper = 0
total_ribbon = 0
for a, b, c in vals:
    ab, bc, ac = a * b, b * c, a * c
    total_paper += 2 * ab  + 2 * bc + 2 * ac + min(ab,bc,ac)
    all = [a, b, c]
    all.remove(max(all))
    x, y = all
    total_ribbon += 2 * x + 2 * y + a * b * c

print(total_paper)
print(total_ribbon)