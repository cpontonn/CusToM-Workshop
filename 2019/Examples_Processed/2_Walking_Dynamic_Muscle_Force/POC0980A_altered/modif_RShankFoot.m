% Pre-Processing "Modify the inertial parameters of the Shank_foot segment"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%________________________________________________________
%
% Licence
% Toolbox distributed under 3-Clause BSD License
%________________________________________________________
%
% Authors : Antoine Muller, Charles Pontonnier, Pierre Puchaud and
% Georges Dumont
%_______________________________________________________
% Scripts to modify inertia of the R_ShankFoot segment
% An ankle brace of 1kg is added

%% Load model and segment
clear BiomechanicalModelsave
if exist('BiomechanicalModelsave.mat','file')==2
    load('BiomechanicalModelsave')
else
    load('BiomechanicalModel.mat');
    BiomechanicalModelsave = BiomechanicalModel;
    save('BiomechanicalModelsave')
end

% Solid list extracted from the OsteoarticularModel
Solid_list = {BiomechanicalModel.OsteoArticularModel.name}';

% Get the numbers of solids of interests
Solids = {'RShankFoot'};
[~,num_solid]=intersect(Solid_list,Solids,'stable');

%% Show masse and inertia of the solid
disp('Masse of Shank_Foot solid')
BiomechanicalModel.OsteoArticularModel(num_solid).m

disp('Inertia matrix of Shank_Foot solid')
BiomechanicalModel.OsteoArticularModel(num_solid).I

%% Add the mass
m=1; % mass

BiomechanicalModel.OsteoArticularModel(num_solid).m=...
    BiomechanicalModel.OsteoArticularModel(num_solid).m...
    +m;

%% Add the inertia
% Modeled as a cylinder of revolution of axis y
% centered in his center of mass

R=0.06; % radius of the cylinder
L=0.44; % length of the cylinder

A=m*R^2/2;
B=m*(R^2/4+L^2/12);

I_brace = [B 0 0; 0 A 0; 0 0 B];

BiomechanicalModel.OsteoArticularModel(num_solid).I=...
    BiomechanicalModel.OsteoArticularModel(num_solid).I...
    +I_brace;

save('BiomechanicalModel.mat')

%% New Parameters
disp('New Masse of Shank_Foot solid')
BiomechanicalModel.OsteoArticularModel(num_solid).m

disp('New Inertia matrix of Shank_Foot solid')
BiomechanicalModel.OsteoArticularModel(num_solid).I

%%