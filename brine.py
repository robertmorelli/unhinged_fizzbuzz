from sys import executable
from subprocess import run

i = 1
LIMIT = 16

template = """
from sys import executable
from subprocess import run

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

    run([executable, "-"], input=template.format(i=i+1, LIMIT=LIMIT, template=template), text=True)
"""

run([executable, "-"], input=template.format(i=i, LIMIT=LIMIT, template=template), text=True)
