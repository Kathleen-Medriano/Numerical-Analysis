% Usage: input myscriptprobset2 in the command window

## Author: Kathleen Kaye S. Medriano
## Created: 2018-10-03

%i

A = [22 17 -1 -8; 17 18 -7 -8; -1 -7 10 2; -8 -8 2 4] 
b = [1 0 5 -2]'

%ii


[L, U, P] = mylu (A)

PA = P*A
LU = L*U

for i = 1:4
  for j = 1:4
    assert(PA(i,j)== LU(i,j),'The equality PA = LU does not hold')
  endfor
endfor

%iii

y = myforsub (L, P*b)
x = mybacksub (U, y)

%iv

M = myprobset2func(A)
N = M.'*M
A = A;

for s = 1:4
  for t = 1:4
    assert(N(s,t)== A(s,t)||abs((N(s,t)-A(s,t)))<(10)^-6,'The equality A = M^T*M does not hold')
  endfor
endfor