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
    \sigma_1 & 0 & \dots & 0 & 0 & \dots \\
    0 & \sigma_2 & \dots & 0 & 0 & \dots \\
    \vdots & \vdots & \ddots & \vdots & \vdots & \vdots \\
    0 & 0 & \dots & \sigma_R & 0 & \dots \\
	0 & 0 & \dots & 0 & 0 & \vdots\\
    \vdots & \vdots & \dots & \vdots & \dots & \ddots \\
\end{bmatrix} _{m \times n} \\
$$

$\text{The diagonal entries are the eigen values of the matrix A arranged in descending order}$
$\sigma_1 \geq \sigma_2 \geq \sigma_3 \geq \dots \geq \sigma_R$
$\text{where R is the rank of the matrix A}$

$\text{It can be seen that }$
$$ A \ = \ \sum_{i = 1}^R
\sigma_i \mathbf{u_ i v_i^T}  \\
A \ = \ \sigma_1 \mathbf{u_ 1 v_1^T} \ + \ \sigma_2 \mathbf{u_ 2 v_2^T} \ + \ \dots \ +
\ \sigma_R \mathbf{u_ R v_R^T}
$$ $\text{where } \mathbf{u_i} \text{ and } \mathbf{v_i} \text{ are the } i^{th} \text{ columns of matrices U and V respectively}$

## Low Rank Approximation
$\text{Consider the following problem.}$
$A \in \mathbb{R}^{m \times n}, \text{ rank} (A) = R$
$\text{Find } A_k \in \mathbb{R}^{m \times n}, \text{ rank} (A_k) = k \text{ such that}$
$||A - A_k|| \text{ is minimized over some norm}$

$\text{As an optization problem, we find } A_k \text{ (for some norm)}$
$$
\begin{align*}
	\min_{A_k} \ \ \ \ \ \ \ \ \ & ||A - A_k|| \\
	\text{such that} \ \ \ \ & \text{rank}(A_k) \leq k
\end{align*}
$$

## SVD as a low rank Approximation

### $\textbf{Eckart–Young–Mirsky Theorem:}$
$\text{Consider } A \in \mathbb{R}^{m \times n}, \text{ rank} (A) = R$

$\text{Suppose } A = U \Sigma V \text{ where } UU^T = I_m, \ VV^T = I_n$
$\ \text{ and } \Sigma_{R \times R} \text{ is a Diagonal Matrix containing the non-zero}$
$\ \text{ singular values of } A \text{ in a non-decreasing order.}$

$\text{The, the solution of the Optimization Problem,}$
$$\text{minimize over } A_k \ \ \ \ \ \ \ \ ||A - A_k|| \ \ \ \ \ \ \ \ \text{ subject to rank} (A_k) \leq k \\
\text{is given by } A_k \ = \ \sum_{i=1}^k \sigma_i \mathbf{u_i v_i^T}
$$ $\text{where } \mathbf{u_i} \text{ and } \mathbf{v_i} \text{ are the  } i^{th} \text{ columns of } U \text{ and } V$


### $\textbf{Proof}: \text{(For Spectral Norm)}$
(Math Stack Exchange) [Link](https://math.stackexchange.com/questions/759032/proof-of-eckart-young-mirsky-theorem)

$$\begin{gather*}
\ & A_k & = &  \sum_{i=1}^k \sigma_i \mathbf{u_i v_i^T} \\
\implies & ||A - A_k|| & = & \left| \left| \sum_{i=k+1}^R \sigma_i \mathbf{u_i v_i^T} \right|\right| _{\ 2} & = &\sigma_{k+1} \\
\end{gather*}
$$ $\text{Consider some Matrix } B \text{ such that } \mathrm{rank}(B) \leq k$
$\mathrm{rank}(B) \leq k \implies \dim\mathcal{N} (B) \geq n-k$
$\text{Suppose } V_{k+1}=[v_1 \ v_2 \ \ldots \ v_{k+1}] \text{ and } \mathcal{R}(V_{k+1}) \text{ be the range space of } V_k$
$\dim\mathcal{N}(B) + \dim\mathcal{R}(V_{k+1}) \geq n-k+k+1=n+1$

$$
\begin{gather*}
	\implies & \exist \ x\in\mathcal{N}(B)\cap\mathcal{R}(V_{k+1}) & \|x\|_2=1 \\
	\implies & x  = \gamma_1v_1 \ + \ \gamma_2v_2 \ + \ \dots \ + \gamma_{k+1}v_{k+1}, & \sum_{i=1}^{k+1} \gamma_i^2 = 1
\end{gather*}
$$ $\text{By definition, }$ 
$$
\begin{gather*}
	\ & \|A-B\|_2^2 \ \|x\|_2^2 & \geq & \|(A-B)x\|_2^2 \\
	\implies & \|A-B\|_2^2 & \geq & \|(A-B)x\|_2^2 \\
\end{gather*}
$$ $\mathrm{We \ know \ that \ } Bx=0 \ \mathrm{since} \ x \in\mathcal{N}(B)$ 
$$
\implies \ \|(A-B)x\|_2^2 \ \geq \ \|Ax\|_2^2 \ = \ \sum_{i=1}^{k+1}\sigma_i^2\gamma_i^2 \ \geq \ \sigma_{k+1}^2 \\ 
$$ $\text{This implies}$
$$
\|A-B\|_2^2 \ \geq \ \sigma_{k+1}^2 \quad \forall \ B \\
$$ $\text{In other words, }$
$$
\|A-B\|_2 \ \geq \ \|A-A_k\|_2 \quad \forall \ B \\
$$ $\text{Hence Proved.}$



### $\textbf{Proof}: \text{(For Frobenius Norm)}$

