# plot for AP curves
set terminal postscript enhanced eps color size 4cm,4cm "Helvetica" 18
set output "figures/05_LS.eps"
set border 3

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc rgb "red"
set style line 3 lw 3 lt 2 lc "black"
set style line 4 lw 3 lt 2 lc rgb "red"

set xtics nomirror out
set ytics nomirror out
unset key



# plot the AP curves
set xlabel "Initiation Time (ms)"
set ylabel "Lifespan (s)"
set ytics 1
set xtics 25
plot    "05_LS/con_lifespan.dat" u 1:($2/1000) w l ls 1, \
        "05_LS/icl_lifespan.dat" u 1:($2/1000) w l ls 2


