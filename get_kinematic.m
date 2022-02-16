function [w, gamma] = get_kinematic(UGV)
    %UNTITLED4 Summary of this function goes here
    
    w(1) = UGV.w(1) + normrnd(0, UGV.w_noise);
    w(2) = UGV.w(2) + normrnd(0, UGV.w_noise);
    w(3) = UGV.w(3) + normrnd(0, UGV.w_noise);
    w(4) = UGV.w(4) + normrnd(0, UGV.w_noise);
    
    gamma(1) = UGV.gammaf + round(normrnd(0, UGV.g_noise));
    gamma(2) = UGV.gammar + round(normrnd(0, UGV.g_noise));
end

