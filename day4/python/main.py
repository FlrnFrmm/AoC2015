from hashlib import md5

i = open("input.txt").read()

counter = 0
res = md5(bytes(f"{i}{counter}".encode())).hexdigest()
while res[:6] != "0" * 6:
    counter += 1
    res = md5(bytes(f"{i}{counter}".encode())).hexdigest()

print(res)
print(counter)