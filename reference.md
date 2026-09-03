# China Quarterly rule-to-CSL reference

This file records how the journal's citation instructions were turned into `the-china-quarterly.csl`.

## Source and reading method

The primary source is [The China Quarterly, “Preparing your materials”](https://www.cambridge.org/core/journals/china-quarterly/information/author-instructions/preparing-your-materials). This document was checked on 3 September 2026. The page labels the citation section “Standard Reference Style” and states it was last updated on 17 September 2019.

The source descriptions below are paraphrases. They identify the source heading and example rather than reproduce the publisher's full text. Every internal code link goes to the exact CSL line range. Every fixture link goes to the source that `devbox run test` renders with Pandoc and compares to `example-output.md`.

State labels have a strict meaning.

| State | Meaning |
| --- | --- |
| Exact | CSL or the proof document produces the stated form. |
| Input | The form is produced when the Zotero or BibTeX data contains the required value. |
| Document | The rule belongs to the manuscript or Pandoc, not CSL. |
| Limit | CSL cannot express the rule fully. The required editorial action is stated. |

## Scope

This is a citation-style implementation. It covers every citation and reference-list instruction in the source's “Style” and “Standard Reference Style” sections. It does not claim to implement unrelated manuscript rules about spelling, word count, tables, figures, acknowledgements, copyright, submission, or AI declarations.

## Footnotes and citations

| ID | China Quarterly instruction | CSL location | Rendered fixture | State |
| --- | --- | --- | --- | --- |
| F01 | Put author-date references in footnotes and give full entries under References. | [style class and citation](the-china-quarterly.csl#L2-L2), [bibliography](the-china-quarterly.csl#L486-L514) | [example metadata and citations](test/example.md#L1-L43) | Exact |
| F02 | Cite surname and year. Add a page locator when needed. | [short author and date](the-china-quarterly.csl#L36-L45), [citation layout](the-china-quarterly.csl#L462-L485) | [one author and locator](test/example.md#L13-L15) | Exact |
| F03 | List one, two, or three authors in a note. | [citation names](the-china-quarterly.csl#L36-L45), [citation options](the-china-quarterly.csl#L462-L462) | [one to three authors](test/example.md#L13-L19) | Exact |
| F04 | Use first author plus “et al.” for four or more authors. | [citation options](the-china-quarterly.csl#L462-L462) | [four authors](test/example.md#L21-L21) | Exact |
| F05 | Separate different works with semicolons. Collapse works by one author without repeating the name. | [citation options](the-china-quarterly.csl#L462-L462) | [several works](test/example.md#L23-L25) | Exact |
| F06 | In a narrative note, print year and page after the named author. | [ordinary citation layout](the-china-quarterly.csl#L474-L481) | [Pandoc author suppression](test/example.md#L43-L43) | Document |
| F07 | Add given names when cited authors share a surname. | [citation options](the-china-quarterly.csl#L462-L462) | [same surname](test/example.md#L31-L31) | Exact |
| F08 | For no author, use the first words of the title plus year. | [title substitute](the-china-quarterly.csl#L36-L45), [citation layout](the-china-quarterly.csl#L474-L481) | [no author](test/example.md#L33-L33) | Input |
| F09 | An organization may use an abbreviation in notes and a fuller form in References. | [literal organization name](the-china-quarterly.csl#L36-L45), [bibliography author](the-china-quarterly.csl#L26-L35) | [organization author](test/example.md#L55-L55) | Limit |
| F10 | Append a, b, c to different works by one author in one year. | [year suffix option](the-china-quarterly.csl#L462-L462), [bibliography sort](the-china-quarterly.csl#L486-L491) | [same-year works](test/example.md#L25-L25) | Exact |
| F11 | Give a full first interview citation and a shortened later one. | [interview citation](the-china-quarterly.csl#L358-L395) | [first and later interview](test/example.md#L37-L41) | Exact |
| F12 | Use n.d. for no date and forthcoming for unpublished work. | [issued values](the-china-quarterly.csl#L180-L203) | [no date and forthcoming](test/example.md#L27-L29) | Input |
| F13 | Put the original publication year in square brackets after the edition year. | [original date](the-china-quarterly.csl#L205-L220) | [edition and original date](test/example.md#L35-L35) | Input |
| F14 | Use Ibid. for consecutive references to the same work. Keep a changed locator. | [Ibid. branch](the-china-quarterly.csl#L462-L485) | [consecutive Duckett citations](test/example.md#L13-L15) | Exact |
| F15 | Give page numbers for quotations and place note markers after punctuation. | [locator output](the-china-quarterly.csl#L459-L461), [citation layout](the-china-quarterly.csl#L474-L481) | [quoted narrative note](test/example.md#L43-L43) | Document |
| F16 | Put Hanzi at the first main-text occurrence, not in notes. | [main-text example](test/example.md#L7-L9), [CJK font setup](test/cjk-header.tex#L1-L3) | [PDF checks](Makefile#L44-L62) | Document |
| F17 | Retain short and full page ranges, such as 324–26 and 324–336. | [page output](the-china-quarterly.csl#L291-L305) | [range examples](test/example.md#L81-L83) | Input |
| F18 | Include sources cited in tables and figure legends in References. | [bibliography layout](the-china-quarterly.csl#L486-L514) | No table fixture | Document |

F06 uses Pandoc's `-@key` syntax. CSL receives the resulting citation request but cannot decide whether prose has already named an author. F09 needs an editorial data choice because standard CSL has no distinct short and long forms for one corporate author. F15 cannot detect a quotation or move a footnote marker in prose. F17 preserves the page value supplied by the data and relies on the processor for the en dash. F18 requires the document processor to expose the table or figure citation to citeproc.

## Reference-list structure and ordering

| ID | China Quarterly instruction | CSL location | Rendered fixture | State |
| --- | --- | --- | --- | --- |
| R01 | Use the heading References and start the list after the article text. | [Pandoc metadata](test/example.md#L1-L3), [page break](test/example.md#L91-L93) | [PDF page check](Makefile#L56-L61) | Document |
| R02 | Use full author names. Do not replace repeated names with dashes. | [bibliography names](the-china-quarterly.csl#L26-L35), [layout](the-china-quarterly.csl#L486-L514) | [all cited items](test/example.md#L13-L91) | Exact |
| R03 | Sort by author. Sort no-author items by title. | [author sort](the-china-quarterly.csl#L46-L64), [bibliography sort](the-china-quarterly.csl#L486-L491) | [no-author item](test/example.md#L33-L33) | Exact |
| R04 | Place a single-author item before multi-author works that begin with that author. | [author sort](the-china-quarterly.csl#L46-L53), [bibliography sort](the-china-quarterly.csl#L486-L491) | No dedicated fixture | Exact |
| R05 | For one author, sort different years oldest first. Sort same-year works by title and label them a, b. | [bibliography sort](the-china-quarterly.csl#L486-L491), [year suffix](the-china-quarterly.csl#L462-L462) | [Rozelle and Lu items](test/example.md#L23-L25) | Exact |
| R06 | Begin a no-author entry with its title and ignore initial articles when sorting. | [title substitute](the-china-quarterly.csl#L46-L64) | [no-author item](test/example.md#L33-L33) | Limit |

R06 needs a manual Zotero sort title when an initial “A,” “An,” or “The” changes order. CSL has no general operation that removes an initial article only while sorting.

## Reference-list forms

| ID | China Quarterly instruction | CSL location | Rendered fixture | State |
| --- | --- | --- | --- | --- |
| B01 | A book has author, year, italic title, edition when present, place, and publisher. | [book title](the-china-quarterly.csl#L71-L83), [default source](the-china-quarterly.csl#L420-L458) | [book examples](test/example.md#L13-L19) | Exact |
| B02 | Chinese books show pinyin followed by an English translation. Preserve pinyin capitalization. | [Chinese book title](the-china-quarterly.csl#L71-L83) | [Chinese book](test/example.md#L47-L47) | Input |
| B03 | Use the specified two- and three-author forms in book entries. | [bibliography names](the-china-quarterly.csl#L26-L35) | [two and three authors](test/example.md#L17-L19) | Limit |
| B04 | Treat an organization as an author. | [bibliography names](the-china-quarterly.csl#L26-L35) | [World Bank](test/example.md#L55-L55) | Exact |
| B05 | Chapters use a quoted title, In, editor, italic book title, place, publisher, and pages. | [chapter source](the-china-quarterly.csl#L307-L322), [source dispatch](the-china-quarterly.csl#L420-L458) | [Chinese chapter](test/example.md#L49-L49) | Exact |
| B06 | Preserve the title capitalization required by the relevant non-English language. | [title output has no forced case](the-china-quarterly.csl#L71-L178) | [French book](test/example.md#L53-L53) | Input |
| B07 | For online material, include DOI or URL and access date when supplied. | [online and access macros](the-china-quarterly.csl#L254-L290) | [online source](test/example.md#L85-L89) | Input |
| B08 | Use the first publication city. Add a disambiguating state or country when needed. Remove publisher suffixes such as Inc. and Ltd. | [publisher output](the-china-quarterly.csl#L248-L253) | [book data](test/references.bib#L1-L7) | Input |
| B09 | Journal articles use italic journal title, volume, issue, pages, and online details when present. | [journal source](the-china-quarterly.csl#L291-L305), [source dispatch](the-china-quarterly.csl#L420-L458) | [journal and DOI](test/example.md#L51-L51), [journal with DOI](test/example.md#L65-L65) | Exact |
| B10 | Apply book-style author names to multi-author journal articles. | [bibliography names](the-china-quarterly.csl#L26-L35) | [four-author journal](test/example.md#L21-L21) | Limit |
| B11 | Treat a contribution to conference proceedings as a chapter. Treat a proceedings item published in a journal as an article. | [type dispatch](the-china-quarterly.csl#L420-L458) | [chapter fixture](test/example.md#L49-L49) | Input |
| B12 | A conference paper uses the event, institution, place, and full date. | [conference-paper macro](the-china-quarterly.csl#L344-L356) | [conference paper](test/example.md#L75-L75) | Exact |
| B13 | A thesis uses its type and institution. | [thesis branch](the-china-quarterly.csl#L443-L449) | [thesis](test/example.md#L77-L77) | Input |
| B14 | An unpublished work uses Forthcoming instead of a year. | [bibliography date](the-china-quarterly.csl#L195-L203) | [forthcoming work](test/example.md#L29-L29) | Input |
| B15 | Internet sources normally remain in notes unless cited more than once. Some long or unattributed sources can remain in notes. | [webpage form](the-china-quarterly.csl#L323-L342) | [repeated web citation](test/example.md#L57-L61) | Limit |
| B16 | Newspapers and magazines use the documented authored and translated-source forms. Include an entry only when cited more than once. | [periodical form](the-china-quarterly.csl#L333-L342), [newspaper title](the-china-quarterly.csl#L148-L178) | [repeated newspapers](test/example.md#L63-L73) | Limit |
| B17 | Archival material may be a note or a bibliography item according to its format. | [type dispatch](the-china-quarterly.csl#L420-L458) | No archival fixture | Limit |
| B18 | Song titles are lower case in quotation marks. Album titles are italic. | [song title](the-china-quarterly.csl#L100-L112), [song source](the-china-quarterly.csl#L403-L418) | [recording](test/example.md#L79-L79) | Exact |

B02 requires pinyin in `Original Title` and the English translation in `Title`. In `test/references.bib`, those fields are `origtitle` and `title`. B03 and B10 have one known CSL limitation: the guide uses a comma before “and” in its two-author example but no serial comma in its three-author example. CSL has one final-name delimiter setting. This style uses the comma consistently. B08 is data cleaning, so the style does not alter a publisher or choose among several cities. B11 requires the user to select the correct Zotero item type. B13 requires a `genre` value such as `PhD diss.`. B15 and B16 cannot make bibliography inclusion depend on how often an item is cited. The fixture cites those examples twice before they appear in References. B17 is an editorial classification decision, not a fixed citation form.

## Proof path

`devbox run test` runs the same path a user uses:

1. Pandoc citeproc renders [test/example.md](test/example.md) with [test/references.bib](test/references.bib) and [the CSL](the-china-quarterly.csl).
2. It compares the result byte for byte with [example-output.md](example-output.md).
3. It builds the [PDF proof](output/pdf/the-china-quarterly-citation-examples.pdf), verifies the PDF structure, checks the rendered citation and reference strings, checks Hanzi, and checks that References is the first text on its page.

The mapping above separates direct implementation from data requirements, document rules, and limits. A row marked Limit is not silently treated as implemented.
