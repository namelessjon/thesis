# plot for I-V curves and current traces
set terminal postscript enhanced eps color size 14.5cm,16cm "Helvetica" 18
set output "figures/01_IV.eps"
set border 0
set multiplot layout 3,2 rowsfirst
set style line 1 lw 3 lt 1 lc "black"
set style line 2 lw 3 lt 1 lc "black" pt 7
set style line 3 lw 3 lt 1 lc rgb "red"
set style line 4 lw 3 lt 1 lc rgb "red" pt 6
set style line 5 lw 5 lt 1 lc "black"
# fill first graph with something for the moment
set label 1 "(a)" at graph 0.05,0.95 font "Helvetica,30"
set zeroaxis ls 1
set xtics axis nomirror
set ytics axis nomirror 40
set key top left reverse Left at graph 0.05,0.9
set xrange [-130:50]
plot    "01_IV/iks_iv_con_exp.dat" w yerrorbars ls 2 t "Chen et al, WT", \
        "01_IV/iks_iv_con_mod.dat" u 1:($2*(66.1616/74.02044)) w l ls 1 t "Modelled WT", \
        "01_IV/iks_iv_mut_exp.dat" w yerrorbars ls 4 t "Chen et al, MT", \
        "01_IV/iks_iv_mut_mod.dat" u 1:($2*(66.1616/74.02044)) w l ls 3 t "Modelled MT"
# plot iv curves
set label 1 ""
set border 0
unset key
unset xtics
unset ytics
set xrange [-200:-190]
set yrange [2:3]
plot    sin(x)

# plot current traces
unset key
unset xtics
unset ytics
unset zeroaxis

set arrow 1 nohead from  3.5,100 to  3.5,140 front
set arrow 2 nohead from  3.5,100 to  4,100 front
set label 2 "40 pA/pF" at 2.55,120
set label 3 "0.5 s" at 3.5,90

set datafile separator ","
set yrange [-60:160]
# exp con
set xrange [0:4.5]
set label 1 "(b)"
plot    "01_IV/figure_1_exp_con_trace.csv" u 1:2 w l ls 5 , \
        "01_IV/figure_1_exp_con_trace.csv" u 3:4 w l ls 5 , \
        "01_IV/figure_1_exp_con_trace.csv" u 5:6 w l ls 5 , \
        "01_IV/figure_1_exp_con_trace.csv" u 7:8 w l ls 5 , \
        "01_IV/figure_1_exp_con_trace.csv" u 9:10 w l ls 5 , \
        "01_IV/figure_1_exp_con_trace.csv" u 11:12 w l ls 5

unset arrow 1
unset arrow 2
unset label 2
unset label 3

# model con
set xrange [0:4500]
set label 1 "(c)"
plot    "01_IV/figure_1_mod_con_trace.csv" u 1:2 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 3:4 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 5:6 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 7:8 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 9:10 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 11:12 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 13:14 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 15:16 w l ls 5  , \
        "01_IV/figure_1_mod_con_trace.csv" u 17:18 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 19:20 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 21:22 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 23:24 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 25:26 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 27:28 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 29:30 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 31:32 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 33:34 w l ls 5 , \
        "01_IV/figure_1_mod_con_trace.csv" u 35:36 w l ls 5 , \
        "01_IV/figure_1_exp_con_trace.csv" u 37:38 w l ls 5
# exp mut
set xrange [0:4.5]
set label 1 "(d)"
plot    "01_IV/figure_1_exp_mut_trace.csv" u 1:2 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 3:4 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 5:6 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 7:8 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 9:10 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 11:12 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 13:14 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 15:16 w l ls 5  , \
        "01_IV/figure_1_exp_mut_trace.csv" u 17:18 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 19:20 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 21:22 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 23:24 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 25:26 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 27:28 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 29:30 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 31:32 w l ls 5 , \
        "01_IV/figure_1_exp_mut_trace.csv" u 33:34 w l ls 5 
# mod mut
set xrange [0:4500]
set label 1 "(e)"
plot    "01_IV/figure_1_mod_mut.csv" u 1:2 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 3:4 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 5:6 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 7:8 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 9:10 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 11:12 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 13:14 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 15:16 w l ls 5  , \
        "01_IV/figure_1_mod_mut.csv" u 17:18 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 19:20 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 21:22 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 23:24 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 25:26 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 27:28 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 29:30 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 31:32 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 33:34 w l ls 5 , \
        "01_IV/figure_1_mod_mut.csv" u 35:36 w l ls 5 , \
        "01_IV/figure_1_exp_mut.csv" u 37:38 w l ls 5

unset multiplot

