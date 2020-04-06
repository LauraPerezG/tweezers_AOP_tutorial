# Section 4.4  Colloidal Interactions

This folder contains the analysis for the data shown in section 4.4 Colloidal interactions.
 



**Potential analysis**

Run [Fig24.m](Potential_analyisis/Fig24.m) in folder [Potential_analysis](Potential_analyisis/) to obtain (a)Time evolution of the probability density distribution of the inter-particles
distance r (t) obtained from 400 different trajectories after the optical traps are switched off at
t = 0 ms for decreasing values of ΔT: (a) ΔT = 456  ± 2mK, (b) 200 ± 2mK, (c) 163 ± 2mK,
and (d) 108 ±  2mK. The solid lines indicate representative individual trajectories while the
coloured background represents the . The dashed horizontal line indicates the distance r
corresponding to the diameter d of the colloids. Sometimes r (t) is smaller than d because
a displacement of the colloids along the vertical z-axis causes their projections onto the
xy-plane to overlap. This occurs more frequently in the presence of critical Casimir forces
and particularly if the particles are stuck together. These cases, however, are rare compared
to those in which the particles do not leave the xy-plane. (e-h) Equilibrium distribution
Peq(r) of the inter-particle distance r (0) (i.e., when the optical tweezers are switched off)
for two optically trapped colloids at temperatures (f) ΔT = 456 ±  2mK, (g) 200 ±  2mK, (h)
163 ±  2mK, and (i) 108 ±  2mK. Each histogram is obtained from 400 different experimental
values. The solid black lines are the theoretical distribution of r (0), obtained via Monte
Carlo integration (106 samples) of two optically trapped particles subjected to the theoretical
total potential V (**R**<sub>1</sub>, **R**<sub>2</sub>) 



![alt text](https://github.com/LauraPerezG/tweezers_AOP_tutorial/blob/merge_26nov_ales_lau/sec_4_4_Colloidal_interactions/figures/Fig24.jpg
"Potential analysis")

**Drift analysis**

Run [Fig25.m](Drift_analysis/Diffusion_coefficients/Fig25.m) in folder [Diffusion_coefficients](Drift_analysis/Diffusion_coefficients/) to obtain(a) Experimental values of the normalized parallel  D∥/D<sub>0</sub> (circles) and perpendicular
D⊥/D<sub>0</sub> (triangles) diffusion constants as functions of r/d. The parallel and perpendicular
directions refer to the line connecting the centers of the two colloids, and D<sub>0</sub> is the bulk
diffusion constant (Eq. (35)) calculated from experimental data. The various colors refer
to data taken at ΔT = 456 ±  2mK (blue), 273 ±  2mK (light blue), 200 ±  2mK (green),
163 ±  2mK (yellow), 127 ±  2mK (orange), and 108 ±  2mK (red). The solid lines represent
the theoretical predictions accounting for the effect of the hydrodynamic interaction between
the colloids. Error bars represent the standard deviation of the experimental values.
The nature of the deviations observed in Dk at short and long distances is discussed
in the main text.


![alt text](https://github.com/LauraPerezG/tweezers_AOP_tutorial/blob/merge_26nov_ales_lau/sec_4_4_Colloidal_interactions/figures/Fig25.jpg 
"diffusion ana")


Run [Fig26.m](Drift_analysis/Drift_velocities/Fig26.m) in folder [Drift_velocities](Drift_analysis/Drift_velocities/) to obtain Parallel v∥ (second row) and perpendicular v⊥ (third row), drift
velocities, respectively, to the direction connecting the centers of the two colloids for (b, f)
ΔT = 456 ±  2mK, (c, g) 200 ±  2mK, (d, h) 163 ±  2mK and (e, i) 108 ±  2mK. In the second
and third row, the symbols with errorbars represent the experimental data, and the thick,
coloured lines represent the corresponding simulation results. The shaded areas represent
the error of the numerical estimates due to the uncertainties in the fit parameters.


![alt text](https://github.com/LauraPerezG/tweezers_AOP_tutorial/blob/merge_26nov_ales_lau/sec_4_4_Colloidal_interactions/figures/Fig26.jpg
"Storeage and loss")



***


 
This repository includes the analysis and plot codes for the the article **Optical Tweezers: A comprehensive Tutorial  from Calibration to Applications** by *[Jan Gieseler](https://scholar.google.com.ar/citations?user=6OKJlNgAAAAJ&hl=en), [Juan Ruben Gomez-Solano](https://www.fisica.unam.mx/es/personal.php?id=639), [Alessandro Magazù](http://softmatterlab.org/people/alessandro-magazzu/),  [Isaac Pérez Castillo](https://scholar.google.com.mx/citations?user=58GAc80AAAAJ&hl=en), [Laura Pérez García](http://softmatterlab.org/people/laura-perez-garcia/), [Martha Gironella-Torrent](https://scholar.google.com/citations?user=tITfJqkAAAAJ&hl=en), [Xavier Viader-Godoy](https://scholar.google.com/citations?user=dTLMJy0AAAAJ&hl=en), [Felix Ritort](http://ffn.ub.es/ritort/), [Giuseppe Pesce](https://scholar.google.com/citations?user=Sf4mmT8AAAAJ&hl=en), [Alejandro V. Arzola](https://orcid.org/0000-0002-4860-6330), [Karen Volke-Sepulveda](https://www.fisica.unam.mx/es/personal.php?id=27) and [Giovanni Volpe](http://softmatterlab.org/people/giovanni-volpe/)*.
