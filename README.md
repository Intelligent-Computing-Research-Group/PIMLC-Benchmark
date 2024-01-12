# PIMLC-Benchmark

## Circuits

These combinational circuits are selected from [The EPFL Combinational Benchmark Suite](https://github.com/lsils/benchmarks). They are optimized using abc (&deepsyn, rewrite, refactor, balance, etc.). Then they are modified using yosys and our own verilog format adjustment code. 


Currently we only picked 12 benchmarks: adder.v  cavlc.v dec.v  div.v  int2float.v  log2.v  max.v  multiplier.v  priority.v  router.v  sin.v  sqrt.v
(*router.v* is manually simplified from 30 outputs to 3 outputs as the outputs after y2 are all 1'b0)

| Filename      | Function      | Logic Gates Number    | Inputs | Outputs  |
|---------------|---------------|-----------------------|--------|----------|
| adder.v       | addition      | 1274                  | 256   | 129       |
| cavlc.v       |Context-adaptive variable-length coding|506| 10| 11        |
| dec.v         | decoder       | 319                   | 8     | 256       |
| div.v         | divisor       | 25176                 | 128   | 128       |
| int2float.v   | int to float  | 185                   | 11    | 7         |
| log2.v        | logarithm 2   | 37269                 | 32    | 32        |
| max.v         | max in 4 nums | 3906                  | 512   | 130       |
| multiplier.v  | multiplier    | 31934                 | 128   | 128       |
| priority.v    |priority encoder| 490                  | 128   | 8         |
| router.v      |Lookahead XY router| 115               | 60    | 3         |
| sin.v         | sine          | 6625                  | 24    | 25        |
| sqrt.v        | square root   | 27769                 | 128   | 64        |



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

