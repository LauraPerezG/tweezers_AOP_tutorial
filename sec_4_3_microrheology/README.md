# Section 4.3  Microrheology

This folder contains the codes to analyze the data obtained from the microrheology experiments discussed  in the text.
 
How to use the Microrheology section:


**Determination of Zero Shear Viscosities**

Run [PosAutocorrelationFunction.m](programs/PosAutocorrelationFunction_Fig21.m)  to obtain (a)Trajectories of particle of distinct diameter trapped in different fluids. From top to bottom: water (2R = 2.73 um), PNP
(2R = 3.25 um) and aqueous miceller solution of CPyCl/NaSal at 4 mM (2R = 3.25 um). (b) Autocorrelation function of the particle position x trapped in the three different cases:
water, PNP and micellar solution. The dashed lines correspond to an exponential
fit. Inset: semilog representration of the position autocorrelation function for the three
cases, normalized by their corresponding variances.

the second part of this program calculates the velocity autocorrelation of a particle trapped by optical tweezers in a 
simple fluid and determines viscosity from decay time. The files used for this script are [Water.txt](data/PassiveMicrorheologyData/Water.txt),  [PNP.txt](data/PassiveMicrorheologyData/PNP.txt) and  [CPyCl4mM.txt](data/PassiveMicrorheologyData/CPyCl4mM.txt) contained in **[PassiveMicrorheologyData](data/PassiveMicrorheologyData/)**. The first column of these files contains the particle position (a), while the second has the corresponding times. 



![alt text](figures/1_Zero_shear_visc.jpg 
"Zero Shear viscosities")

**Determination of storage and loss moduli**


Run [PassiveMicrorheologyKramersKronig.m](programs/PassiveMicrorheologyKramersKronig_Fig22.m) to obtain (a) Power spectral density of
equilibrium fluctuations of x for a particle trapped by optical tweezers in wormlike miceller
solution of CPyCl/NaSal at 5 mM. Inset: time evolution of x over 10 s. (b) Storage (red circles) and loss (blue squares) modulus of the wormlike micellar solution determined by Passive Microrheology. Inset: Expanded view at intermediate frequencies.

Compute storage G'(f) and loss G''(f) modulus of complex fluid by Passive Microrheology from equilibrium Power Spectral Density (PSD) of an embedded particle trapped by optical tweezers, using Kramers Kronig relation to find real part of response function from imaginary part, using Fluctuation-Dissipation theorem.

A file containing the coordinates of the trapped article and the corresponding time is needed, and must be specified in the parameters Filepath and Filename, in this case **[PassiveMicrorheologyData](data/PassiveMicrorheologyData/)** and [CPyCl5mM.txt](data/PassiveMicrorheologyData/CPyCl5mM.txt) are the Filepath and Filename, correspondingly.
[CPyCl5mM.txt](data/PassiveMicrorheologyData/CPyCl5mM.txt)  contains the particle position (first column) and the corresponding time (second column).



![alt text](figures/2_Storage_and_loss.jpg 
"Storeage and loss")



**Active microrheology**

Run [Determination_of_Storage_and_Loss_Moduli.m](programs/Determination_of_Storage_and_Loss_Moduli_Fig23.m) to obtain (a) Power spectral density of the particle position, driven at different frequencies by a sinusoidal motion of the optical trap. The peaks are located at the imposed frequencies fd. Inset: exemplary time evolution of the perturbative force at fd = 1 Hz (thick solid line) and resulting particle position (thin solid line) (b) Numerical values of the storage (red circles) and loss (blue saures) modulus. The dotted and dashed lines depict the corresponding curves shown in  the previous figure obtained
by Passive Microrheology.


This program computes the real and the imaginary part of the complex modulus of a viscoelastic material, measured by Active Microrheology. The particle radius and trap stiffness must be specified as an input. A file containing the coordinates of the trapped article, the sinusoidal 
perturbative force at a single frequency and the corresponding time, is needed, and must be specified in the parameters filename. 


The file name **"5mMdrive_k1e-06_freq_X.mat"** indicated the frequency  **X** at which the sinusoidal perturbation was applied, for instance "5mMdrive_k1e-06_freq_25.6" corresponds to 25.6 Hz
The files contain the particle positions (x), the values of the applied sinusoidal force (fd), the corresponding time (t) and the sampling frequency (fs). These set of files are contained in folder **[ActiveMicrorheologyData](data/ActiveMicrorheologyData/)**.
![alt text](figures/3_Active_mic_sinusoidal.jpg 
"Storeage and loss")



***


 
This repository includes the analysis and plot codes for the the article **Optical Tweezers: A comprehensive Tutorial  from Calibration to Applications** by *[Jan Gieseler](https://scholar.google.com.ar/citations?user=6OKJlNgAAAAJ&hl=en), [Juan Ruben Gomez-Solano](https://www.fisica.unam.mx/es/personal.php?id=639), [Alessandro Magazù](http://softmatterlab.org/people/alessandro-magazzu/),  [Isaac Pérez Castillo](https://scholar.google.com.mx/citations?user=58GAc80AAAAJ&hl=en), [Laura Pérez García](http://softmatterlab.org/people/laura-perez-garcia/), [Martha Gironella-Torrent](https://scholar.google.com/citations?user=tITfJqkAAAAJ&hl=en), [Xavier Viader-Godoy](https://scholar.google.com/citations?user=dTLMJy0AAAAJ&hl=en), [Felix Ritort](http://ffn.ub.es/ritort/), [Giuseppe Pesce](https://scholar.google.com/citations?user=Sf4mmT8AAAAJ&hl=en), [Alejandro V. Arzola](https://orcid.org/0000-0002-4860-6330), [Karen Volke-Sepulveda](https://www.fisica.unam.mx/es/personal.php?id=27) and [Giovanni Volpe](http://softmatterlab.org/people/giovanni-volpe/)*. 
