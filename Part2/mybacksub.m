% Usage: x = mybacksub (U, b) 

% Input: U = an nxn upper triangular matrix 
%        b = a nx1 matrix

% Output: x = a vector solution to the equation: Ux = b;

## Author: Kathleen Kaye S. Medriano
## Created: 2018-10-03

function x = mybacksub (U, b)
  [m,n] = size(U);
  assert(m == n,'The vector and the matrix do not agree in size')
  assert(det(U)!=0, 'The matrix L is not invertible')
  for i = 1:n
    for j = 1:n
      if i > j
        assert(U(i,j)==0,'The matrix is not an upper triangular')
      endif
    endfor
  endfor
  
  x = zeros(n,1);
  
    for k = n: -1: 1
      x(k) = (b(k) - (U(k,k+1:n)*x(k+1:n)))/U(k,k);
    end
  
endfunction
