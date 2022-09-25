% while 2nd
n=1996:2020; z=zeros(25); yts=z(:,1);
a=1; i=1;
while i<=length(year)
    yts(a,1)=sum(data{1,7}{i}(find(data{1,1}{i}==n)))
    a=a+1; i=i+1
end
yraxis=[1996:2020]' ; exz=zeros(25); zeax=exz(:,1); 
quiver(yraxis,zeax,yraxis,yts,1)