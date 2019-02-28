%Contact
M=200;
h=1/M;x=0:h:1;
T=ones(M,1);
outputTime=0:.05:.2;
tl=length(outputTime);
% T(1)=0;

for i=1:tl
    T=heatequation(outputTime(i),M);%calls heatequation functiom 
    plot(x,T,'Linewidth',1.5);grid on;hold on;title('Temperature vs x (Contact)');%plot T vs x
    xlabel('Position(x)');ylabel('\theta(x)');axis([0 1 0 1]); 
end
legend('t=0','t=.05','t=.1','t=.15','t=.2');%,'t=.25','t=.3','t=.35','t=.4');%create legend

% figure(1);legend('time=0','time=1','time=2','time=3','time=4','time=5','time=6');%create legend
function [T]=heatequation(time,M)
    h=1/M;              %grid spacing
    x=0:h:1;y=0:1:1;
    T=ones(M+1,1);TT=zeros(M+1,2);
    T(1)=0;
    dt=0.8*h*h;     %time step
    t=0;
%     video=VideoWriter('movieu.avi');
%     video.open;
    while t<time
        for i=2:M
            T(i)=T(i)+(dt/(h*h))*(T(i+1)-2*T(i)+T(i-1));
            if i==M
                T(M+1)=1;
            end
        end
%         TT(:,1)=T;TT(:,2)=T;
%         subplot(2,1,1);plot(x,T,'Linewidth',2);grid on;title(['Temperature at t=' num2str(t)]);%plot T vs x
%         xlabel('Position(x)');ylabel('\theta(x)');
%         subplot(2,1,2);
%         pcolor(TT');shading interp;colorbar;
%         xlabel('x');xticks([1 25 50 75 100]);
%         xticklabels({'0','0.25','0.5','0.75','1'});
%         figure(1); Mov = getframe(gcf);
%         writeVideo(video,Mov);
%         pause(.01);
        t=t+dt;
        fprintf('t=%f\n',t);
    end
%     close(video);
end