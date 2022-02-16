x = zeros(10000, 1);
y = zeros(10000, 1);
psi = zeros(10000, 1);
vel = zeros(10000, 1);
rate = zeros(10000, 1);
time = zeros(10000, 1);
w = zeros(10000, 4);
gamma = zeros(10000, 2);


% Get UGV struct
UGV = ugv_init();
% Set initial params
UGV = set_navigation(UGV, 20, 10, 0, 0, 0);

% Set linear velocity command
UGV = set_vel_ctrl(UGV, 3.0, 1.0);

% Run 10 secs of simulation
for i = 1:(500 / UGV.dt)
    % Use this function to simulate one step of UGV motion
    UGV = get_move(UGV);
    
    % Use this values (*s = sensed) for your control algo
    [UGV, xs, ys, psis] = get_navigation(UGV);
    [ws, gammas] = get_kinematic(UGV);
    
    % Collect real robot params for logs
    x(i) = UGV.x;
    y(i) = UGV.y;
    vel(i) = UGV.vel;
    rate(i) = UGV.rate;
    w(i,:) = UGV.w;
    gamma(i,:) = [UGV.gammaf, UGV.gammar];
    time(i) = i * UGV.dt;
end

