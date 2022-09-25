%data read
U1toU3 = readtable(filename)
T = readtable("2002~2004U1_U5.xls", 'Sheet','UIG_topography','VariableNamingRule', 'preserve')
%read table은 csv를 열별로 저장하고 변수도 보존되어서 편리한듯!
U1a=xlsread("2002~2004U1_U5.xls",'UIG.U1a');U1b=xlsread("2002~2004U1_U5.xls",'UIG.U1b');
U2a=xlsread("2002~2004U1_U5.xls",'UIG.U2a');U2b=xlsread("2002~2004U1_U5.xls",'UIG.U2b');
U3a=xlsread("2002~2004U1_U5.xls",'UIG.U3a');U3b=xlsread("2002~2004U1_U5.xls",'UIG.U3b');
%repeatational code improvement required
%time allocation
y1a=U1a(:,1);mon1a=U1a(:,2);d1a=U1a(:,3);h1a=U1a(:,4);
y1b=U1b(:,1);mon1b=U1b(:,2);d1b=U1b(:,3);h1b=U1b(:,4);
y2a=U2a(:,1);mon2a=U2a(:,2);d2a=U2a(:,3);h2a=U2a(:,4);
y2b=U2b(:,1);mon2b=U2b(:,2);d2b=U2b(:,3);h2b=U2b(:,4);
y3a=U3a(:,1);mon3a=U3a(:,2);d3a=U3a(:,3);h3a=U3a(:,4);
y3b=U3b(:,1);mon3b=U3b(:,2);d3b=U3b(:,3);h3b=U3b(:,4);
Jd1a=datenum(y1a,mon1a,d1a,h1a,0,0,0);Jd1b=datenum(y1b,mon1b,d1b,h1b,0,0,0);
Jd2a=datenum(y2a,mon2a,d2a,h2a,0,0,0);Jd2b=datenum(y2b,mon2b,d2b,h2b,0,0,0);
Jd3a=datenum(y3a,mon3a,d3a,h3a,0,0,0);Jd3b=datenum(y3b,mon3b,d3b,h3b,0,0,0);
%current speed
Ur1a=U1a(:,7);Ur1b=U1b(:,7);Ur2a=U2a(:,7);Ur2b=U2b(:,7);Ur3a=U3a(:,7);Ur3b=U3b(:,7);
Ur1a=Ur1a( find( (7.3155e+05<=Jd1a) & (Jd1a<= 7.3174e+05) ) );
Ur1a=Ur1a( find( (7.3155e+05<=Jd1b) & (Jd1b<= 7.3174e+05) ) );
Ur2a=Ur2a( find( (7.3155e+05<=Jd2a) & (Jd2a<= 7.3174e+05) ) );
Ur2a=Ur2a( find( (7.3155e+05<=Jd2b) & (Jd2b<= 7.3174e+05) ) );
Ur3a=Ur3a( find( (7.3155e+05<=Jd3a) & (Jd3a<= 7.3174e+05) ) );
Ur3a=Ur3a( find( (7.3155e+05<=Jd3b) & (Jd3b<= 7.3174e+05) ) );
al1 = distance(37.39,131.06,37.39,131.18);%U1
al2 = distance(37.35,131.18,37.35,131.34);%U2
al3 = distance(37.32,131.34,37.32,131.54);%U3
% flux
U1a=U1a*(260*al1);U1b=U1b*(320*al1);U2a=U2a*(330*al2);
U2b=U2b*(420*al2);U3a=U3a*(185*al3);U3b=U3b*(550*al3);
flux02_03=U1a+U1b+U2a+U2b+U3a+U3b;