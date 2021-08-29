% Usage: P = mybisec (f, a, b, tol)

% Input: f = anonymous function
%        a = left endpoint
%        b = right endpoint
%        tol = tolerance

% Output: P = vector showing the approximate zero of f on [a,b] 
%             and whose length is the no. of iterations; 


## Author: Kathleen Kaye S. Medriano 
## Created: 2018-09-15


function P = mybisec (f, a, b, tol);
  
  if nargin == 3;
    tol = 10^(-6);
    elseif nargin < 3;
      display('You have not given the necessary inputs')
      f = input('Please input a function: ')
      a = input('Input a left endpoint: ')
      b = input('Input a right endpoint: ')
      tol = 10^(-6);
  end
   
% Compute for the values on the endpoints and for p 
  fa = f(a);
  fb = f(b);

% Set up P 
  N = ceil((log(b-a)-log(tol))/(log (2)));
  P = zeros(N,1);
  
% Check if the zero is on a or b
  if fa == 0; 
    disp('The zero is on:') 
    disp(num2str(a))
    P = zeros(0);
    elseif fb == 0; 
    disp('The zero is on:') 
    disp(num2str(b))
    P = zeros(0);
% Check if the assumptions of the IZT are met
    elseif fa*fb>0;
      disp('The inputs do not satisfy the Intermediate Zero Theorem');
    else
 
      for n = 1:ceil((log(b-a))-(log(tol)))./(log (2));
       P(n) = (a+b)/2;
       p = P(n);
       fp = f(p);
          if fp == 0 
            break
            elseif sign(fp)*sign(fa) > 0;
              a = p;
              fa = fp;
            else 
              b = p;
              fb = fp; 
          end
      end
      
  end

endfunction
