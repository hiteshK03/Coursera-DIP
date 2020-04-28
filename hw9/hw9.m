img = imread("Cameraman256.bmp");
img_mod = im2double(img);

% imwrite(img,"Cameraman256_compressed",'jpg','quality',10);

img_comp = imread("Cameraman256_compressed");
img_other = im2double(img_comp);

% Metrics

MAX = 1; % max value of pixel
MSE = immse(img_other, img_mod);
psnr = 10*log10(MAX^2/MSE);

fprintf('\n The Peak-SNR value is %0.2f', psnr);