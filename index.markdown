---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
explainer: "CPython is the reference implementation of Python. We love C, but we love Rust a little more 😉... that's why we are creating a Rust Implementation of Python. We are doing it for fun, to learn and to have a useful + usable and maybe a better implementation of Python in Rust."

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

There are many implementation of Python. For example: [CPython](https://github.com/python/cpython) (C) which is "the standard", [Jython](https://www.jython.org/) (Java), [IronPython](https://ironpython.net/) (.NET), [PyPy](https://www.pypy.org/) (Python) and  [Stackless](http://www.stackless.com/) to name a few.  
Each of these implementations offer some benefits: Jython for example compiles Python source code to Java byte code, then routes it to the Java Virtual Machine. Because Python code is translated to Java byte code, it looks and feels like a true Java program at runtime and so it integrates well with Java applications.   
IronPython "is tightly integrated with the .NET Framework" so that "IronPython can use the .NET Framework and Python libraries", and vice versa, "other .NET languages can use Python code just as easily".  
We want to unlock the same possibilities that Jython and IronPython do, but for the Rust programming language and then we want to do some more. Using RustPython, we want to compile Python to WebAssembly, and allow Python to run natively in the browser.  

Check the "learn more" section for an explainer of all those jargon-y words. Read the blog for more in-depth technical discussion.
