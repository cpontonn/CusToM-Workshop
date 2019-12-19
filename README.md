## CusToM Workshop
Examples and presentations used during the workshop of the 3rd December in Bruz at the M2S lab. The Workshop deals with the 
[CusToM : a Matlab toolbox for musculoskeletal simulation](https://github.com/anmuller/CusToM) library in Matlab. You can provide your own copy here on the link.

Reference : 
Muller, A., Pontonnier, C., Puchaud, P., Dumont, G., (2019). CusToM : a Matlab toolbox for musculoskeletal simulation, in review. Journal of Open Source Software.

**License:** [![License](https://img.shields.io/badge/License-3_Clause_BSD-orange.svg)](https://github.com/anmuller/CusToM/blob/master/LICENSE)

# Lessons
- [Kinematic Tutorial](#Tuto1)
- [Inverse Dynamics Tutorial](#Tuto22)
- [Muscle Forces Tutorial](#Tuto2)
- [XSENS Tutorial](#Tuto3)

The examples are based on a walking motions (normal and altered with an ankle brace) published in a [conference](https://hal.inria.fr/hal-02088913/document) recorded with optoelectronic system.
The second example is a tennis service motion from [XSENS Analyze suite](https://content.xsens.com/motion-data) based on inertial sensors.

### 1. Kinematic Tutorial<a name="Tuto1"></a>

The first objective of the tutorial is to compare kinematic results from anthropometric calibration and geometrical calibration. 
At the end of the tutorial, key concepts should be understood: rotation sequences, inverse kinematics, reconstruction error, convergence of geometrical calibration.

![alt text](https://github.com/cpontonn/CusToM-Workshop/blob/master/2019/Examples_Processed/1_Walking/POC0980A_normal_Geometric_Calibration/efw/figure1.gif)
![alt text](https://github.com/cpontonn/CusToM-Workshop/blob/master/2019/Examples_Processed/1_Walking/POC0980A_altered/efw/Marche.gif)

The second objective of the tutorial is to compare the kinematic of normal walking gait with altered gait.

### 2. Inverse Dynamics <a name="Tuto22"></a>

The objective of the second lesson is to compare the torques of normal walking gait with altered gait.
At the end of the tutorial, key concepts should be understood: inverse dynamics, newton-euler algorithm, torques

### 3. Muscle forces <a name="Tuto2"></a>

The objective of the second lesson is to compare the muscle forces of normal walking gait with altered gait.
At the end of the tutorial, key concepts should be understood: cost functions, muscle mechanics

![alt text](https://github.com/cpontonn/CusToM-Workshop/blob/master/2019/Examples_Processed/1_Walking/POC0980A_altered/efw/Marche_force.gif)


### 4. XSENS Tutorial <a name="Tuto3"></a>

![alt text](https://github.com/cpontonn/CusToM-Workshop/blob/master/2019/Examples_Processed/2_Tennis_Force_Prediction/efw/figure2.gif)

The objective of the last tutorial is to evaluate ground reaction forces of a tennis service motion recorded with XSENS inertial sensors using the force prediction algorithm. 
At the end of the tutorial, key concepts should be understood: contact points, contribution to dynamic equilibrium.

# License <a name="License"></a>

This Workshop is provided under: [![License](https://img.shields.io/badge/License-3_Clause_BSD-orange.svg)](https://github.com/anmuller/CusToM/blob/master/LICENSE).

# Illustrations

Illustrations were made with [GIBBON](https://github.com/gibbonCode/GIBBON). You can find the reference below.

Moerman, (2018). GIBBON: The Geometry and Image-Based Bioengineering add-On. Journal of Open Source Software, 3(22), 506, https://doi.org/10.21105/joss.00506
 
