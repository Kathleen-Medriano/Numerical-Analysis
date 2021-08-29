% Author: Kathleen Kaye S. Medriano

%i

  %General considerations
  f = @(x) x.^6 -3*x.^3 + 1;
  pexact = ((3-sqrt(5))/2)^(1/3);
  tol = 10^(-8);
  
  %Bisec and False
  a = 0;
  b = 1;

  %Newton
  df = @(x) 6*x.^5 -9*x.^2;
  
  Pbisec = mybisec (f, a, b, tol); 
  Pnewton = mynewton (f, df, 1, tol);
  Psecant = mysecant (f, 0, 1, tol);
  Pfalse = myfalseposition (f, a, b, tol);
  
  perrorbisec = abs(Pbisec - pexact);
  perrornewton = abs(Pnewton - pexact);
  perrorsecant = abs(Psecant - pexact);
  perrorfalse = abs(Pfalse - pexact);
  tboundbisec = (b-a)./2.^(1:length(Pbisec)); 
  
  figure; semilogy(perrorbisec,'r-*',perrornewton,'g-*',perrorsecant, 'b-*', perrorfalse, 'c-*',tboundbisec, 'm-*')
  legend('Bisection Method','Newton Method','Secant Method','False Position Method', 'Theoretical Bound')
  title('Error values of approximations of f(x) = x^6 -3x^3 + 1 on [0,1] when Bisection, Newton, Secant and False position methods are used')
  xlabel('Iteration number')
  ylabel('Error value')

%ii
 
  x = linspace(-4,4);
  y1 = 2.^(-x);
  y2 = x.^4 -8.*x.^2 + 2;
  figure; hold on
  plot(x,y1,x,y2)
  axis([-4 4 -10 10])
  title('Intersections of the curves y = 2^(-x) and y = x^4 -8x^2 + 2')
  xlabel('x-axis')
  ylabel('y-axis')
  legend('y = 2^(-x)', 'y = x^4 -8x^2 + 2')
  i = @(x) x.^4 -8.*x.^2 + 2;
  h = @(x) 2.^(-x) -  x.^4 + 8.*x.^2 - 2;
  dh = @(x)- 2.^(-x)*log(2) -4.*x.^3 + 16.*x;
  
  P = mynewton (h, dh, -4); 
  p1 = P(end);
  hold on; plot (p1,i(p1), 'r-*')
  
  P = mynewton (h, dh, -1.2);
  p2 = P(end);
  hold on; plot (p2,i(p2),'r*')
  
  P = mynewton (h, dh, 1);
  p3 = P(end);
  hold on; plot (p3,i(p3),'r*')
  
  P = mynewton (h, dh, 2);
  p4 = P(end);
  hold on; plot (p4,i(p4),'r*')
  
  
%iii

  g = @(x) ((x.^6 + 1)/3)^(1/3);
  P = myfixedpoint (g, 0.5)
  pexact = ((3-sqrt(5))/2)^(1/3);
  perror = abs(P-pexact);
  K = 2/(3*((2/3)^(2/3)));
  errbd = ((abs(P(1)-pexact))/(1-K)).*K.^(1:length(P));
  
  figure; semilogy(perror, 'r-*',errbd, 'b-*')
  title('Error values of the approximation of the fixed point of (x^6 + 1)/3)^(1/3) on [1/2,1]')
  ylabel('Error value')
  xlabel('Iteration number')
  legend('Fixed point method','Theoretical bound')