% Post Processing "Walking altered compared to normal walking in dynamic" example
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
cd(fullfile('..\POC0980A_altered'))

% Loading the Biomechanicalmodel file
load('BiomechanicalModel.mat')

% Solid list extracted from the OsteoarticularModel
Solid_list = {BiomechanicalModel.OsteoArticularModel.name}';

% Get the numbers of solids of interests
Solids = {'RHip_J1';'RHip_J2';'RThigh';'RShankFoot'};
[~,num_s]=intersect(Solid_list,Solids,'stable');

% Name of the trial treated
filename='Marche';

% Loading Inverse Dynamics results
load(fullfile(filename,'InverseDynamicsResults.mat'))
%Get the angles of interest
T_unaltered=InverseDynamicsResults.JointTorques(num_s,:); % in Nm
T_altered_normalized = (NormalizeAbscisseCurve100(T_unaltered'))';

%% Reconstruction Error
cd(fullfile('..\POC0980A_normal_Geometric_Calibration'))

% Loading the Biomechanicalmodel file
load('BiomechanicalModel.mat')

% Solid list extracted from the OsteoarticularModel
Solid_list = {BiomechanicalModel.OsteoArticularModel.name}';

% Get the numbers of solids of interests
Solids = {'RHip_J1';'RHip_J2';'RThigh';'RShank'};
[~,num_s]=intersect(Solid_list,Solids,'stable');

%loading previous results of anthropometric simulation
load(fullfile(filename,'InverseDynamicsResults.mat'))

cd(fullfile('..\POC0980A_altered'))

%Get the angles of interest
T_unaltered=InverseDynamicsResults.JointTorques(num_s,:); % in Nm
T_unaltered_normalized = (NormalizeAbscisseCurve100(T_unaltered'))';
%% Joint Angles

% Number of frames in %
Nb_frames = 100;

h2=figure('Name','Right Leg Kinematic');

subplot(2,2,1)
plot(T_altered_normalized(1,:),'r-','LineWidth',2);% in degrees
hold on
plot(T_unaltered_normalized(1,:),'b-','LineWidth',2);% in degrees
xlabel('Frames 0-100%')
ylabel('Torque in Nm')
title([ Solids{1} ' First Z-axis Hip rotation'])
xlim([0 Nb_frames])

subplot(2,2,2)
plot(T_altered_normalized(2,:),'r-','LineWidth',2);% in degrees
hold on
plot(T_unaltered_normalized(2,:),'b-','LineWidth',2);% in degrees
xlabel('Frames 0-100%')
ylabel('Torque in Nm')
title([ Solids{2} ' Second X-axis Hip rotation'])
xlim([0 Nb_frames])

subplot(2,2,3)
plot(T_altered_normalized(3,:),'r-','LineWidth',2);% in degrees
hold on
plot(T_unaltered_normalized(3,:),'b-','LineWidth',2);% in degrees
xlabel('Frames 0-100%')
ylabel('Torque in Nm')
title([ Solids{3} ' Third Y-axis Hip rotation'])
xlim([0 Nb_frames])

subplot(2,2,4)
plot(T_altered_normalized(4,:),'r-','LineWidth',2);% in degrees
hold on
plot(T_unaltered_normalized(4,:),'b-','LineWidth',2);% in degrees
xlabel('Frames 0-100%')
ylabel('Torque in Nm')
title([ Solids{4} ' Z-axis rotation - Knee Flexion/Extension'])
xlim([0 Nb_frames])

legend('Altered Walking','Unaltered Walking','location','best')

% On the graph, we can see the angles from inverse kinematics for the 
% selected angles of the lowerlimb. A 4th order zerolag
% butterworth filter was applied on these angles with a cutoff frequency of
% 5 Hz as it is specify in the Analysis parameters.

cd(fullfile('..\POC0980A_altered'))

