function [k_eq, Ek_eq]=eq1d_v1(x,T,deltax)
%function [mk, Ek]=eq1d(Vx,T,deltax)
% deltax: error in the position detection
% EQ1D   1D implementation of the EQUIPARTITION METHOD

kb=1.38064852e-23;

[N,Nexp]=size(x);

for j=1:Nexp
    
    xx=x(:,j);
    
    sigma2=var(xx);    
    
    k=kb*T./(var(xx,[],1)-deltax^2);
    
    Ekexp2(j)=4/(Nexp*N)*k^2/sigma2*deltax^2;
    
    kexp(j)=k;
    
end
k_eq=mean(kexp);

Ek_eq=sqrt(var(kexp)+mean(Ekexp2));

%
disp('...')

disp('Equipartition analysis')

disp(['k_eq: ' num2str(k_eq) '+-' num2str(Ek_eq)]);