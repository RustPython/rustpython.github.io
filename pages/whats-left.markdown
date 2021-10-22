---
layout: whats_left
title:  "What's Left"
date:   2021-03-29 01:45:00 +0900
categories: numbers
---

RustPython currently supports the full Python syntax. This is "what's left" from the Python Standard Library.   
For each module's details, check the [Python Module Index](https://docs.python.org/3/py-modindex.html).

Note that not every module here is critical or feasible for RustPython to implement. For example, the `readline` Python module is heavily based around the API of GNU readline, but we use rustyline (a different readline implementation), so it probably wouldn't be worth the effort to emulate GNU
readline on top of rustyline just to implement an infrequently used module.

In addition, some modules may just be modules written in Python that we haven't copied over to the stdlib yet; always be sure to check whether a module is implemented in Python before trying to rewrite it in Rust. You can follow [these instructions](https://rustpython.github.io/blog/2020/04/04/how-to-contribute-by-cpython-unittest.html#add-a-new-unittest-file) for copying over files from CPython's Lib.