#!/usr/bin/gnuplot

#Author: Ivano Cerrato
#Date: 28th oct 2013

set title "Ping with a growing number of (linux bridge in Docker) VNFs"

set auto x

set ylabel "Round trip time [ms]"

set grid x y
set xtics rotate by 35 offset -5,-4

set ytics 5
set key center left

set terminal postscript enhanced color 
set output '| ps2pdf - ping.pdf'

#fill pattern n -> select the theme of the bar

plot 'ping.dat' using 1:xtic(4) title "xDPd (Docker)" with lp pointtype 2 linetype 2,\
	'' using 2:xtic(4) title "OVS (VM)" with lp pointtype 3 linetype 3,\
	'' using 3:xtic(4) title "OVS (Docker)" with lp pointtype 4 linetype 4
