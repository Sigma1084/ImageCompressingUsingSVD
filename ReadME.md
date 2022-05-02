# Image Compressing using Single Value Decomposition


## Theory involving the algorithm
The theory used is present in
[info.ipynb](https://github.com/Sigma1084/Image-Compressing/blob/master/info.ipynb)


## Presentation 
[presentation.pptx](presentation.pptx)


## Instructions to run the code are given

* Fork the repo and edit the file [main.m](main.m) in line 24
* Replace `X = getImage("w");` by `X = im2double(imread("path"));`
* **Run** [main.m](main.m)


## Improvement

1. Calculate the largest Eigen Value of `B0 = A'A` and find the first singular value by taking the square root
2. Find `u1` and `v1` corresponding to this singular value `sigma1 = sqrt(lambda1)`
3. Consider `B1 = B0 - lambda1 * I` where `lambda1` is the largest eigen value of `B0`
4. Also let `A1 = A0 - sigma1 * u * v'` where `sigma1` is the largest singular value
5. Consider `D1 = Frobenius(A1 - A)`, the difference between the two matrices
6. Repeat step 1 on `B1`, calculate `B2`, `A2`, `D2`
7. Repeat as long as `Dk` is small enough
