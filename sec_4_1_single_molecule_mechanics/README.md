# Section 4.1: Single molecule mechanics
 This folder contains the codes to analize the expeirments of  a single molecule pulling experiment discussed in the text.
 
How to use the Single molecule mechanics section:

**Free energy of formation of a DNA hairpin**

Run [work_distributions](work_distributions/work_distributions.m) in folder **[work_distributions](work_distributions/)** to obtain  (A) Several pulling trajectories of the hairpin. In red are plotted the unfolding cycles and in blue the folding ones. The black dots indicate the initial ( λ<sub>0</sub> ; f<sub>min</sub>) and final λ<sub>1</sub> 
 ; f<sub>max</sub>) points considering for computing the work, WFU. (B) Probability density distributions of the work, computed as in equation (6). The point atwhich the probabilities cross is the equilibrium difference of free energy of the hairpin. The red and blue lines shown are the interpolations of the bars.

The files contained in **[data](data/)** '' folder  u,f for the unfolding(stretching) and
folding(releasing) trajectories. They contain 4 columns:
$1=counter $2=trap distance(nm) $3=time (s) $4=force(pN)
The files have been sorted in order to have the trap distance order toward
increasing values.


![alt text](https://github.com/LauraPerezG/tweezers_AOP_tutorial/blob/merge_26nov_ales_lau/sec_4_1_single_molecule_mechanics/figures/free_enerygy_hairpin.jpg "Force extension curves and stiffness")


***


 
This repository includes the analysis and plot codes for the the article **Optical Tweezers: A comprehennsive Tutorial  from Calibration to Applications** by *Jan Gieseler, Juan Ruben Gomez-Solano, [Alessandro Magazù](http://softmatterlab.org/people/alessandro-magazzu/), Isaac Castillo, [Laura Pérez García](http://softmatterlab.org/people/laura-perez-garcia/), Martha Gironella-Torrent, Xavier Viader-Godoy, Felix Ritort, Giusceppe Pesce, Alejandro V. Arzola, Karen Volke-Sepulveda and [Giovanni Volpe](http://softmatterlab.org/people/giovanni-volpe/)*. 
 