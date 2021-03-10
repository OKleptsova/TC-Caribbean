
ncfile='../Data/Grid/ADCRIC_grid_nodes.nc';
info=ncinfo(ncfile);
for var={info.Variables.Name}
assignin('base',var{1},ncread(ncfile,var{1}));
end

ncfile='../Data/Grid/ADCRIC_grid_connectivity.nc';
info=ncinfo(ncfile);
for var={info.Variables.Name}
assignin('base',var{1},ncread(ncfile,var{1}));
end

ncfile='../Data/Mean_fields/ADCRIC_MSL.nc';
info=ncinfo(ncfile);
for var={info.Variables.Name}
assignin('base',var{1},ncread(ncfile,var{1}));
end

ncfile='../Data/Mean_fields/ADCRIC_MTR.nc';
info=ncinfo(ncfile);
for var={info.Variables.Name}
assignin('base',var{1},ncread(ncfile,var{1}));
end

ncfile='../Data/Mean_fields/ADCRIC_SWH.nc';
info=ncinfo(ncfile);
for var={info.Variables.Name}
assignin('base',var{1},ncread(ncfile,var{1}));
end

load roma.mat

%------------
        
figure
patch('faces',element,'vertices',[x y MSL(:,1)],'facevertexcdata',MSL(:,1)*100,'EdgeColor','none','FaceColor','interp');
hold on

axis([  -89.9225  -56.3525    7.7063   25.4238])
axis equal
axis([  -89.9225  -56.3525    7.7063   25.4238])

caxis([-50,50]);
c=colorbar;
c.Ticks=-50:10:50;

title('2017 MSL anomaly (cm)');

ax=gca;
ax.SortMethod='childorder';
ax.Box='on';
ax.LineWidth=1;
ax.FontSize=12;
ax.FontWeight='b';
ylabel('degrees latitude')
xlabel('degrees longitude')
grid on

colormap(flipud(roma))

%------------
        
figure
patch('faces',element,'vertices',[x y MSL(:,1)],'facevertexcdata',diff(MSL,1,2)*100,'EdgeColor','none','FaceColor','interp');
hold on

axis([  -89.9225  -56.3525    7.7063   25.4238])
axis equal
axis([  -89.9225  -56.3525    7.7063   25.4238])

caxis([-25,25]);
c=colorbar;
c.Ticks=-50:10:50;

title('2100 - 2017 MSL anomaly difference (cm)');

ax=gca;
ax.SortMethod='childorder';
ax.Box='on';
ax.LineWidth=1;
ax.FontSize=12;
ax.FontWeight='b';
ylabel('degrees latitude')
xlabel('degrees longitude')
grid on

colormap(flipud(roma))

%------------
        
figure
patch('faces',element,'vertices',[x y MTR(:,1)],'facevertexcdata',MTR(:,1)*100,'EdgeColor','none','FaceColor','interp');
hold on

axis([  -89.9225  -56.3525    7.7063   25.4238])
axis equal
axis([  -89.9225  -56.3525    7.7063   25.4238])

caxis([0,120]);
c=colorbar;
c.Ticks=0:20:120;

title('2017 mean tidal range (cm)');

ax=gca;
ax.SortMethod='childorder';
ax.Box='on';
ax.LineWidth=1;
ax.FontSize=12;
ax.FontWeight='b';
ylabel('degrees latitude')
xlabel('degrees longitude')
grid on

colormap(flipud(roma))

%------------
        
figure
patch('faces',element,'vertices',[x y MTR(:,1)],'facevertexcdata',diff(MTR,1,2)*100,'EdgeColor','none','FaceColor','interp');
hold on

axis([  -89.9225  -56.3525    7.7063   25.4238])
axis equal
axis([  -89.9225  -56.3525    7.7063   25.4238])

caxis([-15,15]);
c=colorbar;

title('2100 - 2017 difference in mean tidal range (cm)');

ax=gca;
ax.SortMethod='childorder';
ax.Box='on';
ax.LineWidth=1;
ax.FontSize=12;
ax.FontWeight='b';
ylabel('degrees latitude')
xlabel('degrees longitude')
grid on

colormap(flipud(roma))

%------------
        
figure
patch('faces',element,'vertices',[x y SWH(:,1)],'facevertexcdata',SWH(:,1),'EdgeColor','none','FaceColor','interp');
hold on

axis([  -89.9225  -56.3525    7.7063   25.4238])
axis equal
axis([  -89.9225  -56.3525    7.7063   25.4238])

caxis([0,2.5]);
colorbar;

title('2017 mean significant wave height (m)');

ax=gca;
ax.SortMethod='childorder';
ax.Box='on';
ax.LineWidth=1;
ax.FontSize=12;
ax.FontWeight='b';
ylabel('degrees latitude')
xlabel('degrees longitude')
grid on

colormap(flipud(roma))

%------------
        
figure
patch('faces',element,'vertices',[x y SWH(:,1)],'facevertexcdata',diff(SWH,1,2),'EdgeColor','none','FaceColor','interp');
hold on

axis([  -89.9225  -56.3525    7.7063   25.4238])
axis equal
axis([  -89.9225  -56.3525    7.7063   25.4238])

caxis([-1.25,1.25]);
colorbar

title('2100 - 2017 difference in mean SWH (m)');

ax=gca;
ax.SortMethod='childorder';
ax.Box='on';
ax.LineWidth=1;
ax.FontSize=12;
ax.FontWeight='b';
ylabel('degrees latitude')
xlabel('degrees longitude')
grid on

colormap(flipud(roma))
