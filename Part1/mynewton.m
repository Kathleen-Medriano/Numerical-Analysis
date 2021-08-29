% Usage: P = mynewton (f, df, p0, tol, Nmax)

% Input: f = anonymous function
%        df = derivative of function f
%        p0 = initial approximation
%        tol = error tolerance
%        Nmax = maximum number of iterations

% Output: P = vector showing the approximate zero of f 
%             and whose length is the no. of iterations; 


## Author: Kathleen Kaye S. Medriano 
## Created: 2018-09-07


function P = mynewton (f, df, p0, tol, Nmax)
  
  if nargin < 3;
    f = input('Please input a function: ')
    df = input('Input the derivative of the function: ')
    p0 = input('Input a value for initial approximation: ')
    tol = input('Provide a tolerance level: ')
    Nmax = input('Specify the maximum number of allowable iterations: ') 
    elseif nargin == 3;
      tol = 10^(-6);
      Nmax = 100;
    elseif nargin == 4;
      Nmax = 100; 
  endif
  
  P = zeros(Nmax,1);
  p = p0;
  
  for n = 1:Nmax;
    pold = p; %Storing previous approximation 
    p = p - (f(p)/df(p));
    P(n) = p; %Replacing the nth element of vector P
      if (isreal(p));
        else
          if n == 1;
            disp(['The 1st approximation is not a real number'])
            elseif n == 2;
            disp(['The 2nd approximation is not a real number'])
            elseif n == 3;
            disp(['The 3rd approximation is not a real number'])
            else
            disp(['The ' num2str(n) 'th approximation is not a real number'])
          endif
      endif
      
      if abs(p-pold)<=tol && abs(f(p))<=tol;
        break;
      endif
  endfor
  
  if abs(p-pold)>tol || abs(f(p))>tol;
    disp(['The procedure did not successfully attain the desired approximate solution within ' num2str(Nmax) ' iterations'])
  endif 
  
  P = P(1:n);
  
endfunction
