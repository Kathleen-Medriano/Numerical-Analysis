% Usage: [c, L] = mylagrangepoly (x,y)

% Input: x = row vector of distinct nodes
%        y = row vector of the corresponding function values of the nodes 

% Output: c = vector c of coefficients of the resulting Lagrange
%             interpolating polynomial
%         L = the matrix such that the kth row are the coefficients of the
%             polynomial Ln,k


## Author: Kathleen Kaye S. Medriano 
## Created: 2018-11-21


function [c, L] = mylagrangepoly (x,y)
  n = length(x);
  L = zeros(n);
  
  assert(n == length(y),'Vectors x and y do not correspond in length');
  
  for k = 1:n
    v = 1;
      for j = 1:n
        if j!=k
          v = conv(v,poly(x(j)))/(x(k)-x(j));
        endif
      endfor
    L(k,:) = v;
  endfor
  
  c = y*L;

endfunction
