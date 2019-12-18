% Post Processing "SideStep" example
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This example aimed at getting evaluating the results of the geometrical
% calibration
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

% Loading the result of the geometrical calibration
BiomechanicalModel.GeometricalCalibration
%Struct which stand for 
% *frame_calib: array containing the number of frames used for the calibration;
% *crit: array containing the stop criteria value for each iteration;
% *errorm: cell array containing, for each iteration, the differences between...
%       the experimental markers positions and the reconstructed model markers
%       positions;
% *k_calib: array containing the homothety coefficients;
% *p_calib: array containing the local variation of each model marker;
% *alpha_calib: array containing the axis orientation variation.

%% Variation of the error
crit = BiomechanicalModel.GeometricalCalibration.crit;
figure('Name','Convergence of Geometrical calibration')
bar(crit); hold on; nb_loops =length(crit);
plot([0,nb_loops+1],[0.05 0.05],'r--')
xlim([0,nb_loops+1])
title('Variation of the error between two loops for each loops')
ylabel('Variation of the error between two loops (%)')
xlabel('Loop number')

XX = xlim;YY = ylim;
text(XX(2)/2,YY(1)+(YY(2)-YY(1))*2/3,...
    ['Convergence of Geometrical calibration after ' num2str(nb_loops) ' loops'],...
    'HorizontalAlignment','center');
text(XX(2)/2,YY(1)+(YY(2)-YY(1))*3/5,...
    'under the 5% threshold',...
    'HorizontalAlignment','center')

%% Error Norm
errorm = BiomechanicalModel.GeometricalCalibration.errorm;
figure('Name','Kinematic error for each loops')

% for each frames
subplot(1,2,1)
error = cellfun(@mean,errorm,'UniformOutput',false);
c = parula(nb_loops); % colors of de curves
leg={};% legends
for ii = 1:length(error)
plot(error{ii},'Color',c(ii,:),'LineWidth',3); hold on
leg={ leg{:}, ['loop #' num2str(ii)]};
end
xlabel('Frames')
ylabel('Mean kinematic error for every marker (m)')
legend(leg,'location','best')
title('Mean kinematic error for each frames for all markers')

% mean over the frames
subplot(1,2,2)
Meanerror = cellfun(@mean,error,'UniformOutput',false);
bar(cell2mat(Meanerror)); hold on;
xlim([0,length(crit)+1])
title('Global Mean Kinematic error for each loops')
ylabel('Global mean kinematic error (m)')
xlabel('Loop number')

%% Homothetic factors (k_calib) from anthropometric coefficients

figure('Name','Calibration values')
% Solid list extracted from the OsteoarticularModel
Solid_list = {BiomechanicalModel.OsteoArticularModel.name}';

barh(BiomechanicalModel.GeometricalCalibration.k_calib)
yticks(1:length(Solid_list))
yticklabels(strrep(Solid_list,'_',' '))
xlim([0.8,1.2])
ylabel('Name of the solid')
xlabel('Value of the homethetic coefficient k')

%% Variation of marker locations in segment frame (p_calib)

figure('Name','Calibration values')

% Marker list with local directions (x,y,z)
Marker_list = {BiomechanicalModel.Markers.name}';
Marker_list_3 = reshape([Marker_list Marker_list Marker_list]',[length(Marker_list)*3,1]);
xyz_list ={'_x';'_y';'_z'};
xyz_list_marker= repmat(xyz_list,[length(Marker_list), 1]);
Marker_list_xyz = strcat(Marker_list_3,xyz_list_marker);

% find the non-zero values of variation of marker location
p_calib = BiomechanicalModel.GeometricalCalibration.p_calib;
ind = find(p_calib~=0);

barh(p_calib(ind))
yticks(1:length(ind))
yticklabels(strrep(Marker_list_xyz(ind),'_',' '))
ylabel('Marker direction optimized')
xlabel('Displacement of the marker in the local frame (m)')


