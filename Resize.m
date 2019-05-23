function [Resized_Image] = Resize(Image , New_Size , scale , type)
%In this function
%       Image: Input Image(Orginal)
%       New_Size: size of new image  example:[150,120] row=150 columm=120
%       scale: example: [1.5,0.8] Newrow = orginalRow*1.5 / Newclo = orginalcol*0.9
%       type : type of interpolation  NN: Nearest-neighbor Interpolation or Replication
%                                     SH: Shrink Interpolation  
% run this function: Resize(Image , [] , [1,1.5] , 'NN')
Image =im2double(Image);
Original_Rows = size(Image,1);
Original_Cols = size(Image,2);
if isempty(scale)
    scale = [New_Size(1)/Original_Rows  New_Size(2)/Original_Cols];
end
Out_Rows = Original_Rows * scale(1);
Out_Cols = Original_Cols * scale(2);

[NeW_C, NeW_R] = meshgrid(1 : Out_Cols, 1 : Out_Rows);

NeW_R = NeW_R / scale(1);
NeW_C = NeW_C / scale(2);

R_Row = floor(NeW_R);
R_Col = floor(NeW_C);

R_Row(R_Row < 1) = 1;
R_Col(R_Col < 1) = 1;
R_Row(R_Row > Original_Rows - 1) = Original_Rows - 1;
R_Col(R_Col > Original_Cols - 1) = Original_Cols - 1;


%Nearest-neighbor Interpolation or Replication
if type == 'NN'
    for i = 1:size(NeW_R,1)
        for j = 1 : size(NeW_R,2)
            Resized_Image(i,j) = Image(round(NeW_R(i,j)),round(NeW_C(i,j)));
        end
    end
    %Shrink Interpolation
else if type == 'SH'
        delta_R = NeW_R - R_Row;
        delta_C = NeW_C - R_Col;
        
        Ind_1 = sub2ind([Original_Rows, Original_Cols], R_Row, R_Col);
        Ind_2 = sub2ind([Original_Rows, Original_Cols], R_Row+1,R_Col);
        Ind_3 = sub2ind([Original_Rows, Original_Cols], R_Row, R_Col+1);
        Ind_4 = sub2ind([Original_Rows, Original_Cols], R_Row+1, R_Col+1);
        
        Resized_Image = Image(Ind_1) .* (1 - delta_R) .* (1 - delta_C) + ...
            Image(Ind_2) .*   (delta_R)   .* (1 - delta_C) + ...
            Image(Ind_3) .* (1 - delta_R) .*   (delta_C)   + ...
            Image(Ind_4) .*   (delta_R)   .*   (delta_C);
        %Resized_Image = uint8(Resized_Image);
        
    end
end