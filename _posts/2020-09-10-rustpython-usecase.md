---
layout: post
title:  "Use Case: RustPython Notebook"
excerpt: "A use case for scientific computing in the browser."
---

**Disclaimer: opinions are my own. What you read in this post does not necessarily represent the views of the whole RustPython team -- Mireille**  

The RustPython Notebook is a **toy** notebook inspired by the now inactive [Iodide project](https://alpha.iodide.io/). It is a testament to how powerful and inspiring the Iodide project was.  
You can find the RustPython notebook code on [this link](https://github.com/RustPython/RustPython/tree/master/wasm/notebook) under `RustPython/wasm/notebook`. 

Here is how the notebook looks like:
![Rust Python Notebook](/assets/media/rustpython-notebook.png)

This post is a background discussion on how RustPython can be used for scientific computing in the browser and why that is important. A follow-up post will include a detailed example that showcases how Javascript and Python can work together.

The hope is that this post inspires you to contribute to RustPython.

## Scientific Computing in the browser

This [blog post](https://hacks.mozilla.org/2019/03/iodide-an-experimental-tool-for-scientific-communicatiodide-for-scientific-communication-exploration-on-the-web/) on Mozilla Hacks frames the need for scientific computing in the browser. It focuses on communication. Scientists need to communicate better with policymakers, journalists or interested citizens. One might argue that there is an even greater need for better and more efficient communication within the scientific community. 

Since Mozilla's post in 2019, a lot has happened! (no joke, there's now a global pandemic and an atmosphere of mistrust in science).  
There is a paramount need to **agree on facts** and have verifiable, data-based and model-driven discussions. At a minimum, there is a need to change how discussions are conducted and move them from being centered around **opinion** and **personality** to being focused on **data** and **models**. These models need to be demystified in order to rebuild trust in science. One of the many ways to achieve this is by exposing how models work and let anyone interact with them. Scientists need to meet people in the environment used by most: the browser.

## Sharing scientific work should be as easy and worry-free as sharing a google doc
Coders and the technical community can help. We need to make it extremly simple for scientists to share their work -- a scientist should not be expected to run, manage, secure and pay for a server that runs their model. If someone's code or research paper becomes popular, they should not have to pick up the bill for cloud computing. Besides, no scientist should have to worry about server uptime and security patches when they have actual research to do. 

Imagine if we asked people to configure a server every time that they wanted to share a google doc. Imagine that every time you needed to open a document on your computer, you will need to install custom fonts with specific versions and then install and configure yet another version of a PDF reader. Opening old documents would most likely require you to rollback your changes. If anything breaks, your document won't work. On top of everything, all of this would require adminitrative access.

## Thinking outside the box
Re-thinking how scientific code works in a "serverless" world, using such a ubiquitous tool like the browser, can yield a lot of benefits.

Usually re-thinking how something works requires thinking with a long-term mindset, being open to experimentation and trying a new approach instead of adopting incremental improvements. Thinking outside the box is easier said than done. Here is where RustPython comes in.

## The role of RustPython

The promise of RustPython for scientific computing in the browser is simple. Rust is a new and modern programming language. It plays nicely with WebAssembly. By writing an interpreter for Python in Rust, you can compile that interpreter to WebAssembly. Since WebAssembly runs in the browser, this means you get yourself an interpreter for Python that runs in the browser. In other words, someone can type python code in a browser and the browser can load an interpreter that understands it.

There is a merit to a fresh start with a new Python interpreter that has "running in the browser" as a use case. There is freedom of choice that comes from not having to worry about a huge codebase and a benefit to using a modern programming language like Rust.

The trade-off is that you have a whole interpreter to write, a standard library and so many other libraries to support. It is not a road for the faint hearted or for someone who needs a production ready environment. In fact, while RustPython supports the full Python syntax, it doesn't support the Standard Library at the moment.

## What about?
When talking about new tools, technical debate can get intense -- very quickly. Sure, there are a few other approaches, For example:
- What about compiling CPython to WebAssembly?
- What about using Javascript for scientific computing? Javascript is very advanced and much different from what it used to be!
- What's wrong with servers and what about using Docker?
- What about someone just paying for a lot of servers for a lot of scientists?
    
All the above approaches have their merit. Usually, there are multiple ways to solve a problem. Each approach brings together a different community with different mindsets, toolsets and skillsets. Working on one solution rarely takes away from the viability of another. In the occasion when the community overlaps, for example, a programmer who knows C and Rust can choose to contribute to whichever interpreter they want. That decision will have to do with their preference, the community and what he/she think has a higher chance of working. More people and more energy to solve a problem means a bigger diversity in solutions. One of these solutions is meant to work or inspire and lead to another. Competition and diversity as economists and social scientists believe, is good.

Besides, scientific computing in the browser is one of the use cases for RustPython. Another use case for example is exposing Python scripting in an application written in Rust. This would allow quickly tweaking logic where Rust's compile times would be inhibitive.

If you were looking for a motivation to contribute to RustPython, hopefully scientific computing in the browswer is a good one among many.

# Sample code

Some sample code can be found in [RustPython/tree/master/wasm/notebook/snippets](https://github.com/RustPython/RustPython/tree/master/wasm/notebook/snippets).
