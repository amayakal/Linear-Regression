function [Ermstest_gd] = test_gd(s,m,lambda,W_gd,mu_gd,featureVectorTest,relevanceLabelTest,Ntest)
    sigma = s * s * eye(46);
    phiTest (1:Ntest,1) =1;
    for r = 1:Ntest
       for c = 2:m
           phiTest(r,c) = exp(-1*(featureVectorTest(r,:)' - mu_gd((c-1),:)')'/(2*sigma)*(featureVectorTest(r,:)'-mu_gd((c-1),:)'));   
       end
    end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Calculate Erms for validation dataset               %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Etest = (phiTest*W_gd - relevanceLabelTest)' * (phiTest*W_gd - relevanceLabelTest) + lambda* W_gd'*W_gd/2;
    Ermstest_gd = sqrt((2 * Etest)/Ntest);
end