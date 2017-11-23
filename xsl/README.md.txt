# folder to store xslt scripts

MondseeToFragmentariumKerndaten.xsl => gives a table form with only those elements needed for the metadata in Fragmentarium (not the full description).

MondseeToTeiMsDesc => gives a valid MsDesc tei file for fragments. Schema according to which it is validated: as seen in Fragmentarium. 
	###Need to ask Rafael if they have a stable one.###

MondseeToPrint => should give a print-similar layout.

To get the source file:
1. download the table from google.docs in .xlsx format. 
2. delete all sheet except the first one (Fragmenten).
3. In http://www.tei-c.org/oxgarage/# Convert the file to TEI P5 XML Document.
4. Store this in the folder "source".
5. Run the xsl for the desired operation.