%-------------------------------------------------------------------------%
%  Project       : Simple Tic Tac Toe                                     %
%  File          : Draw_Circle.m                                          %
%  Description   : Function that draw the circle                          %
%  Author        : Monachopoulos Konstantinos                              %
%-------------------------------------------------------------------------%

function [imagenew] = Draw_Circle(image,centerx,centery,r)
for i=1:size(image,1)
    for j=1:size(image,2)     
        if (round(sqrt((centerx-i)^2+(centery-j)^2))==r); 
            imagenew(i,j)=0;
        else
            imagenew(i,j)=image(i,j);
        end    
    end
end

imagenew=im2uint8(imagenew);
