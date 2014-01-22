#! /bin/sh

pdflatex -output-directory pruju/ pruju.tex
pdflatex -output-directory laskarit/ ltp_osa?_laskarit_?.tex
htlatex pruju.tex "html,mathplayer" "" "-dpruju/"
htlatex ltp_osa?_laskarit_?.tex "html,mathplayer" "" "-dlaskarit/"
cp pruju.tex pruju/
cp ltp_osa?_laskarit_?.tex laskarit/