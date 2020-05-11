#png
# set terminal png size 1024,720
# set output "pngplots/test.png"

#epslatex
set terminal epslatex
set output "plots/test.tex"

x_min = -8.3e-03
x_max = -2e-03
dataPTH = "Messwerte/NewFile0.csv"

# Palette Config
load "set2.pal"
set title "Geiler Scheiß"
set xrange [x_min:x_max]
set xlabel "$\\Delta$ E in eV"

set datafile separator ","

f(x) = a + c*exp(-(x-d)/t)
t = 3e-04
a = 0.001
d = 1e-03
fit [x_min:x_max] f(x) dataPTH using 1:2 via a,c,d,t

set label sprintf("$\\tau$ = \\SI{%.7f \\pm %.7f}{s}", t, t_err) at graph 0.5, 0.5
plot dataPTH ls 3 notitle, f(x) ls 2 notitle