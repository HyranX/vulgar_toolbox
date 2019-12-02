function [b] = chao_guiyi(a)
%CHAO_GUIYI ∞¥’’¡–πÈ“ª
b = a;
for iii = 1 : size(a,2)
    b(:,iii) = (a(:,iii) - max(a(:,iii)))/(min(a(:,iii))-max(a(:,iii)));
end

