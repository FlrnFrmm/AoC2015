i = open("input.txt").read()

def check(s):
    vowels = [c for c in s if c in "aeiou"]
    print("Vowel: ", vowels, len(vowels))
    c1 = len(vowels) >= 3

    c2 = False
    for i in range(len(s)-1):
        if s[i] == s[i+1]:
            c2 = True
            break   
    print("Twins: ", c2)

    c3 = False
    for ss in ["ab", "cd", "pq", "xy"]:
        if ss in s:
            print(ss)
            c2 = True
            break   
    print("Bad substring: ", c3)
    return c1 and c2 and not c3

count = 0
for s in i.split():
    print(s)
    if check(s):
        count += 1
    print()

print(count)