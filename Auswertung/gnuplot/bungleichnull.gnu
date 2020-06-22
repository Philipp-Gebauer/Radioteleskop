#png
#  set terminal png size 1024,720
#  set output "pngplots/bungleichnull.png"

#epslatex
set terminal epslatex # size 15 cm, 9 cm
set output "plots/bungleichnull.tex"

x_min = -222
x_max = 304
dataPTH1 = "Messwerte/TXT/Ml78b0.txt"
dataPTH2 = "Messwerte/TXT/Ml78b-2.txt"
dataPTH3 = "Messwerte/TXT/Ml78b2.txt"


# Palette Config
load "jet.pal"
#set xlabel "velocity relative to LSR in $\\si{}{\\frac{km}{s}}$"
#set ylabel "temperature in $\\si{}{K}$"
set xlabel "Geschwindigkeit relativ zu LSR in $\\frac{\\text{km}}{\\text{s}}$"
set ylabel "Temperatur in K"
set xrange [x_min:x_max] 


plot dataPTH1 using 1:2 with line ls 1 lw 2 title "$l = \\si{78}{\\degree}, b = \\, \\, \\, \\, \\, \\si{0}{\\degree}$", \
   dataPTH2 using 1:2 with line ls 7 lw 2 title "$l = \\si{78}{\\degree}, b = \\si{-2}{\\degree}$", \
    dataPTH3 using 1:2 with line ls 9 lw 2 title "$l = \\si{78}{\\degree}, b = \\, \\, \\, \\, \\, \\si{2}{\\degree}$"