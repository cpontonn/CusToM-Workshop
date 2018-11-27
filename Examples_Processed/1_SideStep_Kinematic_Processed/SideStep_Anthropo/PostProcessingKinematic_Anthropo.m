% Post Processing "SideStep" example
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This example aimed at getting the joint angles of the lower limb from
% inverse kinematics
%________________________________________________________
%
% Licence
% Toolbox distributed under 3-Clause BSD License
%________________________________________________________
%
% Authors : Antoine Muller, Charles Pontonnier, Pierre Puchaud and
% Georges Dumont
%_______________________________________________________

% Loading the Biomechanicalmodel file
load('BiomechanicalModel.mat')

% Solid list extracted from the OsteoarticularModel
Solid_list = {BiomechanicalModel.OsteoArticularModel.name}';

% Get the numbers of solids of interests
Solids = {'RHip_J1';'RHip_J2';'RThigh';'RShank';'RAnkle_J1';'RFoot'};
[~,num_s]=intersect(Solid_list,Solids,'stable');

%RShoulder_J1 rotates around Y-axis
BiomechanicalModel.OsteoArticularModel(num_s(1)).a;
%RShoulder_J2 rotates around X-axis
BiomechanicalModel.OsteoArticularModel(num_s(2)).a;
%RHumerus rotates around Y-axis
BiomechanicalModel.OsteoArticularModel(num_s(3)).a;
% Rotation Z-X-Y sequence of the Hip following ISB recommandation

% Name of the trial treated
filename='ChgtDirection04';

% Loading Inverse Kinematic results
load(fullfile(filename,'InverseKinematicsResults.mat'))

%% Reconstruction Error
% Computing the mean reconstruction error over the trial for each frames
RE_mean = mean(InverseKinematicsResults.ReconstructionError,1);

figure;
plot(RE_mean,'b-','LineWidth',2);
xlabel('Frames');
ylabel('Mean Reconstruction Error (m)');
title('Mean reconstruction error over the trial for each frames')

% Computing the global mean reconstruction error for the total amount of
% frames
% disp('Global Mean Reconstruction Error (in m)')
RE_global_mean = mean(mean(InverseKinematicsResults.ReconstructionError,1));
XX = xlim;YY = ylim;
text(XX(2)/2,YY(1)+(YY(2)-YY(1))*2/3,'Mean Reconstruction Error',...
    'HorizontalAlignment','center')
text(XX(2)/2,YY(1)+(YY(2)-YY(1))*3/5,num2str(RE_global_mean),...
    'HorizontalAlignment','center')

%% Joint Angles

% Number of frames
Nb_frames = size(InverseKinematicsResults.JointCoordinates,2);

% Get the angles of interest
q=InverseKinematicsResults.JointCoordinates(num_s,:)*180/pi ; % from radian to degrees

figure('Name','Right Leg Kinematic')

subplot(2,3,1)
plot(q(1,:),'b-','LineWidth',2);% in degrees
xlabel('Frames')
ylabel('Angle (°)')
title([ Solids{1} ' First Z-axis Hip rotation'])
xlim([0 Nb_frames])

subplot(2,3,2)
plot(q(2,:),'b-','LineWidth',2);% in degrees
xlabel('Frames')
ylabel('Angle (°)')
title([ Solids{2} ' Second X-axis Hip rotation'])
xlim([0 Nb_frames])

subplot(2,3,3)
plot(q(3,:),'b-','LineWidth',2);% in degrees
xlabel('Frames')
ylabel('Angle (°)')
title([ Solids{3} ' Third Y-axis Hip rotation'])
xlim([0 Nb_frames])

subplot(2,3,4)
plot(q(4,:),'b-','LineWidth',2);% in degrees
xlabel('Frames')
ylabel('Angle (°)')
title([ Solids{4} ' Z-axis rotation - Knee Flexion/Extension'])
xlim([0 Nb_frames])

subplot(2,3,5)
plot(q(5,:),'b-','LineWidth',2);% in degrees
xlabel('Frames')
ylabel('Angle (°)')
title([ Solids{5} ' Second Z-axis rotation - Ankle Flexion/Extension'])
xlim([0 Nb_frames])

subplot(2,3,6)
plot(q(5,:),'b-','LineWidth',2);% in degrees
xlabel('Frames')
ylabel('Angle (°)')
title([ Solids{5} ' Second X-axis rotation - Ankle Inverserion/Eversion'])
xlim([0 Nb_frames])

% On the graph, we can see the angles from inverse kinematics for the 
% selected angles of the lowerlimb. A 4th order zerolag
% butterworth filter was applied on these angles with a cutoff frequency of
% 5 Hz as it is specify in the Analysis parameters.


%% What about the quality of the model ?
% Shank distance
% Experimental distance
% loading experimental markers of the shank
real_markers = C3dProcessedData('ChgtDirection04',{'RKNI';'RKNE';'RANI';'RANE'});
% computing mean distance between knee markers and ankle markers
Xp_distance = norm( mean( (real_markers(3).position_c3d + real_markers(4).position_c3d)/2 ...
    - (real_markers(1).position_c3d + real_markers(2).position_c3d)/2,1 ));
% Model distance
% loading the model
load('BiomechanicalModel.mat')
% get the solid of reference
Solid = 'RAnkle_J1';
[~,num_s]=intersect(Solid_list,Solid,'stable');

% Position of the Ankle Joint in the Shank reference frame
Model_distance = norm(BiomechanicalModel.OsteoArticularModel(num_s).b);

%Plot
figure('Name','Shank length')
bar([Xp_distance,Model_distance])
xticklabels({'Mean Marker length','Model length'})
title('Shank length');

% Conclusion
% Distance from the anthropometric model is not corresponding to
% experimental length...
% We need a more robust calibration of the geometrical model.
