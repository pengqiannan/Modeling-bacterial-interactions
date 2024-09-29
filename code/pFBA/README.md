# pFBA
## Codes for pFBA.


### Main function:

- `LDmain.m`:  simulate the growth of the combinations of models, and find exchange fluxes based on the combination.


### Input parameters: 

- scenarioID, PercentOfSpeciesBio, filenames, speciesToConsider, CNsourcesName, CNsourcesNumber, mmMedium, directory, compoundtest.


### Other functions：

- `validateModel.m`: Validate models to standard format.

- `convertToIrreversibleModel.m`: Convert models to irreversible models.

- `GetAllCombination.m`: Based on models provided for each species, the multispeciesModel cover all the combination of all species.

- `GetMedium.m`: Based on EX reactions of all models, the inorganic elements provided by MM medium, carbon and nitrogen sources provided, etc., are required to obtain culture conditions suitable for all bacterial combinations. 

- `GetEnhancedCombination.m`: Calculate the biomass of each combination (each multispeciesModel).

- `GetMultiSpeciesModel.m`: Based on GetAllCombination results, merge species into models and all reaction IDs from different databases were converted into for consistency.

- `performLD.m`: Perform LD under different media.

### Dependencies

- MATLAB Version: R2020b or later.

- Required MATLAB Toolboxes: COBRA Toolbox.
  
- Solver: 'gurobi' or 'ibm_cplex'.
