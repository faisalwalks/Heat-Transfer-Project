clear all
clc
alpha = 0.00001175;
mu = .00249993;
L = 1.001;
k = 19;
E = 2*(10^11);
x = [0:0.001:1];
R = [0:0.01:0.1];
r = zeros(1,11);
U = zeros(11,1001);
u = zeros(11,1001);
sigma = zeros(11,1001);
SIGMA = zeros(11,1001);
e = zeros(11,1001);
teta = zeros(11,1001);

for i = 1:11
    
    for j = 1:1001
        teta(i,j) = (1/(r(i)+1))*x(j);
        U(i,j) = (mu/(2*(r(i)+1)))*((x(j)^2)-x(j));
        u(i,j) = U(i,j)*L;
        e(i,j) = (mu/(2*(r(i)+1)))*((2*x(j))-1);
        r(i) =(R(i)*L)/k;
        SIGMA(i,j) = (mu/(2*(r(i)+1)));
        sigma(i,j) = SIGMA(i)*E;

    end
    
end
        
figure()
plot(x,U(1,:),x,U(2,:),x,U(3,:),x,U(4,:),x,U(5,:),x,U(6,:),x,U(7,:),x,U(8,:),x,U(9,:),x,U(10,:),x,U(11,:))
title('Displacement v/s Length')
xlabel('Length')
ylabel('Displacement')
legend('r=0','r=0.01','r=0.02','r=0.03','r=0.04','r=0.05','r=0.06','r=0.07','r=0.08','r=0.09','r=0.1')
figure()
plot(x,e(1,:),x,e(2,:),x,e(3,:),x,e(4,:),x,e(5,:),x,e(6,:),x,e(7,:),x,e(8,:),x,e(9,:),x,e(10,:),x,e(11,:))
title('Strain v/s Length')
xlabel('Length')
ylabel('Strain')
legend('r=0','r=0.01','r=0.02','r=0.03','r=0.04','r=0.05','r=0.06','r=0.07','r=0.08','r=0.09','r=0.1')
figure()
plot(x,teta(1,:),x,teta(2,:),x,teta(3,:),x,teta(4,:),x,teta(5,:),x,teta(6,:),x,teta(7,:),x,teta(8,:),x,teta(9,:),x,teta(10,:),x,teta(11,:))
title('Temperature v/s Length')
xlabel('Length')
ylabel('Temperature')
legend('r=0','r=0.01','r=0.02','r=0.03','r=0.04','r=0.05','r=0.06','r=0.07','r=0.08','r=0.09','r=0.1')
figure()
plot(x,sigma(1,:),x,sigma(2,:),x,sigma(3,:),x,sigma(4,:),x,sigma(5,:),x,sigma(6,:),x,sigma(7,:),x,sigma(8,:),x,sigma(9,:),x,sigma(10,:),x,sigma(11,:))
title('Stress v/s Length')
xlabel('Length')
ylabel('Stress')
legend('r=0','r=0.01','r=0.02','r=0.03','r=0.04','r=0.05','r=0.06','r=0.07','r=0.08','r=0.09','r=0.1')
