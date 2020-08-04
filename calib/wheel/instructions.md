# Wheel Calibration for the DuckieBot

## What you will need:
- A good hard floor surface such as vinyl or tiles or timber (ideally not carpet)
- A measuring tape
- Some not so sticky tape of 2m (I used like the paper based tape)

## What you need to do
Measure out 2m length of tape in a straight line. This allows you to figure out if the DuckieBot goes straight and for how long.

## Code instructions
You will need to have three terminal sessions open
- One being the ssh tunnel to the raspberry pi running the default launch file
- One being ```rosrun teleop_twist_keyboard teleop_twist_keyboard.py _speed:=0.25``` (speed doesn't matter as long it is constant and you stick with it)
- One being ```rosrun dynamic_reconfigure dynparam /duckiebot/diff_drive trim <some-value>```

## Calibration Formula
Since the DuckieBot doesn't have wheel encoders, the control mechanism of wheel velocity is determined by the amount of voltage being sent to the motors.
Below explains how it generally works with the dagu_car pkg that is installed within the DuckieBot Docker Image.

- ```right_wheel_voltage = (gain + trim) * (v + w * 0.5 * baseline)```
- ```left_wheel_voltage = (gain - trim) * (v + w * 0.5 * baseline)```

Where baseline is the distance between the two wheels, ```v``` is linear velocity and ```w``` is angular velocity (apologies but cannot be bothered finding the omega symbol).

### The Trim Value
The trim value dictates the offset or difference in speed in both the left and right wheels. Thus, in order to calibrate our DuckieBot going straight, we need to determine the trim value.

By making the DuckieBot go forward for 2m, it is acceptable for the wheel calibration to be within 10cm at the end. (Ideally as low as possible)

If the DuckieBot veers left, you can correct the wheel speed disparity through the below command.

```rosrun dynamic_reconfigure dynparam /duckiebot/diff_drive trim -0.1```

If the DuckieBot veers right, you can correct the wheel speed disparity through the below command.

```rosrun dynamic_reconfigure dynparam /duckiebot/diff_drive trim 0.1```

Note that the magnitude of the parameter will depend on the Duckiebot.

### The Baseline Value
The baseline value dictates the distance between the wheels. To value to be changed is contained within the ```diff_drive.py``` within the diff_drive node within the catkin_ws of the DuckieBot Container if for some reason you didn't build your DuckieBot correctly.

### The Gain value
The gain value dictates the offset of the nominal speed of both wheels. I.e. the proportional amount of voltage that is correlated with the linear and angular velocities of the DuckieBot.

Currently the DuckieBot does not have code integrated with gain. That could be left up to you. It's relatively straightforward if you refer to the above formula.
