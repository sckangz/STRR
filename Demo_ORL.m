clear
addpath('./fun');
load('./data/ORL_400n_1024d_40c_zscore_uni');

warning off

X = double(X);
y = double(y);


for c = 1 : size(X,2)
    X(:,c) = X(:,c) /norm(X(:,c));
end


Par.max_iter = 50;
Par.alpha = 2.7;  
Par.k = 1;
Par.thr = 6;
[result]=FTRR(X,y,Par);


