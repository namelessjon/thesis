# plot for speedup
set terminal postscript enhanced eps color size 6cm,6cm "Helvetica" 18
set output "speed.eps"
set border 3

# setup line styles to use
set style line 1 lw 2 lt 1 lc "black"
set style line 2 lw 2 lt 1 lc rgb "red"
set style line 3 lw 2 lt 2 lc "black"
set style line 4 lw 2 lt 2 lc rgb "red"

set xtics nomirror out
set ytics nomirror out
unset key


# plot the APDr,50 curves
set xlabel "Processors"
set ylabel "Relative Speedup"
set yrange [1:8]
set xrange [1:8]
set xtics 1

plot "speedup.txt" u 1:2 w l ls 1, \
     "speedup.txt" u 1:8 w l ls 2, \
     "speedup.txt" u 1:3 w l ls 4, \
     "speedup.txt" u 1:4 w l ls 4, \
     "speedup.txt" u 1:5 w l ls 4, \
     "speedup.txt" u 1:6 w l ls 4, \
     "speedup.txt" u 1:7 w l ls 4

