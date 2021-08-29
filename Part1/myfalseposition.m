% Usage: P = myfalseposition (f, a, b, tol, Nmax)

% Input: f = anonymous function
%        a = left endpoint
%        b = right endpoint
%        tol = tolerance
%        Nmax = maximum number of iterations

% Output: P = vector showing the approximate zero of f 
%             and whose length is the no. of iterations; 


## Author: Kathleen Kaye S. Medriano 
## Created: 2018-09-15

function P = myfalseposition (f, a, b, tol, Nmax)

  if nargin < 3; 
    display('You have not given the necessary inputs')
    f = input('Please input a function: ')
    a = input('Input a left endpoint: ')
    b = input('Input a right endpoint: ')
    tol = input('Indicte a tolerance level: ')
    elseif nargin == 3;
      tol = 10^(-6);
      Nmax = 100;
    elseif nargin == 4;
      Nmax = 100; 
  endif
  
% Compute for the values on the endpoints and for p 
  fa = f(a);
  fb = f(b);

% Set up P 
  P = zeros(Nmax,1);
  
% Check if the zero is on a or b
  if abs(fa)<tol|fa == 0; # with warning 
    disp(['The zero is on ' num2str(a)])
    P = zeros(0);
    elseif abs(fb)<tol|fb == 0; # with warning 
    disp(['The zero is on ' num2str(b)]) 
    P = zeros(0);
% Check if the assumptions of the IZT are met
    elseif fa*fb>0;
      disp('The inputs do not satisfy the Intermediate Zero Theorem')
    else

      for n = 1:Nmax;
        pold = b;
        p = b - ((f(b))*((b-a)/(f(b)-f(a))));
        P(n) = p;
          if abs(p-pold)<=tol && abs(f(p))<=tol;
            break;
            elseif f(p)*f(a) > 0;
              a = p;
            else 
              b = p;
          endif
          
      endfor
      
      if abs(p-pold)>tol || abs(f(p))>tol;
        disp(['The procedure did not successfully attain the desired approximate solution within ' num2str(Nmax) ' iterations'])
      endif 
  endif
      
  P = P(1:n);
endfunction
