disp("The condition to be satisfied for an axial mode of helical antenna are")
disp(" 1)  No of turns greater than 3 ")
disp(" 2)  The pitch angle must lie between 12 and 15 degree")
disp(" 3)  The ratio of C/lambda must lie between 3/4 and 4/3 ")

disp("-------------------------")

f=input("Enter the frequency ");
N=input("Enter the turns required for your antenna ");
sp=input("Enter spacing between turns in terms of wavelength ");
w=input("Enter the width required for your antenna in meters ");

% To calculate the wavelength

c = 3*(10^(8)); % speed of light (m/s)
lambda = c/f; % wavelength (m)
c1=lambda;

disp("The wavelength is")
disp(lambda)

% Helical Antenna Design

d = lambda/pi; % diameter of helix (m)
disp("The diameter of helix")
disp(d)

S=lambda*sp; % spacing between turns (m)
disp("The spacing between turns")
disp(S)

Cir=(pi*d); % The circumference in (m)
disp("The circumference of the helix is ")
disp(Cir)

% Calculate other parameters

L=N*(sqrt((S^2)+(lambda^2))); % length of helix (m)
disp("Length of the helix ")
disp(L)

r = d/2; % radius of helix (m)
disp("The radius of helix")
disp(r)

Lc = sqrt((S^2)+(lambda^2)); % length of wire for one turn (m)
disp("The length of wire for one turn")
disp(Lc)

% Calculate radiation resistance

G = (11.8+10*log10(N*sp)); % antenna gain (dB)
disp("The Antenna gain")
disp(G)

Rr = (40*(pi^2)*(L^2)*(d^2))/(lambda^2); % radiation resistance (ohms)
disp("The Radiation resistance")
disp(Rr)

% pitch angle is the angle between the axis of the helix and the direction of the radiation pattern

pitch = atand(S/lambda);
disp("The pitch angle")
disp(pitch)

% To calculate the impedence

imp = 140*c1/lambda;
disp(" The impedence is")
disp(imp)

% To calculate half power beam width

HPBW=(52/sqrt(N*sp));

disp("Half power beam width in degree")
disp(HPBW)

% To calculate First null beam width

FNBW=(115/sqrt(N*sp));
disp("First null beam width in degree")
disp(FNBW)


% To calculate the axial ratio
ax=(((2*N)+1)/2*N);
disp("The axial ratio is")
disp(ax)

hx=helix("Radius",r,"Width",w,"Turns",N,"Spacing",S);

figure(1)
show(hx) % Shows the antenna

figure(2)
pattern(hx,f) % Gives radiation pattern

figure(3)
patternElevation(hx,f) % Gives HPBW and FNBW

figure(4)
current(hx,f)  % Gives Current distribution across the antenna

figure(5)
charge(hx,f) % Gives charge distribution across the antenna

directivity=pattern(hx,f,0,90);
disp("The direcvity of the antenna in the direction ")
disp(directivity)

% impedence of the antenna

figure ('name','Impendence')
impedance(hx,1.5e9:10e6:f)

% Reflection coefficient of the antenna

figure ('name','Reflection coefficient')
S1=sparameters(hx,1.5e9:10e6:f,imp);
rfplot(S1)

% Return Loss of the antenna

figure ('name','Return Loss')
returnLoss(hx,1.5e9:10e6:f,imp);

% VSWR function

figure('name','VSWR')
vswr(hx,1.5e9:10e6:f,imp);
