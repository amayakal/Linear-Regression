function [W_cfs,mu_cfs] = train_cfs(s,m,lambda,featureVectorTrain,Ntrain,relevanceLabelTrain)
    sigma = s * s * eye(46);
    mu_cfs = zeros(m-1,46);
    for j = 1:m-1
        mu_cfs(j,:) = mean(featureVectorTrain(floor(((j-1)*Ntrain/(m-1))+1):floor((j)*Ntrain/(m-1)),1:end));
    end
    phiTrain (1:Ntrain,1) =1;
    for r = 1:Ntrain
       for c = 2:m
           phiTrain(r,c) = exp(-1*(featureVectorTrain(r,:)' - mu_cfs((c-1),:)')'/(2*sigma)*(featureVectorTrain(r,:)'-mu_cfs((c-1),:)'));   
       end
    end
    W_cfs = (lambda *eye(m) + (phiTrain'*phiTrain))\phiTrain'*relevanceLabelTrain;
end