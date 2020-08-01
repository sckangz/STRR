clear
addpath('./fun');
load('./data/mnist1000');

warning off

X = double(X);
y = im2double(Y);


%for c = 1 : size(X,2)
%    X(:,c) = X(:,c) /norm(X(:,c));
%end


Par.max_iter = 50;
Par.alpha = 20;  
Par.k = 10;
Par.thr = 9;
[result]=FTRR(X,y,Par);


