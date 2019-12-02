function [TOPSIS]=topsis(A,weight)
%%% topsis编程
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        TOPSIS法编程                                %
%           输入：一个原始矩阵以及一个权重向量                        %
%           输出：按照原始矩阵中每行进行排序（年或者地区）              %
%   过程  规范化矩阵Z 加权规范化矩阵X 理想值e1和负理想值e2  得分topsis  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   输入原始矩阵A以及权重行向量weight  
[n,m]=size(A);     % 求出矩阵A的行数(n)和列数(m);
B=A.^2;            % 对构造的矩阵每个元素都求平方；
a=sum(B);          % 对B的每一列求和（求平方的和）；
b=sqrt(a);         % 对行向量a开方（topsis公式的分母）；
Z=zeros(n,m);      % 构建一个n行m列的零矩阵Z；
for i=1:n          % 求出新矩阵Z
    for j=1:m
        Z(i,j)=A(i,j)/b(j);
    end
end
X=zeros(n,m);
for i=1:n          % 求出加权规范化矩阵X
    for j=1:m
        X(i,j)=Z(i,j)*weight(j);
    end
end
% 返回X的列数k（其实和原来矩阵的列数是一样的）所以这里不再重复做判断列数；
% 求出理想值(最大值)C1和（最小值）C2，做后续处理；
for i=1:m
    C1(1,i)=max(X(:,i));  
end
for i=1:m
    C2(1,i)=min(X(:,i));
end
% 求欧式空间距离；d1就是没有求平方根的理想值，d2就是没有求平方根的负理想值；
d1=zeros(1,n);    % 构建一个理想值的零矩阵；
for i=1:n
    for j=1:m
       d1(i)=d1(i)+(C1(j)-X(i,j))^2;
    end
end
d2=zeros(1,n);    % 构建一个理想值的零矩阵；
for i=1:n
    for j=1:m
       d2(i)=d2(i)+(C2(j)-X(i,j))^2;
    end
end
e1=sqrt(d1);     % 求出理想值（行向量）；
e2=sqrt(d2);     % 求出负理想值（行向量）；
for i=1:n
    e(1,i)=e1(i)+e2(i);  %求出理想值之和；
end
% 求接近度（最后得分）；
for i=1:n
    TOPSIS(1,i)=e2(i)/e(i);   
end
end