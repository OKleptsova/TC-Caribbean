
path='../Data/SSH_stations_data/';
run_names=dir([path 'Stations_*']);
run_names=run_names(3:-1:1);

col=[0 0 0; 0 0.75 0;0 0 0.75];


for r=1:length(run_names)  %run loop

ncfile = ['../Data/SSH_stations_data/' run_names(r).name];
time=datetime(ncread(ncfile,'time'));
zeta=ncread(ncfile,'zeta');

for i=1:size(zeta,1)
    figure(i); hold on
    plot(time,zeta(i,:),'linewidth',1.5,'color',col(r,:));  

    if r==3
    set(gcf,'Position',[440   443   990   355]); hold on
    xlim([datetime([2017,9,1]),datetime([2017,10,1])])
    set(gca,'FontSize',12,'FontWeight','b');
    ylabel('Water level (m)')
    
    name=ncread(ncfile,'station_name');
    title(name(i,:))
    
    box on
    ax = gca;
    ax.Position=[0.0459 0.0997 0.9500 0.8459];
    legend('Observed','BT','2DBC')  
    end  
    
end

end

