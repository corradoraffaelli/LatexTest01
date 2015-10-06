#!/usr/bin/gnuplot

set title "Thrpugput with a growing number of (linux bridge in Docker) VNFs"

set auto x
set grid x y
set ytics 50
set yrange [50:]

set xtics rotate by 35 offset -5,-4

#set xlabel "Test type"
set ylabel "Throughput [Mbps]"

#set style data histogram
#set boxwidth 0.9
#set style fill solid
#set style histogram cluster gap 1
#set style fill solid border -1



set key at 3,300
#bottom left

set terminal postscript enhanced color  
set output '| ps2pdf - throughput.pdf'

plot 'throughput.dat' using 1:xtic(7) title "xDPd - UDP (iperf - 120s)" with lp pointtype 1 linetype 1,\
		'' using 4:xtic(7) title "OVS - UDP (iperf - 120s)" with lp pointtype 4 linetype 4,\
		'' using 2:xtic(7) title "xDPd - TCP (iperf - 120s)" with lp pointtype 2 linetype 2,\
		'' using 5:xtic(7) title "OVS - TCP (iperf - 120s)" with lp pointtype 5 linetype 5,\
		'' using 3:xtic(7) title "xDPd - TCP (wget - 4GB)" with lp pointtype 3 linetype 3, \
		'' using 6:xtic(7) title "OVS - TCP (wget - 4GB)" with lp pointtype 7 linetype 7
