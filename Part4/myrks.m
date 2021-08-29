## Author: Kathleen Kaye S. Medriano
## Created: 2018-12-04

% Usage: function [t,W] = myrks (f,a,b,Ya,n)

% Input: f = cell of anonymous functions of m+1 variables (t,u1,u2,...,um)  
%        a = initial point of the interval [a,b] (t is an element from [a,b])
%        b = endpoint of the interval [a,b] (t is an element from [a,b])
%        Ya = vector of m initial values, such that Ya(1)=u1(a), Ya(2)=u2(a),..
%             ..,Ya(m) = um(a), where, u1,u2,...,um are the unique functions 
%             which satisfy the mth order system of first order IVPs;
%        n = number of equal length intervals between a and b

% Output: t = column vector of n+1 equally spaced points between a and b
%         W = matrix of size n+1 x m, where each column j contains the 
%             approximations for uj(t) 


function [t,W] = myrks (f,a,b,ya,n)
  h = (b-a)/n;
  t = (a:h:b)'; %column vector
  m = length(f);
  W = zeros(n+1,m);
  P = zeros(4,m);
  
  [r,c] = size(ya);
  
  if r == 1;
    assert(c == m, 'The length of vector ya is not appropriate');
      W(1,:) = ya;
  elseif r == m;
    assert(c == 1, 'The length of vector ya is not appropriate');
      W(1,:) = ya';
  else
    assert(r == 1 && c == m, 'The size of ya is not appropriate');
  end
  
  for k = 1:n 
    for j = 1:m
      temp = [t(k),W(k,:)];
      temp = num2cell(temp);
      
      P(1,j) = h*f{j}(temp{:});%multiplication is scalar since f{j}(temp{:}) is scalar 
    end
    
    for j = 1:m
      temp = [t(k) + h/2, W(k,:)+(1/2).*P(1,:)];%1st addition scalar, 2nd vector
      temp = num2cell(temp);
      
      P(2,j) = h*f{j}(temp{:});
    end
    
    for j = 1:m
      temp = [t(k) + h/2, W(k,:)+(1/2).*P(2,:)]; 
      temp = num2cell(temp);
      
      P(3,j) = h*f{j}(temp{:});
    end
    
    for j = 1:m
      temp = [t(k+1), W(k,:)+ P(3,:)];
      temp = num2cell(temp);
      
      P(4,j) = h*f{j}(temp{:});
    end
    
    for j = 1:m
      W(k+1,j) = W(k,j) + (1/6)*(P(1,j)+2*P(2,j)+2*P(3,j)+P(4,j));
    end
    
  endfor  

endfunction
