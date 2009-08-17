# plot for I-V curves and current traces
set terminal postscript enhanced eps color size 14.5cm,14.5cm "Helvetica" 18
set output "figures/03_REST.eps"
set border 3

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc rgb "red"
set style line 3 lw 3 lt 2 lc rgb "red"

set xtics nomirror out
set ytics nomirror out
unset key
set xrange [0:1000]

set multiplot layout 2,2 rowsfirst

# plot the APDr curves
set label 1 "A" at graph -0.25,1 font "Helvetica,30"
set xlabel "DI (ms)"
set ylabel "APD_{90} (ms)"
plot    "03_REST/apdr/apdr_control.dat" w l ls 1, \
        "03_REST/apdr/apdr_ten.dat" w l ls 2, \
        "03_REST/apdr/apdr_twentyfive.dat" w l ls 3

# plot ERPr curves
set label 1 "B"
set xlabel "S2 Interval (ms)"
set yrange [0:350]
set ylabel "ERP (ms)"
plot    "03_REST/ERPr/erpr_CRN98con.dat" w l ls 1, \
        "03_REST/ERPr/erpr_CRN98s140g10.dat" w l ls 2, \
        "03_REST/ERPr/erpr_CRN98s140g25.dat" w l ls 3

# plot CVr curves
set label 1 "C"
set xlabel "S2 Interval (ms)"
set yrange [20:28]
set ylabel "CV (cm s^{-1})"
plot    "03_REST/cvr/CRN98_con_cv.dat" u 1:($2*100) w l ls 1, \
        "03_REST/cvr/CRN98_s140g10_cv.dat" u 1:($2*100) w l ls 2, \
        "03_REST/cvr/CRN98_s140g25_cv.dat" u 1:($2*100) w l ls 3

# plot VW barchart
set label 1 "D"
set xrange [0:40]
set yrange [0:4]
set ylabel "VW (ms)"
set xlabel ""
set xtics ("WT" 10, "HT10" 20, "HT25" 30) scale 0
set boxwidth 8
plot    "03_REST/vw/vw_processed.dat" u 1:2 w boxes fs solid ls 1, \
        "03_REST/vw/vw_processed.dat" u 3:4 w boxes fs solid ls 2, \
        "03_REST/vw/vw_processed.dat" u 5:6 w boxes fs solid 0.5 ls 2


unset multiplot

