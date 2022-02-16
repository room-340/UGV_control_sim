function [UGV_prime, x, y, psi] = get_navigation(UGV)
    % This function simulates navigation system measurements of UGV
    % navigation parameters.
        
    UGV_prime = UGV;
    pos_seed_diff = - UGV.pos_mu * UGV.pos_seed + sqrt(2 * UGV.pos_noise ^ 2 * UGV.pos_mu) * normrnd(0, 1);
    UGV_prime.pos_seed = UGV.pos_seed + pos_seed_diff * UGV.dt;
    ori_seed_diff = - UGV.ori_mu * UGV.ori_seed + sqrt(2 * UGV.ori_noise ^ 2 * UGV.ori_mu) * normrnd(0, 1);
    UGV_prime.ori_seed = UGV.ori_seed + ori_seed_diff * UGV.dt;
    
    x = UGV.x + UGV_prime.pos_seed * cos(UGV.pos_offset_angle) + normrnd(UGV.pos_offset, UGV.pos_noise);
    y = UGV.y + UGV_prime.pos_seed * sin(UGV.pos_offset_angle) + normrnd(UGV.pos_offset, UGV.pos_noise);
    psi = UGV.psi + UGV_prime.ori_seed + normrnd(0, UGV.ori_noise);
end

