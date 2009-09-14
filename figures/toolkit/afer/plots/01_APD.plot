# plot for APDR traces
set terminal postscript enhanced eps color size 14.5cm,6cm "Helvetica" 18
set output "figures/01_APD.eps"
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

# plot the AP curves
set label 1 "(a)" at graph -0.3,1 font "Helvetica,20"
set xlabel "Time (ms)"
set ylabel "mV"
set yrange [-90:30]
set xrange [0:500]
set xtics 100
plot \
    "01_APD/ap_CRN98con_1.0Hz.dat" u 1:2 w l ls 1, \
    "01_APD/ap_CRN98bosch_am_1.0Hz.dat" u 1:2 w l ls 2, \
    "01_APD/ap_CRN98workman_am_1.0Hz.dat" u 1:2 w l ls 3, \
    "01_APD/ap_CRN98ct_1.0Hz.dat" u 1:2 w l ls 4, \
    "01_APD/ap_CRN98bosch_ct_1.0Hz.dat" u 1:2 w l ls 5, \
    "01_APD/ap_CRN98workman_ct_1.0Hz.dat" u 1:2 w l ls 6


# delta APD
set label 1 "(b)"
set xrange [0:34]
set yrange [0:40]
set ylabel "{/Symbol d} APD_{90} (ms)"
set xlabel ""
set xtics ("Con" 5, "Bosch" 17, "Workman" 29) scale 0
set boxwidth 8
plot \
    "01_APD/ap_flat.dat" u 1:2 w boxes fs solid ls 1, \
    "01_APD/ap_flat.dat" u 3:4 w boxes fs solid ls 2, \
    "01_APD/ap_flat.dat" u 5:6 w boxes fs solid ls 3


unset multiplot

