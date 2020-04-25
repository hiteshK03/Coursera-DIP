% Here we will change the resolution of an image, i.e., down-sample 
% and up-sample the image and, evaluate the difference between
% the upsampled version of previously downsampled image and
% the original image using two quantitative metrics called 
% Mean Squared Error (MSE) and Peak Signal-to-Noise Ratio (PSNR).

img = imread("digital_images_week3_quizzes_original_quiz.jpg");
img_mod = im2double(img);

% Down-sampling of original image

flt_size = 3;
flt = (1/flt_size^2)*ones(flt_size,flt_size);
img_flt = imfilter(img_mod, flt, 'replicate');

[rows, coloumns, channels] = size(img_flt);

img_down = ones(floor(rows/2),floor(coloumns/2));

for i = 1:1+rows/2
    for j = 1:1+coloumns/2
        img_down(i,j) = img_flt(2*i-1,2*j-1);
    end
end

% Up-sampling of down-sampled image to get the original resolution.
 
img_dummy = zeros(359,479);

for i = 1:2:rows
    for j = 1:2:coloumns
        img_dummy(i,j) = img_down((i+1)/2,(j+1)/2);
    end
end

filt = [0.25,0.5,0.25;0.5,1,0.5;0.25,0.5,0.25];
img_up = imfilter(img_dummy, filt);

% Metrics

MAX = 1; % max value of pixel
MSE = immse(img_up, img_mod);
psnr = 10*log10(MAX^2/MSE);

fprintf('\n The Peak-SNR value is %0.2f', psnr);