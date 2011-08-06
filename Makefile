### MAKEFILE for creating GoBible applications for phones with different sizes of memory.

### Use `make help' for user documentation
### This is the developer documentation.

### Definitions

# composition (COMP)
# 	The list of books in a bible depending on the denomination and the canon.
# 	Translations of only one part of the Bible also count as a separate composition.
# 	eg. P, R, N (Protestant, Roman Catholic, New Testament)
# translation (TRAN, plural TRANS):
# 	A specific translation.
# 	eg. HunUj (Hungarian New translation)
# language (LANG):
# 	The language of the user interface to be used with a translation.
# 	eg. en_US
# level (LEVEL):
# 	Unfortunately we have to separate the Bible in smaller Java applications,
# 	because certain phones have small heap memory (RAM). There are different levels
# 	of splitting, depending on the size of memory.
#	The way the Bible is split is the same for all translations belonging to a single
#	composition. This is called the composition level.
#	The files generated for a translation in one level are called the translation
#	level. These files are in a separate folder.
# 	eg. HunUj-1M (1M level of HunUj translation)
# collection (COLL):
# 	One application.
# limit:
# 	The book numbers where a collection starts and ends.
# 	eg. start=1 end=5
# whole collection (WHOLE):
# 	A collection which contains all books of a translation.
# 	eg. HunUj
# split collection (SPLIT):
# 	A collection which is not a whole collection, in other words a collection made
# 	by splitting. Its name contains the abbreviation of the first book.
# 	eg. HunUj2-Zsolt (Second collection of the level, first book is Zsoltárok (Psalms))
# abbreviation (ABBR):
# 	The abbreviation of book names for use in filenames. Only the first books of
# 	split collections must be given. It should not contain non-english letters.
# 	eg. Zsolt (Psa)
# part:
# 	A part of a level, numbered from 1. This appears in the name of the split
# 	collections.
# 	eg. 2
# txt:
# 	The input file for GoBibleCreator, which describes the books and their names.
# 	Whole txt's are in the root folder, split ones are in the level's folder.
# 	eg. HunUj.txt, HunUj-1M/HunUj2-Zsolt.txt
# jar:
# 	The application file. Has the same base name as its corresponding txt file.
# jad:
# 	The application descriptor file needed by certain phones.
# zip:
# 	The .jar and .jad files of a level, in an archive. Whole collections also have
# 	zipfiles.
# 	eg. HunUj-1M.zip, HunUj.zip
# osis:
# 	The XML file from where Bible text is loaded (OSIS format).
# thml:
# 	The XML file from where Bible text is loaded (ThML format).
# svg:
# 	An SVG file illustrating the optimal distribution of a translation level.
# GoBible.zip
# 	A zipfile containg all the desired output files.

# 'Belongs to' relations between concepts (arrowheads mean 'only one')
# 	translation -> composition
# 	translation -> language
#	composition level -> composition
#	composition level -> level
#	translation level -> translation
#	translation level -> level
# 	split collection -> translation level
# 	split collection <-> part
# 	whole collection <-> translation
# 	txt <-> collection
# 	jar <-> collection
# 	jad <-> collection
# 	zip <-> translation level
# 	svg <-> translation level
# 	zip <-> whole collection

### Settings

# compositions
# 	Protestant, Roman Catholic, New Testament, Old Testament, Septuagint (=Roman Catholic Old Testament)
COMPS = P R N O L

# translations
# 	Based on their SWORD module name, if any. Organized by composition.
P.TRANS = HunKar HunUj NIV
R.TRANS = HunSztI
N.TRANS = Byz HunEgy
O.TRANS = Aleppo


# languages
# 	Which UI language to use with each translation
HunKar.lang = hu_HU
HunUj.lang = hu_HU
HunSztI.lang = hu_HU
HunEgy.lang = hu_HU
NIV.lang = en_US
Byz.lang = hu_HU
Aleppo.lang = hu_HU

# Compositions
# 	Levels, parts, limits and abbreviations
# 	
# 	Watch out for whitespaces! Do not put whitespaces after limit numbers.

#  P (Protestant)

#   levels
P.LEVELS = 1M 500k 300k
#   parts
P.level-1M = 1 2
P.level-500k = 1 2 3 4
P.level-300k = 1 2 3 4 5 6 7 8 

#   limits
P.1M1.start=1# Gen
P.1M1.end=18
P.1M2.start=19# Ps
P.1M2.end=66

P.500k1.start=1# Gen
P.500k1.end=5
P.500k2.start=6# Josh
P.500k2.end=18
P.500k3.start=19# Psa
P.500k3.end=39
P.500k4.start=40# Matt
P.500k4.end=66

P.300k1.start=1# Gen
P.300k1.end=5
P.300k2.start=6# Josh
P.300k2.end=12
P.300k3.start=13# 1Chr
P.300k3.end=18
P.300k4.start=19# Psa
P.300k4.end=22
P.300k5.start=23# Isa
P.300k5.end=27
P.300k6.start=28# Hos
P.300k6.end=39
P.300k7.start=40# Matt
P.300k7.end=44
P.300k8.start=45# Rom
P.300k8.end=66

#   abbreviations
HunUj.abbr-1=1Moz
HunUj.abbr-6=Jozs
HunUj.abbr-7=Bir
HunUj.abbr-13=1Kron
HunUj.abbr-19=Zsolt
HunUj.abbr-23=Ezs
HunUj.abbr-28=Hos
HunUj.abbr-40=Mat
HunUj.abbr-45=Rom
HunKar.abbr-1=1Moz
HunKar.abbr-6=Jozs
HunKar.abbr-7=Bir
HunKar.abbr-13=1Kron
HunKar.abbr-19=Zsolt
HunKar.abbr-23=Ezs
HunKar.abbr-28=Hos
HunKar.abbr-40=Mat
HunKar.abbr-45=Rom
NIV.abbr-1=Ge
NIV.abbr-6=Jo
NIV.abbr-7=Ju
NIV.abbr-13=1Ch
NIV.abbr-19=Ps
NIV.abbr-23=Is
NIV.abbr-28=Ho
NIV.abbr-40=Mt
NIV.abbr-45=Ro

#  R (Roman Catholic)

#   levels
R.LEVELS = 1M 500k 300k
#   parts
R.level-1M = 1 2
R.level-500k = 1 2 3 4 5
R.level-300k = 1 2 3 4 5 6 7 8 

#   limits
R.1M1.start=1# Gen
R.1M1.end=22
R.1M2.start=23# Ps
R.1M2.end=73

R.500k1.start=1# Gen
R.500k1.end=10
R.500k2.start=11# 1Kgs
R.500k2.end=22
R.500k3.start=23# Psa
R.500k3.end=34
R.500k4.start=35# Hos
R.500k4.end=73
#R.500k1.start=1# Gen
#R.500k1.end=10
#R.500k2.start=11# 1Kgs
#R.500k2.end=22
#R.500k3.start=23# Psa
#R.500k3.end=33
#R.500k4.start=34# Dan
#R.500k4.end=73

R.300k1.start=1# Gen
R.300k1.end=4
R.300k2.start=5# Deu
R.300k2.end=10
R.300k3.start=11# 1Kgs
R.300k3.end=18
R.300k4.start=19# Esth
R.300k4.end=23
R.300k5.start=24# Pro
R.300k5.end=29
R.300k6.start=30# Jer
R.300k6.end=46
R.300k7.start=47# Matt
R.300k7.end=51
R.300k8.start=52# Rom
R.300k8.end=73

#   abbreviations
HunSztI.abbr-1=Ter
HunSztI.abbr-5=MTorv
HunSztI.abbr-6=Jozs
HunSztI.abbr-7=Bir
HunSztI.abbr-11=1Kir
HunSztI.abbr-12=2Kir
HunSztI.abbr-13=1Kron
HunSztI.abbr-19=Eszt
HunSztI.abbr-22=Job
HunSztI.abbr-23=Zsolt
HunSztI.abbr-24=Peld
HunSztI.abbr-29=Iz
HunSztI.abbr-34=Dan
HunSztI.abbr-35=Oz
HunSztI.abbr-47=Mt
HunSztI.abbr-52=Rom

# N (New Testament)

#   levels
N.LEVELS = 300k

#   parts
N.level-300k = 1 2

#   limits
N.300k1.start=1
N.300k1.end=5
N.300k2.start=6
N.300k2.end=27

#   abbreviations
Byz.abbr-1=Mt
Byz.abbr-6=Rom

HunEgy.abbr-1=Mt
HunEgy.abbr-6=Rom

# O (Old Testament)

#   levels
O.LEVELS = 500k 300k
#   parts
O.level-500k = 1 2
O.level-300k = 1 2 3
#   limits
O.500k1.start=1
O.500k1.end=14# 2Chr
O.500k2.start=15# Ezra
O.500k2.end=39# Mal
O.300k1.start=1
O.300k1.end=9# 1Sam
O.300k2.start=10# 2Sam
O.300k2.end=19# Ps
O.300k3.start=20# Prov
O.300k3.end=39# Mal

#   abbreviations
Aleppo.abbr-1=1Moz
Aleppo.abbr-10=2Sam
Aleppo.abbr-15=Ezsdr
Aleppo.abbr-20=Peld




# GoBible version
GBVER = 2.2.6



### End of settings.

DEFAULT: all

### Acquisition of GoBibleCreator

GB = GoBibleCreator_${GBVER}

# download zip
${GB}.zip :
	wget http://gobible.jolon.org/developer/GoBibleCreator/GoBibleCreator%20${GBVER}.zip
	mv GoBibleCreator\ ${GBVER}.zip ${GB}.zip

# unpack
# 	unzip, copy translated ui.properties, rename not to have spaces in filenames,
# 	delete MacosX files
unpack : ${GB}.zip 
	unzip ${GB}.zip
	rm -R __MACOSX
	mv GoBibleCreator\ ${GBVER} ${GB}
	touch unpack

### Acquisition of Bible texts

# translations
#TRANS = HunUj
TRANS = $(foreach comp, ${COMPS}, \
		$(foreach tran, ${${comp}.TRANS}, ${tran}))
# osis files
#OSISS = HunUj.osis
OSISS = $(foreach comp, ${COMPS}, \
		$(foreach tran, ${${comp}.TRANS}, ${tran}.osis))

# rule for osis files
%.osis :
	mod2osis $(subst .osis,,$@) | \
		sed 's/\&nbsp;/ /g' | \
		sed 's/\&#59;/;/g' > $@

### Building collections

# whole collections
#WHOLES = HunUj
WHOLES = $(foreach comp, ${COMPS}, ${${comp}.TRANS})

# split collection path pattern
# splitpath <comp> <tran> <level> <part>
#splitpath=$2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}

# split collections
#SPLITS = HunUj-1M/HunUj2-Zsolt
#SPLITS = $(foreach comp, ${COMPS}, \
		$(foreach tran, ${${comp}.TRANS}, \
			$(foreach level, ${${comp}.LEVELS}, \
	      			$(foreach part, ${${comp}.level-${level}}, \
					$(call splitpath,${coll},${tran},${level},${trans})))))

# collections
#COLLS = ${WHOLES} ${SPLITS}

# whole jarfiles
#JARS = HunUj.jar HunUj-1M/HunUj1-1Moz.jar
JARS=$(foreach whole, ${WHOLES}, ${whole}.jar)

# other collection files
TXTS=${JARS:%.jar=%.txt}
JADS=${JARS:%.jar=%.jad}

# zipfiles
#ZIPS = HunUj-1M.zip
ZIPS = $(foreach comp, ${COMPS}, \
		$(foreach tran, ${${comp}.TRANS}, \
			$(foreach level, ${${comp}.LEVELS}, ${tran}-${level}.zip))) ${JARS:%.jar=%.zip}

# svgfiles
#SVGS = HunUj-1M.svg
SVGS = ${ZIPS:%.zip=%.svg}


# default target
all: ${ZIPS} ${JARS}

# rule pattern for whole collection files
# whole <tran>
define whole
$1.txt: source-$1.txt
	echo "Source-Text: $1.osis" > $1.txt
	echo "Collection: $1" >> $1.txt
	cat source-$1.txt >> $1.txt
endef
# apply
$(foreach comp, ${COMPS}, \
	$(foreach tran, ${${comp}.TRANS}, $(eval $(call whole,${tran}))))

# split collection rule pattern
# collection <comp> <tran> <level> <part>
define collection
name:=$2$4-${$2.abbr-${$1.$3$4.start}}
dir:=$2-$3
path:=$2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}
start:=${$1.$3$4.start}
end:=${$1.$3$4.end}
$2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}.txt: $2.txt
	mkdir -p $2-$3
	@echo Building $1 $2 $3 $4 $2.abbr-${$1.$3$4.start} Aleppo.abbr-15 ${$2.abbr-${$1.$3$4.start}} ${Aleppo.abbr-15}
	echo "Source-Text: ../$2.osis" > $2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}.txt
	echo "Collection: $2$4-${$2.abbr-${$1.$3$4.start}}" >> $2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}.txt
	grep '^Book:' $2.txt | head -n${$1.$3$4.end} | tail -n+${$1.$3$4.start} >> $2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}.txt
	grep '^Book-Name-Map:' $2.txt | head -n${$1.$3$4.end} | tail -n+${$1.$3$4.start} >> $2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}.txt

$2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}.jar : $2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}.txt unpack $2.osis
	cp -f ui.${$2.lang}.properties ${GB}/GoBibleCore/ui.properties
	cd ${GB} && java -Xmx128m -jar GoBibleCreator.jar ../$2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}.txt

$2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}.jad : $2-$3/$2$4-${$2.abbr-${$1.$3$4.start}}.jar
endef
# apply
# Do not write whitespaces in $(call) parameters.
$(foreach comp, ${COMPS}, \
	$(foreach tran, ${${comp}.TRANS}, \
		$(foreach level, ${${comp}.LEVELS}, \
			$(foreach part, ${${comp}.level-${level}}, \
				$(eval $(call collection,${comp},${tran},${level},${part}))))))

# whole collection jarfile rule 
# 	(split collection jarfile rules are above, in collection rule pattern)
%.jar %.jad : %.txt unpack %.osis
	cp -f ui.${$*.lang}.properties ${GB}/GoBibleCore/ui.properties
	cd ${GB} && java -Xmx128m -jar GoBibleCreator.jar ../$<

%.zip : %.jar %.jad
	zip $*.zip $*.jar $*.jad 


# zipfile rule pattern
# zipfile <comp> <tran> <level>
define zipfile
$2-$3.zip: $(foreach i,${$1.level-$3},$2-$3/$2$i-${$2.abbr-${$1.$3$i.start}}.jar $2-$3/$2$i-${$2.abbr-${$1.$3$i.start}}.jad)
	cd $2-$3 && zip $2-$3.zip $(foreach i,${$1.level-$3},$2$i-${$2.abbr-${$1.$3$i.start}}.jar $2$i-${$2.abbr-${$1.$3$i.start}}.jad) && mv $2-$3.zip ..
endef
# apply zipfile rules
$(foreach comp, ${COMPS}, \
	$(foreach tran, ${${comp}.TRANS}, \
		$(foreach level, ${${comp}.LEVELS}, \
			$(eval $(call zipfile,${comp},${tran},${level})))))

# svg rule pattern
# svgfile <comp> <tran> <level>
define svgfile
$2-$3.svg: $2.osis osis2svg.py
	python osis2svg.py $2.osis $n > $2-$3.svg
endef
# apply svgfile rules
$(foreach comp, ${COMPS}, \
	$(foreach tran, ${${comp}.TRANS}, \
		$(foreach level, ${${comp}.LEVELS}, \
			$(foreach i,${${comp}.level-${level}},$(eval n=$i)) \
			$(eval $(call svgfile,${comp},${tran},${level})))))

### shortcuts

# shortcut rule pattern
# shortcut <tran> <comp>
#HunUj: HunUj-1M.zip HunUj-500k.zip
define shortcut
$1: $(foreach i,${$2.LEVELS},$1-$i.zip)
endef
# apply
$(foreach comp, ${COMPS}, \
	$(foreach tran, ${${comp}.TRANS}, \
		$(eval $(call shortcut,${tran},${comp}))))

# all svgs shortcut
svgs : ${SVGS}

# GoBible.zip
# 	A zipfile containing all the zips and whole jars.
GoBible.zip: ${ZIPS}
	zip GoBible.zip ${ZIPS}

### cleaning
clean:
	rm -Rf ${JARS} ${JADS} ${TXTS} ${ZIPS} wap/ ${GB} unpack ${ZIPS:%.zip=%} ${SVGS}
# FIXME	rmdir ${ZIPS:%.zip=%}

### user doc

# help
help:
	@echo "Usage: make <target>"
	@echo "Available targets: "
	@echo "	help	print this document"
	@echo "	unpack	download and unpack the GoBibleCreator zip"
	@echo "	all	build all possible jarfiles"
	@echo "	clean	clean all created files except the downloadaded zipfile"
	@echo "	<t>	build all jarfiles of translation <t>"
	@echo "	svgs	build all svg files illustrating the bibles"
	@echo "	GoBible.zip	build and pack everything"


# TXT to OSIS generation
HunSztI.osis source-HunSztI-fullnames.txt: text-HunSztI.txt txt2osis-HunSztI.pl
	perl txt2osis-HunSztI.pl text-HunSztI.txt >HunSztI.osis 2>source-HunSztI-fullnames.txt
NIV.osis source-NIV.txt: text-NIV.txt txt2osis-NIV.pl
	perl txt2osis-NIV.pl text-NIV.txt >NIV.osis 2>source-NIV.txt


test:
	@echo $(call collection,P,HunUj,1M,2)
	@echo ${HunSztI.abbr-1}
	@echo ${P.1M1.start}

print-%:
	@echo $($*)

debug:
	@echo "$(foreach comp, ${COMPS}, $(foreach tran, ${${comp}.TRANS},$(eval $(call shortcut,${tran},${comp}))))"

	

#OLD_SHELL := $(SHELL)
#SHELL = $(warning [$@ ($^) ($?)])$(OLD_SHELL)

