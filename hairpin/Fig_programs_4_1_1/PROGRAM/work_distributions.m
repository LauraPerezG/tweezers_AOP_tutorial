%
% Program that computes the free energy of formation of a DNA hairpin.
% 
clear
%clc

%Adding path to functions
addpath('/home/xavi/Documents/ssDNA/Review/PROGRAM/Functions/')

%path to data
dirpath='/home/xavi/Documents/ssDNA/Review/RAW_DATA/';
%output path
outpath='/home/xavi/Documents/ssDNA/Review/RESULTS/';

%The files contained in dirpath folder are u,f for the unfolding(stretching) and
%folding(releasing) trajectories. They contain 4 columns:
%$1=counter $2=trap distance(nm) $3=time (s) $4=force(pN)
%The files have been sorted in order to have the trap distance order toward
%increasing values.

%number of files in dirpath
nfiles=96;

%KBT in pNnm at Room Temperature =25ºC
KBT=4.114;

%limits for integrating fdx. At l0 all trajectories must be in the folded
%state and at lf they have to be at the unfolded state.
l0=-160;
lf=-60;

%we prepare the vectors for the work computed for each trajectory (the
%integral of fdx
Wu=zeros(1,nfiles);
Wf=zeros(1,nfiles);
%also declare fmax and fmin for each trajectory
fmaxu=zeros(1,nfiles);
fminu=zeros(1,nfiles);
fmaxf=zeros(1,nfiles);
fminf=zeros(1,nfiles);
%We also compute the effective stiffness of the unfolding branch 
keff=zeros(1,nfiles);

for i=1:nfiles
    unfoldfile= char(strcat(dirpath,{'u'},num2str(i),{'.txt'}));
    foldfile= char(strcat(dirpath,{'f'},num2str(i),{'.txt'}));
    
    datau=importdata(unfoldfile);
    dataf=importdata(foldfile);
    %importing force and extension

    xu = datau(:,2);
    fu = datau(:,4);
    %finding indices fullfilling the conditions for integrating
    indexu=find(xu>l0 & xu<lf);
    xuint=xu(indexu);
    fuint=fu(indexu);
    fmaxu(i)=fuint(length(indexu));
    fminu(i)=fuint(1);
    
    xf = dataf(:,2);
    ff = dataf(:,4);
    %finding indices fullfilling the conditions for integrating
    indexf=find(xf>l0 & xf<lf);
    xfint=xf(indexf);
    ffint=ff(indexf);
    fmaxf(i)=ffint(length(indexf));
    fminf(i)=ffint(1);
    
    %to compute the stiffnes we do a linear fit of the first nfit=400points
    nfit=400;
    xfit=xfint(1:nfit);
    ffit=ffint(1:nfit);
    P = polyfit(xfit,ffit,1);
    keff(i)=P(1);
    
    
    %we compute the work for each trajectory and add it to the vector of
    %works
    Wu(i)=trapz(xuint,fuint)/KBT;
    Wf(i)=trapz(xfint,ffint)/KBT;
end
    
%%
% We compute the work histogram for the data analyzed in the previous step
%

%we create the vector of each work distribution. The bining is created by
%using the Rice's rule.

[yyu,xu] = hist(Wu, fix(2*length(Wu)^(1/3)) ); 
[yyf,xf] = hist(Wf, fix(2*length(Wf)^(1/3)) ); 
%normalization: probability distribution functions (pdf)
yu = yyu/trapz(xu,yyu);
yf = yyf/trapz(xf,yyf);

%We adjust the bining so both pdf's have the same bining
W = [min([min(xu),min(xf)]) : 0.5 : max([max(xu),max(xf)]) ]';

%interpolation
Pu = interp1(xu,yu,W);
Pf = interp1(xf,yf,W);

%We find the point at which the distributions coincide (units of pNnm)
Weq=W(find(abs(Pu-Pf) == min(abs(Pu-Pf))));

%We write into a file the pdf of the forward and reverse work:
file_nameF = char(strcat(outpath,'WFpdf.txt'));
dlmwrite(file_nameF, [xf',yf'],'delimiter','\t','precision','%5.5f');
file_nameU = char(strcat(outpath,'WUpdf.txt'));
dlmwrite(file_nameU, [xu',yu'],'delimiter','\t','precision','%5.5f');

%We write into a file the pdf of the interpolated area:
file_namePf = char(strcat(outpath,'Interp_WFpdf.txt'));
dlmwrite(file_namePf, [W,Pf],'delimiter','\t','precision','%5.5f');
file_namePu = char(strcat(outpath,'Interp_Wupdf.txt'));
dlmwrite(file_namePu, [W,Pu],'delimiter','\t','precision','%5.5f');


%%
%Finally we subtract the contributions of the handles and bead, the
%released single-stranded DNA and the hairpin orientation in order to get
%the free-energy of formation of the DNA hairpin


%Optical trap contribution + handles (effective stiffness), also in kBT
Weff=(mean(fmaxf)^2-mean(fminf)^2)/(2*mean(keff))/KBT

%ssDNA contribution using inextensible WLC with elastic parameters:
p=1.35;
l=0.59;
n=44;

WssDNA=IntFdx_WLC(mean(fmaxf),p,l*n,KBT)/KBT

%hairpin orientation assuming d=2nm
d=2.0;
Worient=IntFdx_dipole(d, mean(fmaxf),KBT)/KBT

%Free energy of formation (kBT)
%Values for the sequence of the CD4 molecule are: 51.9KBT (Santalucia, 1998)
G0=Weq-Weff-WssDNA+Worient
