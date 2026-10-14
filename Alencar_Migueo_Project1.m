% Author: Migueo Alencar
% Date: 09/11/2026

% Project Features:
% 1. Plot - histogram
% 2. User-defined function - planetTemp
% 3. Matrix/vector computations
% 4. fprintf

% Reads the Excel File and obtains each of the columns.
planetsData = readtable('exoplanets_F26.csv');
lightYearsFromEarth = planetsData.sy_dist .* 3.26; % In light years 


% Creates a histogram for the distances of planets from the 
% earth in light years. 
histogram(lightYearsFromEarth, 'BinLimits', [0, 1000], 'NumBins', 100)
xlabel('Distance from Earth in light-years')
ylabel('Number of Exoplanets')
title('Distribution of Exoplanet Distances from Earth')
 
exoplanets = rmmissing(planetsData, 'DataVariables', {'sy_dist' 'st_teff' 'pl_orbsmax' 'pl_rade'});



% Obtains relevant data from each planet for the above function to
% calculate the planet's temperature 
star_temperatures = exoplanets.st_teff; 
star_radii = exoplanets.st_rad.*6.957.*10.^8; % Converts from solar radii to m 
semi_major_axes = exoplanets.pl_orbsmax.*1.496.*10.^11; % Converts from AU to m 
planet_radii = exoplanets.pl_rade.*6.371.*10.^6; % Converts from Earth radii to m 

%  Planet temperatures in Kelvin 
planetTemperatures = planetTemp(star_temperatures, star_radii, semi_major_axes, planet_radii);


% Uses Planet Temperature in Kelvin and Planet Radius in earth radii to
% determine if the planet is habitable. If so, adds to a new list. 

% (273 < planetTemperatures) & (planetTemperatures < 373) & 

habitable_exoplanets = exoplanets(planetTemperatures <= 373 & planetTemperatures >= 273 & exoplanets.pl_rade <= 2.5, :) 
