% Usage: approxint = mycompncquad (f,a,b,n,type)
% Input: f = anonymous function
%        a = left endpoint
%        b = right endpoint
%        n = number of subintervals
%        type = type of quadrature rule (s for simpsons, t for trapezoidal)

% Output: approxint = approximate integral 

## Author: Kathleen Kaye S. Medriano 
## Created: 2018-11-21


function approxint = mycompncquad (f,a,b,n,type)
  
  par = mod(n,2);
  x = linspace(a,b,n+1);
  h = (b-a)/n;
  
  if ((nargin==4 && par==0))
    type = 's'
  elseif ((nargin==4 && par==1))
    type = 't'
  endif 
  
  if ((type == 't')) 
     Q = h*(((f(a)+f(b))/2) + sum(f(x(2:n))));
  endif
  
  if ((type == 's')) 
    assert(par == 0,'The quadrature rule indicated and the no. of subintervals do not agree')
      Q = (h/3)*(f(a)+f(b)) + (2*h/3)*(sum(f(x(3:2:n-1)))) + (4*h/3)*(sum(f(x(2:2:n))));
  endif
  
  approxint = Q; 
   
endfunction
