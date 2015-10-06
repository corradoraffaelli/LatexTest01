#!/usr/bin/gnuplot

set title "Thrpugput with a growing number of VNFs - wget 4GB"

set auto x
set grid x y
set ytics 50
set yrange [50:]

set xtics rotate by 35 offset -5,-4

#set xlabel "Test type"
set ylabel "Throughput [Mbps]"



set key at 3,300
#bottom left

set terminal postscript enhanced color  
set output '| ps2pdf - tcp_wget_throughput.pdf'

plot 'tcp_wget_throughput.dat' using 1:xtic(4) title "OVS (VM)" with lp pointtype 2 linetype 2,\
		'' using 2:xtic(4) title "OVS (Docker)" with lp pointtype 3 linetype 3,\
		'' using 3:xtic(4) title "xDPd (Docker)" with lp pointtype 4 linetype 4
