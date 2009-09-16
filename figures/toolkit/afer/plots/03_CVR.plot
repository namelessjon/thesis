# plot for APDR traces
set terminal postscript enhanced eps color size 14.5cm,6cm "Helvetica" 18
set output "figures/03_CVR.eps"
set border 3
set bmargin 4

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
set label 1 "(a)" at graph -0.35,1.05 font "Helvetica,20"
set xlabel "S2 Interval (ms)"
set ylabel "Conduction Velocity (mm ms^{-1})"
set xrange [0:750]
set yrange [0.2:0.28]
set ytics 0.02
set format y "%3.2f"
set xtics 250
plot \
    "03_CVR_VW/CRN98_con_cv.dat" u 1:2 w l ls 1, \
    "03_CVR_VW/CRN98_bosch_am_cv.dat" u 1:2 w l ls 2, \
    "03_CVR_VW/CRN98_workman_am_cv.dat" u 1:2 w l ls 3, \
    "03_CVR_VW/CRN98_ct_cv.dat" u 1:2 w l ls 4, \
    "03_CVR_VW/CRN98_bosch_ct_cv.dat" u 1:2 w l ls 5, \
    "03_CVR_VW/CRN98_workman_ct_cv.dat" u 1:2 w l ls 6

set label 1 "(b)" at graph -0.2,1.05 font "Helvetica,20"
set xrange [5:95]
set yrange [0:5]
set ytics 1
set format y "%g"
set ylabel "VW (ms)"
set xlabel ""
set xtics ("AM/PM" 15, \
            "CT" 30, \
            "AM/PM" 45, \
            "CT" 60, \
            "AM/PM" 75, \
            "CT" 90) scale 0
set boxwidth 8
set label 2 "Control" at graph 0.16,-0.2 center font "Helvetica,20"
set label 3 "Bosch" at graph 0.51,-0.2 center font "Helvetica,20"
set label 4 "Workman" at graph 0.83,-0.2 center font "Helvetica,20"

plot  \
    "03_CVR_VW/vw_flat.dat" u 1:2 w boxes fs solid ls 1, \
    "03_CVR_VW/vw_flat.dat" u 3:4 w boxes fs solid 0.5 ls 1, \
    "03_CVR_VW/vw_flat.dat" u 5:6 w boxes fs solid ls 2, \
    "03_CVR_VW/vw_flat.dat" u 7:8 w boxes fs solid 0.5 ls 2, \
    "03_CVR_VW/vw_flat.dat" u 9:10 w boxes fs solid ls 3, \
    "03_CVR_VW/vw_flat.dat" u 11:12 w boxes fs solid 0.5 ls 3

unset multiplot

