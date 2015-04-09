clear all;
close all;
clc;
%
%[featureVectorTest,featureVectorValid,featureVectorTrain,relevanceLabelTest,relevanceLabelValid,relevanceLabelTrain,Ntrain,Nvalid,Ntest]
% = extractInput(filename);
%
load('project1_data.mat');
[W_cfs,mu_cfs] = train_cfs(1,120,0.00001,featureVectorTrain,Ntrain,relevanceLabelTrain);
Erms_cfs = test_cfs(1,120,0.00001,W_cfs,mu_cfs,featureVectorTest,relevanceLabelTest,Ntest);
[W_gd,mu_gd] = train_gd(1,15,0.01,0.0005,featureVectorTrain,Ntrain,relevanceLabelTrain);
Erms_gd = test_gd(1,15,0.01,W_gd,mu_gd,featureVectorTest,relevanceLabelTest,Ntest);
fprintf('My ubit name is %s\n','amayakal');
fprintf('My student number is %d \n',50133703);
fprintf('the model complexity M_cfs is %d\n',120);
fprintf('the model complexity M_gd is %d\n',20);
fprintf('the regularization parameters lambda_cfs is %4.2f\n',0.00001);
fprintf('the regularization parameters lambda_gd is %4.2f\n',0.01);
fprintf('the root mean square error for the closed form solution is %4.2f\n',Erms_cfs);
fprintf('the root mean square error for the gradient descent method is %4.2f\n',Erms_gd);

