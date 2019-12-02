function [score,rank] = chao_zhengtichayi(x)
%整体差异评价法
%   此处显示详细说明
biaozhun = zscore(x);
squ = biaozhun'*biaozhun;
[v,d]=eig(squ);
disp('特征根和特征向量')
v
d
dmax = max(max(d));
for iii = 1:size(d,1)
    for jjj = 1:size(d,2)
        if  d(iii,jjj) == dmax
            break;
        end
    end
end
disp('最大特征根对应特征向量')
vmax = v(:,jjj)
score = x * vmax;
[~,rank] = sort(score)
end

