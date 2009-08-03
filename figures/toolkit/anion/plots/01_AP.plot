# plot for AP curves
set terminal postscript enhanced eps color size 12cm,9cm "Times-Roman" 20
set output "figures/01_AP.eps"
set border 3

# setup line styles to use
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc rgb "red"
set style line 3 lw 3 lt 2 lc rgb "red"

set xtics nomirror out
set ytics nomirror out
unset key
set xrange [0:500]

# plot the AP curves
set xlabel "Time (ms)"
set ylabel "Membrane Potential (mV)"
plot    "01_AP/ap_CRN98con_1.0Hz.dat" w l ls 1, \
        "01_AP/ap_CRN98icl_1.0Hz.dat" w l ls 2

