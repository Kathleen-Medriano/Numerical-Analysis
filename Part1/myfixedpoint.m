% Usage: P = myfixedpoint (f, p0, tol, Nmax)

% Input: f = anonymous function
%        p0 = initial approximation
%        tol = error tolerance
%        Nmax = maximum number of iterations

% Output: P = vector showing the approximate fixed points of f 
%             and whose length is the no. of iterations; 


## Author: Kathleen Kaye S. Medriano 
## Created: 2018-09-15

function P = myfixedpoint (f, p0, tol, Nmax)
  
  if nargin < 2;
    f = input('Please input a function: ')
    p0 = input('Input a value for initial approximation: ')
    tol = input('Provide a tolerance level: ')
    Nmax = input('Specify the maximum number of allowable iterations: ') 
    elseif nargin == 2;
      tol = 10^(-6);
      Nmax = 100;
    elseif nargin == 3;
      Nmax = 100; 
  endif

  P = zeros(Nmax,1); %Initialize P
  p = p0; %Initial approximation  
  n = 0;
  
    if (isreal(p))
      for n = 1:Nmax; 
        pold = p; %Storing previous matrix
        p = f(p);
        P(n) = p; %Replacing the nth element of the matrix P 
          if (isreal(p))
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
          
          if abs(p-pold)<= tol
              break;
          endif 
      endfor
      
      if abs(p-pold)>tol;
        disp(['The procedure did not successfully attain the desired approximate solution within ' num2str(Nmax) ' iterations'])  
      endif  
      
      else
        disp(['The initial approximation p0 = ' num2str(p0) ' is not a real number'])
    endif  
  
  P = P(1:n);
  
endfunction
