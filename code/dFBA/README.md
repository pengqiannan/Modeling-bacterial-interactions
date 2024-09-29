# dFBA
## Codes for dFBA.

This project focuses on metabolic network modelling and optimization, utilizing MATLAB scripts to simulate the interaction states and growth conditions of multiple strains.

### Main function:

- `Main.m`:  The main script serves as the entry point for running the project, invoking other functions for simulation and analysis.


### Input data:

- `CsourcesMets.mat`：Data file containing carbon source metabolites.

- `InorgMets.mat`：Data file containing inorganic metabolites.

- `StrainModel.mat`：MAT file of the microbial strain model.

- `pFBA01.mat`：pFBA simulation results (Ratio : P:S:V:A=1:1:1:1 ).

- `pFBA100.mat`：pFBA simulation results (Ratio : P:S:V:A=100:1:1:1 ).


### Other functions：

- `CalculateGrowthR.m`：Perform FBA operations on all strain models, and ultimately output a vector containing the maximum growth rates for each model.

- `ClassRxnsMetsList.m`：Classify the reactions and metabolites that require constraints, and generate the corresponding variables.

- `InitConcentrations.m`：Initialize the concentration in the simulation medium (metabolite pool)

- `M2SMatrixFBA.m`：Generate an FBA flux matrix for the constrained reactions in each strain model, where each row represents an exchange reaction of a metabolite and each column corresponds to strains A, P, S, and V.

- `M2SMatrixPFBA.m`：Generate an pFBA flux matrix for the constrained reactions in each strain model, where each row represents an exchange reaction of a metabolite and each column corresponds to strains A, P, S, and V.

- `M2SMatrixLB.m`：Generate a matrix of lower bound values for constrained reactions in the model.

- `M2SMatrixUB.m`：Generate a matrix of upper bound values for constrained reactions in the model.

- `PreSetBound.m`：Predefine the upper and lower bounds for reaction boundaries.

- `addSecBioRatio.m`：Fix the ratio of the secretion rate to the maximum growth rate, which is calculated from the results of pFBA (use: fastSecRatio.m).

- `fastSecRatio.m`：Calculate the ratio of secretion reactions to the maximum growth rate in pFBA.

### Dependencies

- MATLAB Version: R2020b or later.

- Required MATLAB Toolboxes:COBRA Toolbox .

- Solver: 'gurobi' or 'ibm_cplex'.

