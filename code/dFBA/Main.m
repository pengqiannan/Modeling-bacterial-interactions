%%  Input model and Initial setup for the model
clear 
%% Set up the initial stage of the model based on the pFBA results
load('StrainModel.mat');
strainNames = {'A', 'P', 'S', 'V'};
ClassRxnsMetsList;
StrainModel=PreSetBound(StrainModel,strainNames,InorgRxns,allSimuRxns);
MU=CalculateGrowthR(StrainModel)

r=1;       % Choose two ratios of initial cell concentrations
% r=1 indicate Ratio : P:S:V:A=100:100:100:100 ; r=2 indicate Ratio : P:S:V:A=100:1:1:1 

allMets=allSimuMets;
allRxns=allSimuRxns;


[StrainModel,SecRatioVec]=addSecBioRatio(StrainModel,allMets,allRxns,strainNames,r);

%the dry weight of bacteria added to each 100ml system is
% 0.236mg (P), 0.229mg (V), 0.214mg (A), 0.210mg (S)

Ratio(1,:)=[0.214 0.236 0.210 0.229]; % r=1 % Ratio : P:S:V:A=100:100:100:100 
Ratio(2,:)=[0.00214 0.236 0.0021 0.00229]; % r=2 % Ratio : P:S:V:A=100:1:1:1 

%% Initialize biomass
timeStep = 0.02;%% Optional Settings; 
nSteps = 100;%% Optional Settings
timeVec=[];
timeVec(1) = 0;
BETA = 1;%  Temporary variable
initGrowthR=[0.001 0.001 0.001 0.001];

biomassVec=[];
initBiomass =Ratio(r,:);%% Optional Settings; 
% biomassVec(1,:)=initBiomass;%% Optional Settings; 
ResMU=[];
ResMU(1,:)=initGrowthR;

Newbiomass = initBiomass.* (1+initGrowthR(end,:)*timeStep);
deltaBiomass =Newbiomass- initBiomass;
biomassVec(end+1,:)=Newbiomass;
%% Initialize concentrations
InitConcentrations % get a cell variables CommPoolRxns and double variables CommPoolCon
concentrationMatrix = sparse(CommPoolCon);
tempPoolCon=repmat(CommPoolCon, 1, 4);
initCommPool=CommPoolCon;


%% rxns * strians Matrix in pFBA flux
[allExMetsMatrix_pFBA]=M2SMatrixPFBA(allMets,r); % or ratio=2 ; set  for function :M2SMatrixPFBA ,fastSecRatio.
matrixAll_pFBA=allExMetsMatrix_pFBA.MT;
% Generate a decision matrix
US_Matrix=matrixAll_pFBA;
US_Matrix(US_Matrix > 0) =0;% secrete
US_Matrix(US_Matrix <0) = 1;% uptake
%% Step 03    Perform dynamic FBA simulation
% nSteps=5;
NewStrainModel=StrainModel;

mu=initGrowthR;
GrowthR=mu;

step=0;
timeVec(1) = 0;





for stepNo = 1:50

    
step=step+1
tempPoolCon=repmat(CommPoolCon, 1, 4);

for n=1:4    
    Name=strainNames{n};      
    model=NewStrainModel.(Name); 
for m=1:length(allMets)   
    temprxns=allRxns(m);
    tempmets=allMets(m);
    %%
    if  matrixAll_pFBA(m,n)==0 && any(contains(model.rxns, temprxns)) == 1 
    %   continue  %% Optional Settings:  
    BoundVec(m,n)=0; 
    model.lb(contains(model.rxns,temprxns))=0;%  unlimit: O2, H+,H4PO3,Pi,H2O and mineral salt
    model.ub(contains(model.rxns,temprxns))=0;%  unlimit: O2, H+,H4PO3,Pi,H2O and mineral salt   
    end    
        %% to be a secreted metabolite : Cross feed and Lignin is not included
    if matrixAll_pFBA(m,n)>0 && any(contains(model.rxns, temprxns)) == 1 
    SecRxn=temprxns;    
    [SecRatio ,~]=fastSecRatio(Name,tempmets,n,r);%     SecFlux=GrowthR(n)*SecRatio;
     % update concentrations   
    tempPoolCon(m,n)=tempPoolCon(m,n) + SecRatio*deltaBiomass(n);% SecreteFlux>0
    CommPoolCon(CommPoolCon<0)=0; 
    end
    %% uptake metabolite 
    if matrixAll_pFBA(m,n)<0         
        UptRxn=temprxns;     
        SingleBio=Newbiomass(n);
        SumBio=dot( Newbiomass',US_Matrix(m,:));
        uptRatio=SingleBio/(SumBio^2);    
        UptFlux =  (tempPoolCon(m,n)*uptRatio)/(timeStep);    % UptFlux>0
        % UptFlux(abs(UptFlux) < 1e-9) =  0.0001;
        UptFlux(UptFlux > 100) = 100;    
        % update rxns bound  
        model = changeRxnBounds(model,UptRxn,-UptFlux,'l'); % UptFlux>0
        model = changeRxnBounds(model,UptRxn,0,'u'); % UptFlux<0 
        % update concentrations
         if GrowthR(1,n)==0
        tempPoolCon(m,n)=tempPoolCon(m,n);  % UptFlux<0
         else
        tempPoolCon(m,n)=tempPoolCon(m,n) - UptFlux/GrowthR(1,n)*deltaBiomass(n);                
         end
        tempPoolCon(tempPoolCon<0)=0;
    end       
end  
model = changeRxnBounds(model,'bio1',0,'l');% 
model = changeRxnBounds(model,'bio1',100,'u');%      
NewStrainModel.(Name)=model;
end

mu=CalculateGrowthR(NewStrainModel);  
if any(mu < 0)
    indices = find(mu==0);
%     GrowthR=ResMU(end,:);
    GrowthR=mu;
    GrowthR(end,indices)=0;
    ResMU(end+1,:)=GrowthR;
else
	GrowthR=mu;
    ResMU(end+1,:)=mu;
end

%% Add constraints on the apoptosis function for biomass; KD: mortality rate
% Update biomass vector
KD = 0.01;  
Newbiomass = biomassVec(end,:).* (1+GrowthR(end,:)*timeStep) - KD*timeStep*biomassVec(end,:);
deltaBiomass = biomassVec(end,:).* (GrowthR(end,:)*timeStep);  
biomassVec(end+1,:)=Newbiomass;
CommPoolCon=sum(tempPoolCon, 2)-CommPoolCon*3;
CommPoolCon(CommPoolCon<0)=0;
concentrationMatrix(:,end+1) = sparse(CommPoolCon);

    
end




%% plot data
for stepNo = 1:50  
timeVec(stepNo+1) = stepNo*timeStep;
end

A=full(concentrationMatrix);%concentrationMatrix :The value of substance concentration at each time point
plot(A(1,:))


% clf
biomassVec(:, end+1) = sum(biomassVec(:, 1:4), 2);
plot(biomassVec(:,5))
axis tight
title('Biomass');
legend('PVAS');



