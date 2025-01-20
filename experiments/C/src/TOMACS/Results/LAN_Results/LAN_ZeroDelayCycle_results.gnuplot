#!/usr/bin/gnuplot

# set terminal pdfcairo enhanced crop color size 40.0,30.0 solid linewidth 4 font "Helvetica, 270"
set key autotitle columnhead
set terminal pdfcairo 
set output 'LagLANSimpleCycle.pdf'
# ZDC = "#99ffff"; MicrostepDelay = "#4671d5";

set xlabel "Timer Period (ms)"
set ylabel "Lag (ms)"

set style fill solid 0.5 border -1
set style boxplot outliers pointtype 2
set style data boxplot

set datafile separator ","

set xtics ('1' 2.5, '2' 4.5, '3' 6.5, '5' 8.5, '10' 10.5, '100' 12.5)
plot for [i=1:6] 'LAN_ZeroDelayCycle_results.csv' using (2*i):i lt 1 title (i==1 ? 'Zero Delay Cycle' : ''),\
for [i=1:6] 'LAN_MicrostepDelayCycle_results.csv' using (2*i + 1):i lt 2 title (i==1 ? 'Microstep Delay Cycle' : '')