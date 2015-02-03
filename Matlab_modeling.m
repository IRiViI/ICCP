%% Argon gas simulation
% This file is for trying out ways to model an argon gas
% Feed back for testing methods is faster with matlab than with C++ For
% now.



%% Parameters
N9 = 3 ;                % Define the number of particles (Number = 9^N9)
U = 10;               % Dimensions of the two dimensional universe (U by U)

%% Pre-calculations
N = 9^N9;

%% Particle positioning
% FCC structure is het best for high density packing
% This function is meant to create such a structure
% Inputs:   N (Number of particles)
% Outputs:  P (N by 2 matrix that uncludes the x and y position, in a 1 by 1 box)

% Number of particles per row
NR = sqrt(N);

% Prealocating P
P = zeros(N,2);                     % 
k = 0;
for i = 0:NR-1
    for j = 0:NR-1
        k = k + 1;
        x = 0.5 + 3 * i + 2 * j;        % x position of the particle
        l =  NR * floor(x/NR);           % if the x position of the particle is outside the box, it will start at the other side again
        y = 0.5 + j;                    % y position of the particle
        P(k,:) = [x-l; y];
    end
end
 % convert the total space units to a square of size one.
P = P / NR;                   % divided by particles per row                     

% figure(1)
% plot(P(:,1),P(:,2),'.')

%% Fill universe with particles
% Expand particle positioning to match universe
P = P * 10;

figure(1)
plot(P(:,1),P(:,2),'.')

