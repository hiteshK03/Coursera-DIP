% Compute the entropy of a given gray-scale image
img = imread("Cameraman256.bmp");

% Method 1 (single-line)
J1 = entropy(img);

% Method 2 (Block)
[H, W] = size(img);
[counts,x] = imhist(img);
prob = counts./(H*W);
entr = prob.*log2(prob);
J2 = sum(entr);