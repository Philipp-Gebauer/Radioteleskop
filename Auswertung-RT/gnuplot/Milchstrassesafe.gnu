#png
#  set terminal png size 1024,720
#  set output "pngplots/Milchstrassesafe.png"

#epslatex
set terminal epslatex
set output "plots/Milchstrassesafe.tex"

y_min = -40
y_max = 20
x_min = -30
x_max = 30
dataPTH = "Messwerte/TXT/Milchstrassesafe.txt"

# Palette Config
load "jet.pal"
#set title "Abbildung der Sonne"
set yrange [y_min:y_max]
set xrange [x_min:x_max]
#set xlabel "x in $\\si{}{kpc}$" 
#set ylabel "y in $\\si{}{kpc}$"
set xlabel "x in kpc" 
set ylabel "y in kpc"
set object circle at 0,-8.5 size first 25 fc rgb "navy" fs solid 0.5
set size square
set ytics 5
 set xtics 5


# f(x) = c
# c = 210
# fit [y_min:y_max] f(x) dataPTH using 1:2 via c

# f(x) = a + c*exp(-(x-d)/t)
 #t = 3e-04
 #a = 0.001
 #d = 1e-03
#  fit [x_min:x_max] f(x) dataPTH using 1:2 via a,c,d,t

plot dataPTH u 1:2 ls 2 ps 2 pt 1 lw 3 notitle