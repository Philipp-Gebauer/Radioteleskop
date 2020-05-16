#png
# set terminal png size 1024,720
# set output "pngplots/Sonnenabbild.png"

#epslatex
set terminal epslatex
set output "plots/Sonnenabbild.tex"

x_min = -8.3e-03
x_max = -2e-03
z_min = 300
z_max = 700
dataPTH = "Messwerte/TXT/Sonnenabbild.txt"

# Palette Config
load "set2.pal"
#set title "Abbildung der Sonne"
#set xrange [x_min:x_max]
set zrange [z_min:z_max]
set xlabel "Azimuth off in $\\degree$" offset 0,-1 rotate parallel
set ylabel "Altitude off in $\\degree$" offset 0,-1 rotate parallel
set zlabel "Temperatur in $\\si{}{K}$" rotate parallel
set dgrid3d 100,100
set hidden3d

#set datafile separator ","

# f(x) = a + c*exp(-(x-d)/t)
# t = 3e-04
# a = 0.001
# d = 1e-03
# fit [x_min:x_max] f(x) dataPTH using 1:2 via a,c,d,t

# set label sprintf("$\\tau$ = \\SI{%.7f \\pm %.7f}{s}", t, t_err) at graph 0.5, 0.5
splot dataPTH u 1:2:4 with lines notitle