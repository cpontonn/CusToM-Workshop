% Post Processing "SideStep" example
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This example aimed at getting evaluating the results of the geometrical
% calibration - shank length
%________________________________________________________
%
% Licence
% Toolbox distributed under 3-Clause BSD License
%________________________________________________________
%
% Authors : Antoine Muller, Charles Pontonnier, Pierre Puchaud and
% Georges Dumont
%_______________________________________________________
%% What about the quality of the model ?
% Shank distance
% Experimental distance
% loading experimental markers of the shank
% real_markers = C3dProcessedData('ChgtDirection04',{'RKNI';'RKNE';'RANI';'RANE'});
% % computing mean distance between knee markers and ankle markers
% Xp_distance = norm( mean( (real_markers(3).position_c3d + real_markers(4).position_c3d)/2 ...
%     - (real_markers(1).position_c3d + real_markers(2).position_c3d)/2,1 ));
Xp_distance = 0.381; %m from the Range of Motion .c3d
% Model distance
% get the solid of reference
Solid = 'RAnkle_J1';
[~,num_s]=intersect(Solid_list,Solid,'stable');

% loading the current calibrated model
load('BiomechanicalModel.mat')
% Position of the Ankle Joint in the Shank reference frame
Calibrated_Model_distance = norm(BiomechanicalModel.OsteoArticularModel(num_s).b);

% loading the anthropometric model
load('..\SideStep_Anthropo\BiomechanicalModel.mat')
% Position of the Ankle Joint in the Shank reference frame
Anthropometric_Model_distance = norm(BiomechanicalModel.OsteoArticularModel(num_s).b);

%Plot
figure('Name','Shank length')
bar([Xp_distance,Calibrated_Model_distance,Anthropometric_Model_distance])
xticklabels({'Mean Marker length','Anthropometric Model length',...
    'Calibrated Model length'})
title('Shank length');
ylabel('Shank length (m)')

% Conclusion
% Distance from the anthropometric model is not corresponding to
% experimental length...
% We need a more robust calibration of the geometrical model.
% We got closer to the marker length with the calibration.


