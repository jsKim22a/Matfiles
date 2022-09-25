D1a=readtable("2002~2004U1_U5.xls", 'Sheet','UIG.U1a','VariableNamingRule','preserve');
D1b=readtable("2002~2004U1_U5.xls", 'Sheet','UIG.U1b','VariableNamingRule','preserve');
D2a=readtable("2002~2004U1_U5.xls", 'Sheet','UIG.U2a','VariableNamingRule','preserve');
D2b=readtable("2002~2004U1_U5.xls", 'Sheet','UIG.U2b','VariableNamingRule','preserve');
D3a=readtable("2002~2004U1_U5.xls", 'Sheet','UIG.U3a','VariableNamingRule','preserve');
D3b=readtable("2002~2004U1_U5.xls", 'Sheet','UIG.U3b','VariableNamingRule','preserve');
%% time
y1a=D1a{:,1};mon1a=D1a{:,2};d1a=D1a{:,3};h1a=D1a{:,4};
y1b=D1b{:,1};mon1b=D1b{:,2};d1b=D1b{:,3};h1b=D1b{:,4};
y2a=D2a{:,1};mon2a=D2a{:,2};d2a=D2a{:,3};h2a=D2a{:,4};
y2b=D2b{:,1};mon2b=D2b{:,2};d2b=D2b{:,3};h2b=D2b{:,4};
y3a=D3a{:,1};mon3a=D3a{:,2};d3a=D3a{:,3};h3a=D3a{:,4};
y3b=D3b{:,1};mon3b=D3b{:,2};d3b=D3b{:,3};h3b=D3b{:,4};
Jd1a=datenum(y1a,mon1a,d1a,h1a,0,0);Jd1b=datenum(y1b,mon1b,d1b,h1b,0,0);
Jd2a=datenum(y2a,mon2a,d2a,h2a,0,0);Jd2b=datenum(y2b,mon2b,d2b,h2b,0,0);
Jd3a=datenum(y3a,mon3a,d3a,h3a,0,0);Jd3b=datenum(y3b,mon3b,d3b,h3b,0,0);
%% current speed
Ur1a=D1a{:,7};Ur1b=D1b{:,7};Ur2a=D2a{:,7};Ur2b=D2b{:,7};Ur3a=D3a{:,7};Ur3b=D3b{:,7};
Ur1a=Ur1a( find( (7.3155e+05<=Jd1a) & (Jd1a<= 7.3174e+05) ) );
Ur1b=Ur1b( find( (7.3155e+05<=Jd1b) & (Jd1b<= 7.3174e+05) ) );
Ur2a=Ur2a( find( (7.3155e+05<=Jd2a) & (Jd2a<= 7.3174e+05) ) );
Ur2b=Ur2b( find( (7.3155e+05<=Jd2b) & (Jd2b<= 7.3174e+05) ) );
Ur3a=Ur3a( find( (7.3155e+05<=Jd3a) & (Jd3a<= 7.3174e+05) ) );
Ur3b=Ur3b( find( (7.3155e+05<=Jd3b) & (Jd3b<= 7.3174e+05) ) );
%% distance
al1 = distance(37.39,131.06,37.39,131.18);%U1
al2 = distance(37.35,131.18,37.35,131.34);%U2
al3 = distance(37.32,131.34,37.32,131.54);%U3
%% U1~U3 flux
Ur1a=Ur1a*(260*al1);Ur1b=Ur1b*(320*al1);Ur2a=Ur2a*(330*al2);
Ur2b=Ur2b*(420*al2);Ur3a=Ur3a*(185*al3);Ur3b=Ur3b*(550*al3);
addu1a=zeros(11);Ur1a=[Ur1a; addu1a(:,1)];Ur1b=[Ur1b; addu1a(:,1)];
addu2a=zeros(13);Ur2a=[Ur2a; addu2a(:,1)];Ur2b=[Ur2b; addu2a(:,1)];
addu3b=zeros(66);Ur3b=[Ur3b; addu3b(:,1)];
flux02_03=Ur1a+Ur1b+Ur2a+Ur2b+Ur3a+Ur3b;
y=flux02_03;
%% 
same time_U3 flux rate
fname='U3data1996~2020.csv';
fileID=fopen(fname,'r');
data=textscan(fileID,'%*s%s%s%s%s%s%s%*d%f','HeaderLines',1,'Delimiter',',');
year=str2double(data{1,1});month=str2double(data{1,2});day=str2double(data{1,3});
hour=str2double(data{1,4});minute=str2double(data{1,5});second=str2double(data{1,6});
flspd=(data{1,7});
Jday=datenum(year,month,day,hour,minute,second);
flspd(isnan(flspd)==1)=0; 
flspd=flspd( find( (7.3155e+05<=Jday) & (Jday<= 7.3174e+05) ) );
x=flspd;
scatter(x,y);[a,b]=polyfit(x,y,1);plot(x,a.*x+b) %a는 2x1 matrix고 b는 structure