# plot for APDR traces
set terminal postscript enhanced eps color size 12cm,6cm "Helvetica" 18
set output "figures/02_APDR.eps"
set border 3

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc rgb "red"
set style line 3 lw 3 lt 2 lc rgb "red"

set xtics nomirror out
set ytics nomirror out
unset key
set xrange [0:700]

set multiplot layout 1,2 rowsfirst

# plot the APDr,50 curves
set label 1 "(a)" at graph -0.4,1 font "Helvetica,18"
set xlabel "DI (ms)"
set ylabel "APD_{50} (ms)"
set yrange [50:350]
set xrange [0:700]
set xtics 200
plot    "02_APDR/s1s2_50_CRN98con.dat" u 3:4 w l ls 1, \
        "02_APDR/s1s2_50_CRN98icl.dat" u 3:4 w l ls 2

# plot APDr,90 curves
set label 1 "(b)"
set xlabel "DI (ms)"
set ylabel "APD_{90} (ms)"
set yrange [50:350]
set xtics 200
plot    "02_APDR/s1s2_90_CRN98con.dat" u 3:4 w l ls 1, \
        "02_APDR/s1s2_90_CRN98icl.dat" u 3:4 w l ls 2

unset multiplot

