#png
#  set terminal png size 1024,720
#  set output "pngplots/Belichtungszeit.png"

#epslatex
set terminal epslatex # size 15 cm, 9 cm
set output "plots/Belichtungszeit.tex"

x_min = -250
x_max = 400
dataPTH1 = "Messwerte/TXT/M_Bel1s_l84_b0.txt"
dataPTH2 = "Messwerte/TXT/M_Bel3s_l84_b0.txt"
dataPTH3 = "Messwerte/TXT/M_Bel10s_l84_b0.txt"
dataPTH4 = "Messwerte/TXT/M_Bel30s_l84_b0.txt"
dataPTH5 = "Messwerte/TXT/M_Bel100s_l84_b0.txt"
dataPTH6 = "Messwerte/TXT/M_Bel300s_l84_b0.txt"


# Palette Config
load "jet.pal"
set xlabel "velocity relative to LSR in $\\si{}{\\frac{km}{s}}$"
set ylabel "Continuum intensity [arbitrary units]"
set xrange [x_min:x_max] 

plot dataPTH1 using 1:2 with line ls 1 ps 3 lw 2 title "$\\si{1}{s}$ Belichtungszeit", dataPTH2 using 1:2 with line ls 3 ps 3 lw 2 title "$\\si{3}{s}$ Belichtungszeit", dataPTH3 using 1:2 with line ls 5 ps 3 lw 2 title "$\\si{10}{s}$ Belichtungszeit", dataPTH4 using 1:2 with line ls 7 ps 3 lw 2 title "$\\si{30}{s}$ Belichtungszeit", dataPTH5 using 1:2 with line ls 9 ps 3 lw 2 title "$\\si{100}{s}$ Belichtungszeit", dataPTH6 using 1:2 with line ls 11 ps 3 lw 2 title "$\\si{300}{s}$ Belichtungszeit"