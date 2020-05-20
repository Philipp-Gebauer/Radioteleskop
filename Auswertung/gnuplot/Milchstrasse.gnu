#png
#  set terminal png size 1024,720
#  set output "pngplots/Milchstrasse.png"

#epslatex
set terminal epslatex
set output "plots/Milchstrasse.tex"

y_min = -30
y_max = 30
x_min = -30
x_max = 30

dataPTH = "Messwerte/TXT/Milchstrasse.txt"

# Palette Config
load "jet.pal"
#set title "Abbildung der Sonne"
set ytics 5
 set xtics 5
 set yrange [y_min:y_max]
set xrange [x_min:x_max]
set xlabel "x in $\\si{}{kpc}$" 
set ylabel "y in $\\si{}{kpc}$"
set object circle at 0,0 size first 25 fc rgb "navy"
set size square



# f(x) = c
# c = 210
# fit [y_min:y_max] f(x) dataPTH using 1:2 via c

# f(x) = a + c*exp(-(x-d)/t)
 #t = 3e-04
 #a = 0.001
 #d = 1e-03
#  fit [x_min:x_max] f(x) dataPTH using 1:2 via a,c,d,t

plot dataPTH u 1:2 ls 2 ps 3 lw 3 notitle