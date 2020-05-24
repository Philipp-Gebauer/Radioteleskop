#png
set terminal png size 1024,720
set output "pngplots/Sonnenkreuz_Alt.png"

#epslatex
#set terminal epslatex # size 15 cm, 9 cm
#set output "plots/Sonnenkreuz_Alt.tex"

x_min = -18
x_max = 18
dataPTH = "Messwerte/TXT/Sonnenkreuz_Alt.txt"

# Palette Config
load "jet.pal"
set xlabel "Altitude offset relative to the Sun in $\\si{}{\\degree}$"
set ylabel "Continuum intensity in arbitrary units"
set xrange [x_min:x_max]

f(x) = (1/((2*pi)**(1/2)*s)) * b * exp(-(x-d)**2/(2*s**2)) + a
a = 312.002
s = 2.38898
d = 0.983662
b = 905.336
fit [x_min:x_max] f(x) dataPTH using 1:4 via a, s, d, b
# fit f(x) dataPTH using 1:($3*1000):2:($4*1000) xyerrors via a,s,d

#hiermüsstest du dein maximum auswählen. Hier ist es hat mit der Standardabweichung s gemacht
set arrow from d-(s*(2*log(2))**(1.0/2)),f(d-(s*(2*log(2))**(1.0/2))) to d+(s*(2*log(2))**(1.0/2)),f(d+(s*(2*log(2))**(1.0/2))) heads
set label sprintf("width: \\SI{%3.2f \\pm %3.2f}{\\degree}",(2*(2*log(2))**(1.0/2)*s),(2*(2*log(2))**(1.0/2)*s_err)) at 5,510

#p = a+c*exp(d/t)
#set label sprintf("$\\tau$(0 mW) = \\SI{%.3f}{ms}", f(0)) at graph 0.6, 0.6
plot dataPTH using 1:4 ls 2 ps 3 lw 3 title "measured data", f(x) ls 8 lw 3 title "gaussian fit"
#plot dataPTH using 1:($3*1000):2:($4*1000) with xyerrorbars ls 2 ps 3 lw 3 notitle, f(x) ls 8 lw 3 notitle