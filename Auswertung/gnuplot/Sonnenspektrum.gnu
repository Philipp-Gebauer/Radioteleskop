#png
  set terminal png size 1024,720
  set output "pngplots/Sonnenspektrum.png"

#epslatex
#set terminal epslatex # size 15 cm, 9 cm
#set output "plots/Sonnenspektrum.tex"

x_min = -18
x_max = 18
dataPTH = "Auswertung/Messwerte/TXT/SAz+00Al00_2.txt"

plot "Messwerte/TXT/SAz+00Al00_2.txt" using 1:2 
#plot dataPTH using 1:2 with lines 