## Author: Kathleen Kaye S. Medriano
## Created: 2018-12-04

%i 

  f = @(t,y) (4.*t.*y)./(t.^4 + 1);
  a = 0;
  b = 1;
  n = 10;
  ya = 1;
  y = @(t) exp(2.*atan(t.^2));
  h = (b-a)/n;
  L = 4;
  M = 8*exp(pi/2);
    
  [te,we] = myeuler (f,a,b,ya,n);

  err_vec = abs(y(te)-we);
  err_bnd = ((h*M)/(2*L)).*(exp(L.*(te-a))-1);
  
  figure 1; semilogy(te(2:end),err_vec(2:end),'b-*',te(2:end),err_bnd(2:end),'r-*')
  xlabel('Time values') 
  ylabel('Error vector values')
  legend('Error vector values','Error bound')
  title('Approximate solution to y = f(t,y) using Eulers method')

  
%ii
   
  df = {@(t,y) (4.*y).*((-3.*t.^4+4.*t.^2+1)./((t.^4 +1).^2))};
  
  [te,we] = myeuler (f,a,b,ya,n);
  [th,wh] = myheun (f,a,b,ya,n);
  [tt,wt] = mytaylor (f,df,a,b,ya,n);
  [trkm,wrkm] = myrkmidpt (f,a,b,ya,n);
  [trk,wrk] = myrk (f,a,b,ya,n);
  
  err_eul = abs(y(te)-we);
  err_hn = abs(y(th)-wh);
  err_tay = abs(y(tt)-wt);
  err_rkm = abs(y(trkm)-wrkm);
  err_rk = abs(y(trk)-wrk);  
  
  figure 2; semilogy(te(2:end),err_eul(2:end),'b-*',th(2:end),err_hn(2:end),'r-*',tt(2:end),err_tay(2:end),'g-*',trkm(2:end),err_rkm(2:end),'m-*',trk(2:end),err_rk(2:end),'k-*')
  xlabel('Time values') 
  ylabel('Error vector values')
  legend('Euler','Heun','Taylor of order 2','Runge-Kutta Midpoint','Runge-Kutta of order 4','Location','southeast')
  title('Error values of approximation to y = f(t,y) using different methods')
  
%iii
  
  f1 = {@(t,u,y) y; @(t,u,y) 4.*u - 2.*t};
  f2 = {@(t,v,y) y; @(t,v,y) 4.*v};
  a = 0;
  b = log(2);
  alpha = 1;
  beta = 0; 
  n = 10; 
  x = @(t) (-17/15).*sinh(2.*t) - ((log(16))/15).*sinh(2.*t) + cosh(2.*t) + t./2;

  [tls,wls] = mylinshoot(f1,f2,a,b,alpha,beta,n);
  err_ls = abs(x(tls)-wls);
  
  figure 3; semilogy(tls(2:end),err_ls(2:end),'k-*')
  xlabel('Time values') 
  ylabel('Error vector values')
  legend('|x(tk) - wk|')
  title('Approximate solution to BVP using linear shooting method')