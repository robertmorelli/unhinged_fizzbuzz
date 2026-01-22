t = """
t = {t!r}
n = {n}
i = {i}
if i <= n:
    print(["{i}", "Fizz", "Buzz", "FizzBuzz"][(i % 3 == 0) + 2 * (i % 5 == 0)].format(i=i))
    exec(t.format(t=t, n=n, i=i+1))
"""
exec(t.format(t=t, n=input(), i=1))
