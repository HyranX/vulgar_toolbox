function [fai, psai] = chao_pca(X)
%方法1:求标准化后的协差矩阵,再求特征根和特征向量=================
%标准化处理
    [p,n]=size(X);
    for j=1:n
        mju(j)=mean(X(:,j));
        sigma(j)=sqrt(cov(X(:,j)));
    end
    for i=1:p
        for j=1:n
            Y(i,j)=(X(i,j)-mju(j))/sigma(j);
        end
    end
    sigmaY=cov(Y);
    %求X标准化的协差矩阵的特征根和特征向量
    [T,lambda]=eig(sigmaY);
    disp('特征根(由小到大):');
    disp(lambda);
    disp('特征向量:');
    disp(T);
    %方差贡献率;累计方差贡献率
    Xsum=sum(sum(lambda,2),1);
    for i=1:n
        fai(i)=lambda(i,i)/Xsum;
    end
    for i=1:n
        psai(i)= sum(sum(lambda(1:i,1:i),2),1)/Xsum;
    end
    disp('方差贡献率:');
    disp(fai);
    disp('累计方差贡献率:');
    disp(psai);
end




% %主成分分析法 PCA Run principal component analysis on the dataset X
% %   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
% %   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
% %
% [m, n] = size(X);
% U = zeros(n);
% S = zeros(n);
% sigma = X' * X / m;
% [U, S, X] = svd(sigma);
% end
% % 
% % function Z = projectData(X, U, K)
% % %on to the top k eigenvectors
% % %   Z = projectData(X, U, K) computes the projection of 
% % %   the normalized inputs X into the reduced dimensional space spanned by
% % %   the first K columns of U. It returns the projected examples in Z.
% % %
% % Z = zeros(size(X, 1), K);
% % for i = 1:size(X,1)
% %   for k = 1:K
% %     x= X(i, :)';
% %     Z(i,k) = x' * U(:, k);
% %   end
% % end
% % end
