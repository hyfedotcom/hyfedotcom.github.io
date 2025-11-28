# Effect of volume on cough detection

## Context

Acoustic cough detection algorithms depend on the reliable capture audio events, ie vibrations in the air. The effective amplitude of these vibrations is strongly influenced by the sound pressure level (SPL) of the cough at the source. Variability in cough volume—between individuals, within individuals across contexts, and across disease states—introduces significant challenges for consistent detection.

1. Reduced SNR and Subthreshold Events

Coughs vary in amplitude over a broad dynamic range (30–40 dB within-person differences are common).

Quieter coughs (low SPL) produce weaker mechanical–acoustic energy transmitted through the air.

These signals may fall near or below the sensor’s noise floor, yielding a poor signal-to-noise ratio (SNR) and making peak detection or subsequent classification unreliable.

Such subthreshold or low-SNR coughs may be particularly common in those with small lungs (children), fatigued patients, or individuals with obstructive lung disease.

2. Variability in Spectral and Temporal Features

Cough SPL affects not only amplitude but also the shape of the acoustic waveform:

Higher-volume coughs typically exhibit sharper transients, stronger high-frequency energy, and more distinct multi-phase structure.

Low-volume coughs may appear muted, temporally smeared, or spectrally compressed.

Algorithms trained on high-SPL events may misclassify low-SPL events because their feature distributions diverge.

3. Influence of Context and Physiology

Cough loudness is influenced by biological, contextual, and behavioural factors:

- Disease state (e.g., weak, fatigued, or muffled cough in advanced disease)  
- Posture (supine vs upright)  
- Voluntary vs reflexive cough  
- Social context (ie, intentional muffling or supression to avoid disruption of others)


These factors create systematic SPL variations that can bias detection if the model does not account for volume.

4. Interaction With External Noise

Low-SPL coughs are more susceptible to masking by environmental or garment-induced acoustic noise.

In low-amplitude events, even mild artefacts (fabric friction, arm movement) can dominate the waveform.

This increases false negatives, reduces temporal precision, and produces uncertainty in classifications.

## Proposed Experiments to Quantify the Impact of Cough Volume on Acoustic Detection

To rigorously characterise how SPL affects wrist-based acoustic cough detection, a structured set of three experiments—progressing from controlled acoustic simulations to human studies and free-living validation—is proposed. This document will be updated upon the completion of these experiments in Q1 2026.


### Experiment 1: Controlled Human Study With Standardised Cough SPL

Objective:
Evaluate algorithmic performance across controlled cough volume levels in human participants.

Design Overview:

Participants perform voluntary coughs instructed to reach specific SPL bands (e.g., low, medium, high), monitored using a calibrated near-field microphone or spirometry-coupled cough meter.

Perform coughs across postures (seated, standing) to capture natural within-person variability.

Collect concurrent wrist acoustic signals and high-quality audio ground truth.

Analyse:

Sensitivity and precision as a function of SPL

Feature distributions for low vs high SPL events

Misclassification patterns driven by low-SPL coughs.

Rationale:
This experiment links SPL-dependent changes in the acoustic signal to actual algorithmic behaviour, enabling identification of vulnerability ranges.

### Experiment 2: Free-Living Study With Passive SPL Estimation

Objective:
Assess the role of cough volume in real-world wrist-based detection accuracy.

Design Overview:

Participants wear the wrist device continuously for several days.

A subset uses an auxiliary audio reference (e.g., chest clip microphone or smartphone cough logger) capable of estimating relative SPL for labelled events.

Real-world coughs are stratified into SPL categories (e.g., quiet, moderate, loud) based on reference measurements.

Evaluate:

Detection rates across SPL levels

SPL–SNR interactions with environmental noise and activity

Whether SPL-aware preprocessing (e.g., dynamic gain compensation) improves detection.

Rationale:
This quantifies the extent to which SPL variability—particularly the prevalence of mild, quiet, or suppressed coughs—limits performance under ecologically valid conditions.

## Summary

Cough SPL (volume, in decibels) critically shapes the detectability of body-borne acoustic signatures at the wrist. Low-SPL coughs produce weak, spectrally altered vibrations that are easily masked by noise and may fall below detection thresholds, while high-SPL coughs yield clearer, more discriminable features. The proposed two-stage experimental programme—controlled human studies with calibrated cough volumes, and free-living SPL-aware validation—enables a comprehensive characterisation of these effects and can inform the development of SPL-robust acoustic detection algorithms. As results come in from these experiments, results will be posted to this document.
