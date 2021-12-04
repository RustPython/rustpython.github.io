---
layout: post
title:  "Using RustPython with PyCharm and Visual Studio Code on macOS."
date:   2021-12-02 01:45:00 +0900
---

For macOS, here is how you can setup RustPython as an interpreter for PyCharm and Visual Studio Code. 

## Pre-requisites

You will need:
- The xcode command line tools from Apple
- Rust [(instructions)](https://www.rust-lang.org/tools/install)

Here are the commands to install them:

- `xcode-select --install`
- `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

(those might change over time)


## Install RustPython

First run:

`cargo install --git https://github.com/RustPython/RustPython`

If you want RustPython with ssl support, try:

`cargo install --git https://github.com/RustPython/RustPython --features ssl`

Go to Cargo's bin directory with `cd ~/.cargo/bin`. Run `ls`, you should see the binary `~/.cargo/bin/rustpython`.

If you type `rustpython` at the terminal, you should get the welcome message:  
![RustPython Welcome Message](/assets/media/rustpython-welcome.jpg)

## Setup PyCharm

In PyCharm, you can add an interpreter by using:
- virtual environment
- conda
- pipenv 
- system interpreter
- poetry

The full docs are on [this link](https://www.jetbrains.com/help/pycharm/configuring-python-interpreter.html). This blog post is for the two options: virtual environment and system interpreter.


### System interpreter
Go to "Add Python Interpreter" -> System Interpreter -> Click on the browse icon.

![PyCharm add Interpreter](/assets/media/pycharm-add-interpreter-list.jpg)

Navigate to `/Users/YOURUSERNAME/.cargo/bin` - selecting `rustpython` as the interpreter gives this error:

![PyCharm add Interpreter](/assets/media/pycharm-rustpython-error.jpg)

There is an easy fix. Create a link/shortcut called `python` that points to `rustpython`.

```
cd ~/.cargo/bin
ln -s rustpython python
```

PyCharm is happy. Test out that things work by creating a python file in PyCharm and running 

```python
import sys
print(sys.executable)
```

### Virtual environment 

In the screen above, if you try to use the virtual option, you get this error.

![venv error](/assets/media/pycharm-venv-error.jpg)

However, you can still manually create the virtual environment. First, create a directory, cd into into it and run:
 `~/.cargo/bin/rustpython -m venv env --without-pip`

This would create a virtual environement that looks like this.

![venv](/assets/media/tree.jpg)

Go the directory, open PyCharm, now you can set the interpreter from the virtual environement.

## Setup Visual Studio Code

Install the Python Extension by Micorsoft. Create your Python file and press `Command + Shift + P`, then search for "Python: Select Interpreter", add a new interpreter by using "Enter Interpreter Path" then browse your filesystem, go to `~/.cargo/bin/rustpython`

You can repeat the same steps for creating a virtual environement and using that with Visual Studio Code.