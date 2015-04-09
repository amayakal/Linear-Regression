function [Ermstest_cfs] = test_cfs(s,m,lambda,W_cfs,mu_cfs,featureVectorTest,relevanceLabelTest,Ntest)
    sigma = s * s * eye(46);
    phitest (1:Ntest,1) =1;
    for r = 1:Ntest
       for c = 2:m
           phitest(r,c) = exp(-1*(featureVectorTest(r,:)' - mu_cfs((c-1),:)')'/(2*sigma)*(featureVectorTest(r,:)'-mu_cfs((c-1),:)'));   
       end
    end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Calculate Erms for validation dataset               %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Etest = (phitest*W_cfs - relevanceLabelTest)' * (phitest*W_cfs - relevanceLabelTest) + lambda* W_cfs'*W_cfs/2;
    Ermstest_cfs = sqrt((2 * Etest)/Ntest);
end