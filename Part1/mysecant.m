% Usage: P = mysecant (f, p0, p1, tol, Nmax)

% Input: f = anonymous function  
%        p0 and p1 = initial approximations
%        tol = error tolerance
%        Nmax = maximum number of iterations

% Output: P = vector showing the approximate zero of f 
%             and whose length is the no. of iterations; 


## Author: Kathleen Kaye S. Medriano 
## Created: 2018-09-15

function P = mysecant (f, p0, p1, tol, Nmax)
  
  if nargin < 3;
    f = input('Please input a function: ')
    p0 = input('Input a value for initial approximation: ')
    p1 = input('Input a value for initial approximation: ')
    tol = input('Provide a tolerance level: ')
    Nmax = input('Specify the maximum number of allowable iterations: ') 
    elseif nargin == 3;
      tol = 10^(-6);
      Nmax = 100;
    elseif nargin == 4;
      Nmax = 100; 
  endif
  
  P = zeros(Nmax,1);
  
  for n = 1:Nmax;
    pold = p1;
    p = p1 - ((f(p1))*((p1-p0)/(f(p1)-f(p0))));
    P(n) = p;
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
    p0 = p1;
    p1 = p;  
  endfor
  
  if abs(p-pold)>tol | abs(f(p))>tol;
    disp(['The procedure did not successfully attain the desired approximate solution within ' num2str(Nmax) ' iterations']) 
  endif 

  P = P(1:n);

endfunction
