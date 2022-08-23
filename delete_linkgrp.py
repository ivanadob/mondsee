import glob
from acdh_tei_pyutils.tei import TeiReader


ns = {"tei": "http://www.tei-c.org/ns/1.0"}
indices = glob.glob('./data/indices/*.xml')
for x in indices:
    doc = TeiReader(x)
    for bad in doc.any_xpath(".//tei:linkGrp"):
        bad.getparent().remove(bad)
    doc.tree_to_file(x)