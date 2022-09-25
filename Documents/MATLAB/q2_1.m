fname='U3data1996~2020.csv';
fileID=fopen(fname,'r');
data=textscan(fileID,'%*s%s%s%s%s%s%s%*d%f','HeaderLines',1,'Delimiter',',');

year=str2double(data{1,1});month=str2double(data{1,2});day=str2double(data{1,3});
hour=str2double(data{1,4});minute=str2double(data{1,5});second=str2double(data{1,6});
flspd=(data{1,7});
Jday=datenum(year,month,day,hour,minute,second);
flspd(isnan(flspd)==1)=0;%유속 자료 중 NaN값 0으로 변환
flv=flspd*(0.01*1735*91290);%flv:수송량 
subplot(2,1,1)
plot(Jday,flv)
hold on
xlabel('시간');ylabel('수송량[m^3/s]');title('<1996~2020 U3>');
set(gca,'xtick',[datenum(1996,11,4,22,0,0):datenum(1,0,0,0,0,0):datenum(2020,11,11,7,0,0)]...
,'xticklabel',datestr([datenum(1996,11,4,22,0,0):datenum(1,0,0,0,0,0):datenum(2021,11,11,7,0,0)],'YYYY'))
% 연간 수송량 변동

subplot(2,1,2)
z=zeros(25);yts=z(:,1);a=1;
for n=1996:2020
yts(a,1)=sum(flv(find(year==n)));
a=a+1;
end
yraxis=[1996:2020]' ; exz=zeros(25); zeax=exz(:,1); 
quiver(yraxis,zeax,yraxis,yts,1)
hold on 
xlabel('시간(year)');ylabel('수송량[m^3/s]');title('<1996~2020 yearly U3>');
set(gca,'xtick',1996:1:2020,'xticklabel',1996:1:2020)
