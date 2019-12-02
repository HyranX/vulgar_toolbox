function [g] = shangquanfa(x)
y=[];
[m,n]=size(x);
for i=1:n
    y(:,i)=x(:,i)/sum([x(:,i)]);
end
for l=1:n
    s(1,l)=0;
    for j=1:m
        p(1,l)=y(j,l)*log(y(j,l));
        s(1,l)=s(1,l)+p(1,l);
    end
end
k=(log(m))^(-1);
e=-k*s;
h=ones(1,n)-e;
w=h/sum(h);
sum(w); 
g=y*w';
end
