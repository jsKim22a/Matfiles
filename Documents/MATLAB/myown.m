%% topography
tdat=readtable("U1~U5_2002~2004.xls", 'Sheet','UIG_topography'...
    ,'VariableNamingRule','preserve');
long=tdat{:,1}; depth=tdat{:,2};
plot(long,depth)
set(gca,'ydir','reverse')
hold on 
xlabel('longitude','fontsize',15);ylabel('depth[m]','fontsize',15);
title('UIG__topography','fontsize',15)
%% station
stat=readtable("U1~U5_2002~2004.xls", 'Sheet','UIG.station'...
    ,'VariableNamingRule','preserve');
x=stat{1:3,2};x=cat(2,x,x); 
y=[1760 2090;1830 2250;1690 2240];
plot(x,y,'o',...
    'MarkerSize',5)
grid on;hold on
dum=zeros(224); zlim=dum(:,1); zlim(:,:)=1500;
plot(long,zlim,'.',...
    'MarkerSize',1)



