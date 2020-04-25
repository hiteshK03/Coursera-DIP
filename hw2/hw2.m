% Here we will implement spatial-domain low-pass filtering
% and, evaluate the difference between the filtered image and 
% the original image using two quantitative metrics called 
% Mean Squared Error (MSE) and Peak Signal-to-Noise Ratio (PSNR).

img = imread("digital_images_week2_quizzes_lena.gif");
img_mod = im2double(img);

flt_size = 3; % dimension of 2D filter
flt = (1/flt_size^2)*ones(flt_size,flt_size);
img_flt = imfilter(img_mod, flt, 'replicate');

MAX = 1; % max value of pixel
MSE = immse(img_flt, img_mod); % Mean Square Error
psnr = 10*log10(MAX^2/MSE); % Peak Signal-to-Noise Ratio

fprintf('\n The Peak-SNR value is %0.2f', psnr);