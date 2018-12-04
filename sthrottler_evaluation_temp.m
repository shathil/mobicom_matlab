%% ON-OFF-M (Without Throttling and using Fast Caching


M1T=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/3G199_fast.csv',1,0,[1 0 1018545 1]); 
M2T=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/3G399_fast.csv',1,0,[1 0 2000000 1]);
M3W=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/WIFI199_fast.csv',1,0,[1 0 1018545 1]); 
M4W=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/WIFI399_fast.csv',1,0,[1 0 2000000 1]);
M5L=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/LTE199_fast.csv',1,0,[1 0 1018545 1]); 
M6L=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/LTE399_fast.csv',1,0,[1 0 2000000 1]); 
M7W=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/WIFI199_ON-OFF-M.csv',1,0,[1 0 1018545 1]);
M8W=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/WIFI399_ON-OFF-M.csv',1,0,[1 0 1990000 1]);
M9T=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/3G199_ON-OFF-M.csv',1,0,[1 0 1018545 1]);
M10T=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/3G399_ON-OFF-M.csv',1,0,[1 0 2000000 1]);
M11L=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/LTE199_ON-OFF-M.csv',1,0,[1 0 1018545 1]);
M12L=csvread('C:\Users\mhoque\Dropbox\MobicomMeasurement/LTE399_ON-OFF-M.csv',1,0,[1 0 2000000 1]);

%% StreamThrottler Traces
MS_WI1=csvread('C:\Users\mhoque\Dropbox\StreamThrottlerNewMeasure\I9305_198_Wifi.csv',1,0,[1 0 1055250 1]);
MS_WI3=csvread('C:\Users\mhoque\Dropbox\StreamThrottlerNewMeasure\I9305_399_Wifi_two.csv',1,0,[1 0 2015295 1]);
MS_T1=csvread('C:\Users\mhoque\Dropbox\StreamThrottlerNewMeasure\9305_3G_199.csv',1,0,[1 0 1018545 1]);
MS_T3=csvread('C:\Users\mhoque\Dropbox\StreamThrottlerNewMeasure\9305_3G_399.csv',1,0,[1 0 2000000 1]);
MS_L1=csvread('C:\Users\mhoque\Dropbox\StreamThrottlerNewMeasure\I9305_199_LTE1.csv',1,0,[1 0 1080060 1]);
MS_L3=csvread('C:\Users\mhoque\Dropbox\StreamThrottlerNewMeasure\I9305_399_LTE1.csv',1,0,[1 0 2015295 1]);

%% Loading Audience Retention %%%%

Last = dlmread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\miika\miika_ar_last.txt');
D_m = dlmread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\miika\miika_durations.txt');
M = csvread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\miika\miika8_awked.txt');
A_m7 = preprocess_retention(M,D_m(7),Last(7));

Last = dlmread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\cagatay\cagatay_ar_last.txt');
D_c = dlmread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\cagatay\cagatay_durations.txt');
M = csvread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\cagatay\cagatay2_awked.txt');
A_c2 = preprocess_retention(M,D_c(2),Last(2));


%% Calculating base line energy
M5L(40001:90000,2)=MS_L3(640001:690000,2);
M6L(45001:95000,2)=MS_L3(640001:690000,2);

M11L(20001:70000,2)=MS_L3(640001:690000,2);
M11L(335001:385000,2)=MS_L3(640001:690000,2);
M11L(655001:705000,2)=MS_L3(640001:690000,2);
M11L(960001:1010000,2)=MS_L3(640001:690000,2);

M12L(20001:70000,2)=MS_L3(640001:690000,2);
M12L(315001:365000,2)=MS_L3(640001:690000,2);
M12L(620001:670000,2)=MS_L3(640001:690000,2);
M12L(930001:980000,2)=MS_L3(640001:690000,2);
M12L(1235001:1285000,2)=MS_L3(640001:690000,2);
M12L(1545001:1595000,2)=MS_L3(640001:690000,2);
M12L(1845001:1895000,2)=MS_L3(640001:690000,2);



base_w1=mean(MS_WI1(MS_WI1(:,1)>65 & MS_WI1(:,1)<204,2));
base_w3=mean(MS_WI3(MS_WI3(:,1)>330 & MS_WI3(:,1)<392,2));
base_t1=mean(MS_T1(MS_T1(:,1)>100 & MS_T1(:,1)<240,2));
base_t3=mean(MS_T3(MS_T3(:,1)>230 & MS_T3(:,1)<232,2));
base_l1=mean(MS_L1(MS_L1(:,1)>45 & MS_L1(:,1)<135,2));
base_l3=mean(MS_L3(MS_L3(:,1)>280 & MS_L3(:,1)<380,2));

base1 = mean(M1T(M1T(:,1)>60 & M1T(:,1)<100,2));
base2 = mean(M2T(M2T(:,1)>150 & M2T(:,1)<200,2));
base3 = mean(M3W(M3W(:,1)>20 & M3W(:,1)<50,2));
base4 = mean(M4W(M4W(:,1)>50 & M4W(:,1)<100,2));
base5 = mean(M5L(M5L(:,1)>50 & M5L(:,1)<100,2));
base6 = mean(M6L(M6L(:,1)>150 & M6L(:,1)<200,2));
base7 = mean(M7W(M7W(:,1)>95 & M7W(:,1)<115,2));
base8 = mean(M8W(M8W(:,1)>135 & M8W(:,1)<155,2));
base9 = mean(M9T(M9T(:,1)>20 & M9T(:,1)<50,2));
base10 = mean(M10T(M10T(:,1)>156 & M10T(:,1)<174,2));
base11 = mean(M11L(M11L(:,1)>150 & M11L(:,1)<185,2));
%base11 = base_l1-22;
base12 = mean(M12L(M12L(:,1)>265 & M12L(:,1)<295,2));
%base12 = base_l3-0;

%% Processing the power traces ON-OFF-M/Fast caching


Lte_Tail_Current= mean(MS_L3(MS_L3(:,1)>128 & MS_L3(:,1)<138,2));
I_tail_lte = (mean(MS_L1(MS_L1(:,1)>141 & MS_L1(:,1)<149,2)));

%M5L(M5L(:,1)>8 & M5L(:,1)<=18,2) = I_tail_lte;
%M6L(M6L(:,1)>9 & M6L(:,1)<=19,2) = I_tail_lte;



%M11L(M11L(:,1)>4 & M11L(:,1)<=14,2) = I_tail_lte;
%M11L(M11L(:,1)>67 & M11L(:,1)<=77,2) = I_tail_lte;
%M11L(M11L(:,1)>131 & M11L(:,1)<=141,2) = I_tail_lte;
%M11L(M11L(:,1)>192 & M11L(:,1)<=202,2) = I_tail_lte;



%% Processing ON-OFF-M (without Throttling)/Fast Caching %%%%%%%%%%%
M1_ = [M1T(:,1) M1T(:,2)-base1];
%M1_(M1_(:,1)>=196 & M1_(:,1)<=200,2) = M1_(M1_(:,1)==176 & M1_(:,1)<180,2);
M2_ = [M2T(:,1) M2T(:,2)-base2];
M2_(M2_(:,1)>=128 & M2_(:,1)<=138,2) = M2_(M2_(:,1)==150 & M2_(:,1)<160,2);
M3_ = [M3W(:,1) M3W(:,2)-base3];
M3_(M3_(:,1)>=51 & M3_(:,1)<=52,2) = M3_(M3_(:,1)==91 & M3_(:,1)<92,2);
M3_(M3_(:,1)>=56.5 & M3_(:,1)<=57,2) = M3_(M3_(:,1)==91 & M3_(:,1)<92,2);
M3_(M3_(:,1)>=111 & M3_(:,1)<=112,2) = M3_(M3_(:,1)==91 & M3_(:,1)<92,2);
M3_(M3_(:,1)>=156.8 & M3_(:,1)<=157.2,2) = M3_(M3_(:,1)==91 & M3_(:,1)<92,2);
M3_(M3_(:,1)>=92.2 & M3_(:,1)<=93.2,2) = M3_(M3_(:,1)==91 & M3_(:,1)<92,2);
M3_(M3_(:,1)>=167.2 & M3_(:,1)<=168.1,2) = M3_(M3_(:,1)==91 & M3_(:,1)<92,2);
M3_(M3_(:,1)>=171 & M3_(:,1)<=171.3,2) = M3_(M3_(:,1)==91 & M3_(:,1)<92,2);

M4_ = [M4W(:,1) M4W(:,2)-base4];
M5_ = [M5L(:,1) M5L(:,2)-base5];
M6_ = [M6L(:,1) M6L(:,2)-base6];
M6_(M6_(:,1)>=110 & M6_(:,1)<=121,2) = M6_(M6_(:,1)==150 & M6_(:,1)<161,2);
M6_(M6_(:,1)>=352 & M6_(:,1)<=363,2) = M6_(M6_(:,1)==150 & M6_(:,1)<161,2);
M7_ = [M7W(:,1) M7W(:,2)-base7];
M7_(M7_(:,1)>=32 & M7_(:,1)<=33,2) = M7_(M7_(:,1)==34 & M7_(:,1)<35,2);
M7_(M7_(:,1)>=92.2 & M7_(:,1)<=93,2) = M7_(M7_(:,1)==34 & M7_(:,1)<35,2);
M7_(M7_(:,1)>=152 & M7_(:,1)<=153,2) = M7_(M7_(:,1)==34 & M7_(:,1)<35,2);
M7_(M7_(:,1)>=154.8 & M7_(:,1)<=155.3,2) = M7_(M7_(:,1)==34.8 & M7_(:,1)<35.3,2);

M8_ = [M8W(:,1) M8W(:,2)-base8];
M9_ = [M9T(:,1) M9T(:,2)-base9];
M9_(M9_(:,1)>=169 & M9_(:,1)<=178,2) = M9_(M9_(:,1)==20 & M9_(:,1)<29,2);
M10_ = [M10T(:,1) M10T(:,2)-base10];
M10_(M10_(:,1)>=86 & M10_(:,1)<=96,2) = M10_(M10_(:,1)==156 & M10_(:,1)<166,2);
M11_ = [M11L(:,1) M11L(:,2)-base11];
M12_ = [M12L(:,1) M12L(:,2)-base12];
%M12_(M12_(:,1)>11 & M12_(:,1)<=21,2) = M12_(M12_(:,1)==265 & M12_(:,1)<275,2);
M12_(M12_(:,1)>=92 & M12_(:,1)<=103,2) = M12_(M12_(:,1)==265 & M12_(:,1)<276,2);
M12_(M12_(:,1)>=161 & M12_(:,1)<=173,2) = M12_(M12_(:,1)==265 & M12_(:,1)<277,2);

%% Processing StreamThrottler %%%%%%%%%%%

%Wifi
MSW1_ = [MS_WI1(:,1) MS_WI1(:,2)-base_w1];
MSW3_ = [MS_WI3(:,1) MS_WI3(:,2)-base_w3];
%MSW1_(MSW1_(:,1)>16.2 & MSW1_(:,1)<20,2) = MSW1_(MSW1_(:,1)==94 & MSW1_(:,1)<=105,2);
MSW1_(MSW1_(:,1)>121 & MSW1_(:,1)<122.8,2) = MSW1_(MSW1_(:,1)==94 & MSW1_(:,1)<=105,2);
%MSW1_(MSW1_(:,1)>134.5 & MSW1_(:,1)<136.8,2) = MSW1_(MSW1_(:,1)==94 & MSW1_(:,1)<=105,2);
MSW1_(MSW1_(:,1)>150.8 & MSW1_(:,1)<152,2) = MSW1_(MSW1_(:,1)==94 & MSW1_(:,1)<=105,2);
%MSW1_(MSW1_(:,1)>168.5 & MSW1_(:,1)<169,2) = MSW1_(MSW1_(:,1)==94 & MSW1_(:,1)<=105,2);

%3G
MST1_ = [MS_T1(:,1) MS_T1(:,2)-base_t1];
MST1_(MST1_(:,1)<45,:) = [];
MST1_(:,1) = MST1_(:,1)-MST1_(1,1);
MST3_= [MS_T3(:,1) MS_T3(:,2)-base_t3];

%LTE
MSL1_ = [MS_L1(:,1) MS_L1(:,2)-base_l1];
MSL1_(MSL1_(:,1)>139 & MSL1_(:,1)<150,2) = MSL1_(MSL1_(:,1)>94 & MSL1_(:,1)<=105,2);
MSL3_ = [MS_L3(:,1) MS_L3(:,2)-base_l3];
MSL3_(MSL3_(:,1)>232 & MSL3_(:,1)<250,2) = MSL3_(MSL3_(:,1)>185 & MSL3_(:,1)<203,2);


%% calculating RX power

V = 3.9;
P_rx_1 = (mean(M1T(M1T(:,1)>0 & M1T(:,1)<=8,2))-base1)*V; %3G
P_rx_2 = (mean(M2T(M2T(:,1)>0 & M2T(:,1)<=22,2))-base2)*V;
P_rx_3 = (mean(M3W(M3W(:,1)>0 & M3W(:,1)<=8,2))-base3)*V; %WIFI
P_rx_4 = (mean(M4W(M4W(:,1)>0 & M4W(:,1)<=17,2))-base4)*V;
P_rx_5 = (mean(M5L(M5L(:,1)>0 & M5L(:,1)<=8,2))-base5)*V; % LTE
P_rx_6 = (mean(M6L(M6L(:,1)>0 & M6L(:,1)<=9,2))-base6)*V;
P_rx_7 = (mean(M7W(M7W(:,1)>2 & M7W(:,1)<=4,2))-base7)*V; %WIFI
P_rx_8 = (mean(M8W(M8W(:,1)>2 & M8W(:,1)<=4,2))-base8)*V;
P_rx_9 = (mean(M9T(M9T(:,1)>132.5 & M9T(:,1)<138.5,2))-base9)*V; %3G
P_rx_10 = (mean(M10T(M10T(:,1)>264 & M10T(:,1)<269.5,2))-base10)*V;
P_rx_11 = (mean(M11L(M11L(:,1)>126.6 & M11L(:,1)<131.2,2))-base11)*V; %LTE
P_rx_12 = (mean(M12L(M12L(:,1)>125 & M12L(:,1)<128,2))-base12)*V;


P_rx_msw1 = (mean(MS_WI1(MS_WI1(:,1)>53 & MS_WI1(:,1)<58,2))-base_w1)*V;
P_rx_msw3 = (mean(MS_WI3(MS_WI3(:,1)>184.6 & MS_WI3(:,1)<186.5,2))-base_w3)*V;

P_rx_mst1 = (mean(MS_T1(MS_T1(:,1)>47 & MS_T1(:,1)<62,2))-base_t1)*V;
P_rx_mst3 = (mean(MS_T3(MS_T3(:,1)>134 & MS_T3(:,1)<141,2))-base_t3)*V;

P_rx_msl1 = (mean(MS_L1(MS_L1(:,1)>5 & MS_L1(:,1)<30,2))-base_l1)*V;
%P_rx_msl1 = P_rx_11;
P_rx_msl3 = (mean(MS_L3(MS_L3(:,1)>125 & MS_L3(:,1)<128,2))-base_l3)*V;




%% tail energy
P_tail_lte = (mean(MS_L1(MS_L1(:,1)>141 & MS_L1(:,1)<149,2))-base_l1)*V;
t_tail_lte = 10;
P_tail_3g_mst1 = (mean(MS_T1(MS_T1(:,1)>63 & MS_T1(:,1)<66,2))-base_t1)*V;
P_tail_3g_mst3 = (mean(MS_T3(MS_T3(:,1)>143 & MS_T3(:,1)<147,2))-base_t3)*V;
t_tail_3g = 5;
E_tail_wifi_msw1 = (60.2-58.2)*(mean(MS_WI1(MS_WI1(:,1)>58.2 & MS_WI1(:,1)<60.2,2))-base_w1)*V;
E_tail_wifi_msw3 = (188.6-186.6)*(mean(MS_WI3(MS_WI3(:,1)>186.6 & MS_WI3(:,1)<188.6,2))-base_w3)*V;

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

%btc_lte_short = d_short*r_s_short/10;
%btc_lte_short = 14830000/8;
%btc_wifi_short = 140*r_s_short/(58.2-52.75);
%btc_3g_short = 198*r_s_short/17.5;
%btc_3g_short_old = 198*r_s_short/11.5;
%btc_lte_long = 14830000/8;
%btc_lte_long = 25830000/8;
%btc_wifi_long = 20770000/8;
%btc_3g_long = 6970000/8;

%% Energy for oracle
%wifi
E_oracle7 = [MS_WI1(MS_WI1(:,1)<d_short,1) MS_WI1(MS_WI1(:,1)<d_short,1)*r_s_short/btc_wifi_short*P_rx_msw1+E_tail_wifi_msw1];
E_oracle7 = [E_oracle7; [MS_WI1(MS_WI1(:,1)>=d_short,1) zeros(length(MS_WI1(MS_WI1(:,1)>=d_short,1)),1)+E_oracle7(end)]];

E_oracle8 = [MS_WI3(MS_WI3(:,1)<d_long,1) MS_WI3(MS_WI3(:,1)<d_long,1)*r_s_long/btc_wifi_long*P_rx_msw3+E_tail_wifi_msw3];
E_oracle8 = [E_oracle8; [MS_WI3(MS_WI3(:,1)>=d_long,1) zeros(length(MS_WI3(MS_WI3(:,1)>=d_long,1)),1)+E_oracle8(end)]];

%3G

E_oracle4 = [MS_T3(MS_T3(:,1)<d_long,1) MS_T3(MS_T3(:,1)<d_long,1)*r_s_long/btc_3g_long*P_rx_mst3+P_tail_3g_mst3*t_tail_3g];
E_oracle4 = [E_oracle4; [MS_T3(MS_T3(:,1)>=d_long,1) zeros(length(MS_T3(MS_T3(:,1)>=d_long,1)),1)+E_oracle4(end)]];

%LTE
%E_oracle11 = [MS_L1(MS_L1(:,1)<d_short,1) MS_L1(MS_L1(:,1)<d_short,1)*r_s_short/btc_lte_short*P_rx_msl1+P_tail_lte*t_tail_lte];
%E_oracle11 = [E_oracle11; [MS_L1(MS_L1(:,1)>=d_short,1) zeros(length(MS_L1(MS_L1(:,1)>=d_short,1)),1)+E_oracle11(end)]];
E_oracle11 = [M5L(M5L(:,1)<d_short,1) M5L(M5L(:,1)<d_short,1)*r_s_short/btc_lte_short*P_rx_5+P_tail_lte*t_tail_lte];
E_oracle11 = [E_oracle11; [M5L(M5L(:,1)>=d_short,1) zeros(length(M5L(M5L(:,1)>=d_short,1)),1)+E_oracle11(end)]];

E_oracle12 = [MS_L3(MS_L3(:,1)<d_long,1) MS_L3(MS_L3(:,1)<d_long,1)*r_s_long/btc_lte_long*P_rx_msl3+P_tail_lte*t_tail_lte];
E_oracle12 = [E_oracle12; [MS_L3(MS_L3(:,1)>=d_long,1) zeros(length(MS_L3(MS_L3(:,1)>=d_long,1)),1)+E_oracle12(end)]];






%% plot figures of energy waste as a function of time
%% wifi short video
%figure
%Y=[cumsum(MSW1_(MSW1_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(MSW1_(:,1)<=d_short,2) cumsum(M7_(MSW1_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(MSW1_(:,1)<=d_short,2)];
%[ax, h1, h2] = plotyy(MSW1_(MSW1_(:,1)<=d_short,1)./MSW1_(find(MSW1_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
%set(ax(2),'ycolor','black');
%set(h1(2),'LineStyle','--');
%set(h2,'Marker','x');

%curYLim = get(ax(1),'YLim');
%set(ax(1),'YLim',[0 curYLim(2)]);
%set(ax(2),'YLim',[0 1]);
%set(ax,'FontSize',20);
%xlabel('fraction of video watched (%)');
%ylabel(ax(1),'energy waste compared to oracle (J)');
%ylabel(ax(2),'audience retention');
%legend('StreamThrottler','default YouTube app','audience retention','Location','Best');

%figure;
%Y=[cumsum(MSW1_(MSW1_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(MSW1_(:,1)<=d_short,2) cumsum(M3_(MSW1_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(MSW1_(:,1)<=d_short,2)];
%[ax, h1, h2] = plotyy(MSW1_(MSW1_(:,1)<=d_short,1)./MSW1_(find(MSW1_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
%set(ax(2),'ycolor','black');
%set(h1(2),'LineStyle','--');
%set(h2,'Marker','x');

%curYLim = get(ax(1),'YLim');
%set(ax(1),'YLim',[0 curYLim(2)]);
%set(ax(2),'YLim',[0 1]);
%set(ax,'FontSize',20);
%xlabel('fraction of video watched (%)');
%ylabel(ax(1),'energy waste compared to oracle (J)');
%ylabel(ax(2),'audience retention');
%legend('StreamThrottler','default YouTube app','audience retention','Location','Best');

%% 3G short video
%btc_3g_short = 198*r_s_short/11.5;
E_oracle3 = [MST1_(MST1_(:,1)<d_short,1) MST1_(MST1_(:,1)<d_short,1)*r_s_short/btc_3g_short*P_rx_mst1+P_tail_3g_mst1*t_tail_3g];
E_oracle3 = [E_oracle3; [MST1_(MST1_(:,1)>=d_short,1) zeros(length(MST1_(MST1_(:,1)>=d_short,1)),1)+E_oracle3(end)]];

figure;
hold on;
Y=[cumsum(MST1_(MST1_(:,1)<=d_short,2)*V*0.0002)-E_oracle3(MST1_(:,1)<=d_short,2) cumsum(M1_(MST1_(:,1)<=d_short,2)*V*0.0002)-E_oracle3(MST1_(:,1)<=d_short,2)];
[ax, h1, h2] = plotyy(MST1_(MST1_(:,1)<=d_short,1)./MST1_(find(MST1_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
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


%btc_3g_short = 198*r_s_short/17.5;
E_oracle3 = [MST1_(MST1_(:,1)<d_short,1) MST1_(MST1_(:,1)<d_short,1)*r_s_short/btc_3g_short*P_rx_mst1+P_tail_3g_mst1*t_tail_3g];
E_oracle3 = [E_oracle3; [MST1_(MST1_(:,1)>=d_short,1) zeros(length(MST1_(MST1_(:,1)>=d_short,1)),1)+E_oracle3(end)]];

figure;
hold on;
Y=[cumsum(MST1_(MST1_(:,1)<=d_short,2)*V*0.0002)-E_oracle3(MST1_(:,1)<=d_short,2) cumsum(M9_(MST1_(:,1)<=d_short,2)*V*0.0002)-E_oracle3(MST1_(:,1)<=d_short,2)];
[ax, h1, h2] = plotyy(MST1_(MST1_(:,1)<=d_short,1)./MST1_(find(MST1_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'energy waste compared to oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','default YouTube app','audience retention','Location','Best');


%% LTE short video

%figure;
%hold on;
%Y=[cumsum(MSL1_(MSL1_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(MSL1_(:,1)<=d_short,2) cumsum(M5_(MSL1_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(MSL1_(:,1)<=d_short,2)];
%[ax, h1, h2] = plotyy(MSL1_(MSL1_(:,1)<=d_short,1)./MSL1_(find(MSL1_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
%set(ax(2),'ycolor','black');
%set(h1(2),'LineStyle','--');
%set(h2,'Marker','x');
%curYLim = get(ax(1),'YLim');
%set(ax(1),'YLim',[0 curYLim(2)]);
%set(ax(2),'YLim',[0 1]);
%set(ax,'FontSize',20);
%xlabel('fraction of video watched (%)');
%ylabel(ax(1),'energy waste compared to oracle (J)');
%ylabel(ax(2),'audience retention');
%legend('StreamThrottler','default YouTube app','audience retention','Location','Best');

figure;
hold on;
Y=[cumsum(M5_(M5_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(M5_(:,1)<=d_short,2) cumsum(M11_(M5_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(M5_(:,1)<=d_short,2)];
[ax, h1, h2] = plotyy(M5_(M5_(:,1)<=d_short,1)./M5_(find(M5_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
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


%% LTE long video

figure;
hold on;
Y=[cumsum(MSL3_(MSL3_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(MSL3_(:,1)<=d_long,2) cumsum(M6_(MSL3_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(MSL3_(:,1)<=d_long,2)];
[ax, h1, h2] = plotyy(MSL3_(MSL3_(:,1)<=d_long,1)./MSL3_(find(MSL3_(:,1)<=d_long,1,'last'),1), Y/1000, A_c2(1,:)/A_c2(1,end), A_c2(2,:));
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


figure;
hold on;
Y=[cumsum(MSL3_(MSL3_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(MSL3_(:,1)<=d_long,2) cumsum(M12_(MSL3_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(MSL3_(:,1)<=d_long,2)];
[ax, h1, h2] = plotyy(MSL3_(MSL3_(:,1)<=d_long,1)./MSL3_(find(MSL3_(:,1)<=d_long,1,'last'),1), Y/1000, A_c2(1,:)/A_c2(1,end), A_c2(2,:));
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

