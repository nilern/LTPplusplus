OPINTOMONISTEIDEN_LATEX := $(wildcard ./opintomonisteet/*.tex)
OPINTOMONISTEIDEN_PDF := $(patsubst ./opintomonisteet/%.tex, ./build/opintomonisteet/%.pdf, $(OPINTOMONISTEIDEN_LATEX))

LASKUHARJOITUSTEN_LATEX := $(wildcard ./laskuharjoitukset/*.tex)
LASKUHARJOITUSTEN_PDF := $(patsubst ./laskuharjoitukset/%.tex, ./build/laskuharjoitukset/%.pdf, $(LASKUHARJOITUSTEN_LATEX))

#  Pääkohteet: ----------------------------------------------------------------------------------

.PHONY: all
all: opintomonisteet laskuharjoitukset nettisivu

.PHONY: opintomonisteet
opintomonisteet: $(OPINTOMONISTEIDEN_PDF)

.PHONY: laskuharjoitukset
laskuharjoitukset: $(LASKUHARJOITUSTEN_PDF)

.PHONY: nettisivu
nettisivu: ./build/nettisivu/index.html ./build/nettisivu/style.css opintomonisteet laskuharjoitukset
	cp -r ./build/opintomonisteet ./build/laskuharjoitukset ./build/nettisivu/

.PHONY: clean
clean:
	rm -r build

# Yksittäiset tiedostot: -----------------------------------------------------------------------

./build/opintomonisteet/%.pdf: ./opintomonisteet/%.tex ./build/opintomonisteet
	rubber --pdf --into=./build/opintomonisteet $<
	rubber --clean --into=./build/opintomonisteet $<

./build/laskuharjoitukset/%.pdf: ./laskuharjoitukset/%.tex ./build/laskuharjoitukset
	rubber --pdf --into=./build/laskuharjoitukset $<
	rubber --clean --into=./build/laskuharjoitukset $<

./build/nettisivu/index.html: ./nettisivu/index.haml ./build/nettisivu
	haml $< > $@

./build/nettisivu/style.css: ./nettisivu/style.scss ./build/nettisivu 
	sass $< > $@

# Kansiorakenne: -------------------------------------------------------------------------------

./build:
	mkdir $@

./build/opintomonisteet: ./build
	mkdir $@

./build/laskuharjoitukset: ./build
	mkdir $@

./build/nettisivu: ./build
	mkdir $@
