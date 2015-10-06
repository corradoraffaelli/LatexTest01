#!/usr/bin/gnuplot

set title "UDP performance with a growing number of (linux bridge in Docker) VNFs on xDPd"

set auto x
set grid x y
set ytics 50
set y2tics 5
set yrange [250:]
set y2range [:20]

set xtics rotate by 35 offset -5,-4

#set xlabel "Test type"
set ylabel "Throughput [Mbps]"
set y2label "Jitter [ms]"

set key center left
#bottom left

set terminal postscript enhanced color  
set output '| ps2pdf - jitter.pdf'

plot 'jitter.dat' using 1:xtic(5) title "Throughput (xDPd - Docker)" with lp pointtype 2 linetype 2,\
		'' using 2:xtic(5) title "Jitter  (xDPd - Docker)" with lp pointtype 3 linetype 3 axes x1y2,\
		'' using 3:xtic(5) title "Throughput (OVS - Docker)" with lp pointtype 4 linetype 4,\
		'' using 4:xtic(5) title "Jitter  (OVS - Docker)" with lp pointtype 5 linetype 5 axes x1y2
		
