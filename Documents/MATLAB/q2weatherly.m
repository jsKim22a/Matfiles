month(month==1)=13;month(month==2)=14;
y2n=1997; m=3; wts={};
for i=1:23
    m=3;
    for j=1:4
        wts{i,j}=sum(flv(find((year==y2n)&(month==m|month==m+1|month==m+2) ) ) );
        m=m+1;
    end
    y2n=y2n+1;
end

subplot(1,5,1)
dt97=[wts{1,1} wts{1,2} wts{1,3} wts{1,4}];
dt98=[wts{2,1} wts{2,2} wts{2,3} wts{2,4}];
dt99=[wts{3,1} wts{3,2} wts{3,3} wts{3,4}];
weather=[1 2 3 4]; weat=['봄 '; '여름';'가을';'겨울'];
plot(weather,dt97,weather,dt98,weather,dt99)
xlabel('계절');ylabel('수송량[m^3/s]');title('<1997~1999>');
set(gca,'xtick',1:4,'xticklabel',weat)
legend('1997','1998','1999')

subplot(1,5,2)
dt00=[wts{4,1} wts{4,2} wts{4,3} wts{4,4}];
dt01=[wts{5,1} wts{5,2} wts{5,3} wts{5,4}];
dt02=[wts{6,1} wts{6,2} wts{6,3} wts{6,4}];
dt03=[wts{7,1} wts{7,2} wts{7,3} wts{7,4}];
dt04=[wts{8,1} wts{8,2} wts{8,3} wts{8,4}];
weather=[1 2 3 4]; weat=['봄 '; '여름';'가을';'겨울'];
plot(weather,dt00,weather,dt01,weather,dt02,weather,dt03,weather,dt04)
xlabel('계절');ylabel('수송량[m^3/s]');title('<2000~2004>');
set(gca,'xtick',1:4,'xticklabel',weat)
legend('2000','2001','2002','2003','2004')

subplot(1,5,3)
dt05=[wts{9,1} wts{9,2} wts{9,3} wts{9,4}];
dt06=[wts{10,1} wts{10,2} wts{10,3} wts{10,4}];
dt07=[wts{11,1} wts{11,2} wts{11,3} wts{11,4}];
dt08=[wts{12,1} wts{12,2} wts{12,3} wts{12,4}];
dt09=[wts{13,1} wts{13,2} wts{13,3} wts{13,4}];
weather=[1 2 3 4]; weat=['봄 '; '여름';'가을';'겨울'];
plot(weather,dt05,weather,dt06,weather,dt07,weather,dt08,weather,dt09)
xlabel('계절');ylabel('수송량[m^3/s]');title('<2005~2009>');
set(gca,'xtick',1:4,'xticklabel',weat)
legend('2005','2006','2007','2008','2009')

subplot(1,5,4)
dt10=[wts{14,1} wts{14,2} wts{14,3} wts{14,4}];
dt11=[wts{15,1} wts{15,2} wts{15,3} wts{15,4}];
dt12=[wts{16,1} wts{16,2} wts{16,3} wts{16,4}];
dt13=[wts{17,1} wts{17,2} wts{17,3} wts{17,4}];
dt14=[wts{18,1} wts{18,2} wts{18,3} wts{18,4}];
weather=[1 2 3 4]; weat=['봄 '; '여름';'가을';'겨울'];
plot(weather,dt10,weather,dt11,weather,dt12,weather,dt13,weather,dt14)
xlabel('계절');ylabel('수송량[m^3/s]');title('<2010~2014>');
set(gca,'xtick',1:4,'xticklabel',weat)
legend('2010','2011','2012','2013','2014')

subplot(1,5,5)
dt15=[wts{19,1} wts{19,2} wts{19,3} wts{19,4}];
dt16=[wts{20,1} wts{20,2} wts{20,3} wts{20,4}];
dt17=[wts{21,1} wts{21,2} wts{21,3} wts{21,4}];
dt18=[wts{22,1} wts{22,2} wts{22,3} wts{22,4}];
dt19=[wts{23,1} wts{23,2} wts{23,3} wts{23,4}];
weather=[1 2 3 4]; weat=['봄 '; '여름';'가을';'겨울'];
plot(weather,dt00,weather,dt01,weather,dt02,weather,dt03,weather,dt04)
xlabel('계절');ylabel('수송량[m^3/s]');title('<2015~2019>');
set(gca,'xtick',1:4,'xticklabel',weat)
legend('2015','2016','2017','2018','2019')


