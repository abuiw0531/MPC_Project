m = 1575;   % Total vehicle mass (kg)
Iz = 2875;  % Yaw moment of inertia of the vehicle (mNs^2)
lf = 1.2;   % Longitudinal distance from the center of gravity to the front tires (m)
lr = 1.6;   % Longitudinal distance from center of gravity to the rear tires (m)
Cf = 19000; % Cornering stiffness of the front tires (N/rad)
Cr = 33000; % Cornering stiffness of the rear tires (N/rad)
Vx = 15;
Ts = .1;

Vx = 15;
A = [-(2*Cf+2*Cr)/m/Vx, 0, -Vx-(2*Cf*lf-2*Cr*lr)/m/Vx, 0;
     0, 0, 1, 0;
     -(2*Cf*lf-2*Cr*lr)/Iz/Vx, 0, -(2*Cf*lf^2+2*Cr*lr^2)/Iz/Vx, 0;
     1, Vx, 0, 0];
B = [2*Cf/m 0 2*Cf*lf/Iz 0]';
C = [0 0 0 1; 0 1 0 0; 1 0 0 0; 0 0 1 0];
D = 0;
vehicle = ss(A,B,C,D);

[allData, scenario, sensor] = generateSensorData();
t = [allData.Time]';
ap = [allData.ActorPoses];
yawRef = [ap.Yaw]';
posRef = vertcat(ap.Position);

simulationTime = 10;
reference = [t posRef(:,2) deg2rad(yawRef)];
waypoints = [t*Vx posRef(:,2) zeros(length(posRef),1)];

x = waypoints(:,1);
y = waypoints(:,2);
tq = 0:.001:t(end);

