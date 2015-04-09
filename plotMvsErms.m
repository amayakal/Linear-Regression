load('project1_data.mat');
%function [] = plotMvsErms_cfs(s,featureVectorTrain,Ntrain,featureVectorValid,Nvalid,relevanceLabelTrain,);
s =1;
l = 0;
sigma = s * s * eye(46);
lambda = 0.001;
for m = 60:10:130;
        l = l + 1;
        m
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

        Etrain = (phiTrain*W_cfs - relevanceLabelTrain)' * (phiTrain*W_cfs - relevanceLabelTrain) + lambda* W_cfs'*W_cfs/2;
        ErmsTrain(l) = sqrt((2 * Etrain)/Ntrain);
        phiValid (1:Nvalid,1) =1;
        for r = 1:Nvalid
           for c = 2:m
               phiValid(r,c) = exp(-1*(featureVectorValid(r,:)' - mu_cfs((c-1),:)')'/(2*sigma)*(featureVectorValid(r,:)'-mu_cfs((c-1),:)'));   
           end
        end
        Evalid = (phiValid*W_cfs - relevanceLabelValid)' * (phiValid*W_cfs - relevanceLabelValid)+ lambda* W_cfs'*W_cfs/2;
        ErmsValid(l) = sqrt((2 * Evalid)/Nvalid);
end
m = 60:10:130;
plot(m,ErmsTrain,'x');
hold on;
plot(m,ErmsValid);