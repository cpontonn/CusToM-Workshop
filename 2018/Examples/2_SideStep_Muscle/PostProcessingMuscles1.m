% Post Processing "Musculoskeletal analysis" example
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This example aimed at getting the muscle activations for lower limb
% muscles obtained with the optmization method
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

%% Optimization results
cd('SideStep_Muscle_Opti');
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
R_ActivationsOpti=Activations(num_Rm,:);
L_ActivationsOpti=Activations(num_Lm,:);

% Number of frames
Nb_frames = size(Activations,2);
clear Activations
clear MuscleForcesComputationResults


figure
for ii=1:6
    subplot(2,3,ii)
    plot(R_ActivationsOpti(ii,:)*100,'r-','LineWidth',2)
    hold on
    plot(L_ActivationsOpti(ii,:)*100,'b-','LineWidth',2)
    xlim([0 Nb_frames])
    ylim([0 100])
    xlabel('Frames')
    ylabel('Muscle Activation (%)')
    title(['Activation of Left and Right ' R_Muscles{ii}(2:end)])
end

legend('Right Side','Left Side')
cd ..