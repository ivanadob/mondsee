# folder to store xslt scripts

1. Copy-paste the data from the first sheet of the google-spreadsheet to excel;
2. in Excel fill out all empty cells with "empty_cell" (method explained here: https://www.accountingweb.com/sites/default/files/Blanks---Figure-3.jpg);
3. Transform the .xlsx to TEI5 in http://oxgarage.tei-c.org/# . This should transform the table so that each row including the data for one fragment is in one <row> element and each cell is in a <cell> element. After the transformation open the xml in Oxygen (or other editor), search for "empty_cell" and replace it with nothing, so that all initially empty fields are empty elements <cell>. 

4a. OxGarageTObasicMetadataFragmentarium.xsl => gives a table form with only those elements needed for the metadata in Fragmentarium (not the full description). Be careful to check: are conditions there so that you take only those fragments, which have description and are digitised but not yet entered in Fragmentarium (if cell with 'digitalisate' and 'Urheber' have text).

4b. oXgarage2tei.xsl => gives a valid MsDesc tei file for fragments. Schema according to which it is validated: as seen in Fragmentarium. 
	###Need to ask Rafael if they have a stable one.###

5. tei-to-latex => should give a print-similar layout. As exit-source it uses tei-5 MsDesc (from step 4b), xslt to fill up a LaTeX skeleton (built up using https://de.sharelatex.com/project/5a1969973621de2df076b05e) 

