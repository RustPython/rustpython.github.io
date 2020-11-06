---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
explainer: "CPython is the common implementation of Python. We love C, but we love Rust a little more 😉... that's why we're working on a RustPython, a Python implementation written in Rust. We are doing it for fun, to learn about writing interpreters, and to have a useful, usable and embeddable implementation of Python in Rust."

build-from-source-link: https://github.com/RustPython/RustPython

demo:
 - url: "https://github.com/RustPython/RustPython/blob/master/examples/hello_embed.rs"
   label: 'Hello World!'
 - url: "https://rustpython.github.io/demo/"
   label: 'Online demo running on WebAssembly'

installation:
  - command: "cargo install rustpython"
  - command: "wapm install rustpython"
  - command: "conda install rustpython -c conda-forge"

goals:
  - goal: "Full Python-3 environment entirely in Rust (not CPython bindings) with a clean implementation, without compatiblity hacks. "
  - goal: "Fast, reliable and secure implementation of Python that can be used with Rust or compiled to WebAssembly. "
---

# Why RustPython?

There are many implementations of Python. For example:
- [CPython](https://github.com/python/cpython) (C), which is the most common
- [Jython](https://www.jython.org/) (Java)
- [IronPython](https://ironpython.net/) (.NET)
- [PyPy](https://www.pypy.org/) (Python)  
- [Stackless](http://www.stackless.com/)

Each of these implementations offer some benefits: Jython, for example, compiles Python source code to Java byte code, then routes it to the Java Virtual Machine. Because Python code is translated to Java byte code, it looks and feels like a true Java program at runtime and so it integrates well with Java applications.   

IronPython is well-integrated with .NET, which means IronPython can use the .NET framework and Python libraries or vice versa.

We want to unlock the same possibilities that Jython and IronPython enable, but for the Rust programming language. In addition, thanks to Rusts' minimal runtime, we're able to compile RustPython to WebAssembly and allow users to run their Python code easily in the browser.

Check the "learn more" section for an explainer of all those jargon-y words, or read the blog for more in-depth technical discussion.