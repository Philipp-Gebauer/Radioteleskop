### a simple gnuplot peak-finder
# requires gnuplot >=5.2

reset session

#png
 set terminal png size 1024,720
 set output "Maxima.png"


FILE = "Messwerte/TXT/Ml58b0.txt"
set table $Data
    plot FILE u 1:2 with table
unset table

ColX=1
ColY=2

# extract all peaks
y2=y1=NaN
set print $Peaks
do for [i=2:|$Data|-1] {
    if ( word($Data[i-1],ColY)<word($Data[i],ColY) && word($Data[i+1],ColY)<word($Data[i],ColY) ) \
    { print sprintf("%d %s %s", i, word($Data[i],ColX), word($Data[i],ColY)) }
}
set print

# determine prominence
set print $PeakInfo
do for [i=1:|$Peaks|] {
    PeakIndex = int(word($Peaks[i],1))
    PeakX = real(word($Data[PeakIndex],ColX))
    PeakY = real(word($Data[PeakIndex],ColY))
    MinY1 = PeakY
    do for [j=PeakIndex+1:|$Data|] {   # search for higher peak to the right
        if ( word($Data[j],ColY) > PeakY ) { break }
        else { MinY1 = word($Data[j],ColY) < MinY1 ? word($Data[j],ColY) : MinY1 }
    }
    MinY2 = PeakY
    do for [j=PeakIndex-1:1:-1] {      # search for higher peak to the left
        if ( word($Data[j],ColY) > PeakY ) { break }
        else { MinY2 = word($Data[j],ColY) < MinY2 ? word($Data[j],ColY) : MinY2 }
    }
    Prominence = MinY1 > MinY2 ? PeakY-MinY1 : PeakY-MinY2
    NormalizedProminence = 100.*Prominence/PeakY
    print sprintf("%2 d %6 .1f %6 .1f %6 .2f", i, PeakX, PeakY, NormalizedProminence )
}
set print 
# print $PeakInfo

#set yrange[150:250]
Threshold = 4
set label 1 at graph 0.05, 0.9 sprintf("Threshold: %g",Threshold)
plot $Data u 1:2 w lp pt 7 ps 0.5 lc rgb "red" not, \
     $PeakInfo u ($4>Threshold?$2:NaN):3 w p pt 7 lc rgb "blue" not, \
     $PeakInfo u ($4>Threshold?$2:NaN):3:3 w labels offset 0,0.8 not, \
     $PeakInfo u ($4>Threshold?$2:NaN):3:2 w labels offset 0,1.5 not, \
     #$PeakInfo u ($4>Threshold?$2:NaN):3 w impulses lc rgb "black" not
### end of code