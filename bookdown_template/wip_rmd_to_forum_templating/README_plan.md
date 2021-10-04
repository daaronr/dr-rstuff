# wip_rmd_to_forum_templating

28 Sep 2021 working on this at bottom of `main_WIP.R` [HERE](https://github.com/daaronr/dr-rstuff/blob/master/bookdown_template/main_WIP.R)

- Work on writing scripts to move from the Rmd bookdown format to a markdown format that can be pasted into EA Forum
    - the content [here](https://rethinkpriorities.github.io/ea_data_public/eas-donations.html) is currently the prime example
    - the scripts here are/will be designed to work on the [template in the current Github Repo](https://daaronr.github.io/dr-rstuff/bookdown_template/docs/about.html), and then be ported to those other repos

- Discussion linked in [google doc here](https://docs.google.com/document/d/1R27474udUmzAD5tozOB6q7GA-EG-sW_j5Pz68bZwJQQ/edit#heading=h.4eoz5fvmsd7x); adding backlinks to this repo

- I propose a [plan](#plan) below


The tips [here](https://rmarkdown.rstudio.com/docs/reference/md_document.html) on converting from Rmd to other markdown formats might be helpful.

- See [some messy coding examples here](https://github.com/daaronr/dr_text_md_tools/tree/master/example_work_from_micro_teaching) for scripts I (Reinstein) have used in the past to bulk edit markdown-related stuff with regular expressions etc (vimscripts and bash scripts using `sed` etc).


## Overview

‘Bookdown’ projects use R and other tools to combine Rmd and associated files produce output like [THIS](https://rethinkpriorities.github.io/ea_data_public/outline-disc.html).

Note that some of the results come from ‘inline code’ (e.g., `r 2+2` produces “4”) ... so the raw Rmd needs processing before conversion. We can do this through 'knitting' or 'building' to a markdown format (or other formats), as noted in the plan below. The md files generated will also need some post-processing, presumably.

Some things can be easily-ish, changed.

- See discussion of hosted images below
- If the md converter doesn't already do it, the syntax for indicating latex content needs changing from `$$` to `\(` notation (or something)
- Internal links may need adjusting (discussion below)


Other ‘fancy html content’ generated by my Rmd tools will never show up in the EA Forum’s current implementation. These need to be changed or removed, in pre or post processing. E.g.,

- Tufte margin notes $\rightarrow$  footnotes
- Folding boxes (drop or link)
- as code cannot be folded, code boxes should be set not to show, or should be removed.


## My plan is something like: {#plan}

0. ... possibly (manually) add ‘tags’ to original Rmd files indicating start and end of sections to remove from forum post version


1. rmd_edits_for_md.py: apply to all Rmd files in folder, create (in new folder?) new Rmd files with adjustments, removing unrenderable content etc ... maybe not bookdown but something simpler?

- Adjusted: think of these as 'one chapter at a time' ... no real benefit of putting 'whole book' together for EA Forum

2. Knit Rmds  to commonmark (individual files) with

`render("chapter_1_sample.Rmd", md_document(variant = "commonmark"))` for just a single 'chapter' file, as that is all we really want anyways for EAFo posts?

Note: putting in `always_allow_html: yes` into the yaml allows this to knit even with stray html content we may have failed to remove

3. md_edits_for_eafo.py apply post-knit fixes and substitutions to .md files so that these work on the EA forum

- these may need to take manual arguments to specify,
- ... e.g, prepend the correct web address where the png files are hosted and append `?raw=true` (not sure if that is necessary)
-  right now that seems to be
    - `https://daaronr.github.io/dr-rstuff/bookdown_template/docs/template_project_files/figure-html/FIGURE_NAME.png` in this template
    - `https://github.com/rethinkpriorities/ea_data_public/blob/main/docs/ea_survey_work_files/figure-html/FIGURE_NAME.png?raw=true` for the relevant actual post

## Preprocessing of Rmd -- simple content to cut or replace syntax

### Remove deselected content (with 'start/end' tags)

### Margin notes to footnotes


###  Tables (numbers produced in R)

At the moment tables come out in some sort of htmly format which doesn’t render on the Forum.
- Changing options to 'latex tables' in some packages (like `Kable`) may fix this?


## Post-processing of md

### Images (more precise discussion)


### Internal links

> Hamish: My guess about the internal links problem: the way internal links work is that you give elements ids like <h1 id="about">About</h1> and then you can link to them like <a href="#about">link</a>. So if the EA forum is generating different IDs to the ones you were using in the R notebook the links won't work.

> Solutions:
> go through all the sections you need to link to and inspect the source to see what element ID they have.
reverse engineer the id-name algorithm the EA forum uses and write a script to change the URLs to the ones the EA forum will use

> actually inspecting source is overkill. just copy the URL from the contents and extract the id from there.
