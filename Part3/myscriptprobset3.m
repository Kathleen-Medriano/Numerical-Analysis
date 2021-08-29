## Author: Kathleen Kaye S. Medriano 
## Created: 2018-11-21

f = @(x) log(2.*x.^2 + 1);

%i

x = linspace(1,4,5);
y = f(x);
xx = linspace(1,4,100);
[cl, L] = mylagrangepoly (x,y)

L1 = polyval(L(1,:),xx);
L2 = polyval(L(2,:),xx);
L3 = polyval(L(3,:),xx);
L4 = polyval(L(4,:),xx);
L5 = polyval(L(5,:),xx);

figure 1; plot(xx,L1,'r-',xx,L2,'b-',xx,L3,'k-',xx,L4,'m-',xx,L5,'g-');
xlabel('x values')
ylabel('y values')
legend('L5,1','L5,2','L5,3','L5,4','L5,5')
title('The polynomials L5,k in [1,4]')


%ii

#x = [1, 4];
#y = f(x);

#[cn,D] = mynewtonpoly (x,y)
#P = polyval(cn,xx);

#M = 31/2;
#errnewtonformula = @(x)(((x-1).*(x-2).*(4-8.*x.^2))./(8.*x.^4 +8.*x.^2+2));
#errnewton = abs(f(xx)-P);


#figure 2; plot(xx,f(xx),'r-',xx,P,'b-');
#xlabel('x values')
#ylabel('y values')
#legend('f(x)','P(x)')
#title('Plot of f(x) and P(x) in the interval [1,4]')


#figure 3; semilogy(xx,errnewton,'g-',xx,abs(M),'k*');
#xlabel('x values')
#ylabel('error value')
#legend('error','upper bound')
#title('Error values of the linear interpolating polynomial P(x) (wrt to f(x)) and upper bound')


%iii 

#n = 20;
#a = 1;
#b = 4; 

#Trapezoidal = mycompncquad (f,a,b,n,'t')
#Simpson = mycompncquad (f,a,b,n,'s')

%iv 

#df = 4.*x./(2.*x.^2 +1);
#h = linspace(0.1,10^(-12),50);
%or h = linspace(10^(-12),0.1,50); note that the graph would be flipped
#note df(2) = 8/9

  
#fwd_dif = abs(((f(2+h).-f(2))./h).-(8/9));
#three_pt1 = abs((((-3/2).*f(2)+(2).*f(2+h).-(1/2).*f(2+2.*h))./h).-(8/9));
#three_pt2 = abs(((f(2+h).-f(2-h))./(2.*h)).-(8/9));

#figure 4; semilogy(fwd_dif,'r-',three_pt1,'b-',three_pt2,'g-')
#legend('Forward difference','Three pt. formula w/ 2,2+h,2+2h','Three pt. formula w/ 2-h,2,2+h')
#title('Error for the approximation of df(2)')
