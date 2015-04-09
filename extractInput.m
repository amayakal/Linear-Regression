function [featureVectorTest,featureVectorValid,featureVectorTrain,relevanceLabelTest,relevanceLabelValid,relevanceLabelTrain,Ntrain,Nvalid,Ntest] = extractInput(x)
    clear all;
    close all;
    clc;
    filename = x;
    fid = fopen(filename);
    format = '%d %*s %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*d%*c%g %*s %*s %*s %*s %*s %*s %*s %*s %*s';
    size = [47 inf];
    A = fscanf(fid,format,size);
    A = A';
    relevanceLabel = A(:,1);
    featureVectors = A(:,2:end);
    featureVectorTest = featureVectors(1:7000,:);
    featureVectorValid = featureVectors(7001:14000,:);
    featureVectorTrain = featureVectors(14001:end,:);
    relevanceLabelTest = relevanceLabel(1:7000,:);
    relevanceLabelValid = relevanceLabel(7001:14000,:);
    relevanceLabelTrain = relevanceLabel(14001:end,:);
    Ntrain = 55623;
    Nvalid = 7000;
    Ntest = 7000;
end