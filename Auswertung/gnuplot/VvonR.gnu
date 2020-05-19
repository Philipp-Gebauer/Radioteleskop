#png
 set terminal png size 1024,720
 set output "pngplots/V(R).png"

#epslatex
#set terminal epslatex
#set output "plots/VvonR.tex"

y_min = 0
y_max = 240
z_min = 300
z_max = 700
dataPTH = "Messwerte/TXT/V(R)_Data.txt"

# Palette Config
load "jet.pal"
#set title "Abbildung der Sonne"
set yrange [y_min:y_max]
set xlabel "Bahnradius in $\\si{}{pc}$" 
set ylabel "V(R) in $\\si{}{\\frac{km}{s}$"


f(x) = c
c = 210
fit [y_min:y_max] f(x) dataPTH using 1:2 via c

# f(x) = a + c*exp(-(x-d)/t)
 #t = 3e-04
 #a = 0.001
 #d = 1e-03
#  fit [x_min:x_max] f(x) dataPTH using 1:2 via a,c,d,t

plot dataPTH u 1:2 ls 2 ps 3 lw 3 title "constant velocity", f(x) ls 8 lw 3 title "linear fit"