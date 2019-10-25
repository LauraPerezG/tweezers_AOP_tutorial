function [k_psd]=plotsub_msd(filename, positioninthefig1, title1, T, subs, maxlag)
load(filename);
disp(filename);
kb=1.38e-23;

axes( 'Position',positioninthefig1);  % fa in modo di centrare il riquadro degli assi nella posizione voluta


% PSD analysis for Nexp

% Initialization of the workspace

addpath psd

nw=round(size(x(1:subs:end,:),1)/500); 
kb=1.38064852e-23;
gamma=6*pi*eta*a;
[fc_exp,D_exp,Efc_exp,ED_exp,f,XX,fw_mean,Pk,EPk,fcut]=psd_lfit(x(1:subs:end,:),dt*subs,nw,1/4);


mgamma_psd=kb*T./D_exp;

Egamma_psd=kb*T./D_exp^2*ED_exp;

k_psd=2*pi*gamma*fc_exp;

Ek_psd=2*pi*gamma*Efc_exp;

% estimation of k using the estimated gamma
%mk2_psd=2*pi*mgamma_psd.*mfc_psd;

%Ek2_psd=2*pi*mgamma_psd.*Efc_psd+2*pi*mfc_psd*Egamma_psd;

loglog(f,XX*1e12,'.','MarkerSize',0.5,'Color',color2rgb('blue_gray'))

hold on

loglog(fw_mean,Pk*1e12,'MarkerFaceColor', 'white' , 'MarkerEdgeColor', 'white','MarkerSize',10)

loglog(f,D_exp/(2*pi^2)./(fc_exp^2+f.^2)*1e12,'MarkerFaceColor', color2rgb('yellow') , 'MarkerEdgeColor', color2rgb('yellow') ,'LineWidth',2)

loglog(fcut*ones(1,300),exp(linspace(log(0.8*min(XX)*1e12),log(1.1*max(XX)*1e12),300)),'.k','MarkerSize',2)

set(gca,'FontSize',16)

xlabel('$f_k(Hz)$','Interpreter','Latex')

ylabel('$|\hat{x}|^2/T_s, \, P^{(ex)}_k(\mu m^2/Hz)$','Interpreter','Latex')

%msd_fit= 2*kb*T/k_msd*(1- exp(-tau/tau0));
%plot(tau, msd_fit*1e12, 'LineWidth',3,'Color',col1, 'DisplayName',  'Non linear fitting');
%hold on 
%ntaus=6;
%errorbar(tau,  mmsd*1e12, Emsd*1e12,'o','MarkerSize',7 ,'LineWidth', 1.5,'Color',colbar, 'DisplayName', 'Experimental mean square displacement');
%box on
%xticks((-0.5:0.1:0.5)*1e-7);
%xlim([0 0.009]);
%ylim([0, 6.5]*1e-4)
%set(gca,'TickLabelInterpreter','latex', 'linewidth',1.5,'FontSize',15);
%xlabel('$\tau(\rm s)$','Interpreter','Latex', 'FontSize',20)
%ylabel('$\rm MSD (\rm{\mu m^{2}})$','Interpreter','Latex', 'FontSize',20)
%plot([tau0*ntaus,tau0*ntaus],[0,6.5*1e-4],'--k', 'HandleVisibility','off')
%text(tau0*ntaus,0.05*max(mmsd)*1e12,[num2str(ntaus),'$\tau_0$'],'Interpreter','latex','FontSize',20)

%hold off
%title(title1)
%legend



end