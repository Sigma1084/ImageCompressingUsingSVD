close all,
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

fprintf("For demonstration, we will be using images in \n" + ...
    "grayscale since it is easier to deal with a single matrix \n" + ...
    "rather than 3 different matrices (in case of RGB). \n\n")


%% Getting the image, performing SVD and displaying the original image
fprintf("Getting the image and performing SVD\n");

X = getImage("b1");  % Image Matrix in Grayscale

fprintf("Started Singular Value Decomposition...\n");
tic, [U, S, V] = svd(X, 'econ'); toc;
fprintf("SVD is complete\n\n");

figure("Name", "Original Image");
printImage(X);
title("Original Image in GrayScale")


%% Plotting the Singular Values
figure("Name", "Singular Values of the Image");
sigmas = diag(S);
semilogy(sigmas, 'k', 'Linewidth', 2);
fprintf("We can see that the first few values are dominating \n" + ...
    "and consititute most of the image matrix \n\n");


%% Making Subplots
[m, n] = size(X);

fprintf("Drawing subplots... \n");

% We will be constructing 4 subplots with max_energy/2 as the max energy
maxM = round((n+1) / 4);
maxM = 20*round(maxM/20);  % Converting to nearest multiple of 20

vals = 1:4;
vals = maxM/4 * vals;

figure("Name", "Compressed Images with matrices of rank k");
title("Compressed Images");
plotindex = 1;
for r = vals
    % For r rows
    Xapprox = U(:, 1:r) * S(1:r, 1:r) * V(:, 1:r)';
    subplot(2, 2, plotindex);
    plotindex = plotindex + 1;
    printImage(Xapprox);
    title(sprintf("r = %d, using %.2f %% of the storage.", r, 200*r/n));
end

fprintf("Subplots Drawn\n\n");


%% Comparing the Original and 50% 

fprintf("Drawing the last plot... \n");
figure("Name", ...
    "Comparing the original and the image compressed by about 50%");
title("Comparing the original and the image compressed by about 50%");

subplot(1, 2, 1);
printImage(X);
title("Original Image");

subplot(1, 2, 2);
printImage(Xapprox);
title("Compressed Image");


%% Analysing the difference

figure("Name", "Difference in Images");
title("Difference");
plotindex = 1;
for r = vals
    % For r rows
    Xapprox = U(:, 1:r) * S(1:r, 1:r) * V(:, 1:r)';
    subplot(2, 2, plotindex);
    plotindex = plotindex + 1;
    printImage(X - Xapprox);
    title(sprintf("r = %d, using %.2f %% of the storage.", r, 200*r/n));
end

fprintf("The difference in the images is almost negligible.\n\n")