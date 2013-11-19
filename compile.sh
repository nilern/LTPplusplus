#! /bin/sh

pdflatex -output-directory pruju/ pruju.tex
pdflatex -output-directory laskarit/ laskarit.tex
htlatex pruju.tex "html,mathplayer" "" "-dpruju/"
htlatex laskarit.tex "html,mathplayer" "" "-dlaskarit/"
cp pruju.tex pruju/
cp laskarit.tex laskarit/