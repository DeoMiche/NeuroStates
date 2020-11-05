%% load data

psych = readtable('psych_test.xls','ReadVariableNames', 0);
BFI = table2array(psych(:,1:5));
STAI = table2array(psych(:,6:7));

FEA = readtable('Fit FEA 04.csv');
NEU = readtable('Fit NEU 04.csv');

MeanDur = [NEU.MeanDur(strcmp(NEU.Map, 'Map4')), FEA.MeanDur(strcmp(FEA.Map, 'Map2')), ...
            NEU.MeanDur(strcmp(NEU.Map, 'Map1')), FEA.MeanDur(strcmp(FEA.Map, 'Map4')), ...
            NEU.MeanDur(strcmp(NEU.Map, 'Map3')), FEA.MeanDur(strcmp(FEA.Map, 'Map1')), ...
            NEU.MeanDur(strcmp(NEU.Map, 'Map2')), FEA.MeanDur(strcmp(FEA.Map, 'Map3'))]*20;
    
TimeCov = [NEU.TimeCov(strcmp(NEU.Map, 'Map4')), FEA.TimeCov(strcmp(FEA.Map, 'Map2')), ...
            NEU.TimeCov(strcmp(NEU.Map, 'Map1')), FEA.TimeCov(strcmp(FEA.Map, 'Map4')), ...
            NEU.TimeCov(strcmp(NEU.Map, 'Map3')), FEA.TimeCov(strcmp(FEA.Map, 'Map1')), ...
            NEU.TimeCov(strcmp(NEU.Map, 'Map2')), FEA.TimeCov(strcmp(FEA.Map, 'Map3'))]*100;

%% correlations

% class C
[R,P]=corrcoef([MeanDur(:,5), MeanDur(:,6), (MeanDur(:,6)-MeanDur(:,5))]);
%[R,P]=corr([MeanDur(:,5), MeanDur(:,6), (MeanDur(:,5)-MeanDur(:,6)), BFI], 'type', 'spearman');
R = R(1:3, 4:end);
P = P(1:3, 4:end);

[R2,P2]=corrcoef([TimeCov(:,5), TimeCov(:,6), (TimeCov(:,6)-TimeCov(:,5)), BFI]);
% [spear_R2,spear_P2]=corr([TimeCov_1(:,3), TimeCov_2(:,3), (TimeCov_1(:,3)-TimeCov_2(:,3))*100, BFI(:,4)],  'type', 'spearman');
R2 = R2(1:3, 4:end);
P2 = P2(1:3, 4:end);

% class D
[R3,P3]=corrcoef([MeanDur(:,7), MeanDur(:,8), (MeanDur(:,8)-MeanDur(:,7)), BFI]);
% [spear_R3,spear_P3]=corr([TimeCov_1(:,4), TimeCov_2(:,4), (TimeCov_1(:,4)-TimeCov_2(:,4))*100, BFI(:,4)], 'type', 'spearman');
R3 = R3(1:3, 4:end);
P3 = P3(1:3, 4:end);

[R4,P4]=corrcoef([TimeCov(:,7), TimeCov(:,8), (TimeCov(:,8)-TimeCov(:,7)), BFI]);
% [spear_R2,spear_P2]=corr([TimeCov_1(:,3), TimeCov_2(:,3), (TimeCov_1(:,3)-TimeCov_2(:,3))*100, BFI(:,4)],  'type', 'spearman');
R4 = R4(1:3, 4:end);
P4 = P4(1:3, 4:end);

%class B
[R5,P5]=corrcoef([TimeCov(:,3), TimeCov(:,4), (TimeCov(:,3)-TimeCov(:,4)), BFI]);
[R8,P8]=corrcoef([MeanDur(:,3), MeanDur(:,4), (MeanDur(:,3)-MeanDur(:,4)), BFI]);
% [spear_R3,spear_P3]=corr([TimeCov_1(:,4), TimeCov_2(:,4), (TimeCov_1(:,4)-TimeCov_2(:,4))*100, BFI(:,4)], 'type', 'spearman');
R5 = R5(1:3, 4:end);
P5 = P5(1:3, 4:end);

%class A
[R6,P6]=corrcoef([TimeCov(:,1), TimeCov(:,2), (TimeCov(:,1)-TimeCov(:,2)), BFI]);
[R7,P7]=corrcoef([MeanDur(:,1), MeanDur(:,2), (MeanDur(:,1)-MeanDur(:,2)), BFI]);

%% plot correlations
figure
MarkerSize = 60;

% parameters correlation
subplot(241)
scatter(BFI(:,4), TimeCov(:,6), MarkerSize,'o', 'MarkerFaceColor', [211 94 96]/255, 'MarkerEdgeColor', 'k')
hold on
scatter(BFI(:,4), TimeCov(:,5), MarkerSize,'o', 'MarkerFaceColor', [114 147 203]/255, 'MarkerEdgeColor', 'k')
H = lsline;
H(1).Color = [114 147 203]/255;
H(1).LineStyle = ':';
H(1).LineWidth = 2;
H(2).Color = [211 94 96]/255;
H(2).LineStyle = ':';
H(2).LineWidth = 2;
xlabel('Neuroticism score', 'FontSize', 18)
ylabel('Time Coverage (%)', 'FontSize', 18)
title('Microstate C', 'FontSize', 20)
lgd = legend({'fear', 'neutral'});
lgd.Location = 'northwest';
% text(22, -5.5, ['r= ' num2str(R2(1),2) ' p= ' num2str(P2(1),1)], 'FontSize', 16);
% text(22, -5.5, ['r= ' num2str(R2(2),2) ' p= ' num2str(P2(2),1)], 'FontSize', 16);
axis square

subplot(242)
scatter(BFI(:,4), MeanDur(:,6), MarkerSize, 'o', 'MarkerFaceColor', [211 94 96]/255, 'MarkerEdgeColor', 'k')
hold on
scatter(BFI(:,4), MeanDur(:,5), MarkerSize, 'o', 'MarkerFaceColor', [114 147 203]/255, 'MarkerEdgeColor', 'k')
H = lsline;
H(1).Color = [114 147 203]/255;
H(1).LineStyle = ':';
H(1).LineWidth = 2;
H(2).Color = [211 94 96]/255;
H(2).LineStyle = ':';
H(2).LineWidth = 2;
xlabel('Neuroticism score', 'FontSize', 18)
ylabel('Mean Duration (ms)', 'FontSize', 18)
title('Microstate C', 'FontSize', 20)
% text(22, -9, ['r= ' num2str(R(1, 4),2) ' p= ' num2str(P(1, 4),1)], 'FontSize', 16);
% text(22, -9, ['r= ' num2str(R(2, 4),2) ' p= ' num2str(P(2, 4),1)], 'FontSize', 16);
axis square
ylim([67.6436 140])

subplot(243)
scatter(BFI(:,4), TimeCov(:,8), MarkerSize,'o', 'MarkerFaceColor', [211 94 96]/255, 'MarkerEdgeColor', 'k')
hold on
scatter(BFI(:,4), TimeCov(:,7), MarkerSize,'o', 'MarkerFaceColor', [114 147 203]/255, 'MarkerEdgeColor', 'k')
H = lsline;
H(1).Color = [114 147 203]/255;
H(1).LineStyle = ':';
H(1).LineWidth = 2;
H(2).Color = [211 94 96]/255;
H(2).LineStyle = ':';
H(2).LineWidth = 2;
xlabel('Neuroticism score', 'FontSize', 18)
ylabel('Time Coverage (%)', 'FontSize', 18)
title('Microstate D', 'FontSize', 20)
% text(20, 38, ['r= ' num2str(R3(1),2) ' p= ' num2str(P3(1),1)], 'FontSize', 16);
% text(20, 33, ['r= ' num2str(R3(2),2) ' p= ' num2str(P3(2),1)], 'FontSize', 16);
axis square

subplot(244)
scatter(BFI(:,4), MeanDur(:,7), MarkerSize, 'o', 'MarkerFaceColor', [211 94 96]/255, 'MarkerEdgeColor', 'k')
hold on
scatter(BFI(:,4), MeanDur(:,8), MarkerSize, 'o', 'MarkerFaceColor', [114 147 203]/255, 'MarkerEdgeColor', 'k')
H = lsline;
H(1).Color = [114 147 203]/255;
H(1).LineStyle = ':';
H(1).LineWidth = 2;
H(2).Color = [211 94 96]/255;
H(2).LineStyle = ':';
H(2).LineWidth = 2;
xlabel('Neuroticism score', 'FontSize', 18)
ylabel('Mean Duration (ms)', 'FontSize', 18)
title('Microstate D', 'FontSize', 20)
% text(22, -9, ['r= ' num2str(R(1, 4),2) ' p= ' num2str(P(1, 4),1)], 'FontSize', 16);
% text(22, -9, ['r= ' num2str(R(2, 4),2) ' p= ' num2str(P(2, 4),1)], 'FontSize', 16);
axis square


%% differences correlation
subplot(245)
scatter(BFI(:,4), (TimeCov(:,6)-TimeCov(:,5)), 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k')
H = lsline
H.Color = [0 0 0];
H.LineStyle = ':';
H.LineWidth = 2;
xlabel('Neuroticism score', 'FontSize', 18)
ylabel('Time Coverage difference (%)', 'FontSize', 18)
ax = axis;
title('Microstate C', 'FontSize', 20)
% axis([-11 21 ax(3:4)])
% text(22, -5.5, ['r= ' num2str(R2(end),2) ' p= ' num2str(P2(end),1)], 'FontSize', 16);
axis square

subplot(246)
scatter(BFI(:,4), (MeanDur(:,6)-MeanDur(:,5)), 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k')
H = lsline
H.Color = [0 0 0];
H.LineStyle = ':';
H.LineWidth = 2;
xlabel('Neuroticism score', 'FontSize', 18)
ylabel('Mean Duration difference (ms)', 'FontSize', 18)
ax = axis;
title('Microstate C', 'FontSize', 20)
% axis([-11 21 ax(3:4)])
% text(22, -9, ['r= ' num2str(R(3, 4),2) ' p= ' num2str(P(3, 4),1)], 'FontSize', 16);
axis square


subplot(247)
scatter(BFI(:,4), (TimeCov(:,8)-TimeCov(:,7)), 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k')
H = lsline
H.Color = [0 0 0];
H.LineStyle = ':';
H.LineWidth = 2;
xlabel('Neuroticism score', 'FontSize', 18)
ylabel('Time Coverage difference (%)', 'FontSize', 18)
ax = axis;
title('Microstate D', 'FontSize', 20)
% axis([-11 21 ax(3:4)])
% text(22, 4.5, ['r= ' num2str(R3(end),2) ' p= ' num2str(P3(end),1)], 'FontSize', 16);
axis square

