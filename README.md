# [rustpython.github.io](https://rustpython.github.io)

<img src="./logo.png" width="125" height="125" align="right" />

## Getting started

This site uses Jekyll. You can find instructions for how to install and configure Jekyll on [https://jekyllrb.com/docs/](https://jekyllrb.com/docs/).

You may also use a tool or service supporting [Development Containers](https://containers.dev/), such as Visual Studio Code or GitHub Codespaces. In that case, your development environment is already set up and includes Jekyll with the right version.

Run Jekyll with:

```bash
bundle exec jekyll serve --livereload
```

## How to Contribute
You can contribute by:
- writing an article,
- improving the theme (developers),
- improving the design of the site by sharing mockups or ideas (UX and designers).

## Writing

You can write a blog post in any language. There are no strict writing guidelines, but if you need ones, checkout [Digital Ocean Technical writing guides](https://www.digitalocean.com/community/tutorials/digitalocean-s-technical-writing-guidelines).

As for what to write about, if you think it is worth sharing, then it is worth writing about (as long as it is about RustPython).

If you need inspiration:
- you can check out the issues marked with the label `content`,
- you can write a how-to, a technical article about something you learned while contributing to RustPython, a use case or just notes-to-future-self for how to configure something.

### Adding posts

The `_posts` folder is where the blog posts are.  

To create a new post create a markdown file with this pattern: `YEAR-MONTH-DAY-title.md`, for example: `2020-10-01-why-rust-python-is-awesome.markdown`

Here is how the content of that file should look like.

```
---
layout: post
title:  "Why RustPython is awesome!"
---

Content goes here.

```

Once you have your post ready, submit a pull request. 

### Editing the homepage

To edit the homepage, you can modifty these files:

- `index.markdown`
- `_config.yml`

`config.yml` has settings like section titles and hyperlinks.

`index.markdown` has the text.  

`contributors.json` is automatically generated and has a list of the top contributors.

## Improving the theme.

The theme doesn't rely on any css frameworks or javascript. It is just a super simple modification to the Jekyll `minima` theme. 

### Color Scheme

The color scheme is that of the RustPython Logo:

![#F74C00](https://via.placeholder.com/15/F74C00/000000?text=+) `#F74C00` or `rgb(247, 76, 0)`  

![#306998](https://via.placeholder.com/15/306998/000000?text=+) `#306998` or `rgb(48, 105, 152)`  

![#ffd43b](https://via.placeholder.com/15/ffd43b/000000?text=+) `#ffd43b` or `rgb(255, 212, 59)`  
