# folder to store xslt scripts

OxGarageTObasicMetadataFragmentarium.xsl => gives a table form with only those elements needed for the metadata in Fragmentarium (not the full description). Choose only those Fragmente which have description and are digitised but not yet entered in Fragmentarium.

MondseeToTeiMsDesc => gives a valid MsDesc tei file for fragments. Schema according to which it is validated: as seen in Fragmentarium. 
	###Need to ask Rafael if they have a stable one.###

tei-to-latex => should give a print-similar layout. As exit-source uses tei-5 MsDesc, xslt to fill up a LaTeX skeleton (built up using https://de.sharelatex.com/project/5a1969973621de2df076b05e) 

