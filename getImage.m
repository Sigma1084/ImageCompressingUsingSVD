function [X] = getImage(arg)

% DECOMPOSE Summary of this function goes here
%    Valid Args: 
%    "a": Returns the image of the apple
%    "ac": Cropped apple
%    "b1": Buildings1
%    "b2": Buildings2
%     Otherwise, Returns RGB of  

if arg == "a"
    A = imread("images/apple/apple_full.jpg");
elseif arg == "ac"
    A = imread("images/apple/apple_cropped.jpg");
elseif arg == "b1"
    A = imread("images/buildings1.jpg");
elseif arg == "b2"
    A = imread("images/buildings2.jpg");
elseif arg == "w"
    A = imread("images/wolf.jpg");
else
    A = imread("images/apple/apple_full.jpg");
end

% X = double(rgb2gray(A));
X = im2double(A);
end