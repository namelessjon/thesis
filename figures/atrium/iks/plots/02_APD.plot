set terminal postscript enhanced eps color size 14.5cm,6cm "Helvetica" 18
set output "figures/02_APD.eps"

set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc rgb "red"
set style line 3 lw 3 lt 2 lc rgb "red"

unset key

set border 3
set xtics nomirror out
set ytics nomirror out
set lmargin 9


set multiplot layout 1,3

set datafile separator ","
set label 1 "(a)" at graph -0.5,1 font "Helvetica,18"
set xlabel "Phi"
set ylabel "APD_{90}"
set xtics 0.5


plot  "02_APD/phi_vs_apd.csv" u 1:2 w l ls 1


set lmargin 7
set label 1 "(b)"

set xrange [0:400]
set yrange [-90:40]
set ylabel "Membrane Potential (mV)"
set xlabel "Time (ms)"
set xtics 400

plot \
    "02_APD/ap_profile.csv" u ($1+10):2 every ::1 w l ls 1, \
    "02_APD/ap_profile.csv" u ($1+10):3 every ::1 w l ls 2, \
    "02_APD/ap_profile.csv" u ($1+10):4 every ::1 w l ls 3

set label 1 "(c)"

set ylabel "I_{kS} (pA/pF)"
set yrange [0:350]

plot \
    "02_APD/current_profile.csv" u ($1+10):2 every ::1 w l ls 1, \
    "02_APD/current_profile.csv" u ($1+10):3 every ::1 w l ls 2, \
    "02_APD/current_profile.csv" u ($1+10):4 every ::1 w l ls 3

unset multiplot
