function [] = gem(score)
clc;format compact;
disp('#########����F:##########')
rict=score'*score;
disp(rict)
[v,d]=eig(rict);
disp('##########������������v:##########')
disp(v)
disp('##########��Ӧ����ֵd:##########')
d;
d_max_1 = max(d);
disp(d_max_1)
disp('##########�������ֵ:##########')
d_max = max(max(d));
disp(d_max)
disp('##########�������ֵλ�ڵڼ�λ��##########')
for i = 1:size(max(d),2)
    if d_max == d_max_1(1)
        break;
    end
end
disp(i)
disp('##########�������ֵ��Ӧ�����������ǣ�##########')
[~, y]=size(score);
x=v(:,y);
disp(x)
disp('##########����������׼������Ϊ��##########')
z=x/sum(x);
disp(z)
disp('##########��ָ���������##########')
[~,xb] = sort(z,'descend');
disp(abs(xb-size(score,2))+1)
end

