function [W_gd,mu_gd] = train_gd(s,m,lambda,eta,featureVectorTrain,Ntrain,relevanceLabelTrain)
    sigma = s * s * eye(46);
    mu_gd = zeros(m-1,46);
    for j = 1:m-1
        mu_gd(j,:) = mean(featureVectorTrain(floor(((j-1)*Ntrain/(m-1))+1):floor((j)*Ntrain/(m-1)),1:end));
    end
    phiTrain_gd (1:Ntrain,1) =1;
    for r = 1:Ntrain
       for c = 2:m
           phiTrain_gd(r,c) = exp(-1*(featureVectorTrain(r,:)' - mu_gd((c-1),:)')'/(2*sigma)*(featureVectorTrain(r,:)'-mu_gd((c-1),:)'));   
       end
    end
    W_gd = zeros(m,1);
    EtrainPrevious = 1000;
    for k = 1:1000
        for i = 1:Ntrain
           W_gd = W_gd + eta*(relevanceLabelTrain(i) - W_gd'*phiTrain_gd(i,:)')*phiTrain_gd(i,:)';
        end
        Etrain = (phiTrain_gd*W_gd - relevanceLabelTrain)' * (phiTrain_gd*W_gd - relevanceLabelTrain) + lambda*W_gd'*W_gd/2;
        div = (Etrain - EtrainPrevious)^2;
        if (div < 0.01)
            break;
        end
        EtrainPrevious = Etrain;
    end
end