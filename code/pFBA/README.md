# LD
A newly developed metabolic modeling pipeline, which could simulate the performances of different microbiomes.


Main function:

LDmain:  simulate the growth of the combinations of models, and find exchange fluxes based on the combination.


Input parameters: 

scenarioID, PercentOfSpeciesBio, syntheticCell, filenames, speciesToConsider, CNsourcesName, CNsourcesNumber, mmMedium, directory, compoundtest.


Other functions：

[For MultiSpecies]

validateModel: Validate models to standard format.

convertToIrreversibleModel: Convert models to irreversible models.

GetAllCombination: Based on models provided for each species, the multispeciesModel cover all the combination of all species.

GetMedium: Based on EX reactions of all models, the inorganic elements provided by MM medium, carbon and nitrogen sources provided, etc., are required to obtain culture conditions suitable for all bacterial combinations. 

GetEnhancedCombination: Calculate the biomass of each combination (each multispeciesModel).

GetMultiSpeciesModel: Based on GetAllCombination results, merge species into models and all reaction IDs from different databases were converted into for consistency.

performLD: Perform LD under different media.

[For syntheticCell]

combineTwoModel: Combination of base models and another selected model. 

getEssensialReaction: Find the essensial reactions that in Rxnlist based on combineTwoModel results.

getImportantRxn: Find the important reactions that could increase the biomass of the species.

