template = """
i = {i}
LIMIT = {LIMIT}
template = {template!r}
if i <= LIMIT:
    print(["{i}", "Fizz", "Buzz", "FizzBuzz"][(i % 3 == 0) + 2 * (i % 5 == 0)].format(i=i))
    exec(template.format(i=i+1, LIMIT=LIMIT, template=template))
"""
exec(template.format(i=1, LIMIT=input(), template=template))
