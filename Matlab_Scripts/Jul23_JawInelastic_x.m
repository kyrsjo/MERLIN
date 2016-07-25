%% Jaw Inelastic X
clearvars all;
%% Import data MERLIN
filename = '/home/HR/Downloads/JawInelastic/jaw_inelastic_TCSG.B5L7.B2_Pure.txt';
% filename = '/home/HR/Downloads/JawInelastic/jaw_inelastic_TCP.C6R7.B2_Pure.txt';
delimiter = {'\t',' '};
startRow = 2;
formatSpec = '%f%f%f%f%f%f%f%*s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);
fclose(fileID);
x = dataArray{:, 1};
xp = dataArray{:, 2};
% y = dataArray{:, 3};
% yp = dataArray{:, 4};
% ct = dataArray{:, 5};
% dp = dataArray{:, 6};
% z = dataArray{:, 7};
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

filename = '/home/HR/Downloads/JawInelastic/jaw_inelastic_TCSG.B5L7.B2_Comp.txt';
% filename = '/home/HR/Downloads/JawInelastic/jaw_inelastic_TCP.C6R7.B2_Comp.txt';
delimiter = {'\t',' '};
startRow = 2;
formatSpec = '%f%f%f%f%f%f%f%*s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);
fclose(fileID);
cx = dataArray{:, 1};
cxp = dataArray{:, 2};
% cy = dataArray{:, 3};
% cyp = dataArray{:, 4};
% cct = dataArray{:, 5};
% cdp = dataArray{:, 6};
% cz = dataArray{:, 7};
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

filename = '/home/HR/Downloads/JawInelastic/jaw_inelastic_TCSG.B5L7.B2_Pure4D.txt';
% filename = '/home/HR/Downloads/JawInelastic/jaw_inelastic_TCP.C6R7.B2_Pure4D.txt';
delimiter = {'\t',' '};
startRow = 2;
formatSpec = '%f%f%f%f%f%f%f%*s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);
fclose(fileID);
x4 = dataArray{:, 1};
xp4 = dataArray{:, 2};
% y4 = dataArray{:, 3};
% yp4 = dataArray{:, 4};
% ct4 = dataArray{:, 5};
% dp4 = dataArray{:, 6};
% z4 = dataArray{:, 7};
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

filename = '/home/HR/Downloads/JawInelastic/jaw_inelastic_TCSG.B5L7.B2_Comp4D.txt';
% filename = '/home/HR/Downloads/JawInelastic/jaw_inelastic_TCP.C6R7.B2_Comp4D.txt';
delimiter = {'\t',' '};
startRow = 2;
formatSpec = '%f%f%f%f%f%f%f%*s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);
fclose(fileID);
cx4 = dataArray{:, 1};
cxp4 = dataArray{:, 2};
% cy4 = dataArray{:, 3};
% cyp4 = dataArray{:, 4};
% cct4 = dataArray{:, 5};
% cdp4 = dataArray{:, 6};
% cz4 = dataArray{:, 7};
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

%% Import SixTrack

% Positive Jaw
filename = '/home/HR/Downloads/JawInelastic/impacts_real_icoll10_ievent1_col4_zoomPosJaw_fort.72';
startRow = 18;
formatSpec = '%19f%19f%11f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'HeaderLines' ,startRow-1, 'ReturnOnError', false);
fclose(fileID);
ST_xpos_min= dataArray{:, 1};
ST_xpos_max = dataArray{:, 2};
ST_xpos_counts= dataArray{:, 3};
clearvars filename startRow formatSpec fileID dataArray ans;

% Negative Jaw
filename = '/home/HR/Downloads/JawInelastic/impacts_real_icoll10_ievent1_col4_zoomNegJaw_fort.72';
startRow = 18;
formatSpec = '%19f%19f%11f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'HeaderLines' ,startRow-1, 'ReturnOnError', false);
fclose(fileID);
ST_xneg_min = dataArray{:, 1};
ST_Xneg_max = dataArray{:, 2};
ST_xneg_counts = dataArray{:, 3};
clearvars filename startRow formatSpec fileID dataArray ans;

filename = '/home/HR/Downloads/JawInelastic/impacts_real_icoll10_ievent1_col5_fort.72';
startRow = 16;
formatSpec = '%19f%19f%11f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);
fclose(fileID);
ST_xp_min = dataArray{:, 1};
ST_xp_max  = dataArray{:, 2};
ST_xp_counts  = dataArray{:, 3};
clearvars filename startRow formatSpec fileID dataArray ans;

%% Custom colours
c_teal = [18 150 155] ./ 255;
c_dodger = [30 144 255] ./ 255;
c_orange = [225 111 0] ./ 255;
c_gray = [112 112 112] ./ 255;

%% Plot histogram of x all
figure;
% Number of bins
hh=1000;

range_1=min(x4):(max(x4)-min(x4))/hh:max(x4);
[N1,X1] = hist(x4,range_1);
% stairs(X1,N1/sum(N1)/(max(x4)-min(x4)/hh ),'Linewidth',1.5, 'Color', c_dodger);
stairs(X1,N1,'Linewidth',1, 'Color', c_teal);
hold on;
% 
% plot( (ST_xpos_min-min(ST_xpos_min) )/1000 ,ST_xpos_counts, 'Color', c_gray);
% plot( (ST_xneg_min-max(ST_xneg_min) )/1000 ,ST_xneg_counts, 'Color', c_gray);

range_4=min(cx4):(max(cx4)-min(cx4))/hh:max(cx4);
[N4,X4] = hist(cx4,range_4);
% stairs(X4,N4/sum(N4)/(max(cx4)-min(cx4)/hh ),'Linewidth',1.5, 'Color', c_dodger);
stairs(X4,N4,'Linewidth',1, 'Color', 'k');
hold on;

range_3=min(x):(max(x)-min(x))/hh:max(x);
[N3,X3] = hist(x,range_3);
% stairs(X3,N3/sum(N3)/(max(x)-min(x)/hh ),'Linewidth',1.5, 'Color', c_orange);
stairs(X3,N3,'Linewidth',1, 'Color', c_orange);
hold on;

range_2=min(cx):(max(cx)-min(cx))/hh:max(cx);
[N2,X2] = hist(cx,range_2);
% stairs(X2,N2/sum(N2)/(max(cx)-min(cx)/hh ),'Linewidth',1, 'Color', c_dodger);
stairs(X2,N2,'Linewidth',1, 'Color', c_dodger);
hold on;

% plot( ST_xpos_min/1000, ST_xpos_counts, 'Color', c_gray);
% plot( ST_xneg_min/1000, ST_xneg_counts, 'Color', c_gray);

grid on;
% set(gca,'yscale','log','FontSize',16,'PlotBoxAspectratio',[4 2 2],'Linewidth',1, 'Xlim', [-1.6E-3 1.6E-3], 'Ylim', [1E3 1E6]);
set(gca,'FontSize',16,'PlotBoxAspectratio',[4 2 2],'Linewidth',1);
% legend({'MERLIN Pure 4D', 'MERLIN Composite 4D', 'MERLIN Pure 6D', 'MERLIN Composite 6D', 'SixTrack', 'SixTrack'},'FontSize',16);
legend({'MERLIN Pure 4D', 'MERLIN Composite 4D', 'MERLIN Pure 6D', 'MERLIN Composite 6D'},'FontSize',16);
xlabel('x [m]');
ylabel('PDF');
% title ('6.5 TeV Beam 2 TCP.C6R7.B2','FontSize',16);
title ('6.5 TeV Beam 2 TCSG.B5L7.B2','FontSize',16);
hold off;

totsum = sum(ST_xpos_counts) + sum(ST_xneg_counts);
msum = sum(N1);


%% Plot histogram of positive x all
figure;
% Number of bins
hh=239;

range_1=min(x4):(max(x4)-min(x4))/hh:max(x4);
% range_1=1.5E-3:0.1E-3/hh:1.6E-3;
[N1,X1] = hist(x4,range_1);
% stairs(X1,N1/sum(N1)/(max(x4)-min(x4)/hh ),'Linewidth',1.5, 'Color', c_dodger);
stairs(X1,N1,'Linewidth',1, 'Color', c_teal);
hold on;
% 
% plot( (ST_xpos_min-min(ST_xpos_min) )/1000 ,ST_xpos_counts, 'Color', c_gray);
% plot( (ST_xneg_min-max(ST_xneg_min) )/1000 ,ST_xneg_counts, 'Color', c_gray);

range_4=min(cx4):(max(cx4)-min(cz4))/hh:max(cx4);
% range_4=1.5E-3:0.1E-3/hh:1.6E-3;
[N4,X4] = hist(cx4,range_4);
% stairs(X4,N4/sum(N4)/(max(cx4)-min(cx4)/hh ),'Linewidth',1.5, 'Color', c_dodger);
stairs(X4,N4,'Linewidth',1, 'Color', 'k');
hold on;

range_3=min(x):(max(x)-min(x))/hh:max(x);
% range_3=1.5E-3:0.1E-3/hh:1.6E-3;
[N3,X3] = hist(x,range_3);
% stairs(X3,N3/sum(N3)/(max(x)-min(x)/hh ),'Linewidth',1.5, 'Color', c_orange);
stairs(X3,N3,'Linewidth',1, 'Color', c_orange);
hold on;

range_2=min(cx):(max(cx)-min(cx))/hh:max(cx);
% range_2=1.5E-3:0.1E-3/hh:1.6E-3;
[N2,X2] = hist(cx,range_2);
% stairs(X2,N2/sum(N2)/(max(cx)-min(cx)/hh ),'Linewidth',1, 'Color', c_dodger);
stairs(X2,N2,'Linewidth',1, 'Color', c_dodger);
hold on;

% plot( ST_xpos_min/1000, ST_xpos_counts, 'Color', c_gray,'Linewidth',2);
% plot( ST_xneg_min/1000, ST_xneg_counts, 'Color', c_gray,'Linewidth',2);

grid on;
% set(gca,'yscale','log','FontSize',16,'PlotBoxAspectratio',[4 2 2],'Linewidth',1, 'Xlim', [-1.6E-3 1.6E-3], 'Ylim', [1E3 1E6]);
% set(gca,'yscale','log','FontSize',16,'PlotBoxAspectratio',[4 2 2],'Linewidth',1, 'Xlim', [1.51E-3 1.59E-3]);
set(gca,'FontSize',16,'PlotBoxAspectratio',[4 2 2],'Linewidth',1);
% legend({'MERLIN Pure 4D', 'MERLIN Composite 4D', 'MERLIN Pure 6D', 'MERLIN Composite 6D', 'SixTrack', 'SixTrack'},'FontSize',16);
legend({'MERLIN Pure 4D', 'MERLIN Composite 4D', 'MERLIN Pure 6D', 'MERLIN Composite 6D'},'FontSize',16);
xlabel('x [m]');
% ylabel('PDF');
ylabel('Frequency');
% title ('6.5 TeV Beam 2 TCP.C6R7.B2','FontSize',16);
title ('6.5 TeV Beam 2 TCSG.B5L7.B2','FontSize',16);
hold off;


%% Plot histogram of negative x all
figure;
% Number of bins
hh=1000;

range_1=min(x4):(max(x4)-min(x4))/hh:max(x4);
% range_1=-1.6E-3:0.1E-3/hh:-1.5E-3;
[N1,X1] = hist(x4,range_1);
% stairs(X1,N1/sum(N1)/(max(x4)-min(x4)/hh ),'Linewidth',1.5, 'Color', c_dodger);
stairs(X1,N1,'Linewidth',1, 'Color', c_teal);
hold on;
% 
% plot( (ST_xpos_min-min(ST_xpos_min) )/1000 ,ST_xpos_counts, 'Color', c_gray);
% plot( (ST_xneg_min-max(ST_xneg_min) )/1000 ,ST_xneg_counts, 'Color', c_gray);

range_4=min(cx4):(max(cx4)-min(cz4))/hh:max(cx4);
% range_4=-1.6E-3:0.1E-3/hh:-1.5E-3;
[N4,X4] = hist(cx4,range_4);
% stairs(X4,N4/sum(N4)/(max(cx4)-min(cx4)/hh ),'Linewidth',1.5, 'Color', c_dodger);
stairs(X4,N4,'Linewidth',1, 'Color', 'k');
hold on;

range_3=min(x):(max(x)-min(x))/hh:max(x);
% range_3=-1.6E-3:0.1E-3/hh:-1.5E-3;
[N3,X3] = hist(x,range_3);
% stairs(X3,N3/sum(N3)/(max(x)-min(x)/hh ),'Linewidth',1.5, 'Color', c_orange);
stairs(X3,N3,'Linewidth',1, 'Color', c_orange);
hold on;

range_2=min(cx):(max(cx)-min(cx))/hh:max(cx);
% range_2=-1.6E-3:0.1E-3/hh:-1.5E-3;
[N2,X2] = hist(cx,range_2);
% stairs(X2,N2/sum(N2)/(max(cx)-min(cx)/hh ),'Linewidth',1, 'Color', c_dodger);
stairs(X2,N2,'Linewidth',1, 'Color', c_dodger);
hold on;

% plot( ST_xpos_min/1000, ST_xpos_counts, 'Color', c_gray,'Linewidth',2);
% plot( ST_xneg_min/1000, ST_xneg_counts, 'Color', c_gray,'Linewidth',2);

grid on;
% set(gca,'yscale','log','FontSize',16,'PlotBoxAspectratio',[4 2 2],'Linewidth',1, 'Xlim', [-1.6E-3 1.6E-3], 'Ylim', [1E3 1E6]);
% set(gca,'yscale','log','FontSize',16,'PlotBoxAspectratio',[4 2 2],'Linewidth',1, 'Xlim', [-1.59E-3 -1.51E-3]);
set(gca,'FontSize',16,'PlotBoxAspectratio',[4 2 2],'Linewidth',1, 'Xlim', [-1E-2 1E-2]);
% legend({'MERLIN Pure 4D', 'MERLIN Composite 4D', 'MERLIN Pure 6D', 'MERLIN Composite 6D', 'SixTrack', 'SixTrack'},'location', 'northwest', 'FontSize',16);
legend({'MERLIN Pure 4D', 'MERLIN Composite 4D', 'MERLIN Pure 6D', 'MERLIN Composite 6D'},'location', 'northwest', 'FontSize',16);
xlabel('x [m]');
% ylabel('PDF');
ylabel('Frequency');
% title ('6.5 TeV Beam 2 TCP.C6R7.B2','FontSize',16);
title ('6.5 TeV Beam 2 TCSG.B5L7.B2','FontSize',16);
hold off;


%% Plot histogram of xp all
figure;
% Number of bins
hh=2050;

range_1=min(xp4):(max(xp4)-min(xp4))/hh:max(xp4);
[N1,X1] = hist(xp4,range_1);
% stairs(X1,N1/sum(N1)/(max(x4)-min(x4)/hh ),'Linewidth',1.5, 'Color', c_dodger);
stairs(X1,N1,'Linewidth',1, 'Color', c_teal);
hold on;
% 
% plot( (ST_xpos_min-min(ST_xpos_min) )/1000 ,ST_xpos_counts, 'Color', c_gray);
% plot( (ST_xneg_min-max(ST_xneg_min) )/1000 ,ST_xneg_counts, 'Color', c_gray);

range_4=min(cxp4):(max(cxp4)-min(cxp4))/hh:max(cxp4);
[N4,X4] = hist(cxp4,range_4);
% stairs(X4,N4/sum(N4)/(max(cx4)-min(cx4)/hh ),'Linewidth',1.5, 'Color', c_dodger);
stairs(X4,N4,'Linewidth',1, 'Color', 'k');
hold on;

range_3=min(xp):(max(xp)-min(xp))/hh:max(xp);
[N3,X3] = hist(xp,range_3);
% stairs(X3,N3/sum(N3)/(max(x)-min(x)/hh ),'Linewidth',1.5, 'Color', c_orange);
stairs(X3,N3,'Linewidth',1, 'Color', c_orange);
hold on;

range_2=min(cxp):(max(cxp)-min(cxp))/hh:max(cxp);
[N2,X2] = hist(cxp,range_2);
% stairs(X2,N2/sum(N2)/(max(cx)-min(cx)/hh ),'Linewidth',1, 'Color', c_dodger);
stairs(X2,N2,'Linewidth',1, 'Color', c_dodger);
hold on;

% plot( ST_xp_min/1000, ST_xp_counts, 'Color', 'r');
% plot( ST_xneg_min/1000, ST_xneg_counts, 'Color', c_gray);

grid on;
% set(gca,'yscale','log','FontSize',16,'PlotBoxAspectratio',[4 2 2],'Linewidth',1, 'Xlim', [-1.6E-3 1.6E-3], 'Ylim', [1E3 1E6]);
set(gca,'yscale','log','FontSize',16,'PlotBoxAspectratio',[4 2 2],'Linewidth',1, 'Xlim', [-2E-4 2E-4]);
% legend({'MERLIN Pure 4D', 'MERLIN Composite 4D', 'MERLIN Pure 6D', 'MERLIN Composite 6D', 'SixTrack', 'SixTrack'},'location', 'north','FontSize',16);
legend({'MERLIN Pure 4D', 'MERLIN Composite 4D', 'MERLIN Pure 6D', 'MERLIN Composite 6D'},'location', 'northeast','FontSize',16);
xlabel('xp [rad]');
ylabel('Frequency');
% title ('6.5 TeV Beam 2 TCP.C6R7.B2','FontSize',16);
title ('6.5 TeV Beam 2 TCSG.B5L7.B2','FontSize',16);
hold off;