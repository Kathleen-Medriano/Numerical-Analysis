% Usage: [L, U, P] = mylu (A) 

% Input: A = an nxn matrix 

% Output: matrices L, U and P such that 

%         L = a lower triangular matrix
%         U = an upper triangular matrix
%         P = a permutation matrix 
  
%  and    PA = LU 
         

## Author: Kathleen Kaye S. Medriano
## Created: 2018-10-03

function [L, U, P] = mylu (A)
  [m,n] = size(A);
  L = eye(n);
  P = eye(n);
  U = A;
  assert(m == n,'The matrix is not square')
  assert(det(A)!=0, 'The matrix L is not invertible')
  
    for k = 1:n-1
      [~,j] = max(abs(U(k:n,k)));
      jmax = k-1+j;
      U([k jmax],:) = U([jmax k],:);
      P([k jmax],:) = P([jmax k],:);
        if k>1
          L([k jmax],[1 k-1]) = L([jmax k],[1 k-1]);
        endif
      l = U(k+1:n,k)/U(k,k);
      U(k+1:n,k+1:n) = (U(k+1:n,k+1:n) - l*U(k,k+1:n));
      
      L(k+1:n, k) = l;
    
    endfor
    
  U = triu(U);
      
endfunction
