function UGV_prime = set_navigation(UGV, x, y, psi, vel, rate)
    % This function is used to FORCE set navigation parameters for UGV.
    % It does NOT consider control or noise values, so I suggest to use it
    % to set initial sumulation conditions only.
    
    UGV_prime = UGV;
    UGV_prime.x = x;
    UGV_prime.y = y;
    UGV_prime.psi = psi;
    UGV_prime.vel = vel;
    UGV_prime.rate = rate;
end

