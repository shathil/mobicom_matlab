M1=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/3G199_fast.csv',1,0,[1 0 1018545 1]); 
M2=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/3G399_fast.csv',1,0,[1 0 2025585 1]);
M3=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/WIFI199_fast.csv',1,0,[1 0 1299945 1]); 
M4=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/WIFI399_fast.csv',1,0,[1 0 2014155 1]);
M5=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/LTE199_fast.csv',1,0,[1 0 1002795 1]); 
M6=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/LTE399_fast.csv',1,0,[1 0 1996500 1]); 
M7=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/WIFI199_ON-OFF-M.csv',1,0,[1 0 1055250 1]);
M8=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/WIFI399_ON-OFF-M.csv',1,0,[1 0 2021055 1]);
M9=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/3G199_ON-OFF-M.csv',1,0,[1 0 989640 1]);
M10=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/3G399_ON-OFF-M.csv',1,0,[1 0 2023770 1]);
M11=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/LTE199-ON-OFF-M.csv',1,0,[1 0 1080060 1]);
M12=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/LTE399-ON-OFF-M.csv',1,0,[1 0 2015295 1]);

%C=csvread('/Users/siekkine/Dropbox/Shared/StreamThrottlerNewMeasure/eSchedule.csv',1,0,[1 0 2055870 1]);
%C2=csvread('/Users/siekkine/Dropbox/Shared/StreamThrottlerNewMeasure/ThrottlerwithoutESchedule.csv',1,0,[1 0 2149515 1]);

%eSchedule's computational energy overhead in StreamThrottler
(mean(C(C(:,1)>50 & C(:,1)<400,2)) - mean(C2(C2(:,1)>50 & C2(:,1)<400,2)))*3.9

%these were for the traces where time was in minutes
%M1(:,1) = 0:0.0002:0.0002*(length(M1)-1);
%M3(:,1) = 0:0.0002:0.0002*(length(M3)-1);
%M5(:,1) = 0:0.0002:0.0002*(length(M5)-1);
%M6(:,1) = 0:0.0002:0.0002*(length(M6)-1);
%M7(:,1) = 0:0.0002:0.0002*(length(M7)-1);
%M8(:,1) = 0:0.0002:0.0002*(length(M8)-1);

base1 = mean(M1(M1(:,1)>85 & M1(:,1)<125,2));
base2 = mean(M2(M2(:,1)>105 & M2(:,1)<145,2));
%base3 = mean(M3(M3(:,1)>181 & M3(:,1)<183,2));
base3 = mean(M3(M3(:,1)>100 & M3(:,1)<240,2));
base4 = mean(M4(M4(:,1)>230 & M4(:,1)<232,2));
%base5 = mean(M5(M5(:,1)>180 & M5(:,1)<200,2));
base5 = mean(M5(M5(:,1)>95 & M5(:,1)<135,2));
%base6 = mean(M6(M6(:,1)>397 & M6(:,1)<399,2));
%base6 = mean(M6(M6(:,1)>180 & M6(:,1)<220,2));
base6 = mean(M6(M6(:,1)>340 & M6(:,1)<390,2));
%base7 = mean(M7(find(M7(:,1)>170 & M7(:,1)<172),2));
base7 = mean(M7(M7(:,1)>65 & M7(:,1)<190,2));
%base8 = mean(M8(find(M8(:,1)>360 & M8(:,1)<362),2));
base8 = mean(M8(M8(:,1)>330 & M8(:,1)<392,2));
%base9 = mean(M9(M9(:,1)>170 & M9(:,1)<186,2));
base9 = mean(M9(M9(:,1)>145 & M9(:,1)<195,2));
base10 = mean(M10(M10(:,1)>145 & M10(:,1)<195,2));
base11 = mean(M11(M11(:,1)>45 & M11(:,1)<135,2));
base12 = mean(M12(M12(:,1)>280 & M12(:,1)<380,2));

M1_ = [M1(:,1) M1(:,2)-base1];
M2_ = [M2(:,1) M2(:,2)-base2];
M3_ = [M3(:,1) M3(:,2)-base3];
M3_(M3_(:,1)<45,:) = [];
M3_(:,1) = M3_(:,1)-M3_(1,1);
M4_ = [M4(:,1) M4(:,2)-base4];
M5_ = [M5(:,1) M5(:,2)-base5];
M6_ = [M6(:,1) M6(:,2)-base6];
M7_ = [M7(:,1) M7(:,2)-base7];
M8_ = [M8(:,1) M8(:,2)-base8];
M9_ = [M9(:,1) M9(:,2)-base9];
M10_ = [M10(:,1) M10(:,2)-base10];
M11_ = [M11(:,1) M11(:,2)-base11];
M11_(M11_(:,1)>139 & M11_(:,1)<150,2) = M11_(M11_(:,1)>94 & M11_(:,1)<=105,2);
M12_ = [M12(:,1) M12(:,2)-base12];
M12_(M12_(:,1)>232 & M12_(:,1)<250,2) = M12_(M12_(:,1)>185 & M12_(:,1)<203,2);


%total energy consumed
mean(M1_(:,2))*4.2*max(M1_(:,1))/1000
mean(M2_(:,2))*4.2*max(M2_(:,1))/1000
mean(M3_(:,2))*4.2*max(M3_(:,1))/1000
mean(M4_(:,2))*4.2*max(M4_(:,1))/1000
mean(M5_(:,2))*4.2*max(M5_(:,1))/1000
mean(M6_(:,2))*4.2*max(M6_(:,1))/1000
mean(M7_(:,2))*4.2*max(M7_(:,1))/1000
mean(M8_(:,2))*4.2*max(M8_(:,1))/1000
%mean(M9_(:,2))*4.2*max(M9_(:,1))/1000
%mean(M10_(:,2))*4.2*max(M10_(:,1))/1000
mean(M11_(:,2))*4.2*max(M11_(:,1))/1000
mean(M12_(:,2))*4.2*max(M12_(:,1))/1000

%compute oracle energy consumption as a function of time
V = 3.9;
% P_rx_1 = (mean(M1(M1(:,1)>5 & M1(:,1)<30,2))-base1)*V;
% P_rx_2 = (mean(M2(M2(:,1)>5 & M2(:,1)<30,2))-base2)*V;
P_rx_3 = (mean(M3(M3(:,1)>47 & M3(:,1)<62,2))-base3)*V;
P_rx_4 = (mean(M4(M4(:,1)>134 & M4(:,1)<141,2))-base4)*V;
% P_rx_5 = (mean(M5(M5(:,1)>5 & M5(:,1)<30,2))-base5)*V;
% P_rx_6 = (mean(M6(M6(:,1)>5 & M6(:,1)<30,2))-base6)*V;
P_rx_7 = (mean(M7(M7(:,1)>53 & M7(:,1)<58,2))-base7)*V;
P_rx_8 = (mean(M8(M8(:,1)>184.6 & M8(:,1)<186.5,2))-base8)*V;
% P_rx_9 = (mean(M9(M9(:,1)>5 & M9(:,1)<30,2))-base9)*V;
% P_rx_10 = (mean(M10(M10(:,1)>5 & M10(:,1)<30,2))-base10)*V;
P_rx_11 = (mean(M11(M11(:,1)>5 & M11(:,1)<30,2))-base11)*V;
P_rx_12 = (mean(M12(M12(:,1)>125 & M12(:,1)<128,2))-base12)*V;

P_tail_lte = (mean(M11(M11(:,1)>141 & M11(:,1)<149,2))-base11)*V;
%P_tail_lte2 = mean(M12(M12(:,1)>130 & M12(:,1)<138,2))-base12;
t_tail_lte = 10;
P_tail_3g_M3 = (mean(M3(M3(:,1)>63 & M3(:,1)<66,2))-base3)*V;
P_tail_3g_M4 = (mean(M4(M4(:,1)>143 & M4(:,1)<147,2))-base4)*V;
t_tail_3g = 5;
E_tail_wifi_M7 = (60.2-58.2)*(mean(M7(M7(:,1)>58.2 & M7(:,1)<60.2,2))-base7)*V;
E_tail_wifi_M8 = (188.6-186.6)*(mean(M8(M8(:,1)>186.6 & M8(:,1)<188.6,2))-base8)*V;

r_s_long = 621400/8;
r_s_short = 574008/8;
%d_short = 198;
d_short = 197;
d_long = 399;

%btc_lte_short = 4700000/8;
btc_lte_short = d_short*r_s_short/30;
%btc_wifi_short = 16120000/8;
btc_wifi_short = 140*r_s_short/(58.2-52.75);
%btc_3g_short = 4000000/8;
btc_3g_short = 198*r_s_short/17.5;
btc_lte_long = 14830000/8;
%btc_lte_long = 10000000/8;
%btc_lte_long = 129*r_s_long/5.3
btc_wifi_long = 20770000/8;
btc_3g_long = 6970000/8;

%wifi
E_oracle7 = [M7(M7(:,1)<d_short,1) M7(M7(:,1)<d_short,1)*r_s_short/btc_wifi_short*P_rx_7+E_tail_wifi_M7];
E_oracle7 = [E_oracle7; [M7(M7(:,1)>=d_short,1) zeros(length(M7(M7(:,1)>=d_short,1)),1)+E_oracle7(end)]];

E_oracle8 = [M8(M8(:,1)<d_long,1) M8(M8(:,1)<d_long,1)*r_s_long/btc_wifi_long*P_rx_8+E_tail_wifi_M8];
E_oracle8 = [E_oracle8; [M8(M8(:,1)>=d_long,1) zeros(length(M8(M8(:,1)>=d_long,1)),1)+E_oracle8(end)]];

%3g
E_oracle3 = [M3_(M3_(:,1)<d_short,1) M3_(M3_(:,1)<d_short,1)*r_s_short/btc_3g_short*P_rx_3+P_tail_3g_M3*t_tail_3g];
%E_oracle3 = [M3_(M3_(:,1)<d_short,1) M3_(M3_(:,1)<d_short,1)*r_s_short/btc_3g_short*P_rx_3];
E_oracle3 = [E_oracle3; [M3_(M3_(:,1)>=d_short,1) zeros(length(M3_(M3_(:,1)>=d_short,1)),1)+E_oracle3(end)]];

E_oracle4 = [M4(M4(:,1)<d_long,1) M4(M4(:,1)<d_long,1)*r_s_long/btc_3g_long*P_rx_4+P_tail_3g_M4*t_tail_3g];
E_oracle4 = [E_oracle4; [M4(M4(:,1)>=d_long,1) zeros(length(M4(M4(:,1)>=d_long,1)),1)+E_oracle4(end)]];

%lte
E_oracle11 = [M11(M11(:,1)<d_short,1) M11(M11(:,1)<d_short,1)*r_s_short/btc_lte_short*P_rx_11+P_tail_lte*t_tail_lte];
E_oracle11 = [E_oracle11; [M11(M11(:,1)>=d_short,1) zeros(length(M11(M11(:,1)>=d_short,1)),1)+E_oracle11(end)]];

E_oracle12 = [M12(M12(:,1)<d_long,1) M12(M12(:,1)<d_long,1)*r_s_long/btc_lte_long*P_rx_12+P_tail_lte*t_tail_lte];
E_oracle12 = [E_oracle12; [M12(M12(:,1)>=d_long,1) zeros(length(M12(M12(:,1)>=d_long,1)),1)+E_oracle12(end)]];



%plot figures of energy waste as a function of time
%wifi short video
figure;
hold on;
%plot(M7_(:,1),cumsum(M7_(:,2)*V*0.0002));
%plot(E_oracle7(:,1),E_oracle7(:,2),'red');
%plot(M7_(M7_(:,1)<=d_short,1)./M7_(find(M7_(:,1)<=d_short,1,'last'),1),cumsum(M7_(M7_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(M7_(:,1)<=d_short,2));
%plot(M5_(M7_(:,1)<=d_short,1)./M5_(find(M7_(:,1)<=d_short,1,'last'),1),cumsum(M5_(M7_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(M7_(:,1)<=d_short,2),'red','LineStyle','--');
Y=[cumsum(M7_(M7_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(M7_(:,1)<=d_short,2) cumsum(M5_(M7_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(M7_(:,1)<=d_short,2)];
[ax, h1, h2] = plotyy(M7_(M7_(:,1)<=d_short,1)./M7_(find(M7_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
%set(h2,'LineStyle','--');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'energy waste compared to oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','default YouTube app','audience retention','Location','Best');

%wifi long video
figure;
hold on;
%plot(M8_(:,1),cumsum(M8_(:,2)*V*0.0002));
%plot(E_oracle8(:,1),E_oracle8(:,2),'red');
%plot(M8_(M8_(:,1)<=d_long,1)./M8_(find(M8_(:,1)<=d_long,1,'last'),1),cumsum(M8_(M8_(:,1)<=d_long,2)*V*0.0002)-E_oracle8(M8_(:,1)<=d_long,2));
%plot(M6_(M8_(:,1)<=d_long,1)./M6_(find(M8_(:,1)<=d_long,1,'last'),1),cumsum(M6_(M8_(:,1)<=d_long,2)*V*0.0002)-E_oracle8(M8_(:,1)<=d_long,2),'red','LineStyle','--');
Y=[cumsum(M8_(M8_(:,1)<=d_long,2)*V*0.0002)-E_oracle8(M8_(:,1)<=d_long,2) cumsum(M6_(M8_(:,1)<=d_long,2)*V*0.0002)-E_oracle8(M8_(:,1)<=d_long,2)];
[ax, h1, h2] = plotyy(M8_(M8_(:,1)<=d_long,1)./M8_(find(M8_(:,1)<=d_long,1,'last'),1), Y/1000, A_c2(1,:)/A_c2(1,end), A_c2(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'energy waste compared to oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','default YouTube app','audience retention','Location','Best');

%3G short video
figure;
hold on;
%plot(M3_(:,1),cumsum(M3_(:,2)*V*0.0002));
%plot(E_oracle3(:,1),E_oracle3(:,2),'red');
%plot(M3_(M3_(:,1)<=d_short,1)./M3_(find(M3_(:,1)<=d_short,1,'last'),1),cumsum(M3_(M3_(:,1)<=d_short,2)*V*0.0002)-E_oracle3(M3_(:,1)<=d_short,2));
%plot(M1_(M3_(:,1)<=d_short,1)./M1_(find(M3_(:,1)<=d_short,1,'last'),1),cumsum(M1_(M3_(:,1)<=d_short,2)*V*0.0002)-E_oracle3(M3_(:,1)<=d_short,2),'red','LineStyle','--');
Y=[cumsum(M3_(M3_(:,1)<=d_short,2)*V*0.0002)-E_oracle3(M3_(:,1)<=d_short,2) cumsum(M1_(M3_(:,1)<=d_short,2)*V*0.0002)-E_oracle3(M3_(:,1)<=d_short,2)];
[ax, h1, h2] = plotyy(M3_(M3_(:,1)<=d_short,1)./M3_(find(M3_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'energy waste compared to oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','default YouTube app','audience retention','Location','Best');

%3G long video
figure;
hold on;
%plot(M4_(M4_(:,1)<=d_long,1)./M4_(find(M4_(:,1)<=d_long,1,'last'),1),cumsum(M4_(M4_(:,1)<=d_long,2)*V*0.0002)-E_oracle4(M4_(:,1)<=d_long,2));
%plot(M2_(M4_(:,1)<=d_long,1)./M2_(find(M4_(:,1)<=d_long,1,'last'),1),cumsum(M2_(M4_(:,1)<=d_long,2)*V*0.0002)-E_oracle4(M4_(:,1)<=d_long,2),'red','LineStyle','--');
Y=[cumsum(M4_(M4_(:,1)<=d_long,2)*V*0.0002)-E_oracle4(M4_(:,1)<=d_long,2) cumsum(M2_(M4_(:,1)<=d_long,2)*V*0.0002)-E_oracle4(M4_(:,1)<=d_long,2)];
[ax, h1, h2] = plotyy(M4_(M4_(:,1)<=d_long,1)./M4_(find(M4_(:,1)<=d_long,1,'last'),1), Y/1000, A_c2(1,:)/A_c2(1,end), A_c2(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'energy waste compared to oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','default YouTube app','audience retention','Location','Best');

%LTE short video
figure;
hold on;
%plot(M11_(:,1),cumsum(M11_(:,2)*V*0.0002));
%plot(E_oracle11(:,1),E_oracle11(:,2),'red');
%plot(M11_(M11_(:,1)<=d_short,1)./M11_(find(M11_(:,1)<=d_short,1,'last'),1),cumsum(M11_(M11_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(M11_(:,1)<=d_short,2));
%plot(M9_(M11_(:,1)<=d_short,1)./M9_(find(M11_(:,1)<=d_short,1,'last'),1),cumsum(M9_(M11_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(M11_(:,1)<=d_short,2),'red','LineStyle','--');
Y=[cumsum(M11_(M11_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(M11_(:,1)<=d_short,2) cumsum(M9_(M11_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(M11_(:,1)<=d_short,2)];
[ax, h1, h2] = plotyy(M11_(M11_(:,1)<=d_short,1)./M11_(find(M11_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'energy waste compared to oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','default YouTube app','audience retention','Location','Best');

%LTE long video
figure;
hold on;
%plot(M12_(:,1),cumsum(M12_(:,2)*V*0.0002));
%plot(E_oracle12(:,1),E_oracle12(:,2),'red');
%plot(M12_(M12_(:,1)<=d_long,1)./M12_(find(M12_(:,1)<=d_long,1,'last'),1),cumsum(M12_(M12_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(M12_(:,1)<=d_long,2));
%plot(M10_(M12_(:,1)<=d_long,1)./M10_(find(M12_(:,1)<=d_long,1,'last'),1),cumsum(M10_(M12_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(M12_(:,1)<=d_long,2),'red','LineStyle','--');
Y=[cumsum(M12_(M12_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(M12_(:,1)<=d_long,2) cumsum(M10_(M12_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(M12_(:,1)<=d_long,2)];
[ax, h1, h2] = plotyy(M12_(M12_(:,1)<=d_long,1)./M12_(find(M12_(:,1)<=d_long,1,'last'),1), Y/1000, A_c2(1,:)/A_c2(1,end), A_c2(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'energy waste compared to oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','default YouTube app','audience retention','Location','Best');




% %plotting avg power draw as a function of time
% %short video over wifi
% figure;
% hold on;
% C = cumsum(M5_(:,2)*0.0002)./M5_(:,1);
% plot(M5_(10:end,1)./M5_(end,1),C(10:end),'black')
% C = cumsum(M7_(:,2)*0.0002)./M7_(:,1);
% plot(M7_(10:end,1)./M7_(end,1),C(10:end),'black','LineStyle','--')
% set(gca,'XLim',[0 1]);
% set(gca,'FontSize',20);
% xlabel('fraction of video watched (%)');
% ylabel('average current draw (mA)');
% legend('Android default','StreamThrottler')
% 
% %short video over 3g
% figure;
% hold on;
% C = cumsum(M1_(:,2)*0.0002)./M1_(:,1);
% plot(M1_(10:end,1)./M1_(end,1),C(10:end),'black')
% C = cumsum(M3_(:,2)*0.0002)./M3_(:,1);
% plot(M3_(10:end,1)./M3_(end,1),C(10:end),'black','LineStyle','--')
% set(gca,'XLim',[0 1]);
% set(gca,'FontSize',20);
% xlabel('fraction of video watched (%)');
% ylabel('average current draw (mA)');
% legend('Android default','StreamThrottler')
% 
% %short video over LTE
% figure;
% hold on;
% %C = cumsum(M1_(:,2)*0.0002)./M1_(:,1);
% %plot(M1_(10:end,1)./M1_(end,1),C(10:end),'black')
% C = cumsum(M11_(:,2)*0.0002)./M11_(:,1);
% plot(M11_(10:end,1)./M11_(end,1),C(10:end),'black','LineStyle','--')
% set(gca,'XLim',[0 1]);
% set(gca,'FontSize',20);
% xlabel('fraction of video watched (%)');
% ylabel('average current draw (mA)');
% legend('Android default','StreamThrottler')
% 
% %long video over wifi
% figure;
% hold on;
% C = cumsum(M6_(:,2)*0.0002)./M6_(:,1);
% plot(M6_(10:end,1)./M6_(end,1),C(10:end),'black')
% C = cumsum(M8_(:,2)*0.0002)./M8_(:,1);
% plot(M8_(10:end,1)./M8_(end,1),C(10:end),'black','LineStyle','--')
% set(gca,'XLim',[0 1]);
% set(gca,'FontSize',20);
% xlabel('fraction of video watched (%)');
% ylabel('average current draw (mA)');
% legend('Android default','StreamThrottler')
% 
% %long video over 3g
% figure;
% hold on;
% C = cumsum(M2_(:,2)*0.0002)./M2_(:,1);
% plot(M2_(10:end,1)./M2_(end,1),C(10:end),'black')
% C = cumsum(M4_(:,2)*0.0002)./M4_(:,1);
% plot(M4_(10:end,1)./M4_(end,1),C(10:end),'black','LineStyle','--')
% set(gca,'XLim',[0 1]);
% set(gca,'FontSize',20);
% xlabel('fraction of video watched (%)');
% ylabel('average current draw (mA)');
% legend('Android default','StreamThrottler')
% 
% %long video over LTE
% figure;
% hold on;
% %C = cumsum(M2_(:,2)*0.0002)./M2_(:,1);
% %plot(M2_(10:end,1)./M2_(end,1),C(10:end),'black')
% C = cumsum(M12_(:,2)*0.0002)./M12_(:,1);
% plot(M12_(10:end,1)./M12_(end,1),C(10:end),'black','LineStyle','--')
% set(gca,'XLim',[0 1]);
% set(gca,'FontSize',20);
% xlabel('fraction of video watched (%)');
% ylabel('average current draw (mA)');
% legend('Android default','StreamThrottler')
