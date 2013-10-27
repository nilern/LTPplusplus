#! /bin/sh

pdflatex pruju.tex
pdflatex laskarit.tex
htlatex pruju.tex "html,mathplayer" "" "-dpruju/"
htlatex laskarit.tex "html,mathplayer" "" "-dlaskarit/"