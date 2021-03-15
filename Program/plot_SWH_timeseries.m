
ncfile='../Data/SWH_stations_data/Stations_2DBC.nc';
time=datetime(ncread(ncfile,'time'));
HS=ncread(ncfile,'SWH');
name=ncread(ncfile,'station_name');

ncfile='../Data/SWH_stations_data/Stations_observed.nc';
time_obs=datetime(ncread(ncfile,'time'));
HS_obs=ncread(ncfile,'SWH');


for i=1:4     
    figure
    set(gcf,'Position',[440   443   990   355]); hold on
    set(gca,'FontSize',12,'FontWeight','b');
    box on   

    plot(time_obs,HS_obs(i,:),'ko','linewidth',1.5);
    hold on

    plot(time,HS(i,:),'linewidth',1.5,'color',[0 0 0.75])
    xlim([datetime(2017,9,1),datetime(2017,10,1)])
    ylabel('SWH (m)')
    legend('Observed', '2DBC');
    title(name(i,:))
    
    ax = gca;
    ax.Position=[0.0434    0.0997    0.9374    0.8459];

    
end