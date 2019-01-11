\cd 
i:first read0 `:../data/02.txt
i
/"GENERATING"
count i where "N" < i
/2
sc:{count y where x < y}
sc["N";i]
/2
sc[i 0;1 _ i]
/5
msc1:{max {sc[x y; (1+y) _ x]}[x] each til count x}
msc1 i
/6

smpl:{("j"$x)?0Nc}
show x1:smpl 30
/"uzrsknzshxfpkofueiclpcxxrjdwsr"
x3:smpl 1000
x4:smpl 1e4
x5:smpl 1e5
x52:smpl 2e5
x54:smpl 4e5
msc1 x3
msc1 x4
msc1 x5
\ts msc1 x3
/3 40848
\ts msc1 x4
/171 553488
\ts msc1 x5
/15024 4746000
\ts msc1 x52
/58623 9491728
\ts msc1 x54
/231248 18983184

/ version 2
0 10 _ x1
splt:{(0, x) _ y}
splt[10; x1]
jn:{[n;txs;tys]
 $[n=0; txs; not count txs; tys;
  (x1:txs[0;`k]) < (y1:tys[0;`k]);
    ([]k:enlist x1;v:enlist n+c:txs[0;`v]), jn[n  ;1 _ txs;    tys];
    ([]k:enlist y1;v:enlist   d:tys[0;`v]), jn[n-1;    txs;1 _ tys]]
 }
jn[0;([]k:();v:());([]k:();v:())]
jn[0;([]k:enlist "a";v: enlist 2);()]
jn[2;();([]k:enlist "b";v:enlist 4)]
jn[2;([]k:"ab";v:2 8);([]k:"ux";v:5 4)]
jn[2;([]k:"xz";v:2 8);([]k:"ab";v:3 4)]

/ n.b.
t1:([]k:"abc";v:1 2 3),([]k:"cd";v:4 5)
t2:([]k:"abc";v:1 2 3),([]k:enlist "d";v:enlist 5)
t3:([]k:enlist "a";v:enlist 3),([]k:enlist "b";v:enlist 4)
t1[0;`v]
1 _ t3

tbl:{m:count x;
 $[m=1;
  ([]k:raze enlist x;v:enlist 0);
  {[m;xs] n:m div 2; sp:splt[n;xs];
   (m;n;sp);
   jn[m-n;tbl[sp 0];tbl[sp 1]]}[m;x]]}
tbl "a"
tbl "b"
jn[1;tbl "a";tbl "b"]
tbl "abcba"
tbl i
msc2:{t:tbl x;max t[`v]}
msc2 i
msc2 x3
/'stack
msc2 x4
/..
\ts msc2 x3
/`stack
\ts msc2 x4
/..


/ we need to convert recursion into iteration (with over: /)!
show e:([]k:();v:())
show ee:enlist e
jn2:{tr:x[`r];m:count txs:x[`a];n:count tys:x[`b];
 if[m=0; :`r`a`b!(tr,tys;e;e)];
 if[n=0; :`r`a`b!(tr,txs;e;e)];
 $[(x1:txs[0;`k]) < (y1:tys[0;`k]);
  `r`a`b!(tr,([]k:enlist x1;v:enlist n+c:txs[0;`v]); 1 _ txs;    tys);
  `r`a`b!(tr,([]k:enlist y1;v:enlist   d:tys[0;`v]);     txs;1 _ tys)]
 }
/set timeout for testing \T 5
jn2[(`r`a`b!(e;e;e))]
jn2[(`r`a`b!(e;([]k:enlist "a";v:enlist 2);e))]
jn2[(`r`a`b!(e;e;([]k:enlist "b";v:enlist 4)))]
jn2[(`r`a`b!(e;([]k:"ab";v:2 8);([]k:"ux";v:5 4)))]
jn2/[(`r`a`b!(e;([]k:"xz";v:2 8);([]k:"ab";v:3 4)))]

/ step by step
show t0:([]k:i;v:(count i)#0)
show tx:1 cut t0
show e:([]k:();v:())
`r`a`b!ee,2#tx
jn2/[`r`a`b!(enlist e),2#tx]
show tx2:({jn2/[`r`a`b!ee,x]} each 2 cut tx)[`r]
-1_(2 cut tx2)
show tx2x:(2 cut tx2,ee)
jn2/[`r`a`b!(ee),2#tx2]
{jn2/[`r`a`b!(ee),x]} each -1_(2 cut tx2)
show tx3:({jn2/[`r`a`b!(ee),x]} each (2 cut tx2, ee))[`r]
jn2/[`r`a`b!ee,2#tx3]
show tx4:({jn2/[`r`a`b!ee,x]} each (2 cut tx3, ee))[`r]
show tx5:({jn2/[`r`a`b!ee,x]} each (2 cut tx4))[`r]

/ now we have all we need
/ n.b. we use over (/) two times!
tbl2:{tx:1 cut ([]k:x;v:(count x)#0);
 {[tx] txx:?[0 = (count tx) mod 2; tx; tx, ee];
  ({jn2/[`r`a`b!ee,x]} each 2 cut txx)[`r]}/[tx]
 }

show tbl2 i
(tbl2 i)[0;`v]
msc3:{max (tbl2 x)[0;`v]}
msc3 i

msc3 x3
msc3 x4
msc3 x5
\ts:10 msc3 x3
/303 317104
\ts:10 msc3 x4
/4213 3324816
421%1e4 * log 1e4
/0.004570949

\ts msc3 x5
/10770 32346256
10770%1e5 * log 1e5
/0.009354703

\ts msc3 x52
/34103 64954208
34103%2e5 * log 2e5
/0.01396969

\ts msc3 x54
/129170 129383440
129170%4e5 * log 4e5
/0.02503446