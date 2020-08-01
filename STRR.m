function [result]=FTRR(X,y,Par)
% Par.max_iter : Maximum Number of Iterations
% Par.alpha    : Trade-off parameter in LSR for penalty term ||S||_F^2
% Par.k        : Order of the low-pass filter based on normalized Laplacian Fourier base
% X            : num*dim data matrix, each column(feature) represents a graph signal
% y            : num*1 cluster indicator vector
[n,~] = size(X);  
c = length(unique(y));

alpha = Par.alpha;
k = Par.k;
max_iter = Par.max_iter; 



W = eye(n);
    
for t = 1:max_iter+1       
    W_old = W;
    D = diag(sum(W));
    L = eye(n)-D^(-1/2) * W * D^(-1/2);
    X_bar = X;
    for i = 1:k
        X_bar=(eye(n)-L/2)*X_bar;
    end
    S = (X_bar*X_bar'+ alpha*eye(n))\(X_bar*X_bar');   
    W = abs(S);     
    if norm(W - W_old,'fro')/norm(W_old,'fro')<1e-5
        break
    end
end
thr = Par.thr;
rng('default')
W_bar = BuildAdjacency(W,thr);

labels = clu_ncut(W_bar,c);
[result] = ClusteringMeasure(y,labels);

end

