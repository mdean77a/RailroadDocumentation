# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX book documenting model railroading experiences, written by J. Michael Dean. The main document is `Railroad.tex`, which is structured as a multi-part book covering topics like club modules, basement layouts, JMRI configuration, 3D printing, test tracks, and electronics.

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
- **title.tex** — Title page layout.
- **chapters/** — One `.tex` file per chapter. Each chapter file must include `%!TEX root = ../Railroad.tex` for editor synchronization. Chapters use `\chapter{}` and `\minitoc` for per-chapter mini table of contents.
- **figures/** — Images organized in subdirectories by topic (e.g., `figures/printer/`).

## Conventions

- Chapter files are `\include`d (not `\input`), which means each starts on a new page and gets its own `.aux` file.
- The book uses `minitoc` — call `\minitoc` at the start of each chapter for a local table of contents.
- Figures use relative paths from the project root (e.g., `./figures/printer/TwoBoxes.jpg`).
- Many parts currently point to `chapters/testChapter.tex` as a placeholder — these are sections yet to be written.
