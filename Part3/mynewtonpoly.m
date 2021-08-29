% Usage: [c, D] = mynewtonpoly (x,y)

% Input: x = vector of distinct nodes
%        y = vector of the corresponding function values of the nodes 

% Output: c = vector c of coefficients of the resulting Newton
%             interpolating polynomial
%         D = the matrix whose lower triangular part contains the valued
%             of the divided differences


## Author: Kathleen Kaye S. Medriano 
## Created: 2018-11-21


function [c,D] = mynewtonpoly (x,y)
  n = length(x);

  assert(n == length(y),'Vectors x and y do not correspond in length');

  D = zeros(n);
  D(:,1) = y';

  for k = 2:n
    for j = k:n
      D(j,k) = (D(j,k-1)-D(j-1,k-1))/(x(j)- x(j-k+1));
    endfor
  endfor
  
  c = D(n,n);

  for k = n-1:-1:1
    c =  conv(c,poly(x(k)));
    c(end) = c(end) + D(k,k);
  endfor
  
endfunction
