[~,n] = size(A);

for i = 1:n
  for j = 1:n
    assert(abs(A(i,i))>(sum((abs(A(i,:))))-abs(A(i,i))),'The matrix A is not row diagonally dominant')
  endfor
endfor