#png
#  set terminal png size 1024,720
#  set output "pngplots/Milchstrassesafe.png"

#epslatex
set terminal epslatex
set output "plots/Milchstrassesafe.tex"

y_min = -20
y_max = 20
x_min = -20
x_max = 20
dataPTH = "Messwerte/TXT/Milchstrassesafe.txt"

# Palette Config
load "jet.pal"
#set title "Abbildung der Sonne"
set yrange [y_min:y_max]
set xrange [x_min:x_max]
set xlabel "x in $\\si{}{kpc}$" 
set ylabel "y in $\\si{}{kpc}$"


# f(x) = c
# c = 210
# fit [y_min:y_max] f(x) dataPTH using 1:2 via c

# f(x) = a + c*exp(-(x-d)/t)
 #t = 3e-04
 #a = 0.001
 #d = 1e-03
#  fit [x_min:x_max] f(x) dataPTH using 1:2 via a,c,d,t

plot dataPTH u 1:2 ls 2 ps 3 lw 3 notitle