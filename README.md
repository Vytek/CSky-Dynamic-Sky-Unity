# CSky Dynamic Sky v1.0.4

Dynamic Sky Sphere System for Unity 3d.

Contact/Support: acxstorage@gmail.com

# Features
- Physically based atmosphere.
- Per Pixel And Per Vertex Atmosphere Quality.
- Two Atmosphere Models.
- Moon Phases.
- Moon Affects Rayleigh.
- Stars Field Based On Real Data.
- Solar Eclipses.
- DateTime Support.
- System DateTime Synchronization.
- Sun And Moon Positions Based On DateTime.
- HDR/LDR Support.
- Fordward/Deferred Support.
- Easy Setup.
- PBR Support.

# Future

The asset is deprecated, so it will not have updates from now.

# Some known issues

Currently there are some problems, so you may need to make several adjustments.

- There are some errors with the calculations of the celestial bodies, I believe that the error is in the part of sidereal time, you can consult the following links that can help to correct these problems:
-  See: http://www.stjarnhimlen.se/comp/ppcomp.html
-  See: http://stjarnhimlen.se/comp/tutorial.html

- The background element creates conflicts with the skybox in the reflection probe, it can be a problem in the shader.

# Things to keep in mind

- The color of the night depends on the data of the sun, so it is not physically correct in its entirety, this I did to simulate the effect of the moon on the atmosphere without doing many extra calculations.

- The magnitude of the stars is based on real data, but the shader is not based on physics, see http://astronexus.com/node/34

- The clouds are crap and are not optimized, you should not use them, they are just to give a small example of how to add clouds through C # code, the shader is written in a hurry
.

![screenshot_1](https://user-images.githubusercontent.com/32694412/31422103-e4df2f26-ae08-11e7-8a21-32fba3bd3e97.png)
![screenshot_2](https://user-images.githubusercontent.com/32694412/31422104-e509a8c8-ae08-11e7-9456-ce0c32c784c5.png)
![screenshot_3](https://user-images.githubusercontent.com/32694412/31422106-e531d618-ae08-11e7-910a-b0e655d9bab9.png)
![screenshot_4](https://user-images.githubusercontent.com/32694412/31422108-e55b21da-ae08-11e7-8a5e-bfe4531d8359.png)
![screenshot_5](https://user-images.githubusercontent.com/32694412/31422109-e5880c18-ae08-11e7-8c8e-c5a5cf04f1df.png)


