%-------------------------------------------------------------------------%
%  Project       : Simple Tic Tac Toe                                     %
%  File          : TicTacToe.m                                            %
%  Description   : Simple Tic Tac Toe Game                                %
%  Author        : Monahopoulos Konstantinos                              %
%-------------------------------------------------------------------------%

clear;clc;close all;
fprintf('Welcome to the TIC TAC TOE game powered by Monahopoulos Konstantinos\n\n')
fprintf('Instructions : To set the coordinates for the move you want to play \n')
fprintf('just write on command prompt 11 (raw 1,column 1), 13 (raw 1,column 3) ... e.t.c\n\n')
name1=input('Player one enter your name :\n','s');
name2=input('Player two enter your name :\n','s');
fprintf('\nplayer %s you have %c\n',name1,'O')
fprintf('player %s you have %c\n',name2,'X')

BoardDimXY(1)=512; % Dimensions of the board (x)
BoardDimXY(2)=512; % Dimensions of the board (y)

TicTacToeFig=255*ones(BoardDimXY(1),BoardDimXY(2),'uint8');
yline=floor(BoardDimXY(2)/3);
xline=floor(BoardDimXY(1)/3);
xsize=length(TicTacToeFig(1,:));
ysize=length(TicTacToeFig(:,1));
TicTacToePos=zeros(3,3);
TicTacToeTmp=zeros(3,3);

% Draw Board Lines
for i=1:2
    TicTacToeFig(:,i*yline)=0;
    TicTacToeFig(i*xline,:)=0;
end

% Draw Board Edges
TicTacToeFig(1,1:ysize)=0;
TicTacToeFig(1:xsize,1)=0;
TicTacToeFig(end,1:ysize)=0;
TicTacToeFig(1:xsize,end)=0;
figure(1),imshow(TicTacToeFig)
title('(: Tic Tac Toe :)');

k=[1 1.5 1.6667]; % TTT on board lines coef

% Centers of boxes
for j=1:3
    for i=1:3
        TicTacToeTmpx(j,i)=round((i*k(i))*floor(xsize/6));
        TicTacToeTmpy(i,j)=round((i*k(i))*floor(ysize/6));
    end
end

% Let the game beggin
while (true)
    PlayAgainFlag=1;
    while (PlayAgainFlag==1)
        fprintf('\nPlayer %s give coordinates for -%c-,\n',name1,'O');
        xy=input('First raw after column: ');
        
        % Calculate the coordinates (raw and column)
        for i=1:3
            for j=1:3
                if xy/((i*10)+j)==1
                    TicTacToeTmp(i,j)=1;
                    i_play=i;
                    j_play=j;
                else
                    TicTacToeTmp(i,j)=0;
                end
            end
        end
        
        if TicTacToePos(i_play,j_play)~=0 % if the seat is takken, play again
            disp('This seat is takken, play again');
        else
            PlayAgainFlag=0;
            % Store the played coordinates
            TicTacToePos=TicTacToeTmp+TicTacToePos;
            % Radiance of circle
            r=floor(yline-(0.7*yline));
            for j=1:3
                for i=1:3
                    if (TicTacToeTmp(j,i) == 1)
                        % Call circle function to draw
                        TicTacToeFig=Draw_Circle(TicTacToeFig,TicTacToeTmpy(j,i),TicTacToeTmpx(j,i),r);
                    end
                end
            end
            hold on
            figure(1),imshow(TicTacToeFig)
            hold off
        end
    end
    
    if ((TicTacToePos(1,1) == 2 && TicTacToePos(1,2) == 2 && TicTacToePos(1,3) == 2)...
            || (TicTacToePos(2,1) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(2,3) == 2) ...
            || (TicTacToePos(3,1) == 2 && TicTacToePos(3,2) == 2 && TicTacToePos(3,3) == 2) ...
            || (TicTacToePos(1,1) == 2 && TicTacToePos(2,1) == 2 && TicTacToePos(3,1) == 2) ...
            || (TicTacToePos(1,2) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(3,2) == 2) ...
            || (TicTacToePos(1,3) == 2 && TicTacToePos(2,3) == 2 && TicTacToePos(3,3) == 2) ...
            || (TicTacToePos(1,1) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(3,3) == 2) ...
            || (TicTacToePos(1,3) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(3,1) == 2) ...
            || (TicTacToePos(1,1) == 1 && TicTacToePos(1,2) == 1 && TicTacToePos(1,3) == 1) ...
            || (TicTacToePos(2,1) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(2,3) == 1) ...
            || (TicTacToePos(3,1) == 1 && TicTacToePos(3,2) == 1 && TicTacToePos(3,3) == 1) ...
            || (TicTacToePos(1,1) == 1 && TicTacToePos(2,1) == 1 && TicTacToePos(3,1) == 1) ...
            || (TicTacToePos(1,2) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(3,2) == 1) ...
            || (TicTacToePos(1,3) == 1 && TicTacToePos(2,3) == 1 && TicTacToePos(3,3) == 1) ...
            || (TicTacToePos(1,1) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(3,3) == 1) ...
            || (TicTacToePos(1,3) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(3,1) == 1) ...
            || (TicTacToePos(1,1) ~= 0 && TicTacToePos(1,2) ~=0 && TicTacToePos(1,3) ~= 0 ...
            && TicTacToePos(2,1) ~= 0 && TicTacToePos(2,2) ~=0 && TicTacToePos(2,3) ~=0 ...
            && TicTacToePos(3,1) ~=0 && TicTacToePos(3,2) ~=0 && TicTacToePos(3,3) ~=0 ))
        % If draw or win then break
        break
    end
    
    PlayAgainFlag=1;
    while (PlayAgainFlag==1)
        fprintf('\nPlayer %s give coordinates for -%c-,\n',name2,'X');
        xy=input('First raw after column: ');
        
        % Calculate the coordinates (raw and column)
        for i=1:3
            for j=1:3
                if xy/((i*10)+j)==1
                    TicTacToeTmp(i,j)=2;
                    i_play=i;
                    j_play=j;
                else
                    TicTacToeTmp(i,j)=0;
                end
            end
        end
        
        if TicTacToePos(i_play,j_play)~=0
            disp('This seat is takken, play again');
        else
            PlayAgainFlag=0;
            for j=1:3
                for i=1:3
                    if (TicTacToeTmp(j,i) == 2)
                        distx=floor(yline-(0.7*yline));
                        % Call X function to draw
                        TicTacToeFig=Draw_X(TicTacToeTmpy(j,i),TicTacToeTmpx(j,i),TicTacToeFig,distx);
                    end
                end
            end
            hold on
            figure(1),imshow(TicTacToeFig)
            hold off
            TicTacToePos=TicTacToeTmp+TicTacToePos;
        end
    end
    
    if ((TicTacToePos(1,1) == 2 && TicTacToePos(1,2) == 2 && TicTacToePos(1,3) == 2) ...
            || (TicTacToePos(2,1) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(2,3) == 2) ...
            || (TicTacToePos(3,1) == 2 && TicTacToePos(3,2) == 2 && TicTacToePos(3,3) == 2) ...
            || (TicTacToePos(1,1) == 2 && TicTacToePos(2,1) == 2 && TicTacToePos(3,1) == 2) ...
            || (TicTacToePos(1,2) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(3,2) == 2) ...
            || (TicTacToePos(1,3) == 2 && TicTacToePos(2,3) == 2 && TicTacToePos(3,3) == 2) ...
            || (TicTacToePos(1,1) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(3,3) == 2) ...
            || (TicTacToePos(1,3) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(3,1) == 2) ...
            || (TicTacToePos(1,1) == 1 && TicTacToePos(1,2) == 1 && TicTacToePos(1,3) == 1) ...
            || (TicTacToePos(2,1) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(2,3) == 1)...
            || (TicTacToePos(3,1) == 1 && TicTacToePos(3,2) == 1 && TicTacToePos(3,3) == 1) ...
            || (TicTacToePos(1,1) == 1 && TicTacToePos(2,1) == 1 && TicTacToePos(3,1) == 1) ...
            || (TicTacToePos(1,2) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(3,2) == 1) ...
            || (TicTacToePos(1,3) == 1 && TicTacToePos(2,3) == 1 && TicTacToePos(3,3) == 1)...
            || (TicTacToePos(1,1) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(3,3) == 1) ...
            || (TicTacToePos(1,3) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(3,1) == 1) ...
            || (TicTacToePos(1,1) ~= 0 && TicTacToePos(1,2) ~=0 && TicTacToePos(1,3) ~= 0 ...
            && TicTacToePos(2,1) ~= 0 && TicTacToePos(2,2) ~=0 && TicTacToePos(2,3) ~=0 ...
            && TicTacToePos(3,1) ~=0 && TicTacToePos(3,2) ~=0 && TicTacToePos(3,3) ~=0 ))
        % If draw or win then break
        break
    end
end

% Find the winner and set the line
for t=0:1
    if (TicTacToePos(1,1) == 1+t && TicTacToePos(1,2) == 1+t && TicTacToePos(1,3) == 1+t)
        TicTacToeFig(TicTacToeTmpy(1,1),TicTacToeTmpx(1,1):TicTacToeTmpx(1,3))=0;
        figure,imshow(TicTacToeFig)
    else if (TicTacToePos(2,1) == 1+t && TicTacToePos(2,2) == 1+t && TicTacToePos(2,3) == 1+t)
            TicTacToeFig(TicTacToeTmpy(2,1),TicTacToeTmpx(1,1):TicTacToeTmpx(1,3))=0;
            figure,imshow(TicTacToeFig)
        else if (TicTacToePos(3,1) == 1+t && TicTacToePos(3,2) == 1+t && TicTacToePos(3,3) == 1+t)
                TicTacToeFig(TicTacToeTmpy(3,1),TicTacToeTmpx(1,1):TicTacToeTmpx(1,3))=0;
                figure,imshow(TicTacToeFig)
            else if (TicTacToePos(1,1) == 1+t && TicTacToePos(2,1) == 1+t && TicTacToePos(3,1) == 1+t)
                    TicTacToeFig(TicTacToeTmpy(1,1):TicTacToeTmpy(3,1),TicTacToeTmpx(1,1))=0;
                    figure,imshow(TicTacToeFig)
                else if (TicTacToePos(1,2) == 1+t && TicTacToePos(2,2) == 1+t && TicTacToePos(3,2) == 1+t)
                        TicTacToeFig(TicTacToeTmpy(1,2):TicTacToeTmpy(3,2),TicTacToeTmpx(2,2))=0;
                        figure,imshow(TicTacToeFig)
                    else if (TicTacToePos(1,3) == 1+t && TicTacToePos(2,3) == 1+t && TicTacToePos(3,3) == 1+t)
                            TicTacToeFig(TicTacToeTmpy(1,3):TicTacToeTmpy(3,3),TicTacToeTmpx(3,3))=0;
                            figure,imshow(TicTacToeFig)
                        else if (TicTacToePos(1,1) == 1+t && TicTacToePos(2,2) == 1+t && TicTacToePos(3,3) == 1+t)
                                for i=0:TicTacToeTmpx(1,3)-TicTacToeTmpx(1,1);
                                    TicTacToeFig(TicTacToeTmpx(1,1)+i,TicTacToeTmpx(1,1)+i)=0;
                                end
                                figure,imshow(TicTacToeFig)
                            else if (TicTacToePos(1,3) == 1+t && TicTacToePos(2,2) == 1+t && TicTacToePos(3,1) == 1+t)
                                    for i=0:TicTacToeTmpx(1,3)-TicTacToeTmpx(1,1);
                                        TicTacToeFig(TicTacToeTmpy(1,1)+i,TicTacToeTmpy(3,3)-i)=0;
                                    end
                                    figure(1),imshow(TicTacToeFig);
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

% Announce the winner or the draw
if ((TicTacToePos(1,1) == 1 && TicTacToePos(1,2) == 1 && TicTacToePos(1,3) == 1) ...
        || (TicTacToePos(2,1) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(2,3) == 1) ...
        || (TicTacToePos(3,1) == 1 && TicTacToePos(3,2) == 1 && TicTacToePos(3,3) == 1) ...
        || (TicTacToePos(1,1) == 1 && TicTacToePos(2,1) == 1 && TicTacToePos(3,1) == 1) ...
        || (TicTacToePos(1,2) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(3,2) == 1) ...
        || (TicTacToePos(1,3) == 1 && TicTacToePos(2,3) == 1 && TicTacToePos(3,3) == 1) ...
        || (TicTacToePos(1,1) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(3,3) == 1) ...
        || (TicTacToePos(1,3) == 1 && TicTacToePos(2,2) == 1 && TicTacToePos(3,1) == 1))
    fprintf('Player %s is the WINNER',name1)
else if ((TicTacToePos(1,1) == 2 && TicTacToePos(1,2) == 2 && TicTacToePos(1,3) == 2) ...
            || (TicTacToePos(2,1) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(2,3) == 2) ...
            || (TicTacToePos(3,1) == 2 && TicTacToePos(3,2) == 2 && TicTacToePos(3,3) == 2) ...
            || (TicTacToePos(1,1) == 2 && TicTacToePos(2,1) == 2 && TicTacToePos(3,1) == 2) ...
            || (TicTacToePos(1,2) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(3,2) == 2) ...
            || (TicTacToePos(1,3) == 2 && TicTacToePos(2,3) == 2 && TicTacToePos(3,3) == 2) ...
            || (TicTacToePos(1,1) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(3,3) == 2) ...
            || (TicTacToePos(1,3) == 2 && TicTacToePos(2,2) == 2 && TicTacToePos(3,1) == 2))
        fprintf('Player %s is the WINNER',name2)
    else
        disp('Draw - Nobody Wins');
    end
end
