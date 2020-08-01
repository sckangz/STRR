clear
addpath('./fun');
load('./data/AR_840n_768d_120c_uni');

warning off

%X = double(X);
%y = double(y);

for c = 1 : size(X,2)
    X(:,c) = X(:,c) /norm(X(:,c));
end

Par.max_iter = 50;
Par.alpha = 0.015;  
Par.k = 1;
Par.thr = 3;
[result]=FTRR(X,y,Par);


