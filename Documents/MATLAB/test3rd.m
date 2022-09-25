%개수로 접근?
%년도별 data 길이 저장
a=1;
for n=1996:2020
yn(a,1)=length(find(year==n) );
a=a+1;
end

length(find(data{1,1}==1996))
