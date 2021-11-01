---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
explainer:
  RustPython is a Python interpreter written in Rust. RustPython can be
  embedded into Rust programs to use Python as a scripting language for your
  application, or it can be compiled to WebAssembly in order to run Python
  in the browser. RustPython is free and open-source under the MIT license.

build-from-source-link: https://github.com/RustPython/RustPython

demo:
 - url: "https://github.com/RustPython/RustPython/blob/master/examples/hello_embed.rs"
   label: 'Hello World!'
 - url: "https://rustpython.github.io/demo/"
   label: 'Online demo running on WebAssembly'
 - url: "https://rustpython.github.io/demo/notebook"
   label: 'Notebook'

installation:
  - command: "cargo install rustpython"
  - command: "wapm install rustpython"
  - command: "conda install rustpython -c conda-forge"

goals:
  - goal:
      Full Python 3 environment entirely in Rust (not CPython bindings), with
      a clean implementation and no compatiblity hacks.
    # TODO: integrate this into the "goals" boxes
    progress:
      # TODO: actually measure how much of the test suite we run
      RustPython can currently run a little less than half of the CPython
      regression test suite, and our API is relatively unstable and
      doesn't require decades of backwards-compatibility.
  - goal:
      Fast, reliable and secure implementation of Python that can be used
      from Rust or compiled to WebAssembly.
    progress:
      RustPython currently runs about 10 times slower than CPython, but there's
      still lots of optimizations to be made. RustPython can be easily embedded
      into Rust programs simply by adding a line to Cargo.toml, and natively
      supports WebAssembly; see our demo above.
---

# Why RustPython?

There are many implementations of Python. For example:
- [CPython](https://github.com/python/cpython) (C), which is the most common
- [Jython](https://www.jython.org/) (Java)
- [IronPython](https://ironpython.net/) (.NET)
- [PyPy](https://www.pypy.org/) (Python)  
- [Stackless](http://www.stackless.com/)

Each of these implementations offer some benefits: Jython, for example, compiles Python 2 source code to Java byte code, then routes it to the Java Virtual Machine. Because Python code is translated to Java bytecode, it looks and feels like a true Java program at runtime and so it integrates well with Java applications.   

IronPython is well-integrated with .NET, which means IronPython can use the .NET framework and Python 2 libraries or vice versa.

We want to unlock the same possibilities that Jython and IronPython enable, but for the Rust programming language. In addition, thanks to Rusts' minimal runtime, we're able to compile RustPython to WebAssembly and allow users to run their Python code easily in the browser.
