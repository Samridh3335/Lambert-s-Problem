clc;
clear;
%% ======================== Delta-V Estimation ========================= %%
% The code is iterated to calculate thr delta v- requirement for a earth to
% lunar transfer. The frame of reference taken is consideration is with
% reference to the earth therefore velocity of the moon is also accounted
% for. The code is specific for hyperbolic transfer and the transfer is
% being made to influence sphere of moon.
%
% Tabulated Variables:
%
% A             = Semi-Major Axis of Hyperbola (km)
% del_v_1       = Initial transfer orbit velocity (km/s)
% del_v_2       = Final transfer orbit velocity (km/s)
% del_v_tot     = Total Delta-V requirement (km/s)
% FO_V          = Final Orbit Velocity (km/s)
% HP_V          = Hyperbolic Orbit Velocity (km/s)
% IO_V          = Initial Orbit Velocity (km/s)
% mu_earth      = Gravitational Parameter of Earth (km^3/sec^2)
% mu_moon       = Gravitational Parameter of Moon (km^3/sec^2)
% R1 (I,J,K)    = Components of position vector of Earth (km)
% R1_M          = Magnitude of vector R1 (km)
% R1_V          = Vector of Initial Position (km)
% R2 (I,J,K)    = Components of position of moon (km)
% R2_M          = Magnitude of vector R2 (km)
% R2_V          = Vector of Final Position (km)
%
% ======================================================================= %

%% ~~~~~~~~~~~~~~~~~~~ Input and Initial Variables ~~~~~~~~~~~~~~~~~~~~~ %%

A           = input('Enter the semi-major axis of transfer hyperbola(km): ');
mu_earth    = 398600;
mu_moon     = 4904.8695;

% Input: Position Vector of Earth:
R1_I = input('Enter position 1 (I-component (km)): ');
R1_J = input('Enter position 1 (J-component (km)): ');
R1_K = input('Enter position 1 (K-component (km)): ');
R1_V = [R1_I R1_J R1_K];
R1_M = norm(R1_V);

% Input: Position Vector of Moon:
R2_I = input('Enter position 2 (I-component (km)): ');
R2_J = input('Enter position 2 (J-component (km)): ');
R2_K = input('Enter position 2 (K-component (km)): ');
R2_V = [R2_I R2_J R2_K];
R2_M = norm(R2_V);

% Hyperbolic velocity:
IO_V = sqrt(mu_earth/R1_M);
FO_V = sqrt(mu_moon/R2_M);
HP_V = sqrt(-mu_earth/A);

% Estimating delta-v requirements for transfer:

del_v_1     = HP_V - IO_V;
del_v_2     = FO_V - HP_V;
del_v_tot   = abs(del_v_1) + abs(del_v_2); 

% Echoing results from the lambert's problem:
clc

fprintf('--------------------------- Initial Input ---------------------------')
fprintf('\n Earth Orbit position vector                 : [%g, %g, %g] (km)', R1_V(1), R1_V(2), R1_V(3))
fprintf('\n Position Vector (R2)                        : [%g, %g, %g] (km)', R2_V(1), R2_V(2), R2_V(3))
fprintf('\n Semi-Major Axis of Transfer Hyperbola       : %g km', A)
fprintf('\n\n-------------------- Delta-V Calculation --------------------')
fprintf('\n Total Delta-V                               : %g km/sec', del_v_tot)
fprintf('\n---------------------------------------------------------------------')

