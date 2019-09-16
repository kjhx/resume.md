# ![Logo Header](img/header.png)

> Inspired by [epsalt's resume builder][epsalt-resume-builder].

## Why

I was tired of writing resumes in InDesign, Word, and other software. I needed something that only required me to write plain text, and it would worry about the rest. Other resume generators were either too complicated or didn't work anymore, so I recreated their markdown –> HTML –> PDF approach with Puppeteer and Pandoc, wrapping it in a simplified process.

## Features

- ~~**Outputs multiple documents.** A resume, cover letter, and your references.~~
- **Write information, not styles.** The script handles the looks.
- **Minimal JS.** It's simple to extend the code to fit your needs.
- **Uses simple CSS and Markdown.** Easy to understand and modify.

## Usage

1. Download this repository.
2. Run `npm install` to install dependencies.
3. Create `src/resume.md`, `src/letter.md`, and `src/references.md`.
    - Example documents are included in the `examples/` folder.
4. Run `make` to build.
    - other usage: `make [ clean | html | pdf ]`
5. Find exported PDFs in `out/pdf/`

## Configuration

Sample documents are located in the `examples/` folder – you'll want to move those into the `src/` folder and edit them with your information. You can infer the styling conventions from the sample documents to add, remove, or modify different sections.

By default, the `.gitignore` is set to ignore the entire `src/` and `out/` directories so that you don't accidentally upload your documents to GitHub.

## Dependencies

- Puppeteer v1.19.0
- Pandoc v0.2.0

[epsalt-resume-builder]: https://github.com/epsalt/resume-builder
