function [mk, Ek]=eq1d(Vx,T,deltax)
%function [mk, Ek]=eq1d(Vx,T,deltax)
% deltax: error in the position detection
% EQ1D   1D implementation of the EQUIPARTITION METHOD

kb=1.38064852e-23;

[N,Nexp]=size(Vx);

for j=1:Nexp
    
    x=Vx(:,j);
    
    sigma2=var(x);    
    
    k=kb*T./(var(x,[],1)-deltax^2);
    
    Ekexp2(j)=4/(Nexp*N)*k^2/sigma2*deltax^2;
    
    kexp(j)=k;
    
end
mk=mean(kexp);

Ek=sqrt(var(kexp)+mean(Ekexp2));

%
disp('...')

disp('Equipartition analysis')

disp(['k_eq: ' num2str(mk) '+-' num2str(Ek)]);