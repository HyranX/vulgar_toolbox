function [score,rank] = chao_zhengtichayi(x)
%����������۷�
%   �˴���ʾ��ϸ˵��
biaozhun = zscore(x);
squ = biaozhun'*biaozhun;
[v,d]=eig(squ);
disp('����������������')
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
disp('�����������Ӧ��������')
vmax = v(:,jjj)
score = x * vmax;
[~,rank] = sort(score)
end

