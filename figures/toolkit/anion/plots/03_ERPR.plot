# plot for I-V curves and current traces
set terminal postscript enhanced eps color size 15cm,8cm "Times-Roman" 20
set output "figures/03_ERPR.eps"
set border 3

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc rgb "red"
set style line 3 lw 3 lt 2 lc rgb "red"

set xtics nomirror out
set ytics nomirror out
unset key
set xrange [300:700]

set multiplot layout 1,2 rowsfirst

# plot the APDr curves
set label 1 "A" at graph -0.3,1 font "Times-Roman,30"
set xlabel "S2 Interval (ms)"
set ylabel "ERP (ms)"
set yrange [50:350]
set xtics 300,200
plot    "03_ERPR/erpr_CRN98con.dat" w l ls 1, \
        "03_ERPR/erpr_CRN98icl.dat" w l ls 2

# plot ERPr curves
set label 1 "B"
set xrange [5:25]
set yrange [0:4]
set ylabel "VW (ms)"
set xlabel ""
set xtics ("Con" 10, "I_{Cl}" 20 ) scale 0
set boxwidth 8
plot    "03_ERPR/vw_processed.dat" u 1:2 w boxes fs solid ls 1, \
        "03_ERPR/vw_processed.dat" u 3:4 w boxes fs solid ls 2

unset multiplot

