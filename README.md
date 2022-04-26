# Singular Value Decomposition (SVD)

$\text{Consider a Matrix } A \in \mathbb{R}^{m \times n}$
$\text{We can decompose the matrix into U, } \Sigma \text{ and V such that}$
$$
A = U \Sigma V^T
$$ $\text{where U and V are orthogonal matrices}$
($UU^T = I$ and $VV^T = I$)

$\text{And } \Sigma \text{ has only Diagonal Entries }$

$$
\Sigma_{m \times n} = 
\begin{bmatrix} 
    \sigma_1 & 0 & \dots & 0 & \dots \\
    0 & \sigma_2 & \dots & 0 & \dots \\
    \vdots & \vdots & \ddots & \vdots & \vdots \\
    0 & 0 & \dots & \sigma_k & \dots \\
    \vdots & \vdots & \dots & \vdots & \ddots \\
\end{bmatrix} \\
$$

$\text{The diagonal entries are the eigen values of the matrix A arranged in descending order}$
$\sigma_1 \geq \sigma_2 \geq \sigma_3 \geq \dots \geq \sigma_k$
$\text{where k is the rank of the matrix A}$

$\text{It can be seen that }$
$$ A \ = \ \sum_{i = 1}^k
\sigma_i \mathbf{u_ i v_i^T}  \\
A \ = \ \sigma_1 \mathbf{u_ 1 v_1^T} \ + \ \sigma_2 \mathbf{u_ 2 v_2^T} \ + \ \dots \ +
\ \sigma_k \mathbf{u_ k v_k^T}
$$ $\text{where } \mathbf{u_i} \text{ and } \mathbf{v_i} \text{ are the } i^{th} \text{ columns of matrices U and V respectively}$

## SVD as a low rank Approximation

$\textbf{Theorem}:$
$\\ \text{Let } A = U \Sigma V^T \text{ after SVD.}$  
$\text{Then,  B = } U'S(V')^T  \text{ is the best k-rank approximation to A} \\
\text{where } U' \text{ and } V' \text{ are the matrices obtained by considering} \\
\text{the first k columns of } U \text{ and } V \text{ respectively and S}$