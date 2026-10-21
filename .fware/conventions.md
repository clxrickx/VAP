# Axis Naming
X - Forwards/Backwards(parllel to the direction of the workplace arrow)
Y - Up/Down(parllel to the airframe)
Z - Left/Right(perpendicular to the direction of the workplace arrow)

# Attitude
Local Tilt will drive attitute. Local X/Y/Z euler rotations will not be used.

# Units
External Distances: Metres<br>
Internal Distances:<br>
 - TVC Pistons: Range of Deflection (-0.5, 0.5) <br>
Angles: Radians<br>
Vertical Speed: Metres per Second<br>
Liquid: Litres<br>

# Code Formatting
camelCase is standard, unless a subscript is present in a variable(e.g. K_p would be Kp). Constants used only within a subsystem should be declared local and placed within the subsystem. ```null``` is used when declaring a value is non-existent; more commonly because you haven't gotten to assigning it's value yet. 0 should only be used if that is the actual, final value for the variable(e.g. a TVC setpoint of 0 would be acceptable, but you should set it to ```null``` if you have not gotten to assigning it's value yet).

# Physics Sensor Composite Outputs
1 - X Position
2 - Y Position
3 - Z Position
4 - Euler Rotation X
5 - Euler Rotation Y
6 - Euler Rotation Z
7 - Linear Velocity X
8 - Linear Velocity Y
9 - Linear Velocity Z
10 - Angular Velocity X
11 - Angular Velocity Y
12 - Angular Velocity Z
13 - Absolute Linear Velocity
14 - Absolute Angular Velocity 
15 - Local Z Tilt
16 - Local X Tilt
17 - Compass Heading(-0.5 ~ 0.5)