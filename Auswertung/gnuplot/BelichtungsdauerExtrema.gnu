#png
#  set terminal png size 1024,720
#  set output "pngplots/BelichtungszeitExtrema.png"

#epslatex
set terminal epslatex # size 15 cm, 9 cm
set output "plots/BelichtungszeitExtrema.tex"

x_min = -230
x_max = 300
dataPTH1 = "Messwerte/TXT/M_Bel1s_l84_b0.txt"
dataPTH2 = "Messwerte/TXT/M_Bel3s_l84_b0.txt"
dataPTH3 = "Messwerte/TXT/M_Bel10s_l84_b0.txt"
dataPTH4 = "Messwerte/TXT/M_Bel30s_l84_b0.txt"
dataPTH5 = "Messwerte/TXT/M_Bel100s_l84_b0.txt"
dataPTH6 = "Messwerte/TXT/M_Bel300s_l84_b0.txt"


# Palette Config
load "jet.pal"
set xlabel "velocity relative to LSR in $\\si{}{\\frac{km}{s}}$"
set ylabel "Temperatur in $\\si{}{K}$"
set xrange [x_min:x_max] 

plot dataPTH1 using 1:2 with line ls 1 lw 2 title "$\\si{1}{s}$", \
     dataPTH4 using 1:2 with line ls 7 lw 2 title "$\\si{30}{s}$", \
      dataPTH6 using 1:2 with line ls 9 lw 2 title "$\\si{300}{s}$"