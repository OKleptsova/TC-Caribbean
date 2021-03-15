
ncfile='../Data/SSH_stations_data/Stations_observed.nc';
zeta_obs=ncread(ncfile,'zeta');
fit_obs=ncread(ncfile,'fit');
time_obs=ncread(ncfile,'time');
time_obs=datetime(time_obs);


list=dir('../Data/SSH_stations_data/Stations_*nc');
list=list([2,1]);

RMSE=NaN*zeros(size(zeta_obs,1),3);
RMSE_full=NaN*zeros(size(zeta_obs,1),3);
gamma=NaN*zeros(size(zeta_obs,1),3);
skill=NaN*zeros(size(zeta_obs,1),3);
gamma_full=NaN*zeros(size(zeta_obs,1),3);
skill_full=NaN*zeros(size(zeta_obs,1),3);

for r=1:length(list)

    ncfile=['../Data/SSH_stations_data/' list(r).name];
    for var={'zeta','fit','time'}
    assignin('base',var{1},ncread(ncfile,var{1}));
    end
    time=datetime(time);
    
    % Full signal 
    eta=(zeta-zeta_obs);
    RMSE_full(:,r)=sqrt(sum(eta.^2,2,'omitnan')./sum(~isnan(zeta_obs),2));
    gamma_full(:,r)=nanvar(eta,0,2)./nanvar(zeta_obs,0,2);
    
    a=sum(eta.^2,2,'omitnan')./sum(~isnan(zeta_obs),2);
    b=zeta-nanmean(zeta_obs,2);
    c=zeta_obs-nanmean(zeta_obs,2);
    d=(abs(b)+abs(c)).^2;
    d=sum(d,2,'omitnan')./sum(~isnan(zeta_obs),2);
    skill_full(:,r)=1-a./d;
    
    % Non-tidal residual
    eta=((zeta-fit)-(zeta_obs-fit_obs));
    RMSE(:,r)= sqrt(sum(eta.^2,2,'omitnan')./sum(~isnan(zeta_obs),2));
    gamma(:,r)=nanvar(eta,0,2)./nanvar((zeta_obs-fit_obs),0,2);
    
    a=sum(eta.^2,2,'omitnan')./sum(~isnan(zeta_obs),2);
    b=zeta-fit-nanmean(zeta_obs-fit_obs,2);
    c=zeta_obs-fit_obs-nanmean(zeta_obs-fit_obs,2);
    d=(abs(b)+abs(c)).^2;
    d=sum(d,2,'omitnan')./sum(~isnan(zeta_obs),2);
    skill(:,r)=1-a./d;

end

ncfile='../Data/SSH_stations_data/Error_statistics_Pringle.nc';
skill(:,3)=ncread(ncfile,'skill');
skill_full(:,3)=ncread(ncfile,'skill_full');
gamma(:,3)=ncread(ncfile,'gamma');
gamma_full(:,3)=ncread(ncfile,'gamma_full');
RMSE(:,3)=ncread(ncfile,'RMSE');
RMSE_full(:,3)=ncread(ncfile,'RMSE_full');

subplot(2,1,1)
bar(RMSE_full)
title('RMSE (m)');
ylabel('Full signal')
set(gca,'FontSize',12,'FontWeight','b');
grid on
l=legend('BT','2DBC', 'Pringle et al','location','SouthOutside','orientation','horizontal');
l.Position=[0.3134    0.4740    0.4089    0.0417];

subplot(2,1,2)
bar(RMSE)
ylabel('Residual')
set(gca,'FontSize',12,'FontWeight','b');
grid on
ylim([0,0.11])

%------- Plot gamma

figure
subplot(2,1,1)
bar(gamma_full)
title('\gamma^2');
ylabel('Full signal')
set(gca,'FontSize',12,'FontWeight','b');
grid on
l=legend('BT','2DBC', 'Pringle et al','location','SouthOutside','orientation','horizontal');
l.Position=[0.3134    0.4740    0.4089    0.0417];

subplot(2,1,2)
bar(gamma)
ylabel('Residual')
set(gca,'FontSize',12,'FontWeight','b');
grid on
set(gca,'ylim',[0,1.2])

%------- Plot skill

figure
subplot(2,1,1)
bar(skill_full)
title('d');
ylabel('Full signal')
set(gca,'FontSize',12,'FontWeight','b');
grid on
l=legend('BT','2DBC', 'Pringle et al','location','SouthOutside','orientation','horizontal')
l.Position=[0.3134    0.4740    0.4089    0.0417];

subplot(2,1,2)
bar(skill)
ylabel('Residual')
set(gca,'FontSize',12,'FontWeight','b');
grid on