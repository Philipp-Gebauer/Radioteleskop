from simplifyplot import inputDat, outputDat

infile = "Messwerte\\Spiking.csv"

[t,p] = inputDat(infile)

t2 = []
p2 = []
if p[0] > p[1]:
    p2.append(p[0])
    t2.append(t[0])

for i in range(1,len(p)-1):
    if p[i] > p[i+1] and p[i] > p[i-1]:
        p2.append(p[i])
        t2.append(t[i])


outputDat("Messwerte\\Spikingmax.csv",[t2, p2])