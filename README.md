# README

This is a Jekyll site + theme for [RustPython](https://github.com/RustPython/RustPython).

There are three things on this site:

- Homepage
- Blog (archive + single post)
- Links to Github/Gitter/Docs/other resources, etc...

## How to edit the homepage

To edit the homepage, you can edit:

- `index.markdown` in the root directory.
- `_config.yml` also in the root directory.
- `_data/contributors.json` or run `update_contributors.py`

`config.yml` has setting like section titles, where links go to etc...  
`index.markdown` has the longer text content.  
`contributors.json` has a list of the top contributors. I figured we can automate how this is generated or update through pull requests.

## How to edit the blog.

Create regular jekyll posts under **\_posts** . To feature a post on the homepage under _the learn more_ section, add the category "featured" to the post.

## How to edit links, menus and other details.

Use `_config.yml`.

## The theme

The theme doesn't rely on any css framework/ and no javascript. Just super simple modification to the minima theme. There are two stylesheets, `style.css` and `media.css`. I did not use `main.css` because it conflicts with minima's stylesheet. I haven't done a Jekyll theme in a while, so contributions are welcome.
