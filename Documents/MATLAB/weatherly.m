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
xlabel('계절');ylabel('수송량[m^3/s]');title('1997~1999');
set(gca,'xtick',1:4,'xticklabel',weat)
legend('1997','1998','1999')

g=4;n=2000;
for i=2:5
    subplot(1,5,i)
    a=[wts{g,1} wts{g,2} wts{g,3} wts{g,4}];
    b=[wts{g+1,1} wts{g+1,2} wts{g+1,3} wts{g+1,4}];
    c=[wts{g+2,1} wts{g+2,2} wts{g+2,3} wts{g+2,4}];
    d=[wts{g+3,1} wts{g+3,2} wts{g+3,3} wts{g+3,4}];
    e=[wts{g+4,1} wts{g+4,2} wts{g+4,3} wts{g+4,4}];
    weather=[1 2 3 4]; weat=['봄 '; '여름';'가을';'겨울'];
    plot(weather,a,weather,b,weather,c,weather,d,weather,e)
    xlabel('계절');ylabel('수송량[m^3/s]');title([num2str(n) '~' num2str(n+4)]);
    set(gca,'xtick',1:4,'xticklabel',weat)
    legend(num2str(n),num2str(n+1),num2str(n+2),num2str(n+3),num2str(n+4))
    g=g+5;n=n+5;
end