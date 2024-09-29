# pFBA
Codes for pFBA.


Main function:

LDmain:  simulate the growth of the combinations of models, and find exchange fluxes based on the combination.


Input parameters: 

scenarioID, PercentOfSpeciesBio, filenames, speciesToConsider, CNsourcesName, CNsourcesNumber, mmMedium, directory, compoundtest.


Other functions：

validateModel: Validate models to standard format.

convertToIrreversibleModel: Convert models to irreversible models.

GetAllCombination: Based on models provided for each species, the multispeciesModel cover all the combination of all species.

GetMedium: Based on EX reactions of all models, the inorganic elements provided by MM medium, carbon and nitrogen sources provided, etc., are required to obtain culture conditions suitable for all bacterial combinations. 

GetEnhancedCombination: Calculate the biomass of each combination (each multispeciesModel).

GetMultiSpeciesModel: Based on GetAllCombination results, merge species into models and all reaction IDs from different databases were converted into for consistency.

performLD: Perform LD under different media.


