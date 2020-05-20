#png
#  set terminal png size 1024,720
#  set output "pngplots/Sonnenkreuz_Alt.png"

#epslatex
set terminal epslatex # size 15 cm, 9 cm
set output "plots/Sonnenkreuz_Alt.tex"

x_min = -18
x_max = 18
dataPTH = "Messwerte/TXT/Sonnenkreuz_Alt.txt"

# Palette Config
load "jet.pal"
set xlabel "Altitude offset relative to the Sun [$\\si{}{\\degree}$]"
set ylabel "Continuum intensity [arbitrary units]"
set xrange [x_min:x_max]

# f(x) = a + (1/((2*pi*s)**(1/2)))*exp(-(x-d)**2/(2*s**2))
# a = 401
# s = -411
# d = -171
# fit [x_min:x_max] f(x) dataPTH using 1:4 via a, s, d

f(x) = (1/((2*pi)**(1/2)*s)) * b * exp(-(x-d)**2/(2*s**2)) + a
a = 312.002
s = 2.38898
d = 0.983662
b = 905.336
fit [x_min:x_max] f(x) dataPTH using 1:4 via a, s, d, b
# fit f(x) dataPTH using 1:($3*1000):2:($4*1000) xyerrors via a,s,d

set arrow from d-s,f(d-s) to d+s,f(d+s) heads
# set label sprintf("width: \\SI{%.1f}{\\degree}",(2*s)) at -2,550
set label sprintf("width: \\SI{%.1f \\pm %.1f}{\\degree}",(2*s),(2*s_err)) at -2,550

#p = a+c*exp(d/t)
#set label sprintf("$\\tau$(0 mW) = \\SI{%.3f}{ms}", f(0)) at graph 0.6, 0.6
plot dataPTH using 1:4 ls 2 ps 3 lw 3 title "measured data", f(x) ls 8 lw 3 title "gaussian fit"
#plot dataPTH using 1:($3*1000):2:($4*1000) with xyerrorbars ls 2 ps 3 lw 3 notitle, f(x) ls 8 lw 3 notitle