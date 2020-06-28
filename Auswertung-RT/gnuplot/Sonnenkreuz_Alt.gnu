#png
#set terminal png size 1024,720
#set output "pngplots/Sonnenkreuz_Alt.png"

#epslatex
set terminal epslatex # size 15 cm, 9 cm
set output "plots/Sonnenkreuz_Alt.tex"

x_min = -18
x_max = 18
dataPTH = "Messwerte/TXT/Sonnenkreuz_Alt.txt"

# Palette Config
load "jet.pal"
#set xlabel "altitude offset relative to the Sun in $\\si{}{\\degree}$"
#set ylabel "continuum intensity in arbitrary units"
set xlabel "H\\\"ohenwinkelversatz relativ zur Sonne in $\\si{}{\\degree}$"
set ylabel "Intensit\\\"at in beliebiger Einheit"


set xrange [x_min:x_max]

f(x) = (1/((2*pi)**(1./2)*s)) * b * exp(-(x-d)**2/(2*s**2)) + a
a = 312.002
s = 2.38898
d = 0.983662
b = 905.336
fit [x_min:x_max] f(x) dataPTH using 1:4 via a, s, d, b
# fit f(x) dataPTH using 1:($3*1000):2:($4*1000) xyerrors via a,s,d

#hiermüsstest du dein maximum auswählen. Hier ist es hat mit der Standardabweichung s gemacht
set arrow from d-(s*(2*log(2))**(1.0/2)),f(d-(s*(2*log(2))**(1.0/2))) to d+(s*(2*log(2))**(1.0/2)),f(d+(s*(2*log(2))**(1.0/2))) heads
set label sprintf("FWHM $= \\SI{%3.2f \\pm %3.2f}{\\degree}$",(2*(2*log(2))**(1.0/2)*s),(2*(2*log(2))**(1.0/2)*s_err)) at 5,510
set arrow from d,f(s+d) to s+d,f(s+d) heads
set label sprintf("$\\sigma =  \\SI{%4.3f \\pm %4.3f}{\\degree}$",s,s_err) at 5,550
set arrow from d,300 to d,700 nohead

#p = a+c*exp(d/t)
#set label sprintf("$\\tau$(0 mW) = \\SI{%.3f}{ms}", f(0)) at graph 0.6, 0.6
#plot dataPTH using 1:4 ls 2 ps 3 lw 3 title "measured data", f(x) ls 8 lw 3 title "gaussian fit"
plot dataPTH using 1:4 ls 2 ps 3 lw 3 title "Messwerte", f(x) ls 8 lw 3 title "\\textsc{Gauss}-Fit"
#plot dataPTH using 1:($3*1000):2:($4*1000) with xyerrorbars ls 2 ps 3 lw 3 notitle, f(x) ls 8 lw 3 notitle