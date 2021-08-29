## Author: Kathleen Kaye S. Medriano 
## Created: 2018-12-04

% Usage: function [t,w] = mylinshoot (f1,f2,a,b,alpha,beta,ya,n)

% Input: f1 = cell array of system of first order IVPs which was derived from the BVP
%        f2 = cell array of system of first order IVPs which was derived from the BVP
%        a = initial point of the interval [a,b] (t is an element from [a,b])
%        b = endpoint of the interval [a,b] (t is an element from [a,b])
%        alpha = x(a)
%        beta = x(b) 
%        n = number of equal length intervals between a and b

% Output: t = vector of n+1 equally spaced points between a and b
%         w = vector of length n+1 where the elements are approximations for y(t) 

function [t,w] = mylinshoot(f1,f2,a,b,alpha,beta,n)
  
  [t,W] = myrks (f1,a,b,[alpha,0],n);
    u = W(:,1);
    
  [t,W] = myrks (f2,a,b,[0, 1],n);  
    v = W(:,1);
    
  w = u + ((beta-u(end))/(v(end))).*v;

endfunction
