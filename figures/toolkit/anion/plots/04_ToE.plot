# plot for I-V curves and current traces
set terminal postscript enhanced eps color size 12cm,6cm "Times-Roman" 18
set output "figures/04_ToE.eps"
set border 3

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc rgb "red"
set style line 3 lw 3 lt 2 lc rgb "red"

set xtics nomirror out
set ytics nomirror out
unset key
set xrange [250:1000]

set multiplot layout 1,2 rowsfirst

# plot the APDr curves
set label 1 "A" at graph -0.3,1 font "Times-Roman,24"
set xlabel "S2 Interval (ms)"
set ylabel "Threshold Of Excitation (nS)"
set xtics 250,250
plot    "04_ToE/CRN98_con_excitability.dat" u 1:($2/10) w l ls 1, \
        "04_ToE/CRN98_icl_excitability.dat" u 1:($2/10) w l ls 2

# plot ERPr curves
set label 1 "B"
set xlabel "DI (ms)"
set ylabel "I_{Na} Activation"
set yrange [0:0.5]
set xrange [0:750]
set xtics 250,250
plot    "04_ToE/s1s2_90_CRN98con.dat" u 3:9 w l ls 1, \
        "04_ToE/s1s2_90_CRN98icl.dat" u 3:9 w l ls 2

unset multiplot

