%% Initialize concentrations  InitConcentra
CommPoolRxns=strcat('EX_', allMets,'_e');
CommPoolCon=100 * ones(length(CommPoolRxns), 1);

% Initial concentration of Carbon sources 
load('CsourcesMets.mat');
CsourcesRxns=strcat('EX_', CsourcesMets,'_e');
[~, IndexCS] = ismember(CsourcesRxns,CommPoolRxns);
IndexCS = IndexCS(IndexCS > 0);
CommPoolCon(IndexCS,:)=0;%% Optional Settings

%  Initial concentration of  Secretions  
allSecMets =sort(unique ([ExMetsA, ExMetsP, ExMetsV, ExMetsS]));
allSecMetsRxns=strcat('EX_', allSecMets,'_e');
[~, IndexSecMets] = ismember(allSecMets,allMets);% counts:10
IndexSecMets = IndexSecMets(IndexSecMets > 0);

CommPoolCon(IndexSecMets,:)=0.1;%% Optional Settings


%  Initial concentration of Nitrogen sources 
NsourcesMets = {'cpd00013'};
NsourcesRxns=strcat('EX_', NsourcesMets,'_e');
[~, IndexNS] = ismember(NsourcesRxns,CommPoolRxns);
IndexNS = IndexNS(IndexNS > 0);
CommPoolCon(IndexNS,:)=6.16;%% Optional Settings
% Optional Settings

%Initial concentration of lignin
experdata=[90.81827264;
72.40081089;
81.88666885;
64.88450558;
11.47262631;
65.72461387;
65.72461387;
60.91617934;
51.49860954;
56.12302166;
59.47071067];
CommPoolCon(IndexLigMets,:)=experdata;%% Optional Settings






load('InorgMets.mat');
InorgRxns=strcat('EX_', InorgMets,'_e');
% %  Initial concentration of mineral salt
% [~, IndexIG] = ismember(InorgRxns,CommPoolRxns);
% IndexIG = IndexIG(IndexIG > 0);
% CommPoolCon(IndexIG,:)=1000;%% Optional Settings



