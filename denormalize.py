import os
import glob
import lxml.etree as ET
from collections import defaultdict
from acdh_tei_pyutils.tei import TeiReader

ns = {"tei": "http://www.tei-c.org/ns/1.0"}
indices = glob.glob('./data/indices/*.xml')
for x in indices:
    doc = TeiReader(x)
    for bad in doc.any_xpath(".//tei:linkGrp"):
        bad.getparent().remove(bad)
    doc.tree_to_file(x)
bibl_dict = defaultdict(set)
ent_dict = defaultdict(set)
files = glob.glob('./data/descriptions/*.xml')
sep = "§§§§§§§"
listsource_file = './data/indices/listsources.xml'
listsources = TeiReader(listsource_file)

for x in files:
    _, f_name = os.path.split(x)
    doc = TeiReader(x)
    title = doc.any_xpath('.//tei:title[1]')[0].text
    abbrs = doc.any_xpath('.//tei:bibl/tei:abbr')
    sigle = f"{f_name}{sep}{title}"
    for abbr in abbrs:
        bibl_dict[abbr.text].add(sigle)
    for ref in doc.any_xpath('.//@ref'):
        ent_dict[ref[1:]].add(sigle)

for x in listsources.any_xpath('.//tei:item'):
    label_node = x.xpath('./tei:label', namespaces=ns)[0]
    item = label_node.getparent()
    label = label_node.text
    try:
        matches = dict(bibl_dict)[label]
    except KeyError:
        continue
    link_group = ET.Element("{http://www.tei-c.org/ns/1.0}linkGrp")
    for match in matches:
        target, source = match.split(sep)
        link = ET.Element("{http://www.tei-c.org/ns/1.0}ptr")
        link.attrib['target'] = target
        link.attrib['sameAs'] = source
        link_group.append(link)
    item.append(link_group)
listsources.tree_to_file(listsource_file)

for x in indices:
    doc = TeiReader(x)
    for item in doc.any_xpath('.//*[@xml:id]'):
        xml_id = item.attrib['{http://www.w3.org/XML/1998/namespace}id']
        try:
            matches = dict(ent_dict)[xml_id]
        except KeyError:
            continue
        link_group = ET.Element("{http://www.tei-c.org/ns/1.0}linkGrp")
        for match in matches:
            target, source = match.split(sep)
            link = ET.Element("{http://www.tei-c.org/ns/1.0}ptr")
            link.attrib['target'] = target
            link.attrib['sameAs'] = source
            link_group.append(link)
        item.append(link_group)
    doc.tree_to_file(x)