---
layout: post
title:  "How the RustPython interpreter works - part 1"
date:   2020-03-11 11:34:01 -0400
categories: featured
---

When you write your code in Python, the machine cannot run it. A lot needs to happen behind the scenes first. This post will:
- Walk you through all the steps and demistify them with screenshots.
- Map the steps to the RustPython interpreter, so you can see things in action.
- Provide links for you to read up on key concepts. Trying to explain everything will require a book. The goal is to show by example.

This is intended for someone who has written python code and has a vague idea what an interpreter or compiler is but wants to see the parts of an interpreter in action.

---

If you have written Python code, you know that to "run your python code", first you have to "install python". If you download and install python from the official website, you are actually installing an interpreter written in the C programming language 😲 and a python virtual machine (among other things).

The C interpreter is refered to as CPython or the "default implementation" since that's what a lot of people use. But there are a couple of other options, for example:

- IPython? (ipython have their own interpreter?)
- Jython (written in Java)
- IronPython (.NET)
- PyPy (written in Python)
- Stackless

Different interpreters could have different workflows. For example [PyPy](https://www.pypy.org/) uses a just in time compiler to turn your code into machine code! The rest of the post will discuss CPython and RustPython.

The CPython interpreter has the job of turning your human code into bytecode that a python virtual machine can run. This doesn't sound very useful. What is bytecode to begin with? what is a python virtual machine? How does this interpretation happen?

# Bytecode  
To avoid "re-inventing the wheel", here are two links to some good explanations:

- [Wikipedia article on bytecode](https://en.wikipedia.org/wiki/Bytecode) (🙄 lol, is it legit to link to wikipedia?)
- [Medium post by Rahul Saini](https://medium.com/@rahul77349/machine-code-vs-byte-code-vs-object-code-vs-source-code-vs-assembly-code-812c9780f24c). In ~4mins reading time Rahul explains "Machine code vs. Byte code vs. Object code vs. Source code vs. Assembly code vs. Executable code"... knowing the differences will come in handy at some point.

In a nutshell, bytecode is an intermediate code between source code and machine code. This makes it portable across multiple hardware and operating systems. Bytecode "works" as long as you implement a virtual machine that can run it. There is a performance penalty for this flexibility.

Seeing is believing. To see what bytecode looks like, you can use a Python module called [`dis`](https://docs.python.org/3/library/dis.html). dis stands for disassembler. You can write source code then see how its bytecode looks like. Here is an example:

![bytecode](/assets/media/bytecode.jpg)

Now that you know that we need bytecode and what it looks like, it is time to show you how RustPython builds it.

## How RustPython turns your code to bytecode
You can find the RustPython source code in [this repo](https://github.com/RustPython/RustPython).

Here are the main steps that RustPython currently does:  
- parse the line of source code into tokens  
- determine if the tokens are valid syntax  
- create an Abstract Syntax Tree (AST)  
- ? is there a bytecode optimization step?  
- compile the AST into bytecode  
- ? any other steps implemented in RustPython?  

This list of steps introduces some new concepts like: tokens and abstract syntax trees. If you want to read-up on the details, check out:
- [Inside The Python Virtual Machine](https://leanpub.com/insidethepythonvirtualmachine/read#leanpub-auto-introduction) ebook.
- [Python in a nutshell / Lexical structure](https://learning.oreilly.com/library/view/python-in-a/9781491913833/ch03.html#python_language-id00003)  


### Step 1: parsing source code into tokens

Assuming that you don't want to read two books, the fastest way to understand what tokens are, is to see them. Conveniently, Python comes with a [tokenizer](https://docs.python.org/3/library/tokenize.html). Here is what happen if I run the tokenizer on the function I created earlier.  
`$ python -m tokenize file.py`

`file.py` has the add function that I used in the previous examples, it returns x+y.

![tokenzizing](/assets/media/tokenizing.jpg)


A picture IS worth a thousand word 😛. As you can guess, python tokens are the basic lexical components of the language.

If you want to be fancy, this parsing process is called "Lexical Analysis".

Here are the links to the RustPython and CPython tokenizers:

**`RustPython/parser/lexer.rs`** >>
[source code](https://github.com/RustPython/RustPython/blob/master/parser/src/lexer.rs)  

**`cpython/Lib/tokenize.py`** >>
[source code](https://github.com/python/cpython/blob/3.8/Lib/tokenize.py)

### step2 : determine if the tokens are valid syntax

In the previous step, if you add random stuff to your function and tokenize it, it will still tokenize.

![tokenzizing](/assets/media/tokenizing-with-errors.jpg)

So don't hate on the whole interpreter when you get error messages! or at least don't hate on the tokenizer!

To determine if the tokens are valid syntax, first you need a definition of what a valid syntax is. Python has a defined "grammar" or set of rules. The official reference is on [this link](https://docs.python.org/3/reference/grammar.html). There, you will find a machine readable file. You may read a book to know the rules of python, but words are too "fluffy", the machine needs a very strict set of rules encoded in a file. [This video](https://www.youtube.com/watch?v=KGMFvy2d5OI) explains the notation and the Python grammar.
As the presenter puts it, this is the spirit of the beast (python) and it is only ~10KB 😭 (compare that to the size of python books you had to read!)

So, we have the rules of a programming language in a machine encoded format... now we need to write something that verifies that those rules were followed... This like something that should exist as an open source project!  
Sure enough, there is a whole Rust parser generator framework called `LALRPOP`. It takes the tokens generated by the lexer, verifies the syntax and turns the tokens into an AST (Abstract Syntax Tree). More information and a tutorial can be found in the [LALRPOP book](https://lalrpop.github.io/lalrpop/README.html).

RustPython masks the errors from `LALRPOP ` and provides you with safer, nicer errors. You can see the code for this in `RustPython/parser/src/error.rs`

## Recap 🥴 🥵

As a recap, when you write a line of python code and "run it", here is what happens:

**your code** (in `file.py` or interactive shell)  
 ⭣ parse the line of source code into tokens  
 ⭣ determine if the tokens are valid syntax  
 ⭣ create an Abstract Syntax Tree (AST)     
 → up next: compile the AST into bytecode   
 **bytecode** (in `__pycache__/file.pyc` or in memory)  

 The compiler is under **`RustPython/compiler`** we'll dive into the details in a next post. In the meantime, check out the parser folder in `RustPython`.
