# plot for tip traces
set terminal postscript enhanced eps color size 3cm,3cm "Times-Roman" 20

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"

unset xtics
unset ytics
unset xlabel
unset ylabel
unset key
set xrange [0:375]
set yrange [0:375]
set size square
set bmargin 0
set lmargin 0
set rmargin 0
set tmargin 0

set output "figures/04_2D_trace_con.eps"
plot "04_2D_trace/control_core.dat" u 2:3 w l ls 1

set output "figures/04_2D_trace_HT10.eps"
plot "04_2D_trace/ten_core.dat" u 2:3 w l ls 1

set output "figures/04_2D_trace_HT25.eps"
plot "04_2D_trace/twentyfive_core.dat" u 2:3 w l ls 1
