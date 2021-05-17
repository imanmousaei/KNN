clc
clear
close all
%%
I=xlsread('dataset.xlsx');
R=0.7;
K = 3;
Ntrain= round(0.7 * size(I,1));
trData=I(1:Ntrain,1:3);
trLabels=I(1:Ntrain,end);
tsData=I(Ntrain+1:end,1:3);
tsLabels=I(Ntrain+1:end,end);
%%
for i=1:size(tsData, 1)
    F = dist(tsData(i, :), trData');
    [vs, inds] = sort(F);
    nearest = trLabels(inds(1:K));
    
    class1 = numel(find(nearest == 1));
    class2 = numel(find(nearest == 2));
    if(class1 > class2)
        y_test(i) = 1;
    else
        y_test(i) = 2;
    end
end
%%
plotconfusion(categorical(tsLabels),categorical(y_test'))
