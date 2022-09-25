subplot(3,1,2)
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