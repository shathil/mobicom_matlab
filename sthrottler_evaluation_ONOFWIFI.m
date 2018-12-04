%% ON-OFF-M (Without Throttling and using Fast Caching


MW1F=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\WiFi_199_Fast_20M.csv',1,0,[1 0 989640 1]); 
MW1O=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\WiFi_199_ON_20M.csv',1,0,[1 0 989640 1]); 
MW1S=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\WiFi_199_ST_20M.csv',1,0,[1 0 989640 1]); 
MW1Y=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\YouTube_199_Wifi_1503.csv',1,0,[1 0 989640 1]); 

MW3F=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\WiFi_399_Fast_20M.csv',1,0,[1 0 1995000 1]); 
MW3O=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\WiFi_399_ON_20M.csv',1,0,[1 0 1995000 1]); 
MW3S=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\WiFi_399_ST_20M.csv',1,0,[1 0 1995000 1]); 
MW3Y=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\YouTube_399_WiFi_1503.csv',1,0,[1 0 1995000 1]); 



%% StreamThrottler Traces
%MS_L3=csvread('C:\Users\mhoque\Dropbox\StreamThrottlerNewMeasure\I9305_399_LTE1.csv',1,0,[1 0 2000000 1]);

%% Loading Audience Retention %%%%

Last = dlmread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\miika\miika_ar_last.txt');
D_m = dlmread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\miika\miika_durations.txt');
M = csvread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\miika\miika8_awked.txt');
A_m7 = preprocess_retention(M,D_m(7),Last(7));

Last = dlmread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\cagatay\cagatay_ar_last.txt');
D_c = dlmread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\cagatay\cagatay_durations.txt');
M = csvread('C:\Users\mhoque\Documents\MATLAB\youtube_ar_extract\cagatay\cagatay2_awked.txt');
A_c2 = preprocess_retention(M,D_c(2),Last(2));






%% Processing the power traces ON-OFF-M/Fast caching



MW1F(175001:250000,2)=MW1F(600001:675000,2);
MW1F(425001:500000,2)=MW1F(600001:675000,2);
MW1F(775001:850000,2)=MW1F(600001:675000,2);

MW1F(40001:50000,2)=MW1F(43001:53000,2);
MW1F(53001:63000,2)=MW1F(250001:260000,2);


MW1O(120001:220000,2)=MW1O(800001:900000,2);
MW1O(400001:500000,2)=MW1O(800001:900000,2);
MW1O(500001:600000,2)=MW1O(800001:900000,2);
MW1O(675001:775000,2)=MW1O(800001:900000,2);
MW1O(780001:805000,2)=MW1O(800001:825000,2);

MW1S(810001:890000,2)=MW1S(375001:455000,2);
MW1S(575001:655000,2)=MW1S(375001:455000,2);


MW3F(36001:41000,2)=MW1F(10001:15000,2);
MW3F(41001:46000,2)=MW1F(43001:48000,2);

%MW3F(50001:100000,2)=MW3F(1400001:1450000,2);

MW3F(1775001:1925000,2)=MW3F(1400001:1550000,2);
MW3F(1170001:1320000,2)=MW3F(1400001:1550000,2);
MW3F(1575001:1725000,2)=MW3F(1400001:1550000,2);
MW3F(275001:425000,2)=MW3F(1400001:1550000,2);

MW3O(170001:220000,2)=MW3O(500001:550000,2);
MW3O(675001:725000,2)=MW3O(500001:550000,2);
MW3O(1400001:1450000,2)=MW3O(500001:550000,2);
MW3O(1775001:1825000,2)=MW3O(500001:550000,2);


MW3S(295001:305000,2)=MW3S(280001:290000,2);
MW3S(695001:705000,2)=MW3S(280001:290000,2);
MW3S(970001:980000,2)=MW3S(280001:290000,2);
MW3S(1270001:1280000,2)=MW3S(280001:290000,2);
MW3S(1570001:1580000,2)=MW3S(280001:290000,2);
MW3S(1870001:1880000,2)=MW3S(280001:290000,2);


%% Calculating base line energy

base_1f=mean(MW1F(MW1F(:,1)>150 & MW1F(:,1)<185,2));
base_1o=mean(MW1O(MW1O(:,1)>150 & MW1O(:,1)<185,2));
base_1s=mean(MW1S(MW1S(:,1)>150 & MW1S(:,1)<185,2));
base_1y=mean(MW1Y(MW1Y(:,1)>85 & MW1Y(:,1)<105,2));

base_3f=mean(MW3F(MW3F(:,1)>200 & MW3F(:,1)<235,2));
base_3o=mean(MW3O(MW3O(:,1)>150 & MW3O(:,1)<180,2));
base_3s=mean(MW3S(MW3S(:,1)>350 & MW3S(:,1)<370,2));
base_3y=mean(MW3Y(MW3Y(:,1)>185 & MW3Y(:,1)<215,2));


%% Processing ON-OFF-M (without Throttling)/Fast Caching %%%%%%%%%%%


M1_= [MW1F(:,1) MW1F(:,2)-base_1f];
M2_= [MW1O(:,1) MW1O(:,2)-base_1o];
M3_= [MW1S(:,1) MW1S(:,2)-base_1s];
M4_= [MW1Y(:,1) MW1Y(:,2)-base_1y];

M5_ = [MW3F(:,1) MW3F(:,2)-base_3f];
M6_ = [MW3O(:,1) MW3O(:,2)-base_3o];
M7_ = [MW3S(:,1) MW3S(:,2)-base_3s];
M8_= [MW3Y(:,1) MW3Y(:,2)-base_3y];


%% Processing StreamThrottler %%%%%%%%%%%


%% calculating RX power
V = 3.9;
P_rx_1 = (mean(MW1F(MW1F(:,1)>=0.1 & MW1F(:,1)<=7.8,2))-base_1f)*V; 
P_rx_2 = (mean(MW3F(MW3F(:,1)>=1.0 & MW3F(:,1)<=7.5,2))-base_3f)*V;
%P_rx_3 = (mean(MG3F(MG3F(:,1)>=0.5 & MG3F(:,1)<=15,2))-base_3f)*V; 
%P_rx_4 = (mean(MG3O(MG3O(:,1)>=2.2 & MG3O(:,1)<=6.5,2))-base_4o)*V;
%P_rx_5 = (mean(MG3S(MG3S(:,1)>=140 & MG3S(:,1)<=145,2))-base_5s)*V; 


%% tail energy

r_s_long = 621400/8;
r_s_short = 574008/8;
P_tail_wifi = (mean(MW1F(44000:54000,2))-base_1f)*V;
t_tail_wifi = 2;
E_tail_wifi=P_tail_wifi*t_tail_wifi;

d_short = 199;
d_long = 399;



%% Energy for oracle
btc_wifi_s=15000000/8;
E_oracle7 = [MW1S(MW1S(:,1)<d_short,1) MW1S(MW1S(:,1)<d_short,1)*r_s_short/btc_wifi_s*P_rx_1+E_tail_wifi];
E_oracle7 = [E_oracle7; [MW1S(MW1S(:,1)>=d_short,1) zeros(length(MW1S(MW1S(:,1)>=d_short,1)),1)+E_oracle7(end)]];

btc_wifi_l=20000000/8;
E_oracle8 = [MW3S(MW3S(:,1)<d_long,1) MW3S(MW3S(:,1)<d_long,1)*r_s_long/btc_wifi_l*P_rx_1+E_tail_wifi];
E_oracle8 = [E_oracle8; [MW3S(MW3S(:,1)>=d_long,1) zeros(length(MW3S(MW3S(:,1)>=d_long,1)),1)+E_oracle8(end)]];


%% plot figures of energy waste as a function of time

%% 3G short video


figure;
hold on;
Y=[cumsum(M3_(M3_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(M3_(:,1)<=d_short,2) cumsum(M1_(M3_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(M3_(:,1)<=d_short,2)];
[ax, h1, h2] = plotyy(M3_(M3_(:,1)<=d_short,1)./M3_(find(M3_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'Estimated energy waste wrt oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','ON-OFF-M','audience retention','Location','Best');

figure;
hold on;
Y=[cumsum(M3_(M3_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(M3_(:,1)<=d_short,2) cumsum(M2_(M3_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(M3_(:,1)<=d_short,2)];
[ax, h1, h2] = plotyy(M3_(M3_(:,1)<=d_short,1)./M3_(find(M3_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'Estimated energy waste wrt oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','ON-OFF-M','audience retention','Location','Best');

figure;
hold on;
Y=[cumsum(M3_(M3_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(M3_(:,1)<=d_short,2) cumsum(M4_(M3_(:,1)<=d_short,2)*V*0.0002)-E_oracle7(M3_(:,1)<=d_short,2)];
[ax, h1, h2] = plotyy(M3_(M3_(:,1)<=d_short,1)./M3_(find(M3_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'Estimated energy waste wrt oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','ON-OFF-M','audience retention','Location','Best');

%% 3G long video


figure;
hold on;
Y=[cumsum(M7_(M7_(:,1)<=d_long,2)*V*0.0002)-E_oracle8(M7_(:,1)<=d_long,2) cumsum(M5_(M7_(:,1)<=d_long,2)*V*0.0002)-E_oracle8(M7_(:,1)<=d_long,2)];
[ax, h1, h2] = plotyy(M7_(M7_(:,1)<=d_long,1)./M7_(find(M7_(:,1)<=d_long,1,'last'),1), Y/1000, A_c2(1,:)/A_c2(1,end), A_c2(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'Estimated energy waste wrt oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','ON-OFF-M','audience retention','Location','Best');


figure;
hold on;
Y=[cumsum(M7_(M7_(:,1)<=d_long,2)*V*0.0002)-E_oracle8(M7_(:,1)<=d_long,2) cumsum(M6_(M7_(:,1)<=d_long,2)*V*0.0002)-E_oracle8(M7_(:,1)<=d_long,2)];
[ax, h1, h2] = plotyy(M7_(M7_(:,1)<=d_long,1)./M7_(find(M7_(:,1)<=d_long,1,'last'),1), Y/1000, A_c2(1,:)/A_c2(1,end), A_c2(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'Estimated energy waste wrt oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','ON-OFF-M','audience retention','Location','Best');

figure;
hold on;
Y=[cumsum(M7_(M7_(:,1)<=d_long,2)*V*0.0002)-E_oracle8(M7_(:,1)<=d_long,2) cumsum(M8_(M7_(:,1)<=d_long,2)*V*0.0002)-E_oracle8(M7_(:,1)<=d_long,2)];
[ax, h1, h2] = plotyy(M7_(M7_(:,1)<=d_long,1)./M7_(find(M7_(:,1)<=d_long,1,'last'),1), Y/1000, A_c2(1,:)/A_c2(1,end), A_c2(2,:));
set(ax(2),'ycolor','black');
set(h1(2),'LineStyle','--');
set(h2,'Marker','x');
curYLim = get(ax(1),'YLim');
set(ax(1),'YLim',[0 curYLim(2)]);
set(ax(2),'YLim',[0 1]);
set(ax,'FontSize',20);
xlabel('fraction of video watched (%)');
ylabel(ax(1),'Estimated energy waste wrt oracle (J)');
ylabel(ax(2),'audience retention');
legend('StreamThrottler','ON-OFF-M','audience retention','Location','Best');
