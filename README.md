# PIMLC-Benchmark
This is the benchmark suite generated by yosys and MIG\_project. 
Currently we only picked 12 benchmarks: adder.v  cavlc.v dec.v  div.v  int2float.v  log2.v  max.v  multiplier.v  priority.v  router.v  sin.v  sqrt.v
(*router.v* is manually simplified as the outputs after y2 are all 1'b0)
The input are generated by the MIG\_project-main.

## sepinv
`sepinv` is for seperating inverters in the calculation as standalone operation

## outputopt
`outputopt` is for optimizing the position of output.
For example, for
```
input x0, x1, ..., x8;
output y0, y1, y2, y3;
wire n66, n67, ..., n250;
assign y0 = n121;
assign y1 = n151;
assign y2 = n84;
assign y3 = n219;
```
change it as

```
input x0, x1, ..., x8;
output y0, y1, y2, y3;
wire n66, n67, ..., n250;
assign y0 = n66;
assign y1 = n67;
assign y2 = n68;
assign y3 = n69;
```
so the output bits are continuous.

