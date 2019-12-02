function [weight] = shangzhifa(A)
%%% 熵值法编程
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        熵值法编程                               %
%                    输入：一个原始矩阵                            %
%                    输出：指标的权重                              %
%    过程：原始矩阵A 单位化矩阵R 信息熵C 效用d 权重weight 得分Y     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   输入原始矩阵A 
[n,m]=size(A);   % 求出矩阵的行数n和列数m；
k=1/log(n);
a=sum(A);        % 对A矩阵的列求和；
% 标准化 找出r矩阵；
for i=1:m
    e(1,i)=max(A(:,i));  
end
r=zeros(n,m);    % 构建一个n行m列的r矩阵存数据；
for i=1:n
    for j=1:m
        r(i,j)=A(i,j)/e(j);
    end
end
t=sum(r);
R=zeros(n,m);   %  构建矩阵进行单位化；
for i=1:n
    for j=1:m
        R(i,j)=r(i,j)/t(j);
    end
end 
%  上述操作为熵值函数打分做准备；
for i=1:n        % 求出新矩阵B
    for j=1:m
        B(i,j)=A(i,j)/a(j);
    end
end
%  对矩阵B每一个元素取对数矩阵C；
for i=1:n        % 求出对数矩阵C；
    for j=1:m
       C(i,j)=log(B(i,j));
    end
end
D=B.*C;         % 两个矩阵对应位置相乘； 
b=sum(D);       % 对矩阵D求和；
c=(-k)*b;       % 绝对值矩阵；
d=1-c;          % 没有转化的单位矩阵；
s=sum(d);
weight=d/s;     % 转化为单位矩阵
for i=1:n       % 构建权重得分；
    for j=1:m
        y(i,j)=R(i,j)*weight(j);
    end
end  
Y=sum(y,2);     % 求出最后的得分；
end
