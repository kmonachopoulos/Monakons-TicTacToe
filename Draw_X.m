%-------------------------------------------------------------------------%
%  Project       : Simple Tic Tac Toe                                     %
%  File          : Draw_X.m                                               %
%  Description   : Function that draw the X                               %
%  Author        : Monahopoulos Konstantinos                              %
%-------------------------------------------------------------------------%

function [ placex ] = Draw_X(centerx,centery,image,k)
for p=0:k
    image(centerx-p,centery-p)=0;
    image(centerx-p,centery+p)=0;
    image(centerx+p,centery-p)=0;
    image(centerx+p,centery+p)=0;
end

placex=image;
