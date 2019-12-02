function [ b ] = dezeros( a,c )
[m,n] = size(a);
i=1;j=1;
b=a;
for i=1:m
    for j=1:n
        if a(i,j)==0
            b(i,j)=c;
        end
    end
end

