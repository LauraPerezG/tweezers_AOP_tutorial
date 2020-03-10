clear all
close all
addpath pot
addpath eq
addpath acf
addpath psd
addpath msd
addpath forma
addpath bayesian
load('Data_positions_Fig9_1P2_S.mat')


x = x - repmat(mean(x),size(x,1),1);

kB=1.38e-23; % Boltzmann constant [m^2kg/s^2K]
T=300;  % Temperature [K]
r=1.03E-6;      % Particle radius [m]
v=0.00002414*10^(247.8/(-140+T));  % Water viscosity [Pa*s]
gamma=pi*6*r*v; %[m*Pa*s]
dnn=2e3*(1:1e1:5000);
for nj=1:30%length(dnn)
    nj
xn =x(1:dnn(nj), :);
N=length(xn);
%Potential
[k_pot(nj), sigma_k_pot(nj), ~, ~, ~, ~, ~, ~, ~,~]=pot_lfit(xn,T,50);
%Equipartition
[k_eq(nj), sigma_k_eq(nj)]=eq1d(xn,T);
%autocorrelation function
[k_acf(nj), sugma_acf(nj), D_acf(nj), sigam_D_acf(nj),gamma_exp(nj), sigma_gamma_exp(nj),~, ~, ~,~, ~, ~]=acf_lfit(xn,T,dt);

%power spectral density
nw=round(size(xn,1)/500); 
[fc_exp,D_exp(nj),sigma_fc_exp,sigma_D_exp(nj),~,~,~,~,~,~]=psd_lfit(xn,dt,nw,1/4);
gamma_psd(nj)=kB*T./D_exp(nj);

sigma_gamma_psd(nj)=kB*T./D_exp(nj)^2*sigma_D_exp(nj);

k_psd(nj)=2*pi*gamma*fc_exp;

sigma_k_psd(nj)=2*pi*gamma*sigma_fc_exp;

%mean square displacement
maxlag=20;
[k_msd(nj),sigma_k_msd(nj),~, ~, D_msd(nj), ED_msd(nj), ~, ~, ~, ~, gamma_msd(nj), sigma2_gamma_msd(nj)]=msd_nfilt(x,T,dt,maxlag);
%FORMA
%[k_forma(nj), sigma_k_forma(nj),D_forma(nj), sigma_D_forma(nj)] = forma1d(reshape(x, [size(x,1)*size(x,2),1 ]), dt, gamma);
%BAYESIAN
subs=10;
[k_bay(nj), sigma_k_bay(nj), gamma_bay(nj), sigma_gamma_bay(nj), D_bay(nj), sigma_D_bay(nj)]= bayesian(x(1:subs:end), dt*subs,T, a);
end


save('results_comparison.mat', 'k_pot', 'sigma_k_pot', 'k_eq', 'sigma_k_eq')
%%
load('results_comparison.mat')
scatter(dnn(1:30), k_pot*1e6, 'DisplayName', 'Potential')
hold on
scatter(dnn(1:30),k_eq*1e6, 'DisplayName', 'Equipartition')
scatter(dnn(1:30),k_acf*1e6, 'DisplayName', 'Autocorrelation funtion')
scatter(dnn(1:30),k_psd*1e6, 'DisplayName', 'PSD')
scatter(dnn(1:30),k_msd*1e6,  'DisplayName', 'MSD')
%scatter(dnn(1:30),k_forma*1e6,  'DisplayName', 'FORMA')
scatter(dnn(1:30), k_bay*1e6,  'DisplayName', 'BAYES')
legend