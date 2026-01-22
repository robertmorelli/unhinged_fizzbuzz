i = 1
LIMIT = input()
template = """
i = {i}
LIMIT = {LIMIT}
template = {template!r}
if i <= LIMIT:
    if i % 15 == 0:
        print("FizzBuzz")
    elif i % 3 == 0:
        print("Fizz")
    elif i % 5 == 0:
        print("Buzz")
    else:
        print(i)

    exec(template.format(i=i+1, LIMIT=LIMIT, template=template))
"""
exec(template.format(i=i, LIMIT=LIMIT, template=template))
