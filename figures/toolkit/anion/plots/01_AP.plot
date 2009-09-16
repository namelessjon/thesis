# plot for APDR traces
set terminal postscript enhanced eps color size 12cm,6cm "Helvetica" 18
set output "figures/01_AP.eps"
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
set ylabel "Membrane Potential (mV)"
set yrange [-90:20]
set xrange [0:600]
set xtics 200
plot    "01_AP/ap_CRN98con_1.0Hz.dat" u 1:2 w l ls 1, \
        "01_AP/ap_CRN98icl_1.0Hz.dat" u 1:2 w l ls 2

# plot APDr,90 curves
set label 1 "(b)"
set xlabel "Time (ms)"
set ylabel "Open Fraction"
set yrange [0:1]
set ytics 0.2
plot    "01_AP/ap_CRN98con_1.0Hz.dat" u 1:5 w l ls 1, \
        "01_AP/ap_CRN98icl_1.0Hz.dat" u 1:5 w l ls 2, \
        "01_AP/ap_CRN98con_1.0Hz.dat" u 1:4 w l ls 3, \
        "01_AP/ap_CRN98icl_1.0Hz.dat" u 1:4 w l ls 4

unset multiplot

