clear all;
close all;

%Initial position/velocity
x=0;
v=0;
avgV=0;

t=0;% starting time
dt=1;%time step
n=500;%number of steps

tau = 10;
ps = 1-exp(-dt/tau); % probability of scattering
F = 1; % force
m = 1; % mass

%loop to advance position/velocity
for j= 2:dt:n
    % update based on previous
    if rand(1)<=ps %set v=0 if scattering
        v(j)=0;
    else
        v(j)= (F/m)*dt + v(j-1);
    end
    avgV(j) =mean(v);
    x(j)= (F/(2*m))*dt^2 + v(j-1)*dt + x(j-1);
    t(j) = dt +t(j-1);
    
    subplot(2,1,1);hold on;
    plot(t,v,'g');plot(t,avgV,'bo');
%     legend('Velocity','Average');
    title(sprintf('v vs t Vdrift = %0.5f',avgV(j)));xlabel('t');ylabel('v');
    hold off;
    
    subplot(2,1,2);hold on;
    plot(t,x,'r');
%     legend('Position');
    title('x vs t');xlabel('t');ylabel('x');
    hold off;
    
    pause(0.001)
end 

