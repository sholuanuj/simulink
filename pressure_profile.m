t = [0 0.2 0.5 1.0 1.5 2.0]*1e-3;
P = [0 1.0 6.0 8.0 5.0 0].'*1e5;
pressure_profile = timeseries(P, t);
save('pressure_profile.mat','pressure_profile');
