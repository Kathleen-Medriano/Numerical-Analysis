% Usage: M = myprobset2func(A)

% Input: A = an nxn symmetric matrix 

% Output: M = an upper triangular matrix M such that M.’*M = A


## Author: Kathleen Kaye S. Medriano
## Created: 2018-10-03

function M = myprobset2func(A)
  [m,n] = size(A);
  assert(m==n,'The matrix is not a square matrix')
  for i = 1:n
    for j = 1:n
      assert(A(i,j) == A(j,i),'The matrix is not symmetric')
    endfor
  endfor
  
  M = zeros(n);
  
  M(1,1) = sqrt(A(1,1));
  for p = 2:n
    M(1,p) = A(1,p)/M(1,1);
  endfor
  
  for j = 2:n
    M(j,j) = sqrt(A(j,j)- sum((M(1:j-1,j)).^2));  %diagonal entries
    
      for k = j+1:n
        M(j,k) = (A(j,k) - (((M(1:j-1,j)).')*(M(1:j-1,k))))/M(j,j); 
        
      endfor 
  endfor 
        
        
endfunction
