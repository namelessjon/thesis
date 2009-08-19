# plot for APDR traces
set terminal postscript enhanced eps color size 12cm,6cm "Helvetica" 18
set output "figures/01_APDR.eps"
set border 3

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc rgb "red"
set style line 3 lw 3 lt 1 lc rgb "blue"
set style line 4 lw 3 lt 2 lc "black"
set style line 5 lw 3 lt 2 lc rgb "red"
set style line 6 lw 3 lt 2 lc rgb "blue"

set xtics nomirror out
set ytics nomirror out
unset key
set xrange [0:700]

set multiplot layout 1,2 rowsfirst

# plot the APDr,50 curves
set label 1 "A" at graph -0.3,1 font "Helvetica,20"
set xlabel "DI (ms)"
set ylabel "APD_{90} (ms)"
set yrange [50:350]
set xrange [0:750]
set xtics 250
plot \
    "01_APDR/s1s2_90_CRN98con.dat" u 3:4 w l ls 1, \
    "01_APDR/s1s2_90_CRN98bosch_am.dat" u 3:4 w l ls 2, \
    "01_APDR/s1s2_90_CRN98workman_am.dat" u 3:4 w l ls 3, \
    "01_APDR/s1s2_90_CRN98ct.dat" u 3:4 w l ls 4, \
    "01_APDR/s1s2_90_CRN98bosch_ct.dat" u 3:4 w l ls 5, \
    "01_APDR/s1s2_90_CRN98workman_ct.dat" u 3:4 w l ls 6

unset multiplot

