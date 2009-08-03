# plot for I-V curves and current traces
set terminal postscript enhanced eps color size 15cm,8cm "Times-Roman" 20
set output "figures/04_CVR.eps"
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
set label 1 "A" at graph -0.3,1 font "Times-Roman,30"
set xlabel "S2 Interval (ms)"
set ylabel "Conduction Velocity (mm ms^{-1})"
set xtics 250,250
plot    "04_CVR/CRN98_con_cv.dat" w l ls 1, \
        "04_CVR/CRN98_icl_cv.dat" w l ls 2

# plot ERPr curves
set label 1 "B"
set xlabel "S2 Interval (ms)"
set ylabel "Threshold Of Excitation (nS)"
set xtics 250,250
plot    "04_CVR/CRN98_con_excitability.dat" w l ls 1, \
        "04_CVR/CRN98_icl_excitability.dat" w l ls 2

unset multiplot

