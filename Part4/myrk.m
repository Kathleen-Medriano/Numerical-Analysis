## Author: Kathleen Kaye S. Medriano
## Created: 2018-12-04

% Usage: function [t,w] = myrk (f,a,b,ya,n)

% Input: f = anonymous function of 2 variables (t,y)
%        a = initial point of the interval [a,b] (t is an element from [a,b])
%        b = endpoint of the interval [a,b] (t is an element from [a,b])
%        ya = y(a) where y(t) is the unique function solution of the IVP
%        n = number of equal length intervals between a and b

% Output: t = vector of n+1 equally spaced points between a and b
%         w = vector of length n+1 where the elements are approximations for y(t) 

function [t,w] = myrk (f,a,b,ya,n)
  h = (b-a)/n;
  t = (a:h:b)'; %column vector 
  w = zeros(n+1,1); %column vector 
  
  w(1) =ya;
  
  for k = 1:n
    P1 = h*f(t(k),w(k));
    P2 = h*f(t(k)+(h/2),w(k)+(1/2*P1));
    P3 = h*f(t(k)+(h/2),w(k)+(1/2*P2));
    P4 = h*f(t(k+1),w(k)+P3);
    
    w(k+1) = w(k) + (1/6)*(P1 + 2*P2 + 2*P3 + P4);  
  endfor

endfunction
