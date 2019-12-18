% Post Processing "Musculoskeletal analysis" example
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This example aimed at comparing the muscle activations for lower limb
% muscles obtained with the optmization method and the MusIC method with a
% (4,4) database density
%________________________________________________________
%
% Licence
% Toolbox distributed under 3-Clause BSD License
%________________________________________________________
%
% Authors : Charles Pontonnier, Pierre Puchaud
%_______________________________________________________

%% Init
clear all;
close all;
clc;
location = cd;
%% Optimization results with predicted forces
cd('SideStep_Muscle_Opti_with_Predicted_Forces\');
% Loading the Biomechanicalmodel file
load('BiomechanicalModel.mat')

%Muscles of interests
R_Muscles = {'RGluteusMaximus2','RSemitendinosus','RRectusFemoris','RGastrocnemius','RSoleus','RTibialisAnterior'};
L_Muscles = {'LGluteusMaximus2','LSemitendinosus','LRectusFemoris','LGastrocnemius','LSoleus','LTibialisAnterior'};

% Muscle list extracted from the Muscles struct
Muscle_list = {BiomechanicalModel.Muscles.name}';

% Get the numbers of solids on which the forces are applied
[~,num_Rm]=intersect(Muscle_list,R_Muscles);
[~,num_Lm]=intersect(Muscle_list,L_Muscles);

% Name of the trial treated
filename='ChgtDirection04';

% Loading Muscle force computations outputs
load(fullfile(filename,'MuscleForcesComputationResults.mat'))

% Get the activations
Activations=MuscleForcesComputationResults.MuscleActivations;

% of the desired muscles
R_ActivationsOptiPredicted=Activations(num_Rm,:);
L_ActivationsOptiPredicted=Activations(num_Lm,:);

% Number of frames
Nb_frames = size(Activations,2);
clear Activations
clear MuscleForcesComputationResults

%% Optimization Results with experimental forces
cd .. 
cd(fullfile('..\2_SideStep_Muscle_Processed','SideStep_Muscle_Opti'));


% Name of the trial treated
filename='ChgtDirection04';

% Loading Muscle force computations outputs
load(fullfile(filename,'MuscleForcesComputationResults.mat'))

% Get the activations
Activations=MuscleForcesComputationResults.MuscleActivations;

% of the desired muscles
R_ActivationsOptiXp=Activations(num_Rm,:);
L_ActivationsOptiXp=Activations(num_Lm,:);

% Number of frames
Nb_frames = size(Activations,2);
clear Activations
clear MuscleForcesComputationResults
%% Plot the result
figure
for ii=1:6
    subplot(2,3,ii)
    plot(R_ActivationsOptiPredicted(ii,:)*100,'-','Color',[0,100,0]/255,'LineWidth',2)
    hold on
    plot(R_ActivationsOptiXp(ii,:)*100,'b-','LineWidth',2)
    xlim([0 Nb_frames])
    ylim([0 100])
    xlabel('Frames')
    ylabel('Muscle Activation (%)')
    title(['Activation of Right ' R_Muscles{ii}(2:end)])
end

legend('Predicted Forces','Experimental Forces')

figure
for ii=1:6
    subplot(2,3,ii)
    plot(L_ActivationsOptiPredicted(ii,:)*100,'-','Color',[0,100,0]/255,'LineWidth',2)
    hold on
    plot(L_ActivationsOptiXp(ii,:)*100,'b-','LineWidth',2)
    xlim([0 Nb_frames])
    ylim([0 100])
    xlabel('Frames')
    ylabel('Muscle Activation (%)')
    title(['Activation of Left ' R_Muscles{ii}(2:end)])
end

legend('Predicted Forces','Experimental Forces')

cd(location)