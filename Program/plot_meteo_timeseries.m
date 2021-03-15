ncfile='../Data/Meteo_stations_data/Stations_CESM.nc';
time_CESM=datetime(ncread(ncfile,'time'));
PSL_CESM=ncread(ncfile,'psl');
VWind_CESM=ncread(ncfile,'UWind');
name=ncread(ncfile,'station_name');

ncfile='../Data/Meteo_stations_data/Stations_CESM+ERA5.nc';
time=datetime(ncread(ncfile,'time'));
PSL=ncread(ncfile,'psl');
VWind=ncread(ncfile,'UWind');

ncfile='../Data/Meteo_stations_data/Stations_observed.nc';
time_obs=datetime(ncread(ncfile,'time'));
PSL_obs=ncread(ncfile,'psl');
VWind_obs=ncread(ncfile,'UWind');


for i=1:size(name,1)
    
    figure('Position',[440,339,940,459]);
    subplot(2,1,1)
    plot(time_obs,PSL_obs(i,:),'k','linewidth',2)
    hold on
    plot(time_CESM,PSL_CESM(i,:)/100,'b','linewidth',1.5)
    plot(time_CESM,PSL(i,:)/100,'r','linewidth',1.5)
    xlim([datetime(2017,9,1),datetime(2017,10,1)]);
    ylim([960,1030]);   

    b=legend('Observed','CESM','CESM+ERA5','location','SouthOutside','Orientation','horizontal');

    b.Position=[ 0.3731    0.4749    0.2883    0.0381];
    ylabel('Sea-level pressure (hPa)');
    title(name(i,:));
    set(gca,'FontSize',14,'FontWeight','b');
        
    subplot(2,1,2)
%     data.WINDSPEED(data.WINDSPEED==0)=NaN;
    plot(time_obs,VWind_obs(i,:),'k','linewidth',2)
    hold on
    plot(time_CESM,VWind_CESM(i,:),'b','linewidth',1.5)
    plot(time_CESM,VWind(i,:),'r','linewidth',1.5)
    xlim([datetime(2017,9,1),datetime(2017,10,1)])
    ylim([0,30])
    ylabel('Wind speed (m/s)');
    set(gca,'FontSize',14,'FontWeight','b');


end