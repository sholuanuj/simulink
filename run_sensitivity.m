clear; clc;
run('injector_params.m');
run('pressure_profile.m');
modelName = 'MyInjector';

k_values = [0.8e4 1.5e4 2.5e4];
A_values = [0.7e-5 1.0e-5 1.3e-5];
c_values = [20 50 100];
noz_values = [0.15e-3 0.20e-3 0.25e-3];

results = struct();
runSim = @(m) sim(m,'StopTime','0.002','SaveOutput','on','SaveFormat','Structure');

% spring
for i=1:length(k_values)
    k = k_values(i);
    save('injector_params.mat','k','c','m','A','preload','nozD','Cd','rho');
    run('injector_params.m');
    simOut = runSim(modelName);
    results.k(i).k = k;
    results.k(i).lift = needle_lift_ts;
    results.k(i).flow = inj_flow_ts;
end

% area
run('injector_params.m');
for i=1:length(A_values)
    A = A_values(i);
    save('injector_params.mat','k','c','m','A','preload','nozD','Cd','rho');
    run('injector_params.m');
    simOut = runSim(modelName);
    results.A(i).A = A;
    results.A(i).lift = needle_lift_ts;
    results.A(i).flow = inj_flow_ts;
end

% damping
run('injector_params.m');
for i=1:length(c_values)
    c = c_values(i);
    save('injector_params.mat','k','c','m','A','preload','nozD','Cd','rho');
    run('injector_params.m');
    simOut = runSim(modelName);
    results.c(i).c = c;
    results.c(i).lift = needle_lift_ts;
    results.c(i).flow = inj_flow_ts;
end

% nozzle
run('injector_params.m');
for i=1:length(noz_values)
    nozD = noz_values(i);
    save('injector_params.mat','k','c','m','A','preload','nozD','Cd','rho');
    run('injector_params.m');
    simOut = runSim(modelName);
    results.noz(i).nozD = nozD;
    results.noz(i).lift = needle_lift_ts;
    results.noz(i).flow = inj_flow_ts;
end

save('sensitivity_results.mat','results');
