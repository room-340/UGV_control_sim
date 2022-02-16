function UGV = ugv_init()
    % This function creates UGV structure describing full state of unmanned
    % ground vehicle.
    
    %% Simulation parameters
    UGV.dt = 0.05; % simulation step
    UGV.pos_noise = 0.7; % Position noise standart deviation
    UGV.ori_noise = 0.03; % Orientation noise standart deviation
    UGV.pos_seed = 0.0; % Randomization seed for the position noise
    UGV.ori_seed = 0.0; % Randomization seed for the orientation noise
    UGV.w_noise = 0.1; % Wheels rotation rate noise standart deviation
    UGV.g_noise = 0.2; % Wheelset angles noise standtart deviation
    UGV.pos_offset_angle = pi/6;
    UGV.pos_offset = 0.2; % static posotion offset (m)
    UGV.pos_mu = 0.01;
    UGV.ori_mu = 0.04;
    
    %% Navigation parameters
    UGV.x = 0.0; % X coordinate (m)
    UGV.y = 0.0; % Y coordinate (m)
    UGV.psi = 0.0; % Heading angle (radians)
    UGV.vel = 0.0; % Linear velocity (m/s)
    UGV.rate = 0.0; % Angular rate (rad/s)
    
    %% Construction parameters
    UGV.lf = 0.4; % Forward len (m)
    UGV.lr = 0.45; % Rear len (m)
    UGV.rw = 0.254 / 2; % Wheels radius (m)
    UGV.lw = 0.625; % Wheelset length (m)
    
    %% Kinematic parameters
    UGV.gammaf = 0.0; % Rotation angle of the front wheels (deg)
    UGV.gammar = 0.0; % Rotation angle of the rear wheels (deg)
    UGV.w = [0.0, 0.0, 0.0, 0.0]; % Rotation rate of the wheels
    
    %% Control parameters
    UGV.setw = [0.0, 0.0, 0.0, 0.0]; % Set (desired) values for wheels rotation rate
    UGV.setg = [0.0, 0.0]; % Set (desired) values for wheelset rotation angles (forward and rear)
    % PD regulator coefs for motors control sim
    UGV.Pw = 1.9;
    UGV.Dw = 0.07;
    UGV.Pg = 0.8;
    UGV.Dg = 0.0;
    UGV.lastw = [0.0, 0.0, 0.0, 0.0]; % Previous values for wheels rotation rate
    UGV.lastg = [0.0, 0.0]; % Previous values for wheelset rotation angles (forward and rear)
end