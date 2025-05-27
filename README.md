# Nemo Lab Pathogen–Macrophage Interaction Models

## Overview

This repository contains code, data, and documents for my research modeling the interactions between pathogens and macrophages using mechanistic differential equation models. The goal of this research was to find and analyze the interactions of pathogens and macrophages using a mathematical model to gain insights into how the immune system works.

### Two-Equation System

- $\displaystyle \frac{dP}{dT} = \alpha P\bigl(1 - \tfrac{P}{b}\bigr) - \mu P G$
- $\displaystyle \frac{dG}{dT} = \delta - \sigma G - \mu P G$

### Three-Equation System

- $\displaystyle \frac{dP}{dT} = \alpha p\bigl(1 - \tfrac{p}{\beta}\bigr) - \mu p g - \kappa s p$
- $\displaystyle \frac{dG}{dT} = \delta - \sigma G - \mu p g$
- $\displaystyle \frac{dS}{dT} = \frac{\phi P}{\eta + P} - \psi S$

## Analysis

We analyzed this system using:

- **Scaling**  
  Non‐dimensionalization of variables and parameters for more interpretable and general results.

- **Jacobian Analysis**  
  Computation of the Jacobian matrix at equilibria and application of the Routh–Hurwitz criteria.

- **Phase-Plane Analysis**  
  Plotting nullclines and direction fields to visualize trajectory flow.

- **Equilibrium Analysis**  
  Identification of where and how many equilibria exist.

- **Parameterized Curves**  
  Used parameterized curves to compare the two models.

- **Numerical Simulations**  
  Used numerical methods to solve the system of ODEs and illustrate how trajectories evolve.

## Project Files

- [Deriving Equations](Files/DerivingEqutaions.pdf)  
  Shows the work behind the equations and criteria used in the project.

- [Presentation](Files/DerivingEqutaions.pdf)  
  This PDF contains the PowerPoint slides for the project.

- [System of Three Equations](Files/SystemOfThreeEquations.pdf)  
  Short document outlining the three‐equation model and parameter meanings.

- [System of Two Equations](Files/SystemOfTwoEquations.pdf)  
  Short document outlining the two‐equation model and parameter meanings.


## Scripts

- [Nulclines.m](Scripts/Nulclines.m)  
  Draws the phase‐plane nullclines, overlays the full vector field, simulates solution trajectories from several initial conditions, and marks the vertical dividing line that separates regions of stable versus unstable endemic equilibria.

- [RinTermsOfM.m](Scripts/RinTermsOfM.m)  
  Compares the needed r-value for a given system with and without a specialist macrophages, then plots a graph comparing them.

- [ScaledVsUnscaled.m](Scripts/ScaledVsUnscaled.m)  
  Sketches two graphs—one scaled and one unscaled—that compare the differences between the graphs of a scaled and unscaled system of equations.

- [Stableequilibrium.m](Scripts/Stableequilibrium.m)  
  Sketches three different plots that display three types of node stability—Stable, Unstable, and Saddle Node.

- [ThreeGraphs.m](Scripts/ThreeGraphs.m)  
  Sketches the nullclines for a system and displays three separate nullclines for the pathogen representing different r-values.

- [basePlot.m](Scripts/basePlot.m)  
  Graphs a basic nullcline plot of the system with arrows showing the direction points are being pushed in.

- [findingNumberOfSolutions.m](Scripts/findingNumberOfSolutions.m)  
  Shows three different parabolas representing how systems with all else equal, except for their r-values, have different numbers of solutions.

- [pg_scaled.m](Scripts/pg_scaled.m)  
  Script for numerically solving the scaled system of equations.

- [pg_unscaled.m](Scripts/pg_unscaled.m)  
  Script for numerically solving the unscaled system of equations.

- [testUnscaled.m](Scripts/testUnscaled.m)  
  Draws a simple graph to test that the pg_scaled.m script works correctly.

## How to Run Scripts

1. **Install MATLAB**  
   Make sure you have MATLAB R2020a or later installed.

2. **Download core solvers**  
   Save `pg_scaled.m` and `pg_unscaled.m` into a single folder.

3. **Add additional scripts**  
   Download any other `foo.m` files you want to run and place them in the same folder.

4. **Run the scripts**  
   ```matlab
   % In MATLAB, change to your folder:
   cd('path/to/your/folder')

   % Example: run the scaled solver
   pg_scaled

   % Example: run the unscaled solver
   pg_unscaled

   % Example: run a script that depends on pg_scaled and pg_unscaled
   ScaledVsUnscaledScript
