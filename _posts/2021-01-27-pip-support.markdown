---
layout: post
title:  "pip is working! 🎉  🎉 "
date:   2021-01-27 01:45:00 +0900
categories: [featured]
---

7380 commits and 1940 pull requests later, **pip** and **get-pip.py** are working with RustPython 🎉  🎉. pip can install itself and setuptools!

This update is brought to you from [@coolreader18's](https://github.com/coolreader18) terminal by asciinema 🍿.

## get-pip.py
[![asciicast](https://asciinema.org/a/3pAZSfrFeIbEUzpPyXtvYZCeN.svg)](https://asciinema.org/a/3pAZSfrFeIbEUzpPyXtvYZCeN)


## get-pip.py + pip install requests
[![asciicast](https://asciinema.org/a/fuTmP0wMD8HnvwsOkPRPuVHoa.svg)](https://asciinema.org/a/fuTmP0wMD8HnvwsOkPRPuVHoa)


## pip installs itself and setup tools
[![asciicast](https://asciinema.org/a/y2rIeqELmzn5LCaWI6MLMvujz.svg)](https://asciinema.org/a/y2rIeqELmzn5LCaWI6MLMvujz)


## What you need to do

(Update 2021-02-08): Everything has been merged to master!

```shell
    $ cargo install --git https://github.com/RustPython/RustPython --features ssl # or however you build
    $ curl https://bootstrap.pypa.io/get-pip.py -O
    $ rustpython get-pip.py
    ...lots of work...
    $ rustpython -m pip --version
    pip 21.0 from /home/.../.local/lib/rustpython3.9/site-packages/pip (python 3.9)
```

There's undoubtedly still a lot that doesn't work, so if there's something simple-ish that errors inside of pip or a setup script, feel free to open an issue for it (note that C extensions won't be supported anytime soon, and a ctypes implementation is in progress).

(Previous instructions):

This update is so fresh, things are not merged into the `master` or `release` branches yet. For now, to test this out, you have to checkout the `pip-merg` branch, and make sure to build with the `ssl` feature:  

```shell  
    $ cd RustPython
    $ git fetch --all
    $ git checkout pip-merg
    $ cargo install --path . --features ssl
    $ curl https://bootstrap.pypa.io/get-pip.py -O
    $ rustpython get-pip.py
    ...lots of work...
    $ rustpython -m pip --version
    pip 21.0 from /home/.../.local/lib/rustpython3.9/site-packages/pip (python 3.9)
```
