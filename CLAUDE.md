# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX book documenting model railroading experiences, written by J. Michael Dean. The main document is `Railroad.tex`, which is structured as a multi-part book. Currently active parts are Wasatch N Scale Club and 3D Printing. Placeholder folders exist for future parts: basement layout, electrical, civil, structures, scenery, JMRI/git configuration, cars, dispatcher, and author.

## Build Command

Compile the PDF with:
```
pdflatex Railroad.tex
```

The `% !TEX TS-program = pdflatexmk` directive at the top of `Railroad.tex` indicates `pdflatexmk` (latexmk with pdflatex) is the intended build tool when using a TeX IDE. A full build (to resolve references, index, and table of contents) requires multiple passes:
```
latexmk -pdf Railroad.tex
```

To build the index:
```
makeindex Railroad.idx
```

## Architecture

- **Railroad.tex** — Main document. Defines document class (book, 12pt, twoside), page style, and includes all parts/chapters. All new chapters should be added here via `\include{}`.
- **railroadSetup.sty** — Custom package loaded by the main document. Contains all shared `\RequirePackage` declarations. Add new package dependencies here, not in individual chapter files.
- **title/title.tex** — Title page layout for the overall book, with its own `title/figures/` subdirectory for cover images.
- **Chapter folders** — Each chapter lives in its own top-level folder (e.g., `wasatch_n_scale/`, `3d_printing/`). Each folder contains a primary `.tex` file that is included in the main document. Chapter folders may contain a `figures/` subdirectory for chapter-specific images. Each primary chapter file must include `%!TEX root = ../Railroad.tex` for editor synchronization.
- **figures/** — Root-level figures directory containing shared images (e.g., `figures/printer/` for 3D printing photos).

## Conventions

- Chapter files are `\include`d (not `\input`), which means each starts on a new page and gets its own `.aux` file.
- The book uses `minitoc` — call `\minitoc` at the start of each chapter for a local table of contents.

## CRITICAL IMPORTANT GIT WORKFLOW
This project is in a git repository with its origin on Github.  
ALWAYS create a feature branch when starting revisions with the user.  
During development inside a branch, if the user tells you to commit, use a meaningful commit message.
When the user tells you to push, you should first merge the branch to main, then push main, and then delete the branch locally.
The goal is to NOT HAVE extra branches on Github.