# dFBA
## Codes for dFBA.

This project focuses on metabolic network modelling and optimization, utilizing MATLAB scripts to simulate the interaction states and growth conditions of multiple strains.

### Main function:

main:  The main script serves as the entry point for running the project, invoking other functions for simulation and analysis.


### Input data:

CsourcesMets：Data file containing carbon source metabolites.

InorgMets：Data file containing inorganic metabolites.

StrainModel：MAT file of the microbial strain model.

pFBA01：pFBA simulation results (Ratio : P:S:V:A=1:1:1:1 ).

pFBA100：pFBA simulation results (Ratio : P:S:V:A=100:1:1:1 ).


### Other functions：

CalculateGrowthR：Perform FBA operations on all strain models, and ultimately output a vector containing the maximum growth rates for each model.

ClassRxnsMetsList：Classify the reactions and metabolites that require constraints, and generate the corresponding variables.

InitConcentrations：Initialize the concentration in the simulation medium (metabolite pool)

M2SMatrixFBA：Generate an FBA flux matrix for the constrained reactions in each strain model, where each row represents an exchange reaction of a metabolite and each column corresponds to strains A, P, S, and V.

M2SMatrixPFBA：Generate an pFBA flux matrix for the constrained reactions in each strain model, where each row represents an exchange reaction of a metabolite and each column corresponds to strains A, P, S, and V.

M2SMatrixLB：Generate a matrix of lower bound values for constrained reactions in the model.

M2SMatrixUB：Generate a matrix of upper bound values for constrained reactions in the model.

PreSetBound：Predefine the upper and lower bounds for reaction boundaries.

addSecBioRatio：Fix the ratio of the secretion rate to the maximum growth rate, which is calculated from the results of pFBA (use: fastSecRatio.m).

fastSecRatio：Calculate the ratio of secretion reactions to the maximum growth rate in pFBA.

