#!/usr/bin/python
import sys

osis = file(sys.argv[1]);

size = 1./20.
try: parts=int(sys.argv[2]);
except: parts=4

books=[]
booknames=[]
for n,i in enumerate(osis):
	if '"book"' in i:
		a,x,b=i.partition('osisID="')
		a,x,b=b.partition('"')
		books.append(n)
		booknames.append(a)

width=n
books.append(n)

print ("""<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->
<svg
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.0"
   width="%(width)f"
   height="60">
  <defs
     id="defs4" />
  <g
     id="layer1">""" % {"width":size * width})


for n,i in enumerate(booknames):
	print("""
    <rect
       width="%(width)f"
       height="40"
       x="%(x)f"
       y="0"
       style="opacity:1;fill:#ffe46c;fill-opacity:1;stroke:#000000;stroke-width:2.29904366;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
       """ % {"width":size * (books[n+1]-books[n]), "x": size*books[n]})
	print("""
    <text
       x="%(x)f"
       y="20"
       id="text2385"
       xml:space="preserve"
       style="font-size:20px;font-style:normal;font-weight:normal;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-family:Bitstream Vera Sans">%(name)s</text>
	 """ % {"x":size * books[n], "name": i})

for i in xrange(parts):
	print("""
    <rect
       width="%(width)f"
       height="20"
       x="%(x)f"
       y="40"
       style="opacity:1;fill:#6c6cff;fill-opacity:1;stroke:#000000;stroke-width:2.29904366;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
       """ % {"width":size * width / parts, "x": size*width/parts*i})


	

print("""
  </g>
</svg>
""")







