# plot for extracted voltage traces
set terminal postscript enhanced eps color size 10cm,5cm "Helvetica" 18
set output "stability.eps"
set border 3

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc rgb "red"
set style line 3 lw 3 lt 2 lc "black"
set style line 4 lw 3 lt 2 lc rgb "red"

set xtics nomirror out
set ytics nomirror out
unset key

set multiplot layout 1,2 rowsfirst

# plot the APDr,50 curves
set label 1 "(a)" at graph -0.4,1 font "Helvetica,18"
set xlabel "Time (ms)"
set ylabel "mV"
set ytics 20
set yrange [-90:10]
set xrange [0:200]
set xtics 50
plot "stability.txt" u 1:2 w l ls 2, \
     "stability.txt" u 1:11 w l ls 4

# plot APDr,90 curves
set label 1 "(b)"
plot "stability.txt" u 1:4 w l ls 2, \
     "stability.txt" u 1:13 w l ls 4

unset multiplot

