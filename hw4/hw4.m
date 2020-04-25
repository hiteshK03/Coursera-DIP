% Here we will perform block matching motion estimation between 
% two consecutive video frames and use MAE as the matching criterion to
% determine the most suitable block.

frame_1 = imread("digital_images_week4_quizzes_frame_1.jpg");
frame_2 = imread("digital_images_week4_quizzes_frame_2.jpg");
I1 = cast(frame_1, 'double');
I2 = cast(frame_2, 'double');

B_target = I2(65:96,81:112);

min_err = 1000;
num = 0;
for i = 1:257
    for j = 1:321
        er = MAE(B_target, I1(i:i+31,j:j+31));
        if er <= min_err
            min_err = er;
            cx = i;
            cy = j;
            coor = i+j;
        end
    end
end

fprintf('\n The MAE value is %0.2f', min_err);

% Function to calculate Mean Absolute Error(MAE)

function err = MAE(B1,B2)
    err = mean(mean(abs(B1-B2)));
end