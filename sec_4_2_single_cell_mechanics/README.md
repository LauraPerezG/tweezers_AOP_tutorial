# Section 4.2: Single cell mechanics
 This folder contains the codes to analize the expeirments of  a single molecule pulling experiment discussed in the text.
 
How to use the Single  cell mechanics section:

**Force extension and stiffness**

Run [CelullarMechanics.m](Programs/CelullarMechanics.m)  to obtain separated trajectories and stiffness of the cell from pulling protocol. Given a txt file, the program ask to select the number of columns of the file, the columns of Y force, 
 trap A Y distance, trap B Y distance, value of trap stiffness, maximum force, minimum force and number of 
 stiffness intervals,it returns the separated trajectories in diferent files named
 'filename_#trajectoryT_U.txt'(ex:RBC1_1T_U.txt') if we are going from low forces to high forces and
 'filename_#trajectoryT_D.txt'(ex:RBC1_1T_D.txt') if we are going from high forces to low forces.
 In these files the first column will be celullar extension and the second column will be Y force. 
 All the trajeectories will be forced to start to (0,0) in order to correct any drift. 
 The second file named 'filename_Stiffness.txt' (ex: RBC1_Stiffness.txt) where first column will
 correspond to the mean Y force and the second one to the Stiffness value.


The program will ask the following parameters:

Number of columns: 16

Y force: 5

YA dist: 12

YB dist: 14

MaxForce: 20

MinForce:0

**Trap stiffness value in pN/nm : WE STILL NEED THIS ONE**

Intervals of Stiffness:6

After that run [Figure_force_extension_stiffnes.m](Figure_force_extension_stiffnes.m) to obtain the plot of the previous results.

![alt text](https://github.com/LauraPerezG/tweezers_AOP_tutorial/blob/merge_26nov_ales_lau/sec_4_2_single_cell_mechanics/Figures/cellular_mechanics.jpg "Force extension curves and stiffness")


***


 
This repository includes the analysis and plot codes for the the article **Optical Tweezers: A comprehennsive Tutorial  from Calibration to Applications** by *Jan Gieseler, Juan Ruben Gomez-Solano, [Alessandro Magazù](http://softmatterlab.org/people/alessandro-magazzu/),  Isaac Pérez Castillo, [Laura Pérez García](http://softmatterlab.org/people/laura-perez-garcia/), Martha Gironella-Torrent, Xavier Viader-Godoy, Felix Ritort, Giusceppe Pesce, Alejandro V. Arzola, Karen Volke-Sepulveda and [Giovanni Volpe](http://softmatterlab.org/people/giovanni-volpe/)*. 
 