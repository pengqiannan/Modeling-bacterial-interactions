function [BioAndDegradationAll, modelsAll, mediumAll, Singlemodels, superModel] = LDmain (scenarioID,directory,filenames, speciesToConsider,mmMedium, CNsourcesName, CNsourcesNumber,compoundtest,PercentOfSpeciesBio,syntheticCell)
%PercentOfSpeciesBio is the ratio of artificial biomass of each strain, and the number of its numerical value must be the number of models, and must be greater than 0.
%scenarioID = 1; The objective function of the bacterial community model is the sum of the biomass of all strains, and the biomass proportion of all strains is unlimited (the biomass of all strains is allowed to be 0). 
%scenarioID = 2; The objective function of the bacterial community model was the biomass of the first strain, which was used to find other strains that could promote the biomass of the first strain.
%scenarioID = 3; The objective function of the bacterial community model was the sum of the biomass of all strains, and the total biomass was the sum of the biomass of all strains, and the biomass ratio of all strains was 1.  
%scenarioID = 4; The objective function of the bacterial community model is the sum of the biomass of all strains, and the total biomass is the sum of the biomass of all strains, and the biomass ratio of all strains is artificially specified as PercentOfSpeciesBio.  
%PercentOfSpeciesBio must be specified when scenarioID is 4 and not if scenarioID is 1-3.   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
syntheticCell = 0;
scenarioID = 4
PercentOfSpeciesBio=[100 1 1 1]
speciesToConsider = [1:4]
filenames = {'Pluralibacter.mat','Shewanella.mat','Vibrio.mat','Aeromonas.mat'};
CNsourcesName = {'cpd00013','cpd00027','cpd00197','cpd00077','cpd00401','cpd00153','cpd04073','cpd00561','cpd00489','cpd00604','cpd00136','cpd01059','cpd01733'};
CNsourcesNumber = [-100,0,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15];

mmMedium = 'Mymedium.txt' 
directory = 'F:\model\'
compoundtest = {'cpd00013','cpd00027','cpd00197','cpd00077','cpd00401','cpd00153','cpd04073','cpd00561','cpd00489','cpd00604','cpd00136','cpd01059','cpd01733'};

if ((exist(['Percent' ...
        'OfSpeciesBio']) == 0) & (scenarioID == 4))
	error ('PercentOfSpeciesBio must be defined when scenarioID is 4. Aborting')
end

if exist('PercentOfSpeciesBio') == 0
	PercentOfSpeciesBio = [];
end

if exist('syntheticCell') == 0
	PercentOfSpeciesBio = 0;
end

[BioAndDegradationAll, modelsAll, mediumAll] = GetEnhancedCombination (scenarioID,directory,filenames, speciesToConsider,mmMedium, CNsourcesName, CNsourcesNumber,compoundtest,PercentOfSpeciesBio);
