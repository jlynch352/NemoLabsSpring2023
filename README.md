# Nemo Lab Pathogen–Macrophage Interaction Models

A collection of mechanistic ODE models of host–pathogen interactions, exploring both generalist and specialist macrophage responses.  

## Overview

This project develops and analyzes simplified mathematical models for how macrophages (immune cells) interact with a pathogen population. Starting from a **generalist-only** formulation, we then extend to include a **specialist** macrophage cohort that amplifies the immune response under high pathogen load.  

## Features

- **Generalist model** with logistic pathogen growth and constant-rate macrophage production/destruction :contentReference[oaicite:0]{index=0}:contentReference[oaicite:1]{index=1}  
- **Specialist extension** adds pathogen‐induced macrophage growth and one‐way killing :contentReference[oaicite:2]{index=2}:contentReference[oaicite:3]{index=3}  
- Dimensionless scaling to reduce parameters to biologically interpretable ratios  
- Nullcline and phase‐plane analysis to locate equilibria and assess stability  
- Jacobian‐ and Routh–Hurwitz–based criteria for rigorous local stability  

## Model Summaries

### 1. Generalist-only (2 D)

\[
\begin{aligned}
\frac{dP}{dT} &= \alpha\,P\Bigl(1 - \frac{P}{\beta}\Bigr)\;-\;\kappa\,M\,P,\\
\frac{dM}{dT} &= \varphi\,\frac{P}{\eta + P}\;-\;\psi\,M.
\end{aligned}
\]
- **P** = pathogen count  
- **M** = generalist macrophage count  
- α, β = pathogen growth/carrying‐capacity  
- κ = killing rate; φ, η, ψ = macrophage production half‐sat., max, death :contentReference[oaicite:4]{index=4}:contentReference[oaicite:5]{index=5}  

### 2. Generalist + Specialist (3 D)

\[
\begin{aligned}
\frac{dP}{dT} &= \alpha\,P\Bigl(1 - \frac{P}{\beta}\Bigr)\;-\;\kappa_G\,G\,P\;-\;\kappa_S\,S\,P,\\
\frac{dG}{dT} &= \varphi_G\,\frac{P}{\eta_G + P}\;-\;\psi_G\,G,\\
\frac{dS}{dT} &= \varphi_S\,P\;-\;\psi_S\,S.
\end{aligned}
\]
- **S** = specialist macrophages produced in proportion to P  
- φ_S, ψ_S, κ_S = specialist production, death, killing rates :contentReference[oaicite:6]{index=6}:contentReference[oaicite:7]{index=7}  

## Getting Started

### Requirements

- **MATLAB** (or GNU Octave) with ODE solver support  
- Basic linear‐algebra and plotting toolboxes  

### Core Scripts

- `pm_unscaled.m` — generalist-only ODE simulator :contentReference[oaicite:8]{index=8}:contentReference[oaicite:9]{index=9}  
- `test_pm_unscaled.m` — runs and plots generalist dynamics :contentReference[oaicite:10]{index=10}:contentReference[oaicite:11]{index=11}  
- `phase_plane_examples_fixed.m` — vector‐field & trajectory examples :contentReference[oaicite:12]{index=12}:contentReference[oaicite:13]{index=13}  
- `DimensionlessExample.m` — logistic growth scaling demo :contentReference[oaicite:14]{index=14}:contentReference[oaicite:15]{index=15}  
- Specialist‐model scripts (to be added)  

## Usage

```matlab
% Generalist-only demo:
par = struct('alpha',0.5,'beta',100,'kappa',0.01,...
             'phi',1.0,'eta',10,'psi',0.1);
[t,P,M] = pm_unscaled([50,20],[0,50], par);
plot(t,P,'r',t,M,'b'); legend('P','M');
