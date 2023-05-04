# This script sort and exchange the intermediate results(ni in verilog) 
#  to make the output place as close as the input in memory.
#  e.g. y0=n612;y1=n153;y2=n449; ==> y0=n129;y1=n130;y2=n131;
benchmarks=(adder cavlc dec div int2float log2 max multiplier priority router sin sqrt)
g++ outputopt.cpp -o outputopt
for b in ${benchmarks[@]}
do
    ./outputopt ${b}.v ${b}_opt.v
    mv ${b}.v ${b}_old.v
    mv ${b}_opt.v ${b}.v
done
rm -f outputopt
