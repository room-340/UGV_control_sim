function UGV_prime = set_kin_ctrl(UGV, setw, setgamma)
    % This function is used to set the desired values for UGV kinematic
    % parameters. The parameters themselves will start approaching these
    % desired values in the followup get_move() function calls. It might
    % take some time for parameters to actually reach the desired values.
    % Keep in mind that gamma values always come in DEGREES!
    
    UGV_prime = UGV;
    UGV_prime.setw = setw;
    UGV_prime.setg = round(setgamma);

end

