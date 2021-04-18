function [out,mask] =idealFilter(im,edges,type);
warning off

if nargin < 3
    type = 'lp';
end

im = double(im);
mask = zeros(size(im));
[M,N] = size(im);
rM = round(M/2)+1;
rN = round(N/2)+1;
if length(edges)<2
    [x,y] = meshgrid(1:size(im,1),1:size(im,2));
    ind = ((x-rM).^2+(y-rN).^2 < edges^2)';
    mask(ind) = 1;
else
    mask(rM-edges(1):rM+edges(1),rN-edges(2):rN+edges(2))=1;
end
mask = fftshift(mask);

if strcmp(type,'hp')
    mask = ~mask;
end

if strcmp(type,'gausslp')
    h = fspecial('gaussian',[M,N],edges);
    mask = abs(ifft2(h));
end

if strcmp(type,'laplacian')
    mask = fftshift(-4*pi^2*((x-rM).^2+(y-rN).^2))';
end

figure(1);
imshow(im,[0 255])
title('original image')

ft = fft2(im);

figure(2);
fftshow(ft)
title('original FFT')

figure(3);
fftshow(mask)
title('mask')

ftout = mask.*fft2(im);
figure(4)
fftshow(ftout)
title('output FFT')

out = real(ifft2(ftout));
figure(5)
imshow(out,[])
title('Filtered image')

figure(6)
fftshow(abs(ifft2(mask)))
title('spatial filter corresponding to mask')







