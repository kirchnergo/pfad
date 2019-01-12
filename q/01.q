\cd 
i:first read0 `:../data/01.txt
x:"J"$ "," vs i
x
r:til count x
r in x

/ minfree version 1
mf1:{r:(til count x); first r where not r in x}
mf1 x
\ts do[100000;mf1 xs]

/ create larger samples
smpl:{(neg x)?x+y}
x3:smpl . 1000 1
x5:smpl . 100000 1
x7:smpl . 10000000 1
x8:smpl . 100000000 1
/x9:smpl . 1000000000 1

/ examples v1
mf1 x3
mf1 x5
mf1 x7
mf1 x8
\ts mf1 x3
\ts mf1 x5
\ts mf1 x7
/582 402653424
\ts mf1 x8
/2119 3221225712
/\ts mf1 x9
/567077 25769804016
\ts do[10000;mf1 x3]
\ts do[100;mf1 x5]
\ts do[10;mf1 x7]
\ts do[10;mf1 x8]

/ minfree version 2
(x where not a;x where a:x >= 10)
pt:{(y where not a;y where a:y >= x)}
pt[10;x]
xx:"i"$(1)
mfm:{[a;xs] n:count xs; b:a+1+n div 2; p:pt[b;xs]; $[not n; a; (b-a)=count p 0; mfm[b;p 1]; mfm[a;p 0]]}
mf2:mfm[0]
mf2 x
mfm2:{[a;n;xs] b:a+1+n div 2; p:pt[b;xs]; m:count p 0; $[not n; a; m=b-a; mfm2[b;n-m;p 1]; mfm2[a;m;p 0]]}
mf3:{mfm2[0;count x;x]}
mf3 x

/ examples v2
mf3 x3
mf3 x5
mf3 x7
mf3 x8
\ts mf3 x3
\ts mf3 x5
\ts mf3 x7
/266 268440752
\ts mf3 x8
/2280 2147489696
/\ts mf3 x9
/186595 17179876112
\ts do[10000;mf3 x3]
\ts do[100;mf3 x5]
\ts do[10;mf3 x7]
\ts do[10;mf3 x8]
