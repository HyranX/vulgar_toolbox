function [ z ] = chao_pearson( a )
format compact
[r,p]=corrcoef(a);
[~,sb]=size(a);
z=[sb,sb];
for i=1:sb
    for j=1:sb
        if i<j
            z(i,j)=p(i,j);
        else
            z(i,j)=r(i,j);
        end
    end
end