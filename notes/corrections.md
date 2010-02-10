Jonathan Stott – PhD Thesis "Developing realistic models of the atrium and the p–wave ECG"
==========================================================================================

Suggested general corrections
-----------------------------

My main concern with this thesis was the lack of an overall direction. This can be fixed by a revision of chapter 1, and corrections to other parts of the thesis.

I suggest that the revised chapter 1 has the following structure:

* Section 1, which gives an overview of the whole thesis; including a clear description of the motivation for the study, the aim of the thesis, and a synopsis of each chapter. I would be happiest if this section could form a new chapter 1.
* Section 2, which describes the anatomical and physiological background to the thesis. This section should include (i) a general description of structure and function in cells, tissues, and the whole heart, (ii) dynamic properties of the tissue such as restitution, (iii) a description of normal activation sequences, the normal ECG, and arrhythmia mechanisms such as spiral waves.
* Section 3, which explains why models of cardiac cells and tissues are important tools, provides a history of cardiac model development, describes the structure and physics of cell, tissue, and ECG models, (importantly) covers the limits of modelling, and explains how modelling can interact with experimental work.


The experimental studies in section 2.3 should be moved to chapter 3. The motivation for these and the other packages of experimental work should be explained in more detail, and it might be helpful to open the description of each experimental study with a specific hypothesis that is tested in the study. 

Specific comments and corrections
---------------------------------

Page 19. A diagram of atrial anatomy would help here.

Page 23. You need to describe how the action potential upstroke is initiated, and how action potentials propagate within tissue.

Page 27. Markov should have a capital M.

Page 30. How do the Nygren and CRN models compare? What are the differences and similarities? Are they based on the same data? If so, why are they different? What does this tell us about cardiac cell models?

Page 31. You should give the derivation of the Bidomain equations from Maxwells equations.

Page 34. You need to include something about the stability criteria for dt and dx, as well as some evidence that your solution scheme is stable.

Page 51. The justification for developing another simulation toolkit needs to be given.

Page 59. Some data on performance and optimisation should be given. What kind of speedup was obtained? What was the effect of parallelising the code, caching, and pre computing some parameters as lookup tables? What are the implications of Amdahl’s law for this code?

Page 83. Some evidence for the comparison with COR and CellML should be given.

Page 85. Principle Component should be Principal Component.

Page 86. Justification for using the CRN model and not another model (3 variable FK for example) should be given.

Page 87. The monodomain description repeats section 1.2.5. Is the numerical implementation stable? What are the boundary conditions and how are they implemented?

Page 91. Include the units of the diffusion coefficient, and a justification for including this value, and the ratio of 1:9 to reflect anisotropy.

Page 98. Time and current scales are missing from Figure 3.7 (b) – (e).

Page 100. The APD in Figure 3.8 seems very short (or the conduction velocity is very small). This should be explained given the activation sequence in Figure 3.4 and the APDs in Figure 3.9?

Page 104. Include the method used to compute dominant frequency, as well as an explanation of why it was used rather than another technique such as threshold crossing  to count activations, and what it reflects.

Page 109. Typo “valuables”.

Page 135. Some indication of the factors that influence p-wave shape and amplitude in real patients should be given.


Richard Clayton 18 January 2010

