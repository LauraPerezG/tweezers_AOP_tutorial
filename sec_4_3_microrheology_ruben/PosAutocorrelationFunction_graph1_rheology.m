%COMPUTE velocity autocorrelation  of particle trapped by optical tweezers
%simple fluid and determine viscosity from decay time

% Files Water.txt, PNP.txt and CPyCl4mM.txt are needed to run PosAutocorrelationFunction.m and get the plots and fits 
% of Figure 2(a) and (b) on the manuscript. The first column of these files contains the particle position (a), while the 
% second has the correspondinf times. A .mat version of these data is also given with the same information.

clear all
close all

T0=22; %bath temperature
kB=1.38e-23; %Boltzman constant
T0 =T0 + 273.16;
R = (3.25e-6)/2; %particle radius

% 
xwi = 400;    % width of the plot square
bx1 = 140;     % extra space at the left
bx2 = 20;     % extra space at the right

Xpix = 2*xwi+2*bx1+2*bx2;  % total

ywi = 150;    % length riquadro con funzione
YYWi=3*ywi;
by1 = 75;     % extra space below
by2 = 30;     % extra space up

Ypix = 1*by1+1*YYWi+1*by2;  % larghezza figura in pixel
%number of bins of the histogram, if not set default is 50
figure('Position',[10 20 Xpix Ypix]);

Extension='.txt';
Filepath = 'PassiveMicrorheologyData/';
Filename{1}=['Water'];
Filename{2}= [ 'PNP'];
Filename{3}=['CPyCl4mM'];

color{1}=[70/255,130/255,180/255];
color{2}=[30/255,180/255,200/255];
color{3}=[170/255,10/255,30/255];
for jj=1:3
filname = [Filepath Filename{jj} Extension];
Data = dlmread(filname,'',1,0);
positionintefig1=[bx1 0 xwi 0]/Xpix + [0 by1+(3-jj)*ywi 0 ywi]/Ypix;
axes( 'Position',positionintefig1);
%Read data
[aaa,bbb]=size(Data);
x = Data(:,1); %position in meters
t = Data(:,2); %time in seconds
plot(t,x/1e-6, 'Color', color{jj}, 'LineWidth', 1.5)
xlim([0 10])
xticks([0, 2, 4, 6, 8 ,10]);
yticks([-0.20, 0 , 0.2]);


ylim([-0.3 0.3])
legend(Filename{jj})
ylabel('$x ( \rm \mu m$)','Interpreter','Latex', 'FontSize',30);
set(gca,'TickLabelInterpreter','tex', 'linewidth',1.5,'FontSize',25);


if (jj==1 || jj==2)
set(gca,'TickLabelInterpreter','tex', 'linewidth',1.5, 'FontSize',25,'Xticklabel',[]);
end
end 

xlabel('t (s)', 'Interpreter','Latex', 'FontSize',30)

%title('Stochastic trajectory of trapped particle')
%%
positionintefig2=[2*bx1+xwi+bx2 0 xwi 0]/Xpix + [0 by1 0 YYWi]/Ypix;
axes( 'Position',positionintefig2);
%Compute autocorrelation function
for jj=1:3
filname = [Filepath Filename{jj} Extension];
Data = dlmread(filname,'',1,0);

%Read data
[aaa,bbb]=size(Data);
x = Data(:,1); %position in meters
t = Data(:,2); %time in seconds
xx=xcorr(x,'unbiased');

aa = length(x);

kk=100; %take only the kk-nth part of total time interval of autocorrelation function

xxcorr=xx(aa:end); %take possitive values of time for autocorrelation function 

%figure(2)
hold on
plot(t(1:floor(aa/kk)),xxcorr(1:floor(aa/kk))/1e-12,'o', 'Color', color{jj}, 'DisplayName', Filename{jj})

%title('Stochastic trajectory of trapped particle')

%Compute trap stiffness
varx = var(x); %variance of particle position
k = kB*T0/varx %trap stiffness from equipartition 


%fit first points of autocorrelatio function to exponential and determine
%viscosity

tt = t(1:floor(floor(aa/kk)/10));
logxxcorr = log(xxcorr(1:floor(floor(aa/kk)/10)));

coeff = polyfit(tt,logxxcorr,1)

eta = k/6/pi/R/(-coeff(1))  %viscosity in Pa*s
xxcorrfit = exp(coeff(2))*exp(coeff(1)*t(1:floor(aa/kk)));

%figure(2)
plot(t(1:floor(aa/kk)),xxcorrfit/1e-12,'k --', 'HandleVisibility','off')

xlim([0 0.75])
end
legend
xlabel('t (s)', 'Interpreter','Latex', 'FontSize',30)
ylabel('$\langle x(t)x(o)\rangle(\mu m ^2)$','Interpreter','Latex', 'FontSize',30);
set(gca,'TickLabelInterpreter','tex', 'linewidth',1.5, 'FontSize',25,'Xticklabel',[]);



