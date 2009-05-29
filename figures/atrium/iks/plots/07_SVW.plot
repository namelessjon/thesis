# plot for I-V curves and current traces
set terminal postscript enhanced eps color size 8cm,8cm "Times-Roman" 20
set output "figures/07_SVW.eps"
set border 3

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc rgb "red"
set style line 3 lw 3 lt 2 lc rgb "red"

set xtics nomirror out
set ytics nomirror out
unset key


# plot VW barchart
set xrange [0:40]
set yrange [0:100]
set ylabel "Spatial Vulnerablity Window (mm)"
set xlabel ""
set xtics ("WT" 10, "HT10" 20, "HT25" 30) scale 0
set boxwidth 8
plot    "07_SVW/svw_processed.dat" u 1:2 w boxes fs solid ls 1, \
        "07_SVW/svw_processed.dat" u 3:4 w boxes fs solid ls 2, \
        "07_SVW/svw_processed.dat" u 5:6 w boxes fs solid 0.5 ls 2



