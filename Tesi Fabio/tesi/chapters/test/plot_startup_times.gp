#!/usr/bin/gnuplot

#Author: Fabio Mignini
#Date: 28th dic 2013

set title "Deployment time with a growing number of VNFs"

set auto x

set ylabel "Deployment timex [s]"

set grid x y
set xtics rotate by 35 offset -5,-4

set ytics 5
set key center left

set terminal postscript enhanced color 
set output '| ps2pdf - startup_times.pdf'

#fill pattern n -> select the theme of the bar

plot 'startup_times.dat' using 1:xtic(4) title "OpenStack - OVS (VM)" with lp pointtype 2 linetype 2,\
	'' using 2:xtic(4) title "OpenStack - OVS (docker)" with lp pointtype 3 linetype 3,\
	'' using 3:xtic(4) title "Integrated node - xDPd (Docker)" with lp pointtype 4 linetype 4
