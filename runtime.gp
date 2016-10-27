reset
set ylabel 'time(sec)'
set style fill solid
set title 'perfomance comparison'
set term png enhanced font 'Verdana,10'
set output 'runtime.png'
set grid

plot 'output.txt' using 2:xtic(1) with histogram title 'fizzbuzz', \
'' using 3:xtic(1) with histogram title 'qsort'  , \
'' using 4:xtic(1) with histogram title 'miller' , \
'' using 5:xtic(1) with histogram title 'primetable' , \
'' using 6:xtic(1) with histogram title 'dfs' , \
'' using 7:xtic(1) with histogram title 'fact' , \
'' using 10:xtic(1) with histogram title 'fib' , \
'' using 11:xtic(1) with histogram title 'factlong' , \
