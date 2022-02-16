function UGV_prime = set_kinematic(UGV, wrate, gamma)
    % This function is used to FORCE set kinematic parameters for UGV.
    % It does NOT consider control or noise values, so I suggest to use it
    % to set initial sumulation conditions only.
    % Keep in mind that all rotations are counter clockwise when locking on
    % the UGV from above. This means that to turn right:
    % gamma(1) must be positive
    % gamma(2) must be negative
    % And dont forget that gammas come in DEGREES!
    
    UGV_prime = UGV;
    UGV_prime.w = wrate;
    UGV_prime.gammaf = gamma(1);
    UGV_prime.gammar = gamma(2);

end

