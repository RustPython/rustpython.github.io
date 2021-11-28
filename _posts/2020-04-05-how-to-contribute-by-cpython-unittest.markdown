---
layout: post
title:  "How to contribute to RustPython using CPython's unit tests"
date:   2020-04-05 01:45:00 +0900
categories: [guideline, featured]
redirect_from: /guideline/2020/04/04/how-to-contribute-by-cpython-unittest.html
---

At the very end of 2019, we finally reached one of our short-term goals: CPython `unittest` support which makes finding CPython compatibility errors easier than ever.
This will probably be the major source of contributions for new contributors this year. Here is a simple guideline.

## Fix known compatibility bugs
Let's find an incompatibility issue and fix it.
1. Look at the `Lib/test` directory of the project. There are many `test_` prefixed files like `test_unicode.py`.
2. Try to open one of them. It might look just fine at a glance - but search for `TODO: RUSTPYTHON` in the files. There are tons of skipped, marked as an expected failure or commented out tests.
  1. Alternatively, try looking at the [regression test results]({% link pages/regression-tests-results.markdown %}) to find skipped or expected failure tests; some of them have
     notes for a way to resolve the issue.
3. Choose one or two interesting bugs. Remove the test blocker - `skip`, `expectedFailure` or comments.
4. Try to fix them.

Here's how you run a single unittest file:

```
$ RUSTPYTHONPATH=Lib cargo run --release Lib/test/test_unicode.py
```

## Add a new unittest file
Because CPython unittest doesn't work perfectly in RustPython, we are adding test files one by one. Here's how:
1. Download the CPython source code with `git clone https://github.com/python/cpython.git`.
2. Check out a specific version of CPython. We test against CPython 3.8, so the most recent release of 3.8 ([currently 3.8.7](https://www.python.org/doc/versions/)) is recommended.
3. Copy a file from CPython's `Lib/test`
4. Commit the file without editing it. Specify the CPython version you copied from in the commit message.
5. Try to edit it until it runs without a crash or failure.
6. Commit the changes to make it run. This is the core contribution.

Because RustPython is not perfect, "try to edit it until it runs" doesn't mean to make it run 100% of the tests successfully. The common methods to make the test file pass are:
1. It must at least be able to start to run the tests. Fix the test code or bug until it runs at least a single unit of the test. Typically, unimplemented stdlib or missing files in `unittest` can cause issues. Sometimes RustPython bugs cause issues too.
2. If any test can't be loaded because of a `SyntaxError`, you'll have to comment that part out.
3. If any test leads to a crash of RustPython, this code can't be run. Mark the test with `@unittest.skip('TODO: RUSTPYTHON')` to skip it.
4. If any test runs but fails, this is an incompatibility issue. Mark the test as an expected failure with `@unittest.expectedFailure`.

We prefer the reversed order of above methods. The later, the more strict, so it's easier to detect any progress or regression.
When we temporarily disable parts of `unittest` due to RustPython caveats, we mark them to make it easier to find (and re-enable!) them later. Please see the examples below or search for `TODO: RUSTPYTHON` in the `Lib/test` directory to check actual usage.

Comment out:
```python
# TODO: RUSTPYTHON
#
# def ...  # commented out tests
```

`skip`:
```python
@unittest.skip("TODO: RUSTPYTHON")
def ...  # skipped tests
```

`expectedFailure`:
```python
# TODO: RUSTPYTHON
@unittest.expectedFailure
def ...  # failed tests
```

## Development guide
For a general introduction to RustPython development, please visit the [RustPython development guide](https://github.com/RustPython/RustPython/blob/master/DEVELOPMENT.md)
