#png
#set terminal png size 1024,720
#set output "pngplots/Sonnenabbild.png"

#epslatex
set terminal epslatex
set output "plots/Sonnenabbild.tex"

x_min = -8.3e-03
x_max = -2e-03
z_min = 300
z_max = 700
dataPTH = "Messwerte/TXT/Sonnenabbild.txt"

# Palette Config
load "jet.pal"
#set title "Abbildung der Sonne"
#set xrange [x_min:x_max]
set zrange [z_min:z_max]
#set xrange [-10:10]
#set yrange [-10:10]
#set xlabel "azimuth offset in $\\degree$" offset 0,-1 rotate parallel
#set ylabel "altitude offset in $\\degree$" offset 0,-1 rotate parallel
#set zlabel "temperature in $\\si{}{K}$" rotate parallel
set xlabel "Azimutwinkelversatz in $\\degree$" offset 0,-1 rotate parallel
set ylabel "H\\\"ohenwinkelversatz in $\\degree$" offset 0,-1 rotate parallel
set zlabel "Temperatur in $\\si{K}$" rotate parallel
set dgrid3d 101,101
set hidden3d
set ztics 100
set ticslevel 0.05
set cbrange [300:700]
unset colorbox
#set dgrid3d splines
#set dgrid3d 101,101 qnorm 1
set dgrid3d 151,151 qnorm (2,mean=0,sd=1)
#set dgrid3d 30,30 qnorm 2
#set dgrid3d 191,191 gauss 2.25,2.25
#set dgrid3d 30,30 gauss .75
#set dgrid3d 30,30 gauss 0.35,0.5

#set pm3d #füllt mit farbe
#set datafile separator ","

 #f(x) = a + c*exp(-(x-d)/t)
 #t = 3e-04
 #a = 0.001
 #d = 1e-03
#  fit [x_min:x_max] f(x) dataPTH using 1:2 via a,c,d,t

# set label sprintf("$\\tau$ = \\SI{%.7f \\pm %.7f}{s}", t, t_err) at graph 0.5, 0.5
splot dataPTH u 1:2:4 with lines notitle linecolor palette