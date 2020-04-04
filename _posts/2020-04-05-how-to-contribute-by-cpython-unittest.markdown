---
layout: post
title:  "How to contribute to RustPython by CPython unittest"
date:   2020-04-05 01:45:00 +0900
categories: guideline
---

At the very end of 2019, we finally reached one of the short-term goals: CPython unittest support. Due to this enhancement, finding CPython compatibility is easier than before.
Probably this will be the major source of contribution spots for the new contributors this year. Here is a simple guideline.

## Fix known compatibility bugs
Let's find an incompatibility issue and fix it.

1. See `Lib/test` directory of the project. There are many `test_` prefixed files like `test_unicode.py`.
2. Try to open one of them. It might look just fine at a glance - but search for `TODO: RUSTPYTHON` in the files. There are tons of skipped, marked as an expected failure or commented out tests.
3. Choose one or two interesting bugs. Remove the test blocker - skip, expectedFailure or comments.
4. Try to fix them.

Here is a quick tip to run single unittest file.

```sh
$ RUSTPYTHONPATH=Lib cargo run --release Lib/test/test_unicode.py
```

## Add a new unittest file
Because CPython unittest is not perfectly working in RustPython, we are doing this one by one with editings.
1. Download CPython source code.
2. Check out a specific version of CPython. For now, 3.8.2 is recommended. (We are testing against CPython 3.8 and 3.8.2 is the most recent version for now)
3. Copy a file from CPython `Lib/test`
4. Commit the file without editing. Specify copied CPython version to commit message.
5. Try to edit it until it runs without a crash or failure.
6. Commit the changes to make it run. This is the core contribution.

Because RustPython is not perfect, "try to edit it until it runs" doesn't mean to make 100% successful running. The common editing methods here:
1. At least it must be able to start to run the test. Fix the test code or bug until it runs at least a single unit of the test. Typically, unimplemented stdlib or missing files of unittest can make issues. Sometimes RustPython bugs make issues too.
2. If any test is not loadable by `SyntaxError`, that part is required to be commented out.
3. If any test leads to a crash of RustPython, this code is not possible to run. Mark the test to skip.
4. If any test is run but fails, this is an incompatibility issue. Mark the test as an expected failure.

We prefer the reversed order of upper methods. The later the more strict so easy to detect any progress or regression.
When we temporarily disable parts of unittest due to RustPython caveats, we mark them to find it out easily later. Please check the examples below or search for `TODO: RUSTPYTHON` in `Lib/test` directory to check actual usage.

Comment out:
```python
# TODO: RUSTPYTHON
#
# def ...  # commented out tests
```

skip:
```python
@unittest.skip("TODO: RUSTPYTHON")
def ...  # skipped tests
```

expectedFailure:
```python
# TODO: RUSTPYTHON
@unittest.expectedFailure
def ...  # failed tests
```

## Development guide
For the general source of the development, please visit the [RustPython development guide](https://github.com/RustPython/RustPython/blob/master/DEVELOPMENT.md)
