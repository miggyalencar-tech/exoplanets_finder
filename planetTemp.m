function Tp = planetTemp(Ts, Rs, a, Rp)

% Stefan-Boltzmann constant in W m^-2 K^-4 
B = 5.670374419.*10.^-8; 

% Star's energy output per unit area per second in W/m^2
FsR = B.*Ts.^4; 

% Star's energy output per second (luminosity) in W
Ls = 4.*pi.*Rs.^2.*FsR;  

% Energy flux at the radius of the planet's orbit in W/m^2

FsA = Ls./(4.*pi.*a.^2); 

% Energy per second gathered by the planet from its host star in W

Eabs = FsA.*Rp.^2.*pi; 

% Rate at which the planet is emitting energy into space is 
% Eemit = 4.*pi.*Rp.^2.*B.*Tp.^4; Can use this and Eabs (equal to each 
% other) to solve for Tp. 

Tp = (Eabs./(4.*pi.*Rp.^2.*B)).^(1/4);   

end