#png
 set terminal png size 1024,720
 set output "pngplots/Sonnenkreuz_Az.png"

#epslatex
# set terminal epslatex # size 15 cm, 9 cm
# set output "plots/Sonnenkreuz_Az.tex"

x_min = -18
x_max = 18
dataPTH = "Messwerte/TXT/Sonnenkreuz_Az.txt"

# Palette Config
load "jet.pal"
set xlabel "Azimuth offset relative to the Sun [$\\si{}{\\degree}$]"
set ylabel "Continuum intensity [arbitrary units]"
set xrange [x_min:x_max]

# f(x) = a + (1/((2*pi*s)**(1/2)))*exp(-(x-d)**2/(2*s**2))
# a = 401
# s = -411
# d = -171
# fit [x_min:x_max] f(x) dataPTH using 1:4 via a, s, d

f(x) = (1/((2*pi)**(1/2)*s)) * b * exp(-(x-d)**2/(2*s**2)) + a
a = 313.048
s = 3.3129
d = 0.967925
b = 364.680
fit [x_min:x_max] f(x) dataPTH using 1:4 via a, s, d, b
# fit f(x) dataPTH using 1:($3*1000):2:($4*1000) xyerrors via a,s,d

#p = a+c*exp(d/t)
#set label sprintf("$\\tau$(0 mW) = \\SI{%.3f}{ms}", f(0)) at graph 0.6, 0.6
plot dataPTH using 1:4 ls 2 ps 3 lw 3 title "measured data", f(x) ls 8 lw 3 title "gaussian fit"
#plot dataPTH using 1:($3*1000):2:($4*1000) with xyerrorbars ls 2 ps 3 lw 3 notitle, f(x) ls 8 lw 3 notitle