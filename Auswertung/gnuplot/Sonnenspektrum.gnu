#png
 # set terminal png size 1024,720
 # set output "pngplots/Sonnenspektrum.png"

#epslatex
set terminal epslatex # size 15 cm, 9 cm
set output "plots/Sonnenspektrum.tex"

y_min = 0
y_max = 750
dataPTH = "Auswertung/Messwerte/Sonnenspektrum.txt"


load "jet.pal"
set xlabel "Frequenz in MHz"
set ylabel "Temperatur in K"
set yrange [y_min:y_max]

set arrow from 1410,0 to 1410,750 nohead

plot "Messwerte/TXT/Sonnenspektrum.txt" using 2:3 ls 2 ps 1 lw 1 title "Messwerte"
#plot dataPTH using 1:2 with lines 