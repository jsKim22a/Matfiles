%% 데이터 불러오기

addpath E:\contest(20220818~)\Q2
load E:\contest(20220818~)\Q2\distance.mat

%% 1996~2020년 남향 수송량 장기변화추세 / 수심 1800m는 딱 중간 지점

temp = readmatrix("U3_1996~2020.csv");
long_time_data = datenum([temp(2:end,2),temp(2:end,3),temp(2:end,4),temp(2:end,5),temp(2:end,6),temp(2:end,7)]);
long_speed_data = temp(2:end,9);

move_mean_speed = movmean(long_speed_data,720*3,'omitnan');

plot(long_time_data,long_speed_data)
hold on
plot(long_time_data,move_mean_speed,'linewidth',2,'color','r')
hold off

xticks(linspace(long_time_data(1371,1),long_time_data(202971,1),24))
datetick('x','yyyy-mm')
xlim([min(long_time_data) max(long_time_data)])
grid on


%% 2002~2004년 해류 속도 + 시간 데이터 (U1 ~ U3) 추출


for i = 1:3
    temp1 = readmatrix("U1~U5_2002~2004.xls",'Sheet', sprintf('UIG.U%da',i));
    temp2 = readmatrix("U1~U5_2002~2004.xls",'Sheet', sprintf('UIG.U%db',i));
    current_speed_data{1,i} = temp1(:,8);
    current_speed_data{2,i} = temp2(:,8);
    current_time_data_temp{1,i} = temp1(:,1:6);
    current_time_data_temp{2,i} = temp2(:,1:6);
    current_depth_data(1,i) = unique(temp1(:,7));
    current_depth_data(2,i) = unique(temp2(:,7));
end

clear 'temp*'

%% 2002~2004년 시간데이터 우리가 아는 단위로 변환

for i = 1:2
    for j = 1:3
        temp = current_time_data_temp{i,j};
        current_time_data{i,j} = datestr(datenum([temp(:,1),temp(:,2),temp(:,3),temp(:,4),temp(:,5),temp(:,6)]),'yyyy-mm-dd HH:MM');
       
    end
end

clear current_time_data_temp i j temp

%% U1~U3의 flux  구하기 _ distance는 지성이가 보내주면 그걸로 진행

for i = 1:2
    for j = 1:3
        temp = polyfit(current_speed_data{i,j},1:size(current_speed_data{i,j},1),1);
        speed1(i,j) = temp(1)*1500+temp(2);
        speed2(i,j) = temp(1)*current_depth_data(i,j)+temp(2)
        flux{i,j} = distance(i,j).*((speed1+speed2)./2).*(current_depth_data(i,j)-1500);
    end
end

%%

correlation = polyfit(long_speed_data([53181:65055],1),sum(flux,'all'))
result = correlation(1)*flux+correlation(2)

