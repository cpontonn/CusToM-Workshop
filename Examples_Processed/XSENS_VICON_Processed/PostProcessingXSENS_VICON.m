% Post Processing "XSENS_VICON" example
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This example aimed at getting the joint angles of the hip, knee and ankle
% flexions computed with XSENS and VICON data during mantutention tasks
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


%% Angles of interest
Solids = {'RHip_J1';'RShank';'RAnkle_J1';'LHip_J1';'LShank';'LAnkle_J1'};

%% Name of the trial treated
filename='Manutention02';

%% Sample rates
dt_VICON=1/200;
dt_XSENS=1/240;
%% VICON DATA
cd('VICON_DATA');

% Loading the Biomechanicalmodel file
load('BiomechanicalModel.mat')

% Solid list extracted from the OsteoarticularModel
Solid_list = {BiomechanicalModel.OsteoArticularModel.name}';

% Get the numbers of solids of interests

[~,num_s]=intersect(Solid_list,Solids,'stable');


% Loading Inverse Kinematic results
load(fullfile(filename,'InverseKinematicsResults.mat'))
IK_VICON=InverseKinematicsResults;

clear InverseKinematicsResults;

%% XSENS DATA
cd .. 
cd('XSENS_DATA');


% Loading Inverse Kinematic results
load(fullfile(filename,'InverseKinematicsResults.mat'))
IK_XSENS=InverseKinematicsResults;

%% Reconstruction Error
cd ..
% Computing the mean reconstruction error over the trial for each frame
RE_mean_VICON = mean(IK_VICON.ReconstructionError,1);
time_VICON=zeros(1,numel(RE_mean_VICON));
for i=1:numel(time_VICON)
time_VICON(i)=(i-1)*dt_VICON;
end
RE_mean_XSENS = mean(IK_XSENS.ReconstructionError,1);
time_XSENS=zeros(1,numel(RE_mean_XSENS));
for i=1:numel(time_XSENS)
time_XSENS(i)=(i-1)*dt_XSENS;
end
figure;
hold on

plot(time_VICON,RE_mean_VICON,'b-','LineWidth',2);
plot(time_XSENS,RE_mean_XSENS,'r--','LineWidth',2);
xlabel('Time(s)');
ylabel('Mean Reconstruction Error (m)');
ymax=max(max(RE_mean_VICON),max(RE_mean_XSENS))*1.1;
ylim=[0 ymax];
title('Mean reconstruction error over the trial for each frames')
legend('VICON\_DATA','XSENS\_DATA');
% Computing the global mean reconstruction error for the total amount of
% frames
% disp('Global Mean Reconstruction Error (in m)')
RE_global_VICON = mean(mean(IK_VICON.ReconstructionError,1));
RE_global_XSENS = mean(mean(IK_XSENS.ReconstructionError,1));

text(0,ymax*0.8,[' RE\_global\_VICON=',num2str(RE_global_VICON),'m']);
text(0,ymax*0.77,[' RE\_global\_XSENS=',num2str(RE_global_XSENS),'m']);
%% Joint Angles

% Number of frames


% Get the angles of interest
q_VICON=IK_VICON.JointCoordinates(num_s,:)*180/pi ; % from radian to degrees
q_XSENS=IK_XSENS.JointCoordinates(num_s,:)*180/pi ; % from radian to degrees

figure;

subplot(2,3,1)
hold on;
plot(time_VICON,q_VICON(1,:),'b-','LineWidth',2);% in degrees
plot(time_XSENS,q_XSENS(1,:),'r--','LineWidth',2);% in degrees
xlabel('time (s)')
ylabel('Angle (°)')
title([ Solids{1} ' Right Hip Flexion'])
xlim([0 max(time_VICON)])

subplot(2,3,2)
hold on;
plot(time_VICON,q_VICON(2,:),'b-','LineWidth',2);% in degrees
plot(time_XSENS,q_XSENS(2,:),'r--','LineWidth',2);% in degrees
xlabel('time (s)')
ylabel('Angle (°)')
title([ Solids{2} ' Right Knee Flexion'])
xlim([0 max(time_VICON)])

subplot(2,3,3)
hold on;
plot(time_VICON,q_VICON(3,:),'b-','LineWidth',2);% in degrees
plot(time_XSENS,q_XSENS(3,:),'r--','LineWidth',2);% in degrees
xlabel('time (s)')
ylabel('Angle (°)')
title([ Solids{3} ' Right Ankle Flexion'])
xlim([0 max(time_VICON)])

subplot(2,3,4)
hold on;
plot(time_VICON,q_VICON(4,:),'b-','LineWidth',2);% in degrees
plot(time_XSENS,q_XSENS(4,:),'r--','LineWidth',2);% in degrees
xlabel('time (s)')
ylabel('Angle (°)')
title([ Solids{4} ' Left Hip Flexion'])
xlim([0 max(time_VICON)])

subplot(2,3,5)
hold on;
plot(time_VICON,q_VICON(5,:),'b-','LineWidth',2);% in degrees
plot(time_XSENS,q_XSENS(5,:),'r--','LineWidth',2);% in degrees
xlabel('time (s)')
ylabel('Angle (°)')
title([ Solids{5} ' Left Knee Flexion'])
xlim([0 max(time_VICON)])

subplot(2,3,6)
hold on;
plot(time_VICON,q_VICON(6,:),'b-','LineWidth',2);% in degrees
plot(time_XSENS,q_XSENS(6,:),'r--','LineWidth',2);% in degrees
xlabel('time (s)')
ylabel('Angle (°)')
title([ Solids{6} ' Left Ankle Flexion'])
xlim([0 max(time_VICON)])