# My Docker-Compose Setup

## Dockerfile
The Dockerfile to build the image is within `docker/`. It contains the build instructions for an image to have ROS Melodic / Ubuntu 18.04 with basic GUI operation if you have hardware that runs Intel Integrated Graphics (No Graphics card setup and Intel CPU).

For those who have a NVIDIA GPU on their setups: please refer to [here](http://wiki.ros.org/es/docker/Tutorials/Hardware%20Acceleration). I will post some information if there are users who have a NVIDIA GPU in their setup. (Everything relating to ROS will work except for RVIZ and Gazebo which require OpenGL).

## Docker-Compose
Ensure that you have Docker-Compose installed and obviously Docker Desktop for Ubuntu Installed. Link for installation is located [here](https://docs.docker.com/compose/install/)

## IP Addresses
To observe what the IP address is easily without failure and confusion - once you are SSH'ed into the Duckiebot; you can ping your laptop from the terminal shell from the RaspberryPi. (I.e. run `ping <Your-Laptop-Hostname>.local`). I have included some regular expressions in my scripts which print out the correct IPs that you will have to edit the `docker-compose.yaml` file.

## Some other notes
Remember to set your `ROS_MASTER_URI` to the Duckiebots one which is http://raspberrypi.local:11311/. In Docker-Compose this is passed as an argument under the Environment Variable.

```yaml
environment:
- "ROS_MASTER_URI=http://raspberrypi.local:11311/"
```

Remember to alter these variables per your setup.
```yaml
extra_hosts:
  - "<LAPTOP_HOSTNAME>.local:<LAPTOP_IP>"
  - "raspberrypi.local:<PI_IP>"
environment:
  - "ROS_MASTER_URI=http://raspberrypi.local:11311/"
  - "ROS_HOSTNAME=<LAPTOP_HOSTNAME>.local"
```

## Wheel Calibration
There are some notes if you refer to `calib/wheel/`.
