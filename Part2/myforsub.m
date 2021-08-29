% Usage: x = myforsub (L, b) 

% Input: L = an nxn lower triangular matrix 
%        b = a nx1 matrix

% Output: x = a vector solution to the equation: Lx = b;

## Author: Kathleen Kaye S. Medriano
## Created: 2018-10-03


function x = myforsub (L, b) 
  [m,n] = size(L);
  assert(m == n,'The vector and the matrix do not agree in size')
  assert(det(L)!=0, 'The matrix L is not invertible')
  for i = 1:n
    for j = 1:n
      if i < j
        assert(L(i,j)==0,'The matrix is not a lower triangular')
      endif
    endfor
  endfor
  
  x = zeros(n,1);
  x(1) = b(1)/L(1,1);
  
  
    for k = 2 : n
      x(k) = (b(k) - (L(k,1:k-1)*x(1:k-1)))/L(k,k);
    endfor

endfunction
