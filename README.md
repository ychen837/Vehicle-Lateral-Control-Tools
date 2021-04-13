# Vehicle-Lateral-Control-Tools
My MATLAB toolbox for vehicle lateral controller design.
This project is work in conjunction with Morgan Saras and Jennifer Maya Zapata. 
The lateral dynamics of vehicles is modeled using the formulation in R.Rajamani 2006, then the system response is analyzed given various conditions.

## Modules:
1. pole_cl: pole placement design
2. vans: velocity analysis, [y] = vans (Vx), return observed state y, take longtitudinal velocity Vx as input
3. vedy: model of vehicle dynamics

## Parameters:
1. Caf: Front tire stiffness
2. Car: Rear tire stiffness
3. lf: Front length of the vehicle from center of gravity
4. lr: Rear length of the vehicle from center of gravity
5. m: Mass of the vehicle
6. Vx: Lateral Velocity of the vehicle 
7. Iz: Moment of inertia of the vehicle in Z axis 
8. sys: Control system of the vehicle
9. A,B,C: Control system parameters
10. Ks: Closed-loop feedback constant
11. y: Output of the control system

## toolbox functions:
1. vans: [Ks, y] = vans (Vx)
2. [sys,A,B,C] = vedy(Caf,Car,lf,lr,m,Vx,Iz)

## Reference: 
R. Rajamani Vehicle Dynamics and Control, New York:Springer, 2006.
