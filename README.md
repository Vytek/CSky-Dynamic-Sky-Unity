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
Unfortunately I can not continue working on this asset, this asset was being used for my survival game, now the game is at a very early stage and since it is for fun I am not in a hurry, for that reason I decided to wait for several of the features interesting from unity stop being in preview. Currently this active has several flaws and may need to make several adjustments.

# Some known issues

-There are some problems with the calculations of the celestial bodies, that of the sun seems to have the correct coordinates, but the moon and the stars do not, I think the problem is in a bad calculation in sidereal time, you can correct this problem by consulting the entances in the description of the class.

- The background element creates conflicts with the skybox in the reflection probe, it can be a problem in the shader.

-The atmospheric dispersion model of preetham is adjusted to the eye, so it may not be physically correct in its entirety, the adjustments are in the method called BetaMie (c #) and finalFex (cginclude).

-The color of the night depends on the data of the sun, so it is not physically correct in its entirety, this I did to simulate the effect of the moon on the atmosphere without doing many extra calculations.

- The magnitude of the stars is based on real data, however they have been adjusted to the eye, the shader is not physically correct, it is done to have a little more artistic control.




![screenshot_1](https://user-images.githubusercontent.com/32694412/31422103-e4df2f26-ae08-11e7-8a21-32fba3bd3e97.png)
![screenshot_2](https://user-images.githubusercontent.com/32694412/31422104-e509a8c8-ae08-11e7-9456-ce0c32c784c5.png)
![screenshot_3](https://user-images.githubusercontent.com/32694412/31422106-e531d618-ae08-11e7-910a-b0e655d9bab9.png)
![screenshot_4](https://user-images.githubusercontent.com/32694412/31422108-e55b21da-ae08-11e7-8a5e-bfe4531d8359.png)
![screenshot_5](https://user-images.githubusercontent.com/32694412/31422109-e5880c18-ae08-11e7-8c8e-c5a5cf04f1df.png)


