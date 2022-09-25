 % while 
i=1;n=1996;a=1;
z=zeros(25);yts=z(:,1); %yts: yearly transport
while data{1,1}{i}==n
    yts(a,1)=yts(a,1)+data{1,7}{i};
    i=i+1;
    if data{1,1}{i}==n+1
    n=n+1;a=a+1;
    continue
    end
end
%실패 



