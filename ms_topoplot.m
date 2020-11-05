% import maps
load 'C:\Users\Michele\Desktop\UNI\MyExperiments\(2019) DeoMier\EGI files\EGI_204_chanlocs.mat'
neu = load('neu_EP2.Resamp comp.04.(04).ep');
fea = load('fea_EP2.Resamp_comp.04.(04).ep');

% adjust order of maps
% NEU = D A C B
neu_idx = [4 1 3 2];
neu = neu(neu_idx,:);
% FEA = B D A C
fea_idx = [2 4 1 3];
fea = fea(fea_idx,:);

% adjust color of maps 
fea(4,:) = -fea(4,:);
neu(4,:) = -neu(4,:);
T = ['A'; 'B'; 'C'; 'D'];

% plot
ms = figure;
for map = 4:-1:1
    subplot(2, 4, map)
    topoplotIndie(fea(map,:), chanlocs, 'numcontour',0, 'electrodes', 'off');
    
    if map == 1
        text(-1,0,'Fear', 'FontWeight', 'bold', 'FontSize', 24)
    end
    title(T(map), 'FontSize', 24)
    
    subplot(2, 4, 4+map)
    topoplotIndie(-neu(map,:), chanlocs, 'numcontour',0, 'electrodes', 'off');
    if map == 1
        text(-1,0,'Neutral', 'FontWeight', 'bold', 'FontSize', 24)
    end
end

text(1.55,2.4,'Microstate Class', 'FontWeight', 'bold', 'FontSize', 30)
text(-1.3, .5,'Condition', 'rotation', 90, 'FontWeight', 'bold', 'FontSize', 30)
ax1 = gca;
%% plot spatial correlation table
figure
for i = 1:4
    for j = 1:4
        spatCor(i,j) = corr2(fea(i,:), neu(j,:));
    end
end
spatCor = abs(spatCor);
% spatCorT = array2table(spatCor, 'RowNames',{'A', 'B', 'C', 'D'}, 'VariableNames',{'A', 'B', 'C', 'D'});
% spatCorT.Properties.DimensionNames = {'Fear', 'Neutral'};
xyvalues = {'A','B','C', 'D'};
he = heatmap(xyvalues,xyvalues,spatCor);

he.Title = 'Spatial Correlation';
he.XLabel = 'Fear';
he.YLabel = 'Neutral';
colorbar off
colormap parula
