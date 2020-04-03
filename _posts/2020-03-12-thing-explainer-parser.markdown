---
layout: post
title:  "Thing explainer: RustPython parser"
date:   2020-04-02 11:34:01 -0400
---

This post is a "thing explainer" for the RustPython parser. You can see the source code at [RustPython/parser/](https://github.com/RustPython/RustPython/tree/master/parser).

The post is intended for someone who has written python code and has a vague idea what an interpreter is but wants to understand the details.

When you write your code in Python, the machine cannot run it. A lot needs to happen behind the scenes first. This post will:
- Walk you through the steps and demystify them with screenshots.
- Map some of the steps to the files in `RustPython/parser/`, so you can see things in action.

---

If you have written Python code, you know that to "run your python code", first you have to "install python". If you download and install python from the official website, you are actually installing  CPython, an interpreter written in the C programming language 😲 and a python virtual machine (among other things).

Different interpreters could have different workflows. The rest of the post will discuss CPython and RustPython.

The interpreter has the job of turning your human code into byte code that a python virtual machine can run. Bytecode is an intermediate code between source code and machine code. This makes it portable across multiple hardware and operating systems. Bytecode "works" as long as you implement a virtual machine that can run it. There is a performance penalty for this flexibility. RustPython has a vm under [RustPython/vm/](https://github.com/RustPython/RustPython/tree/master/vm). Other posts, will go into the details of that vm.

Seeing is believing. To see what bytecode looks like, you can use a Python module called [`dis`](https://docs.python.org/3/library/dis.html). dis stands for disassembler. You can write source code then see how its bytecode looks like. Here is an example:

![bytecode](/assets/media/bytecode.jpg)

Now that you know that we need bytecode and what it looks like, it is time to show you how RustPython builds it.

## How RustPython turns your code to bytecode

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


A picture IS worth a thousand word 😛. As you can guess, python tokens are the basic "units" in the language.

If you want to sound fancy, the tokens are the basic "lexical components". This parsing process is called "Lexical Analysis". The thing that does the process is a "lexer".

Here are the links to the files in RustPython and CPython tokenizers:

**`RustPython/parser/lexer.rs`** >>
[source code](https://github.com/RustPython/RustPython/blob/master/parser/src/lexer.rs)  

**`cpython/Lib/tokenize.py`** >>
[source code](https://github.com/python/cpython/blob/3.8/Lib/tokenize.py)

### step2 : determine if the tokens are valid syntax

In the previous step, if you add random stuff to your function and tokenize it, it will work and still tokenize.

![tokenzizing](/assets/media/tokenizing-with-errors.jpg)

So don't hate on the whole interpreter when you get error messages! or at least don't hate on the tokenizer!

To determine if the tokens are valid syntax, first you need a definition of what a valid syntax is. Python has a defined "grammar" or set of rules. The official reference is on [this link](https://docs.python.org/3/reference/grammar.html). There, you will find a machine readable file. You may read a book to know the rules of python, but words are too "fluffy", the machine needs a very strict set of rules encoded in a file. [This video](https://www.youtube.com/watch?v=KGMFvy2d5OI) explains the notation and the Python grammar.
As the presenter puts it, this is the spirit of the beast (python) and it is only ~10KB 😭 (compare that to the size of python books you had to read!)

So, we have the rules or grammar of a programming language in a machine encoded format... now we need to write something that verifies that those rules were followed... This sounds like something that other people could use and like something that should exist as an open source project! 🤔

Sure enough, there is a whole Rust framework called `LALRPOP`. It takes the tokens generated by the lexer, verifies the syntax and turns the tokens into an AST (Abstract Syntax Tree). More information and a tutorial can be found in the [LALRPOP book](https://lalrpop.github.io/lalrpop/README.html).

RustPython does one nice extra thing on top of `LALRPOP `. It masks the errors and provides you with safer, nicer errors. You can see the code for this in `RustPython/parser/src/error.rs`

## Recap 🥴 🥵

As a recap, when you write a line of python code and "run it", here is what happens:

**your code** (in `file.py` or interactive shell)  
 ⭣ parse the line of source code into tokens  
 ⭣ determine if the tokens are valid syntax  
 ⭣ create an Abstract Syntax Tree (AST)     
 ⭣ compile the AST into bytecode   
 **bytecode** (in `__pycache__/file.pyc` or in memory)  

 The compiler is under **`RustPython/compiler`** we'll dive into the details in a next post. In the meantime, check out the parser source code in [RustPython/parser/](https://github.com/RustPython/RustPython/tree/master/parser).
