# The China Quarterly CSL

An independent CSL style for [The China Quarterly](https://www.cambridge.org/core/journals/china-quarterly/information/author-instructions/preparing-your-materials). The journal calls its scheme “Standard Reference Style” and does not name a base CSL style. Zotero's current [style index](https://www.zotero.org/styles-files/styles.json) has no China Quarterly entry.

> [!NOTE]
> Human note: Made fully w codex (terra and some sol). I looked over the result and it seems pretty clean. There is a detailed [reference.md](reference.md) that shows each TCQ assertion and maps it to the implementation in the CSL. The rest of this repo was created by machines.

`the-china-quarterly.csl` implements the guide's author-date footnotes, Ibid., author grouping, full References list, source-type forms, and Chinese-language pinyin with English translations. `test/example.md` and `test/references.bib` exercise those forms, including Hanzi in main text.

For the full source-to-code map, including limits that CSL cannot express, see [reference.md](reference.md).

## build and check

[Devbox](https://www.jetify.com/devbox) is the only system requirement.

```sh
devbox run test
```

The command renders the examples with Pandoc citeproc, compares them with `example-output.md`, builds the PDF, checks its structure and text, checks the Hanzi, and confirms References begins on a new page.

```sh
devbox run build-pdf
```

Pandoc does the CSL work. XeLaTeX only makes the PDF because Pandoc needs a PDF engine. It uses TeX Gyre Termes for normal serif text and GNU Unifont only for Hanzi. There is no Node, `node_modules`, or JavaScript test dependency.
