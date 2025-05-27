# Nemo Lab Pathogen–Macrophage Interaction Models

## Overview

This repository contains code, data, and documents for my research modeling the interactions between pathogens and macrophages using mechanistic differential equation models. The goal of this reseatch was to find and anaylze the interactions of pathogens and macrophages using a mathematical model to gain insights into the underlying function of the immune system works.

### Two-Equation System
- $\frac{dP}{dT} = \alpha P(1 - \frac{P}{b}) - \mu PG$ 
- $\frac{dG}{dT} = \delta - \sigma G - \mu PG$ 
  
### Three-Equation System
- $\frac{dP}{dT} = \alpha p(1 - \frac{p}{ \beta }) - \mu pg -\kappa sp$ 
- $\frac{dG}{dT} = \delta - \sigma G - \mu pg$
- $\frac{dS}{dT} = \frac{\phi P}{\eta + P} - \psi S$
  
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

## Scipts

##

