# plot for I-V curves and current traces
set terminal postscript enhanced eps color size 15cm,8cm "Times-Roman" 20
set output "figures/02_APD90.eps"
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

# plot the APDr curves
set label 1 "A" at graph -0.3,1 font "Times-Roman,30"
set xlabel "DI (ms)"
set ylabel "APD_{90} (ms)"
set yrange [50:350]
set xtics 200
plot    "02_APD90/s1s2_90_CRN98con.dat" u 3:4 w l ls 1, \
        "02_APD90/s1s2_90_CRN98icl.dat" u 3:4 w l ls 2

# plot ERPr curves
set label 1 "B"
set xlabel "DI (ms)"
set ylabel "I_{Na} Activation"
set yrange [0:0.5]
set xtics 200
plot    "02_APD90/s1s2_90_CRN98con.dat" u 3:9 w l ls 1, \
        "02_APD90/s1s2_90_CRN98icl.dat" u 3:9 w l ls 2

unset multiplot

