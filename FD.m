lena = imread('lena_color_512.tif');
mandril = imread('mandril_color.tif');
warning off

%imshow(lena);
lena = rgb2gray(lena);
mandril = rgb2gray(mandril);

% show picture after pre-processing
imshow(lena)
imshow(mandril)

% show frequency domain
%imshow(fftshift(log(abs(fft2(lena)))),[])
imshow(fftshift(log(abs(fft2(mandril)))),[])

% show histogram
lena_out = abs(fft2(lena));
mandril_out = abs(fft2(mandril));
lena_out(1,1)=0;
mandril_out(1,1)=0;
%hist(lena_out(:));
%hist(mandril_out(:));

box on
%image(lena_out)
%imshow(fftshift(lena_out),[0,500000])

%out = idealFilter(lena,[70 70],'lp');
%out = idealFilter(mandril,[70 70],'lp');
%out = idealFilter(lena,[20 20],'lp');
%out = idealFilter(lena,[70 70],'hp');
out = idealFilter(mandril,[70 70],'hp')
%out = idealFilter(lena,[20],'gausslp')
%out = idealFilter(lena,[5],'gausslp')
