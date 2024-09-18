%new analysis
initCobraToolbox(false);
changeCobraSolver('gurobi', 'LP');%The 'glpk' model is prone to error.
filenames = {'Pluralibacter.mat','Shewanella.mat','Vibrio.mat','Aeromonas.mat'};
speciesToConsider = [1:4];
PercentOfSpeciesBio = [];
%PercentOfSpeciesBio = [0.1 0.1 0.1 0.1 0.1 0.1 0.1];
CNsourcesName = {'cpd00013','cpd00027','cpd00197','cpd00077','cpd00401','cpd00153','cpd04073','cpd00561','cpd00489','cpd00604','cpd00136','cpd01059','cpd01733'};
%CNsourcesNumber = [-50,-50,-50,-50];
CNsourcesNumber = [-100,0,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15];
mmMedium = 'Mymedium.txt';
directory = 'F:\model\';
compoundtest = {'cpd00013','cpd00027','cpd00197','cpd00077','cpd00401','cpd00153','cpd04073','cpd00561','cpd00489','cpd00604','cpd00136','cpd01059','cpd01733'};;
scenarioID = 4;
syntheticCell = 0;
[BioAndDegradationAll, modelsAll, mediumAll, Singlemodels, superModel] = LDmain (scenarioID,directory,filenames, speciesToConsider,mmMedium, CNsourcesName, CNsourcesNumber,compoundtest,PercentOfSpeciesBio,syntheticCell);
save('PVAS.mat')
