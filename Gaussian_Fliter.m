function [ Gaussian_Filter , Blur_Image , Miss_Image ] = Gaussian_Fliter( Image , Variance  , Mode )
% Author : Mehdi Sadeghi
% gaussian filter
[R C D] = size(Image);
if D == 3
    Image = rgb2gray(Image);
end
Image = double(Image);
    CX = round(C/2);
    CY = round(R/2);
    [X Y] = meshgrid(1:C , 1:R);
    X = X - CX;
    Y = Y - CY;
    Gaussian_Filter =  exp( -(X.^2+Y.^2)/(2*Variance^2) ) / (2*pi*Variance^2);
    Gaussian_Filter = Gaussian_Filter / max(Gaussian_Filter(:));
    if strcmp(Mode , 'High')
        Gaussian_Filter = 1- Gaussian_Filter;
    end
    FT_Image = fftshift(fft2(Image));
    FT_Blur_Image =  FT_Image .* Gaussian_Filter;
    Blur_Image = abs(ifft2(FT_Blur_Image));
    Miss_Image = Image - Blur_Image;
    Blur_Image = uint8(Blur_Image);
    Miss_Image = uint8(Miss_Image);
end




