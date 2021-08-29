
## Author: imathuser <imathuser@IMATHSLAB3>
## Created: 2018-10-09

function x = myjacobi (A, b, x0, tol, Nmax)
  [~,n] = size(A);
  x = x0;
  
    for k = 1:Nmax
      xold = x;
        for i = 1:n
          x(i) = (b(i)-(A(i,[1:i-1,i+1:n])*(xold([1:i-1,i+1:n]))))/A(i,i)
        endfor
        
        if norm(A*x-b)<tol
          break;
        endif
        
    endfor
        
endfunction
