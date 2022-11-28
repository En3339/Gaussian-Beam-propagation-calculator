%% The function below calculate the complex amplitude of a Gaussian beam, at any points in the space.
% Inputs:
% 	W0              Beam Waist
%   lambda          Wavelength
%   Pt_Cartesian    Points in space(in Cartesian format)
% Outputs:
%   ComplexAMP      Complex amptitude.
% Example:
%         ComplexAMP = ComplexAMP(1.5e-2, 960e-9, [0,0,5e-1])  
%
% EN.LU.22@UCL.AC.UK
% DATE:17/11/2022


function ComplexAMP=ComplexAMP(W0,lambda,Pt_Cartesian)
%def and calculate parameters of the light sources:
c= 3e8;
f=c/lambda;
v=c/lambda/(2*pi);
k=2*pi/lambda;
E=10^10; % U0 the electric field amplitude (and phase) at the origin (r = 0, z = 0),
x=Pt_Cartesian(1);y=Pt_Cartesian(2);z=Pt_Cartesian(3);

% About the Beam
% n is the refraction index, take a kind of glass refraction index as the example
n = 1.52; 

% Rayleigh range 
z0 = pi * W0^2 * n/ lambda;

% Wz Radius of the beam
Wz = W0*(1+(z/z0)^2)^0.5;

% Curvature radius
Rz=z*(1+(z0/z)^2);

% Phase
Phase = atan(z/z0);

r= (x^2 + y^2)^0.5;
ComplexAMP = E*W0/Wz*exp(-r^2/Wz^2)*exp(i*(k*z+k*r^2/2/Rz-Phase));
end
