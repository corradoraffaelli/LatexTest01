#!/usr/bin/gnuplot

set title "Thrpugput with a growing number of VNFs - wget 4GB"

set auto x
set grid x y
set ytics 50
set yrange [50:]

set xtics rotate by 35 offset -5,-4

#set xlabel "Test type"
set ylabel "Throughput [Mbps]"



set key at 4,300
#bottom left

set terminal postscript enhanced color  
set output '| ps2pdf - tcp_wget_throughput.pdf'

plot 'tcp_wget_throughput.dat' using 1:xtic(4) title "OpenStack - OVS (VM)" with lp pointtype 2 linetype 2 lw 6,\
		'' using 2:xtic(4) title "OpenStack - OVS (Docker)" with lp pointtype 3 linetype 3 lw 6,\
		'' using 3:xtic(4) title "Integrated node - xDPd (Docker)" with lp pointtype 4 linetype 4 lw 6
