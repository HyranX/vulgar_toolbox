function [borda] = chao_borda(a)        % ÊäÈëÎª17*28µÄ¾ØÕó
    [sa,sb] = size(a);
    borda=zeros(1,sb);
    for k=1:sa 
        temp=zeros(1,sb);
        for jj=1:sb
            for ii=1:sa
                if a(ii,jj)==k
                    temp(jj)=sa-ii;
                    break;
                end
            end
        end
        borda(k)=sum(temp);
    end
end

