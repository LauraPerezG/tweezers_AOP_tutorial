function [k_msd,sigma2_k_msd ,  gamma_msd, sigma2_gamma_msd ,tau0]=plotsub_msd(filename, positioninthefig1, title1,subs, maxlag)
load(filename);
disp(filename);
kb=1.38064852e-23;
%blue color
col1=[73/255,4/255,10/255];
%yellow
col2=[241/255,185/255,14/255];
%gray color for experimental data
colbar=[7/255, 79/255, 129/255];


[k_msd,sigma2_k_msd, tau0, sigma2_tau0, D_msd, ED_msd, tau, mmsd, Emsd, indc, gamma_msd, sigma2_gamma_msd]=msd_nfilt(x(1:subs:size(x,1),:),T,dt*subs,maxlag);



axes( 'Position',positioninthefig1);  % fa in modo di centrare il riquadro degli assi nella posizione voluta

msd_fit= 2*kb*T/k_msd*(1- exp(-tau/tau0));
plot(tau, msd_fit*1e12, '--','LineWidth',3,'Color',color2rgb('deep_purple'), 'DisplayName',  'Non linear fitting');
hold on 
ntaus=6;
errorbar(tau(1:2:end),  mmsd(1:2:end)*1e12, Emsd(1:2:end)*1e12,'.','MarkerSize',7 ,'LineWidth', 1.5,'Color',colbar, 'DisplayName', 'Experimental mean square displacement');
box on
%xticks((-0.5:0.1:0.5)*1e-7);
xlim([0 0.009]);
ylim([0, 6.5]*1e-4)
set(gca,'TickLabelInterpreter','latex', 'linewidth',1.5,'FontSize',15);
xlabel('$\tau(\rm s)$','Interpreter','Latex', 'FontSize',20)
ylabel('$\rm MSD (\rm{\mu m^{2}})$','Interpreter','Latex', 'FontSize',20)
plot([tau0*ntaus,tau0*ntaus],[0,6.5*1e-4],'--k', 'HandleVisibility','off')
text(tau0*ntaus,0.05*max(mmsd)*1e12,[num2str(ntaus),'$\tau_0$'],'Interpreter','latex','FontSize',20)

hold off
title(title1)
legend



end