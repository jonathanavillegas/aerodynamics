# Finite Wing Aerodynamics Analysis

Numerical lifting line analysis tool for evaluating wing performance of a UAV in preliminary design. The solver uses lifting line theory and the Biot-Savart law to analyze the effects of induced velocity on lift distribution, including propeller-wing interaction effects.

## Overview

This analysis performs numerical lifting line analysis to evaluate the performance of wings with and without propeller effects. The wing is discretized into 100 horseshoe vortices (panels) and uses NACA 0012 airfoil data to understand stall behavior and lift distribution characteristics.

## Wing Geometry & Operating Conditions

- **Wing Span:** 3.05 m (10 ft)
- **Chord Length:** 0.4572 m (1.5 ft)
- **Aspect Ratio:** 6.67
- **Airfoil:** NACA 0012
- **Operating Speed:** 51.44 m/s (100 knots)
- **Design Angle of Attack:** 8°
- **Propeller Diameter:** 1.22 m (4 ft)
- **Propeller Radius:** 0.6096 m (2 ft)
- **Altitude:** 10,668 m (35,000 ft, density: 0.364 kg/m³)

## Methods

### Lifting Line Theory Implementation

The wing span is discretized into horseshoe vortices. The solver calculates circulation distribution and induced velocities at each collocation point using Biot-Savart law.

### Numerical Implementation

An iterative process solves for circulation and induced velocity distribution:

1. **Initialization:** Calculate initial circulation from geometric angle of attack
2. **Trailing Vortex Calculation:** Compute trailing vortex strength as difference between adjacent panels
3. **Induced Velocity:** Calculate using Biot-Savart law
4. **Effective Angle of Attack:** Account for induced downwash
5. **Lift Coefficient:** Interpolate from NACA 0012 data
6. **Circulation Update:** Calculate new bound circulation
7. **Convergence Check:** Iterate until convergence within 0.05%

### Propeller Wake Velocity Calculation

Propeller slipstream effects are modeled using actuator disk theory, with wake velocity calculated for wing sections within the propeller wake region.

## Results

The analysis examines wing performance with and without propellers at various thrust levels (200 N, 500 N, 800 N per propeller). Key findings include:

- Overall lift coefficient for no-propeller case: 0.8269
- Propeller cases show minimal variation: 0.8278, 0.8279, 0.8281
- Circulation values remain constant (~9.8 m²/s) in center wing region across all thrust levels

## Technologies

- MATLAB
- Panel Methods
- Lifting Line Theory
- Numerical Methods

## Source Data

NACA 0012 airfoil data from NACA Technical Note 3361:
- Critzos, C. C., Heyson, H. H., & Boswinkle, R. W. (1955). Aerodynamic Characteristics of NACA 0012 Airfoil Section at Angles of Attack from 0° to 180°. NACA Technical Note 3361. Langley Aeronautical Laboratory.

