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
subplot(5,1,1)
yts{1}

    
