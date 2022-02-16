function UGV_prime = get_move(UGV)
    % This function simulates UGV motion transition with given control commands
    
    %% Navigation parameters transition
    UGV_prime = UGV;
    UGV_prime.x = UGV.x + UGV.vel * cos(UGV.psi) * UGV.dt;
    UGV_prime.y = UGV.y + UGV.vel * sin(UGV.psi) * UGV.dt;
    UGV_prime.psi = UGV.psi + UGV.rate *  UGV.dt;
    UGV_prime.vel = UGV.rw / 4.0 * sum(UGV.w);
    Kappa = atan( (UGV.lf * tand(UGV.gammar) + UGV.lr * tand(UGV.gammaf)) / (UGV.lf + UGV.lr) );
    if  UGV.gammar == 0 && UGV.gammaf == 0
        Kappa = 0;
    end
    UGV_prime.rate = UGV_prime.vel * cos(Kappa) / (UGV.lf + UGV.lr) * (tand(UGV.gammaf) - tand(UGV.gammar));
    
    %% Kinematic parameters transition
    wrate_error = UGV.setw - UGV.w;
    wrate_diff = (UGV.w - UGV.lastw) / UGV.dt;
    wrate_control = UGV.Pw * wrate_error + UGV.Dw * wrate_diff;
    UGV_prime.w = UGV.w + wrate_control * UGV.dt;
    UGV_prime.lastw = UGV.w;
    
    gamma_error = UGV.setg - [UGV.gammaf, UGV.gammar];
    gamma_diff = ([UGV.gammaf, UGV.gammar] - UGV.lastg) / UGV.dt;
    gamma_control = UGV.Pg * gamma_error + UGV.Dg * gamma_diff;
    UGV_prime.gammaf = UGV.gammaf + ceil(abs(gamma_control(1)) * UGV.dt) * sign(gamma_control(1));
    UGV_prime.gammar = UGV.gammar + ceil(abs(gamma_control(2)) * UGV.dt) * sign(gamma_control(2));
    UGV_prime.lastg = [UGV.gammaf, UGV.gammar];
    if abs(UGV_prime.gammaf) > 30
            UGV_prime.gammaf = sign(UGV_prime.gammaf) * 30;
    end
    if abs(UGV_prime.gammar) > 30
            UGV_prime.gammar = sign(UGV_prime.gammar) * 30;
    end
    
end

