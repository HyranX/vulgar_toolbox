function [] = gem(score)
clc;format compact;
disp('#########矩阵F:##########')
rict=score'*score;
disp(rict)
[v,d]=eig(rict);
disp('##########特征向量矩阵v:##########')
disp(v)
disp('##########对应特征值d:##########')
d;
d_max_1 = max(d);
disp(d_max_1)
disp('##########最大特征值:##########')
d_max = max(max(d));
disp(d_max)
disp('##########最大特征值位于第几位？##########')
for i = 1:size(max(d),2)
    if d_max == d_max_1(1)
        break;
    end
end
disp(i)
disp('##########最大特征值对应的特征向量是：##########')
[~, y]=size(score);
x=v(:,y);
disp(x)
disp('##########特征向量标准化后结果为：##########')
z=x/sum(x);
disp(z)
disp('##########各指标的排名：##########')
[~,xb] = sort(z,'descend');
disp(abs(xb-size(score,2))+1)
end

