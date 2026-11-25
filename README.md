# unhinged_fizzbuzz

A collection of unnecessarily cursed FizzBuzz implementations.

## Implementations

- [`mips/branchless.s`](mips/branchless.s) — Self-modifying MIPS assembly. No branches, no flags, no jump tables, no calls, no stack. Requires MARS with self-modifying code enabled (developed with [robertmorelli.mips-assembly](https://marketplace.visualstudio.com/items?itemName=robertmorelli.mips-assembly)).
- [`python/brine.py`](python/brine.py) — Quine-style self-evaluating `exec` loop.
- [`python/dict.py`](python/dict.py) — Single-expression dict overwrite using `zip` and stepped ranges.
- [`js/timers.js`](js/timers.js) — Racing `setTimeout` timers at 1x, 3x, 5x, and 15x intervals.
- [`sh/coreutils.sh`](sh/coreutils.sh) — GNU coreutils pipeline using `yes`, `nl`, and `sed`.

## Honorable mention

- [Fizz Buzz with Cosines](https://susam.net/fizz-buzz-with-cosines.html)
