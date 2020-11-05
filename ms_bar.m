%% load and organize data

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
        
%%
figure; subplot(121)
mean_m = mean(MeanDur);
std_m = std(MeanDur);
b = bar(reshape(mean_m, 2, 4)', 'hist','FaceColor','flat');
b(1).FaceColor = [114 147 203]/255;
b(1).EdgeColor = 'none';
b(1).Marker = 'o';
% b(1).FaceAlpha = 0.7;
b(2).FaceColor = [211 94 96]/255;
b(2).EdgeColor = 'none';
% b(2).FaceAlpha = 0.7;
hold on
offset = 0.15;
offset2 = [rand(16,1)*0.08] .* reshape([ones(8,1),-ones(8,1)]', 1, 16)'; %+0.05;
sz = 100;
scatter(repmat(1,1,16)-offset+offset2', MeanDur(:,1), sz, 'MarkerEdgeColor',[57 106 177]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(1,1,16)+offset+offset2', MeanDur(:,2), sz, 'MarkerEdgeColor',[204 37 41]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(2,1,16)-offset+offset2', MeanDur(:,3), sz, 'MarkerEdgeColor',[57 106 177]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(2,1,16)+offset+offset2', MeanDur(:,4), sz, 'MarkerEdgeColor',[204 37 41]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(3,1,16)-offset+offset2', MeanDur(:,5), sz, 'MarkerEdgeColor',[57 106 177]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(3,1,16)+offset+offset2', MeanDur(:,6), sz, 'MarkerEdgeColor',[204 37 41]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(4,1,16)-offset+offset2', MeanDur(:,7), sz, 'MarkerEdgeColor',[57 106 177]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(4,1,16)+offset+offset2', MeanDur(:,8), sz, 'MarkerEdgeColor',[204 37 41]/255,'MarkerFaceColor', [1 1 1]);
% scatter(repmat(0.85,1,16), MeanDur(:,1))
er = errorbar(reshape([(1:4)-offset;(1:4)+offset], 1, 8), mean_m, std_m, 'LineWidth', 1.5, 'CapSize', 20);
er.Color = [0 0 0];                            
er.LineStyle = 'none';

plot([3-offset, 3+offset], [1 1]*max(MeanDur(:,5))*1.05, '-k', 'LineWidth', 1.5), plot(3, max(MeanDur(:,5))*1.06, '*k')

xlabel('Microstate Class', 'FontSize', 20)
ylabel('Mean Duration (ms)', 'FontSize', 20)
box off
set(gca, 'xticklabels',{'A', 'B', 'C', 'D'}, 'fontsize', 20)
lgd = legend({'Neutral', 'Fear'}, 'box', 'off');
hold off
axis square
%%
subplot(122)
mean_m = mean(TimeCov);
std_m = std(TimeCov);
b = bar(reshape(mean_m, 2, 4)', 'hist', 'FaceColor', 'flat');
b(1).FaceColor = [114 147 203]/255;
b(1).EdgeColor = 'none';
b(1).Marker = 'o';
% b(1).FaceAlpha = 0.7;
b(2).FaceColor = [211 94 96]/255;
b(2).EdgeColor = 'none';
% b(2).FaceAlpha = 0.7;
hold on
offset = 0.15;
offset2 = [rand(16,1)*0.08] .* reshape([ones(8,1),-ones(8,1)]', 1, 16)'; %+0.05;
sz = 100;
scatter(repmat(1,1,16)-offset+offset2', TimeCov(:,1), sz, 'MarkerEdgeColor',[57 106 177]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(1,1,16)+offset+offset2', TimeCov(:,2), sz, 'MarkerEdgeColor',[204 37 41]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(2,1,16)-offset+offset2', TimeCov(:,3), sz, 'MarkerEdgeColor',[57 106 177]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(2,1,16)+offset+offset2', TimeCov(:,4), sz, 'MarkerEdgeColor',[204 37 41]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(3,1,16)-offset+offset2', TimeCov(:,5), sz, 'MarkerEdgeColor',[57 106 177]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(3,1,16)+offset+offset2', TimeCov(:,6), sz, 'MarkerEdgeColor',[204 37 41]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(4,1,16)-offset+offset2', TimeCov(:,7), sz, 'MarkerEdgeColor',[57 106 177]/255,'MarkerFaceColor', [1 1 1]);
scatter(repmat(4,1,16)+offset+offset2', TimeCov(:,8), sz, 'MarkerEdgeColor',[204 37 41]/255,'MarkerFaceColor', [1 1 1]);

er = errorbar(reshape([(1:4)-offset;(1:4)+offset], 1, 8), mean_m, std_m, 'LineWidth', 1.5, 'CapSize', 13);
er.Color = [0 0 0];                            
er.LineStyle = 'none';

plot([3-offset, 3+offset], [1 1]*max(TimeCov(:,5))*1.05, '-k', 'LineWidth', 1.5), plot(3, max(TimeCov(:,5))*1.062, '*k')
plot([4-offset, 4+offset], [1 1]*max(TimeCov(:,8))*1.1, '-k', 'LineWidth', 1.5), plot( 4, max(TimeCov(:,8))*1.12, '*k')

xlabel('Microstate Class', 'FontSize', 20)
ylabel('Time Coverage (%)', 'FontSize', 20)
box off
set(gca, 'xticklabels',{'A', 'B', 'C', 'D'}, 'fontsize', 20)
lgd = legend({'Neutral', 'Fear'}, 'box', 'off');
hold off
axis square
