%% ON-OFF-M (Without Throttling and using Fast Caching


MG1F=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\3G_199_FST_6M.csv',1,0,[1 0 989640 1]); 
MG1O=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\3G_199_ON_6M.csv',1,0,[1 0 989640 1]); 
MG1Y=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\YouTube_199_3G.csv',1,0,[1 0 989640 1]); 
%

MG3F=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\3G_399_Fast_6M.csv',1,0,[1 0 1995000 1]); 
MG3O=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\3G_399_ON3_6M.csv',1,0,[1 0 1995000 1]); 

MG3S=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\3G_399_ST_6M.csv',1,0,[1 0 1995000 1]); 
MG3Y=csvread('C:\Users\mhoque\Documents\MATLAB\MobSTON\YouTube_399_3G.csv',1,0,[1 0 1995000 1]); 



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



MG1F(65001:100000,2)=MG1F(109001:144000,2);
MG1F(100001:200000,2)=MG1F(200001:300000,2);
MG1F(380001:430000,2)=MG1F(200001:250000,2);
MG1F(430001:480000,2)=MG1F(200001:250000,2);
MG1F(930001:980000,2)=MG1F(200001:250000,2);

MG1O(100001:250000,2)=MG1O(450001:600000,2);

MG3F(425001:525000,2)=MG3F(600001:700000,2);
MG3F(1000001:1100000,2)=MG3F(600001:700000,2);
MG3F(1150001:1200000,2)=MG3F(600001:650000,2);
MG3F(1450001:1500000,2)=MG3F(600001:650000,2);
MG3F(1790001:1840000,2)=MG3F(600001:650000,2);

MG3O(1240001:1290000,2)=MG3O(475001:525000,2);


MG3S(245001:295000,2)=MG3S(575001:625000,2);
MG3S(750001:800000,2)=MG3S(575001:625000,2);
MG3S(1000001:1100000,2)=MG3S(1250001:1350000,2);
MG3S(1795001:1845000,2)=MG3S(1250001:1300000,2);
MG3S(1965001:1995000,2)=MG3S(1250001:1280000,2);


MG3Y(1175001:1275000,2)=MG3Y(1075001:1175000,2);

%% Calculating base line energy

base_1f=mean(MG1F(MG1F(:,1)>150 & MG1F(:,1)<185,2));
base_2o=mean(MG1O(MG1O(:,1)>150 & MG1O(:,1)<185,2));
base_1y=mean(MG1Y(MG1Y(:,1)>85 & MG1Y(:,1)<105,2));

base_3f=mean(MG3F(MG3F(:,1)>200 & MG3F(:,1)<235,2));
base_4o=mean(MG3O(MG3O(:,1)>150 & MG3O(:,1)<180,2));
base_5s=mean(MG3S(MG3S(:,1)>300 & MG3S(:,1)<350,2));
base_3y=mean(MG3Y(MG3Y(:,1)>100 & MG3Y(:,1)<150,2));


%% Processing ON-OFF-M (without Throttling)/Fast Caching %%%%%%%%%%%


M1_ = [MG1F(:,1) MG1F(:,2)-base_1f];
M2_ = [MG1O(:,1) MG1O(:,2)-base_2o];
M1Y_= [MG1Y(:,1) MG1Y(:,2)-base_1y];
M3_ = [MG3F(:,1) MG3F(:,2)-base_3f];
M4_ = [MG3O(:,1) MG3O(:,2)-base_4o];
M5_ = [MG3S(:,1) MG3S(:,2)-base_5s];
M3Y_= [MG3Y(:,1) MG3Y(:,2)-base_3y];


%% Processing StreamThrottler %%%%%%%%%%%


%% calculating RX power
V = 3.9;
P_rx_1 = (mean(MG1F(MG1F(:,1)>=0.1 & MG1F(:,1)<=12,2))-base_1f)*V; 
P_rx_2 = (mean(MG1O(MG1O(:,1)>=3 & MG1O(:,1)<=8.5,2))-base_2o)*V;
P_rx_3 = (mean(MG3F(MG3F(:,1)>=0.5 & MG3F(:,1)<=15,2))-base_3f)*V; 
P_rx_4 = (mean(MG3O(MG3O(:,1)>=2.2 & MG3O(:,1)<=6.5,2))-base_4o)*V;
P_rx_5 = (mean(MG3S(MG3S(:,1)>=140 & MG3S(:,1)<=145,2))-base_5s)*V; 


%% tail energy

r_s_long = 621400/8;
r_s_short = 574008/8;
P_tail_3g = (mean(MG3S(1420000:1445000,2))-base_5s)*V;
t_tail_3g = 5;
btc_3g=10000000/8;
d_short = 199;
d_long = 399;



%% Energy for oracle

E_oracle11 = [MG1F(MG1F(:,1)<d_short,1) MG1F(MG1F(:,1)<d_short,1)*r_s_short/btc_3g*P_rx_1+P_tail_3g*t_tail_3g];
E_oracle11 = [E_oracle11; [MG1F(MG1F(:,1)>=d_short,1) zeros(length(MG1F(MG1F(:,1)>=d_short,1)),1)+E_oracle11(end)]];


E_oracle1y = [MG1Y(MG1Y(:,1)<d_short,1) MG1Y(MG1Y(:,1)<d_short,1)*r_s_short/btc_3g*P_rx_1+P_tail_3g*t_tail_3g];
E_oracle1y = [E_oracle1y; [MG1Y(MG1Y(:,1)>=d_short,1) zeros(length(MG1Y(MG1Y(:,1)>=d_short,1)),1)+E_oracle1y(end)]];

btc_3g=10000000/8;

E_oracle12 = [MG3S(MG3S(:,1)<d_long,1) MG3S(MG3S(:,1)<d_long,1)*r_s_long/btc_3g*P_rx_5+P_tail_3g*t_tail_3g];
E_oracle12 = [E_oracle12; [MG3S(MG3S(:,1)>=d_long,1) zeros(length(MG3S(MG3S(:,1)>=d_long,1)),1)+E_oracle12(end)]];

E_oracle3y = [MG3Y(MG3Y(:,1)<d_long,1) MG3Y(MG3Y(:,1)<d_long,1)*r_s_long/btc_lte*P_rx_5+P_tail_3g*t_tail_3g];
E_oracle3y = [E_oracle3y; [MG3Y(MG3Y(:,1)>=d_long,1) zeros(length(MG3Y(MG3Y(:,1)>=d_long,1)),1)+E_oracle3y(end)]];

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
Y=[cumsum(M1_(M1_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(M1_(:,1)<=d_short,2) cumsum(M1Y_(M1_(:,1)<=d_short,2)*V*0.0002)-E_oracle11(M1_(:,1)<=d_short,2)];
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
