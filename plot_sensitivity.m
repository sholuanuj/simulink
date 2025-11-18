load('sensitivity_results.mat','results');

figure; hold on;
for i=1:length(results.k)
    ts = results.k(i).lift;
    plot(ts.time*1e3, ts.data,'LineWidth',1.6);
end
xlabel('Time (ms)'); ylabel('Needle lift (m)');
title('Effect of Spring Stiffness (k)');
legend(arrayfun(@(x) sprintf('k=%.0f',results.k(x).k),1:length(results.k),'UniformOutput',false));
grid on;

figure; hold on;
for i=1:length(results.A)
    ts = results.A(i).lift;
    plot(ts.time*1e3, ts.data,'LineWidth',1.6);
end
xlabel('Time (ms)'); ylabel('Needle lift (m)');
title('Effect of Hydraulic Area (A)');
legend(arrayfun(@(x) sprintf('A=%.1e',results.A(x).A),1:length(results.A),'UniformOutput',false));
grid on;

figure; hold on;
for i=1:length(results.c)
    ts = results.c(i).lift;
    plot(ts.time*1e3, ts.data,'LineWidth',1.6);
end
xlabel('Time (ms)'); ylabel('Needle lift (m)');
title('Effect of Damping (c)');
legend(arrayfun(@(x) sprintf('c=%.0f',results.c(x).c),1:length(results.c),'UniformOutput',false));
grid on;

figure; hold on;
for i=1:length(results.noz)
    ts = results.noz(i).flow;
    plot(ts.time*1e3, ts.data,'LineWidth',1.6);
end
xlabel('Time (ms)'); ylabel('Injection flow (kg/s)');
title('Effect of Nozzle Diameter');
legend(arrayfun(@(x) sprintf('d=%.2f mm',results.noz(x).nozD*1e3),1:length(results.noz),'UniformOutput',false));
grid on;
