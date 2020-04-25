% Here we will perform median filtering to enhance the quality of 
% a noise corrupted image

noisyImage = imread("digital_images_week5_quizzes_noisy.jpg");
noiseFree = imread("digital_images_week5_quizzes_original.jpg");
imgMod1 = im2double(noisyImage);
imgMod2 = im2double(noiseFree);

imp_img1 = medfilt2(imgMod1); % 1-pass filtering output
imp_img2 = medfilt2(imp_img1); % 2-pass filtering output

MAX = 1; % max value of pixel

MSE1 = immse(imgMod1, imgMod2);
MSE2 = immse(imgMod2, imp_img1);
MSE3 = immse(imgMod2, imp_img2);

psnr1 = 10*log10(MAX^2/MSE1);
psnr2 = 10*log10(MAX^2/MSE2);
psnr3 = 10*log10(MAX^2/MSE3);

fprintf(['\n The Peak-SNR value between the noise-free image ' ...
    'and the noisy input image is %0.2f'], psnr1);
fprintf(['\n The Peak-SNR value between the noise-free image ' ...
    'and the 1-pass filtering output is %0.2f'], psnr2);
fprintf(['\n The Peak-SNR value between the noise-free image ' ...
    'and the 2-pass filtering output is %0.2f'], psnr3);

% subplot(1,2,1), imshow(imp_img1)
% subplot(1,2,2), imshow(imp_img2)