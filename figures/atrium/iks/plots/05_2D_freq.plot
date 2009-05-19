# 2D ap profiles and power spectrums
set terminal postscript enhanced eps color size 17cm,5.66cm "Times-Roman" 20

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc "black"
set style line 3 lw 3 lt 1 lc "black"

# set universal settings
set border 3
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
set xtics  3000
set yrange [-85:15]
set xlabel "t (ms)"
set ylabel "mV"

set label 1 "A" at graph -0.4,1.15 font "Times-Roman,20"
plot    "05_2D_freq/2D_ap_profiles.dat" u 5:6 w l ls 1
set label 1 "C"
plot    "05_2D_freq/2D_ap_profiles.dat" u 1:2 w l ls 2
set label 1 "E"
plot    "05_2D_freq/2D_ap_profiles.dat" u 3:4 w l ls 3

# plot the spectrum
set xrange [2:20]
set xtics 4,4,20
set ytics ("0" 0, "50" 50, "100" 100, "150" 150)
set yrange [0:150]
set xlabel "f (Hz)"
set ylabel "power"
set label 1 "B"
plot "05_2D_freq/2d_frequencies_control.dat" w l ls 1
set label 1 "D"
plot "05_2D_freq/2d_frequencies_ten.dat" w l ls 2
set label 1 "F"
plot "05_2D_freq/2d_frequencies_twentyfive.dat" w l ls 3

unset multiplot

