# 2D ap profiles and power spectrums
set terminal postscript enhanced eps color size 14.5cm,4.5cm "Helvetica" 18

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc "black"
set style line 3 lw 3 lt 1 lc "black"

# set universal settings
set border 2
set xtics nomirror out scale 0.5
set xlabel offset 0,0.5
set ylabel offset 0.7,0
set ytics nomirror out scale 0.5
unset key

# control
set output "figures/05_2D_freq.eps"
set multiplot layout 2,3 rowsfirst

# plot the ap profile
set xrange [0:3000]
unset xtics
set yrange [-85:15]
unset xlabel
set ylabel "mV"
set arrow 1 nohead from 2500,-85 to 3000,-85
set label 2 "500 ms" at graph 0.76,-0.1 font "Helvetica,18"

set label 1 "(a)" at graph -0.4,1.15 font "Helvetica,18"
plot    "05_2D_freq/2D_ap_profiles.dat" u 5:6 w l ls 1
set label 1 "(c)"
plot    "05_2D_freq/2D_ap_profiles.dat" u 1:2 w l ls 2
set label 1 "(e)"
plot    "05_2D_freq/2D_ap_profiles.dat" u 3:4 w l ls 3

unset label 2
unset arrow 1
# plot the spectrum
set xtics nomirror out scale 0.5
set border 3
set xrange [2:20]
set xtics 4,4,20
set ytics ("0" 0, "50" 50, "100" 100, "150" 150)
set yrange [0:150]
set xlabel "f (Hz)"
set ylabel "power"
set label 1 "(b)"
plot "05_2D_freq/2d_frequencies_control.dat" w l ls 1
set label 1 "(d)"
plot "05_2D_freq/2d_frequencies_ten.dat" w l ls 2
set label 1 "(f)"
plot "05_2D_freq/2d_frequencies_twentyfive.dat" w l ls 3

unset multiplot

