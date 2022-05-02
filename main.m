close all,
clear all,
clc;


%% Explanation on SVD (Referred from MATLAB Documentation)

% [___] = svd(A,"econ") produces an economy-size decomposition of A 
% using either of the previous output argument combinations. 
% If A is an m-by-n matrix, then,
% m > n — Only the first n columns of U are computed, and S is n-by-n.
% m = n — svd(A,"econ") is equivalent to svd(A).
% m < n — Only the first m columns of V are computed, and S is m-by-m.


%% Printing some Information

fprintf("Application of SVD in Image Compression\n\n");

%% Getting the image, performing SVD and displaying the original image
fprintf("Getting the image and performing SVD\n");

X = getImage("w");  % Image Matrix in Grayscale

fprintf("Started Singular Value Decomposition...\n");
tic, 
    [RU, RS, RV] = svd(X(:, :, 1), 'econ');
    [GU, GS, GV] = svd(X(:, :, 2), 'econ');
    [BU, BS, BV] = svd(X(:, :, 3), 'econ');
toc;
fprintf("SVD is complete\n\n");

figure("Name", "Original Image");
printImage(X);
title("Original Image")
pause;


%% Plotting the Singular Values
figure("Name", "Singular Values of the Image");

subplot(1, 3, 1);
sigmas = diag(RS);
semilogy(sigmas, 'k', 'Linewidth', 2);
title("Red");

subplot(1, 3, 2);
sigmas = diag(GS);
semilogy(sigmas, 'k', 'Linewidth', 2);
title("Green");

subplot(1, 3, 3);
sigmas = diag(BS);
semilogy(sigmas, 'k', 'Linewidth', 2);
title("Blue");

fprintf("We can see that the first few values are dominating \n" + ...
    "and consititute most of the image matrix \n\n");
pause;

%% Making Subplots
[m, n, ~] = size(X);

fprintf("Drawing subplots... \n");

% We will be constructing 4 subplots with max_energy/2 as the max energy
maxR = round((n+1) / 4);
maxR = 20*round(maxR/20);  % Converting to nearest multiple of 20

vals = 1:4;
vals = maxR/8 * vals;

figure("Name", "Compressed Images with matrices of rank k");
title("Compressed Images");
plotindex = 1;
for r = vals
    % For r rows

    Xapprox(:, :, 1) = RU(:, 1:r) * RS(1:r, 1:r) * RV(:, 1:r)';
    Xapprox(:, :, 2) = GU(:, 1:r) * GS(1:r, 1:r) * GV(:, 1:r)';
    Xapprox(:, :, 3) = BU(:, 1:r) * BS(1:r, 1:r) * BV(:, 1:r)';

    subplot(2, 2, plotindex);
    plotindex = plotindex + 1;
    printImage(Xapprox);
    title(sprintf("r = %d, %.2f %% storage.", r, 200*r/n));
end

fprintf("Subplots Drawn\n\n");
pause;


%% Analysing the difference

figure("Name", "Difference in Images");
title("Difference");
plotindex = 1;
for r = [1, 5, 10, 30]
    % For r rows

    Xapprox(:, :, 1) = RU(:, 1:r) * RS(1:r, 1:r) * RV(:, 1:r)';
    Xapprox(:, :, 2) = GU(:, 1:r) * GS(1:r, 1:r) * GV(:, 1:r)';
    Xapprox(:, :, 3) = BU(:, 1:r) * BS(1:r, 1:r) * BV(:, 1:r)';

    subplot(2, 2, plotindex);
    plotindex = plotindex + 1;
    printImage(X - Xapprox);
    title(sprintf("r = %d, %.2f %% storage.", r, 200*r/n));
end

fprintf("The difference in the images is almost negligible.\n\n")
pause;

%% Analysis of the image using ten Singular Values

fprintf("Analysis of the image using ten Singular Values \n\n");

figure("Name", "Analysing using 10 Singular Values")
r = 10;
Xapprox(:, :, 1) = RU(:, 1:r) * RS(1:r, 1:r) * RV(:, 1:r)';
Xapprox(:, :, 2) = GU(:, 1:r) * GS(1:r, 1:r) * GV(:, 1:r)';
Xapprox(:, :, 3) = BU(:, 1:r) * BS(1:r, 1:r) * BV(:, 1:r)';

subplot(1, 3, 1);
printImage(X);
title("Original Image");

subplot(1, 3, 2);
printImage(Xapprox);
title(sprintf("r = %d, %.2f %% storage.", r, 200*r/n));

subplot(1, 3, 3);
printImage(X - Xapprox);
title("Difference");
pause;


%% Comparing the Original and 50% 

fprintf("Drawing the Comparison plot... \n\n");
figure("Name", ...
    "Comparing the original and the image compressed by about 50%");
title("Comparing the original and the image compressed by about 50%");

r = maxR;
Xapprox(:, :, 1) = RU(:, 1:r) * RS(1:r, 1:r) * RV(:, 1:r)';
Xapprox(:, :, 2) = GU(:, 1:r) * GS(1:r, 1:r) * GV(:, 1:r)';
Xapprox(:, :, 3) = BU(:, 1:r) * BS(1:r, 1:r) * BV(:, 1:r)';


subplot(1, 2, 1);
printImage(X);
title("Original Image");

subplot(1, 2, 2);
printImage(Xapprox);
title("Compressed by about 50%");

fprintf("----Thank You -----\n");

