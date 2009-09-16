# plot for tip traces
set terminal postscript enhanced eps color size 20cm,20cm "Helvetica" 20

# setup line styles to use
set style line 1 lw 3 lt 1 pt 7 ps 3 lc "black"

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
plot "06_figures/con_345.trace" u 2:3 w p ls 1

set output "figures/04_2D_trace_icl.eps"
plot "06_figures/icl_345.trace" u 2:3 w p ls 1
