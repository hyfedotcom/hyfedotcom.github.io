# Algorithm Development: Principles and Practice

This document describes the principles, processes, and best practices used in the development of the Hyfe cough detection algorithm. 

## Overview of the Hyfe Cough Detection Algorithm

The Hyfe cough detection algorithm is an on-device machine learning system that runs on a wrist-worn smartwatch. Its purpose is to detect cough events from a stream of real-time, continuous audio, and generate corresponding timestamps. The algorithm is optimized for:    



- Near-field, user-originating coughs  
- Real-time execution on a low-power embedded system  
- High specificity in real-world contexts with moderate background noise    
- Privacy-by-design (no audio storage or transmission)  



The system continuously acquires audio from an onboard microphone, and then processes that audio through a two-step algorithm (first, a lightweight feature-extraction pipeline for the identification of onset/explosive events; second, an ML classifier which categorizes events as cough or non-cough) and, when a cough signature is detected, stores a timestamp locally.

## Principles Guiding Algorithm Development

Though not a medical device, the algorithm development process followed well-established machine learning and medical device software practices:    



- Use of high-quality, adjudicated labels  
- Clear separation of training and test datasets  
- Diverse, representative data from real-world conditions   
- Privacy-first design, minimizing sensitive data exposure  
- Embedded ML design constraints, ensuring reliability under limited memory and compute  
- Controls for noise, drift, and ambiguous audio  
- Reproducible pipelines and documented SOPs  




## Dataset Composition and Data Provenance

Algorithm development requires a large collection of raw acoustic data representing both coughs and non-cough events and contexts across a variety of environmental and physiological contexts. The training/development dataset consists of continuous audio recordings collected from individuals wearing/using an audio capture device (the ID206 device itself; phones; third-party wrist-worn audio recorders) in both real-world and controlled settings. Data sources included:  



- Daily-living soundscapes (homes, workplaces, outdoors)  
- Multiple cough etiologies (e.g., chronic, acute, asthma-associated coughs)  
- Wide variability in background noise  
- Demographic diversity across age and health conditions  
- Diversity in devices and modality (wearing, desktop, bedside, etc.)  
  


  

Strict controls governed data provenance:    



- Audio was uploaded to secure, encrypted systems.  
- All recordings were de-identified and segmented into 1-minute chunks.  
- Access to raw audio was restricted to trained annotators.  
- All annotations were logged, versioned, and traceable.  
- The labels dataset was curated such that only well-annotated, near-field, unambiguous coughs were included in the final training set.  



High-quality labels are critical, as the algorithm’s performance depends directly on the accuracy and consistency of ground truth. Accordingly, the generation of labels is governed by a rigorous multi-step process:    



- Two independent labelers annotated each 1-minute audio segment.  
- Labelers used spectrograms and waveforms to visually inspect acoustic events.  
- Each segment was evaluated for coughs, throat clears, sneezes, crying, and ambiguous cases.  
- Events could include “far” or “not sure” tags to flag uncertainty.  
- Disagreements triggered adjudication by an expert reviewer (MD/PhD).  



## Train/test split

The dataset used for algorithm training was partitioned using best practices that prevent overfitting and ensure generalization:  


- Training set – used to learn model parameters  
- Validation set – used for tuning and internal evaluation  
- Hold-out test set – kept fully independent and untouched during development  



The classifier training dataset consisted of over 500,000 snippets derived from the labeling process. Ambiguous or low-confidence labels (ie, those labeled as "far" or "not sure") were excluded entirely from training, reducing the risk of label noise affecting model performance. In testing, they were included, and accuracy statistics were computed for both their inclusion and exclusion.

The “holdout” dataset consists of data with the following characteristics and provenance:  


- ID206: 1545 coughs and 544.2 minutes of non-cough sounds.  
- Domino watch (a deprecated wrist-worn device used by Hyfe with audio collected at 44.1khz and downsampled to the ID206's 8khz rate): 248 coughs and 503.8 minutes of non-cough sounds.  
- Phone: 715 coughs and 348.5 minutes of non-cough sounds.  



## Model architecture

The model architecture was optimized for:   

 
- Small memory footprint  
- Low latency  
- Robustness to background noise  
- Reproducible performance under diverse conditions  



Hyperparameters were tuned through systematic experimentation, always referencing the validation set—not the test set.



The algorithm was built specifically for deployment on a constrained wearable device. This meant that the strict conditions had to be met in regards to the following areas:    


- Executed on the NRF52840 MCU  
- Real-time processing under Zephyr RTOS  
- Strict upper bounds on feature size, model size, and inference latency  
- Efficient buffering and batching of audio frames  
- Energy Efficiency  
- Designed for continuous operation on battery power  
- Processing pipeline optimized to minimize wake cycles  
- Lightweight model architecture avoids expensive computations  



## Privacy by design

The cough detection algorithm was developed using a strict privacy-by-design approach in which the device never stores, transmits, or makes accessible any raw audio. All sound captured by the microphone is processed immediately through a lightweight feature-extraction pipeline, and only the resulting cough/non-cough decision and timestamp are retained. No audio files, waveforms, or spectral representations are written to persistent storage, and no audio leaves the device at any stage. This eliminates the possibility of reconstructing speech, background conversations, or other sensitive sounds, protecting users from inadvertent capture of personally identifiable information. By architecting the system so that the algorithm’s inputs exist only ephemerally and the outputs contain no acoustic content, Hyfe ensures that continuous monitoring can occur safely in intimate, everyday environments without compromising user privacy.

In the algorithm's output:    


- Only event timestamps are stored  
- No raw audio is saved or transmitted  
- On-device memory is limited to encrypted event logs  


## Noise Handling and Robustness Measures

Real-world audio contains substantial variability. To address this, the algorithm incorporates:   


- Filters that suppress spectral patterns inconsistent with coughs  
- Thresholding logic to avoid triggers during loud environmental noise  
- Mechanisms that distinguish near-field from far-field events  


Training data was intentionally curated to include both challenging and typical environments, enabling stronger generalization.



## Adherence to industry best practices  

The development of the Hyfe cough detection algorithm followed widely recognized industry best practices for machine learning systems specifically, and software development more generally. These practices emphasize reproducibility, transparency of development processes, data governance, and robustness in real-world deployment. Hyfe adhered to these principles in the following ways:    


1. All data used for algorithm development was collected, labeled, versioned,and stored under controlled procedures, ensuring traceability and full auditability of the training corpus.   
2. The algorithm was developed using strict separation of training, validation, and hold-out test datasets, preventing data leakage and guaranteeing unbiased model evaluation.  
3. Hyfe followed best practices for documentation of model architectures, preprocessing steps, feature definitions, and iterative retraining, enabling reproducibility and controlled lifecycle management.   
4. The dataset was constructed to reflect the broad variability in user demographics, environments, and cough types expected in the real world, aligning with best practices for generalizability.   
5. The model was designed and tested according to the principles of reliable embedded ML deployment: resource-aware design, explainable inference pathways, and deterministic behavior under constrained hardware conditions.   
6. Hyfe Inc. privacy-by-design principles, and risk-based development considerations to ensure the algorithm behaves safely under environmental unpredictability, individual diversity, and general background noise.   


Collectively, these elements demonstrate alignment with modern development frameworks such as human-centered design principles, edge-AI safety guidelines, and emerging regulatory expectations for trustworthy and transparent machine-learning systems. 




