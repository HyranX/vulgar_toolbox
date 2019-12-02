function output=chao_greyana(x0)

%�ο�������Ƚ����ӹ�ͬ�洢��һ������x0��,�ο�����λ�ڵ�һ��

%б������
for i=2:length(x0(:,1))
    x1(i,:)=x0(i,:)-x0(i-1,:);
end

%��׼��
m=length(x1(1,:));
for i=1:m
x2(:,i)=x1(:,i)/std(x1(:,i));
end

%����
[y,pos]=sort(x2(:,1));
x2_sorted=x2(pos,:);

% �ж���������
n=length(x1(:,1));
k=[1:n]';
for j=1:m
sig_j(j)=qiuhe(k.*x2_sorted(:,j))-qiuhe(x2_sorted(:,j))*qiuhe(k)/n;
end

%caculation of distantion
for j=2:m
    dist_0i(:,j)=abs(sign(sig_j(:,j)./sig_j(:,1)).*x2_sorted(:,j)-x2_sorted(:,1));
end

%�������ϵ��
for i=1:n
    for j=1:m
        coef_rela(i,j)=(min(dist_0i)+0.5*max(dist_0i))/(dist_0i(i,j)+0.5*max(dist_0i));
end
end

for j=1:m
output(j)=qiuhe(coef_rela(:,j))/n;
end



function output=qiuhe(input)
output=0;
for i=1:length(input)
    output=output+input(i);
end






% function chao_greyana(stats)
% %% stats��һ��m��n�����۾��󣬼�m�����۶���n������ָ��
% %% [��Ҫ]���òο����У�����ָ�����������ֵ��ɵ������������ȱ���Ҫ��stats����һ��
% optArray=max(stats,[],1); % �������ü�������ָ���Ϊ������ָ�꣬��ָ������ֵ��ɲο����У���ʵ��Ӧ���и��ݾ��������������
% %% ԭʼ���۾����������
% [r,c]=size(stats);       % stats�������������������۶���ĸ���������ָ��ĸ���
% samNo=1:r;               % �������
% %% ���ݹ淶������������ָ��������ο�����һ��淶����0-1֮��
% % �������ȫΪ����ָ�꣬������ȫ��ָ��ֵԽ��Խ�ã���ʵ��Ӧ���и��ݾ�������ֱ���Բ�ͬ���͵�ָ�����ݽ��б�׼��������Ȼ���������޸���Ӧ�Ĵ���
% % �����׼������������http://blog.sina.com.cn/s/blog_b3509cfd0101bsky.html
% stdMatrix=zeros(r+1,c);  % ����׼���������ռ䣬��һ��Ϊ�ο����еı�׼��ֵ���ڶ��������һ��Ϊԭʼ���۾���ı�׼��ֵ
% optArryAndStat=[optArray;stats];
% maxOfCols=max(optArryAndStat);    % �����ο��������ڵĸ��е����ֵ
% minOfCols=min(optArryAndStat);    % �����ο��������ڵĸ��е���Сֵ
% for j=1:c
%     for i=1:r+1
%         stdMatrix(i,j)=(optArryAndStat(i,j)-minOfCols(j))./(maxOfCols(j)-minOfCols(j));  % �����׼��ָ��ֵ
%     end
% end
% %% �������ϵ��
% absValue=zeros(r,c);   % �����Բ�ֵ���з���ռ�
% R_0 = stdMatrix(1,:);  % ��׼��������Ĳο�����
% for i=2:r+1
%     absValue(i-1,:)=abs(stdMatrix(i,:)-R_0);  % ���Բ�ֵ���м���
% end
% minAbsValueOfCols=min(absValue,[],1);    % absValueÿһ�е���Сֵ
% maxAbsValueOfCols=max(absValue,[],1);    % absValueÿһ�е����ֵ
% minAbsValue=min(minAbsValueOfCols);      % absValue����Сֵ
% maxAbsValue=max(maxAbsValueOfCols);      % absValue�����ֵ
% defCoeff=0.5;          % ���÷ֱ�ϵ��Ϊ0.5
% relCoeff=(minAbsValue+defCoeff*maxAbsValue)./(absValue+defCoeff*maxAbsValue);  % ����ϵ������
% %% ���������
% % ���������Ȩ����͹�Ȩ�أ�ʵ�ַ�������http://blog.sina.com.cn/s/blog_b3509cfd0101bm0f.html
% % ��ʵ��Ӧ���пɲ��ò�ͬ�ķ���ȷ��Ȩ�أ�Ȼ���������޸���Ӧ�Ĵ���
% weights=chao_shangquanfa(stdMatrix(2:r,:)');  % Ȩ��
% P=zeros(r,1);    % �����������з���ռ�
% for i=1:r
%     for j=1:c
%         P(i,1)=relCoeff(i,j)*weights(j);  % �����ȼ���
%     end
% end
% %% Ȩ�ؿ��ӻ�
% [sortW,IXW]=sort(weights,'descend');   % Ȩ�ؽ�������IXWȷ����Ӧ��ָ������һ��
% indexes={};
% for i=1:c
%     indexes(i)={strcat('ָ��',num2str(i))}; % ָ������Ϊ��ָ��1����ָ�ꡰ2������
% end
% sortIndex=indexes(IXW);                % �������Ȩ�ض�Ӧ��ָ������
% figure;
% subplot(1,2,1);
% bar(weights);
% xlim([0 c+1]);   % ����x�᷶Χ
% xlabel('ָ������','FontSize',12,'FontWeight','bold');
% set(gca,'xtick',1:c);
% set(gca,'XTickLabel',indexes,'FontWeight','light');
% ylabel('Ȩ��','FontSize',12,'FontWeight','bold');
% set(gca,'YGrid','on');
% for i=1:c
%     text(i-0.35,weights(i)+0.005,sprintf('%.3f',weights(i)));
% end
% title('ָ��Ȩ�ؿ��ӻ�');
% box off;
% subplot(1,2,2);
% bar(sortW);
% xlim([0 c+1]);   % ����x�᷶Χ
% xlabel('ָ������','FontSize',12,'FontWeight','bold');
% set(gca,'xtick',1:c);
% set(gca,'XTickLabel',sortIndex,'FontWeight','light');
% ylabel('Ȩ��','FontSize',12,'FontWeight','bold');
% set(gca,'YGrid','on');
% for i=1:c
%     text(i-0.35,sortW(i)+0.005,sprintf('%.3f',sortW(i)));
% end
% title('ָ��Ȩ�ؿ��ӻ����������У�');
% box off;
% %% �����ȷ������չʾ
% [sortP,IX]=sort(P,'descend');  % �����Ƚ�������IXȷ����Ӧ���������һ��
% sortSamNo=samNo(IX);           % �����������ȶ�Ӧ���������
% figure;
% subplot(2,1,1);
% plot(P,'--rs',...
%     'LineWidth',2,...
%     'MarkerEdgeColor','k',...
%     'MarkerFaceColor','g',...
%     'MarkerSize',10);
% xlim([1 r]);   % ����x�᷶Χ
% xlabel('�������','FontSize',12,'FontWeight','bold');
% set(gca,'xtick',1:r);
% set(gca,'XTickLabel',samNo,'FontWeight','light');
% ylabel('������','FontSize',12,'FontWeight','bold');
% title('XXX�����ɫ�������ۺ����۽��');
% grid on;
% subplot(2,1,2);
% plot(sortP,'--rs',...
%     'LineWidth',2,...
%     'MarkerEdgeColor','k',...
%     'MarkerFaceColor','g',...
%     'MarkerSize',10);
% xlim([1 r]);   % ����x�᷶Χ
% xlabel('�������','FontSize',10,'FontWeight','bold');
% set(gca,'xtick',1:r);
% set(gca,'XTickLabel',sortSamNo,'FontWeight','light');
% ylabel('������','FontSize',10,'FontWeight','bold');
% title('XXX�����ɫ�������ۺ����۽�����������У�');
% grid on;
% hold off;
% end