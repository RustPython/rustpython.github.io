---
layout: post
title:  "Build RustPython on Windows"
date:   2020-04-03 01:11:01 -0400
categories: featured
---

Building RustPython on windows is an issue for people new to the project.
This articles seeks to make it easy for you.

## Let's get to work.
- First [Download Rust](https://www.google.com "Rust download page") and follow the installation guide.

- Make sure you have a C/C++ compiler installed. I'd advice using Microsoft Visual Studio compilers for the job. [Download Visual Studio](https://visualstudio.microsoft.com/downloads/ "Visual Studio Download Page") and follow the installation guide. A community version is all we need. Be sure to check `Desktop Development with C++`.

- [Download and setup git](https://git-scm.com/download/win "Git download page") if you haven't already.

- Next we need to install openssl since RustPython depends on it. However the build process for openssl is not very straight forward. We employ [Vcpkg](https://github.com/Microsoft/vcpkg) to help us. [Clone Vcpkg](https://github.com/Microsoft/vcpkg "Vcpkg github repository") into a folder of your choosing. I will use ```C:\vcpkg\``` in this example. Following vcpkg's installation guide, in the cloned directory

From your Powershell run the scripts.
    ```Powershell
    PS C:\vcpkg> .\bootstrap-vcpkg.bat  
    PS C:\vcpkg> .\vcpkg integrate install
    ```

Finally we install openssl by running
    ```Powershell
    PS C:\vcpkg> .\vcpkg install openssl:x64-windows
    ```
Get some coffee for this one.
After the installation is done, there will be a created path 
    ```
    C:\vcpkg\installed\x64-windows\
    ```
Edit your User environment Variables or System Variables, whichever you prefer and set `OPENSSL_DIR` to this path

## Now for the real deal: Building Rustpython.

- Clone Rustpython from [https://github.com/rustpython/rustpython](https://github.com/rustpython/rustpython).
- Change directory into the clone directory. Suppose this directory is `C:\rustpython`,
    ```Powershell
    PS C:\> cd rustpython
    ```
- Run the script ```symlinks-to-hardlinks.ps1``` in windows powershell to copy some python files into the vm project (There was no need to type the same code twice, lol)
    ```powershell
    PS C:\rustpython> .\scripts\symlinks-to-hardlinks.ps1
    ```

- When all is done, build RustPython with cargo from the project's parent directory
    ```Powershell
    PS C:\rustpython> Cargo build --release
    ```
After cargo does its magic, you should see a ```targets/release``` folder created

copy the `.dll` files `libcrypto-1_1-x64.dll` and `libssl-1_1-x64.dll` from 
    ```
    C:\vcpkg\installed\x64-windows\bin
    ``` 
or the `bin` folder of wherever you installed openssl to into the ```targets/release``` directory.

## Now run *`ruspython.exe`* and enjoy it's beauty.