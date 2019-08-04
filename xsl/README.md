# folder to store xslt scripts

1. Copy-paste the data from the first sheet of the google-spreadsheet to excel (alternatively, choose the rows you need - e.g. only rows with 'Urheber' or only the digitised ones);
2. in Excel fill out all empty cells with "empty_cell" (method explained here: https://www.accountingweb.com/sites/default/files/Blanks---Figure-3.jpg);
3. Transform the .xlsx to TEI5 in https://oxgarage.tei-c.de/. This should transform the table so that each row including the data for one fragment is in one <row> element and each cell is in a <cell> element. After the transformation open the xml in Oxygen (or other editor), search for "empty_cell" and replace it with nothing, so that all initially empty fields are empty elements <cell>. 

4a. OxGarageTObasicMetadataFragmentarium.xsl => gives a table form with elements needed for the metadata and scholarly descriptions in Fragmentarium (in the Fragmentarium order of appearance). If you haven't limited the selection of fragments from the google-spreadsheet, here is the chance to add conditions and, for instance, choose only those fragments, which have description and are digitised but not yet entered in Fragmentarium (if cell with 'digitalisate' and 'Urheber' have text). This would need some small tinkering of the xslt code.

4b. oXgarage2tei.xsl => gives a valid MsDesc tei file for fragments.

5. tei-to-latex => gives a print-similar layout. As exit-source it uses tei-5 MsDesc (from step 4b), xslt to fill up a LaTeX skeleton (model for the xslt: https://www.overleaf.com/read/hhbgsgvyqjrw).

