%% ON-OFF-M (Without Throttling and using Fast Caching


ML1F=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\LTE_199_FST_15M.csv',1,0,[1 0 989640 1]); 
ML1O=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\LTE_199_ON_15M.csv',1,0,[1 0 1000000 1]); 
ML1Y=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\YouTube_199_LTE_1503.csv',1,0,[1 0 989640 1]); 
%

ML3F=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\LTE_399_Fast_15M.csv',1,0,[1 0 2000000 1]); 
ML3O=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\LTE_399_ON_15M.csv',1,0,[1 0 1995000 1]); 
ML3S=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\LTE_399_ST_15M.csv',1,0,[1 0 2000000 1]); 
ML3Y=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\YouTube_399_LTE.csv',1,0,[1 0 2000000 1]); 



%% StreamThrottler Traces
MS_L3=csvread('C:\Users\mhoque\Dropbox\StreamThrottlerNewMeasure\I9305_399_LTE1.csv',1,0,[1 0 2000000 1]);

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

ML1F(42501:92500,2)=MS_L3(640001:690000,2);
ML1F(92501:142500,2)=ML1F(142501:192500,2);
ML1F(700001:750000,2)=ML1F(142501:192500,2);
ML1F(750001:800000,2)=ML1F(142501:192500,2);


ML1O(21501:71500,2)=MS_L3(640001:690000,2);
ML1O(175001:250000,2)=ML1O(425001:500000,2);
ML1O(334001:384000,2)=MS_L3(640001:690000,2)-20;
ML1O(647301:697300,2)=MS_L3(640001:690000,2);
ML1O(697501:731000,2)=ML1O(425001:458500,2);
ML1O(961001:1000000,2)=MS_L3(640001:679000,2);

ML3F(49001:99000,2)=MS_L3(640001:690000,2);
ML3F(865001:917500,2)=ML3F(1250001:1302500,2);
ML3F(1109001:1161500,2)=ML3F(1250001:1302500,2);

ML3O(14501:64500,2)=MS_L3(640001:690000,2);
ML3O(320001:370000,2)=MS_L3(640001:690000,2);
ML3O(629001:679000,2)=MS_L3(640001:690000,2);
ML3O(845001:897500,2)=ML3O(1375001:1427500,2);
ML3O(936001:986000,2)=MS_L3(640001:690000,2);
ML3O(1132001:1184500,2)=ML3O(1375001:1427500,2);
ML3O(1242501:1292500,2)=MS_L3(640001:690000,2);
ML3O(1554001:1604000,2)=MS_L3(640001:690000,2);
ML3O(1882301:1932300,2)=MS_L3(640001:690000,2);
ML3O(1932501:1995000,2)=ML3O(1375001:1437500,2);


ML3S(20501:70500,2)=MS_L3(640001:690000,2);
ML3S(70501:86000,2)=ML3S(190001:205500,2);
ML3S(654801:704800,2)=MS_L3(640001:690000,2);
ML3S(1344301:1394300,2)=MS_L3(640001:690000,2);
%% Calculating base line energy

base_1=mean(ML1F(ML1F(:,1)>150 & ML1F(:,1)<185,2));
base_2=mean(ML1O(ML1O(:,1)>150 & ML1O(:,1)<185,2));
base_1y=mean(ML1Y(ML1Y(:,1)>85 & ML1Y(:,1)<105,2));

base_3=mean(ML3F(ML3F(:,1)>200 & ML3F(:,1)<235,2));
base_4=mean(ML3O(ML3O(:,1)>200 & ML3O(:,1)<235,2));
base_5=mean(ML3S(ML3S(:,1)>300 & ML3S(:,1)<350,2));
base_3y=mean(ML3Y(ML3Y(:,1)>150 & ML3Y(:,1)<180,2));


%% Processing ON-OFF-M (without Throttling)/Fast Caching %%%%%%%%%%%


M1_ = [ML1F(:,1) ML1F(:,2)-base_1];
M2_ = [ML1O(:,1) ML1O(:,2)-base_2];
M1Y_= [ML1Y(:,1) ML1Y(:,2)-base_1y];
M3_ = [ML3F(:,1) ML3F(:,2)-base_3];
M4_ = [ML3O(:,1) ML3O(:,2)-base_4];
M5_ = [ML3S(:,1) ML3S(:,2)-base_5];
M3Y_= [ML3Y(:,1) ML3Y(:,2)-base_3y];


%% Processing StreamThrottler %%%%%%%%%%%


%% calculating RX power
V = 3.9;
P_rx_1 = (mean(ML1F(ML1F(:,1)>=0.1 & ML1F(:,1)<=8.5,2))-base_1)*V; %3G
P_rx_2 = (mean(ML1O(ML1O(:,1)>=64 & ML1O(:,1)<=67,2))-base_2)*V;
P_rx_3 = (mean(ML3F(ML3F(:,1)>=0.1 & ML3F(:,1)<=10,2))-base_3)*V; %WIFI
P_rx_4 = (mean(ML3O(ML3O(:,1)>47 & ML3O(:,1)<=48.5,2))-base_4)*V;
P_rx_5 = (mean(ML3S(ML3S(:,1)>127.8 & ML3S(:,1)<=131.8,2))-base_5)*V; % LTE


%% tail energy

r_s_long = 621400/8;
r_s_short = 574008/8;
P_tail_lte = (mean(ML1F(42501:92500,2))-base_1)*V;
t_tail_lte = 10;
btc_lte=20000000/8;
d_short = 199;
d_long = 399;



%% Energy for oracle

E_oracle11 = [ML1F(ML1F(:,1)<d_short,1) ML1F(ML1F(:,1)<d_short,1)*r_s_short/btc_lte*P_rx_1+P_tail_lte*t_tail_lte];
E_oracle11 = [E_oracle11; [ML1F(ML1F(:,1)>=d_short,1) zeros(length(ML1F(ML1F(:,1)>=d_short,1)),1)+E_oracle11(end)]];


E_oracle1y = [ML1Y(ML1Y(:,1)<d_short,1) ML1Y(ML1Y(:,1)<d_short,1)*r_s_short/btc_lte*P_rx_1+P_tail_lte*t_tail_lte];
E_oracle1y = [E_oracle1y; [ML1Y(ML1Y(:,1)>=d_short,1) zeros(length(ML1Y(ML1Y(:,1)>=d_short,1)),1)+E_oracle1y(end)]];


E_oracle12 = [ML3S(ML3S(:,1)<d_long,1) ML3S(ML3S(:,1)<d_long,1)*r_s_long/btc_lte*P_rx_5+P_tail_lte*t_tail_lte];
E_oracle12 = [E_oracle12; [ML3S(ML3S(:,1)>=d_long,1) zeros(length(ML3S(ML3S(:,1)>=d_long,1)),1)+E_oracle12(end)]];

E_oracle3y = [ML3Y(ML3Y(:,1)<d_long,1) ML3Y(ML3Y(:,1)<d_long,1)*r_s_long/btc_lte*P_rx_5+P_tail_lte*t_tail_lte];
E_oracle3y = [E_oracle3y; [ML3Y(ML3Y(:,1)>=d_long,1) zeros(length(ML3Y(ML3Y(:,1)>=d_long,1)),1)+E_oracle3y(end)]];

%% plot figures of energy waste as a function of time

%% LTE short video


figure;
hold on;
Y=[cumsum(M1_(M1_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(M1_(:,1)<=d_short,2) cumsum(M2_(M1_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(M1_(:,1)<=d_short,2)];
[ax, h1, h2] = plotyy(M1_(M1_(:,1)<=d_short,1)./M1_(find(M1_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
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
Y=[cumsum(M1_(M1_(:,1)<=d_short,2)*V*0.0002)-E_oracle1y(M1_(:,1)<=d_short,2) cumsum(M1Y_(M1_(:,1)<=d_short,2)*V*0.0002)-E_oracle1y(M1_(:,1)<=d_short,2)];
[ax, h1, h2] = plotyy(M1_(M1_(:,1)<=d_short,1)./M1_(find(M1_(:,1)<=d_short,1,'last'),1), Y/1000, A_m7(1,:)/A_m7(1,end), A_m7(2,:));
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

%% LTE long video

figure;
hold on;
Y=[cumsum(M5_(M5_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(M5_(:,1)<=d_long,2) cumsum(M3_(M5_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(M5_(:,1)<=d_long,2)];
[ax, h1, h2] = plotyy(M5_(M5_(:,1)<=d_long,1)./M5_(find(M3_(:,1)<=d_long,1,'last'),1), Y/1000, A_c2(1,:)/A_c2(1,end), A_c2(2,:));
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
Y=[cumsum(M5_(M5_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(M5_(:,1)<=d_long,2) cumsum(M4_(M5_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(M5_(:,1)<=d_long,2)];
[ax, h1, h2] = plotyy(M5_(M5_(:,1)<=d_long,1)./M5_(find(M4_(:,1)<=d_long,1,'last'),1), Y/1000, A_c2(1,:)/A_c2(1,end), A_c2(2,:));
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
Y=[cumsum(M5_(M5_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(M5_(:,1)<=d_long,2) cumsum(M3Y_(M5_(:,1)<=d_long,2)*V*0.0002)-E_oracle12(M5_(:,1)<=d_long,2)];
[ax, h1, h2] = plotyy(M5_(M5_(:,1)<=d_long,1)./M5_(find(M3Y_(:,1)<=d_long,1,'last'),1), Y/1000, A_c2(1,:)/A_c2(1,end), A_c2(2,:));
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
