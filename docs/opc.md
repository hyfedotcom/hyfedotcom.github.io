# Other People's Coughs

## Context

The Hyfe device demonstrates optimal performance when positioned on the wrist and within 3 ft (~100cm) of the person coughing. When used in real-world settings, its median accuracy includes a 90% sensitivity and an average of fewer than two false positives per hour. But questions have arisen regarding the extent to which the system captures non-user coughs. Hyfe has (a) carried out multiple experiments to quantify the effect on cough counts from contamination from non-user coughs and (b) written a white paper exploring options for addressing the phenomenon.



## Poster

This poster presents a study evaluating how often non-user coughs (coughs from people near the wearer) are unintentionally captured by the Hyfe CoughMonitor smartwatch and how these external coughs vary across real-world environments.

### Key Findings

Dataset:  
223 hours (~10 days) of acoustic cough monitoring were analyzed from healthy volunteers in diverse environments.

Main Result:  
Non-participant cough exposure varied widely depending on location and context—from 0 coughs/hour in quiet indoor settings to 1.04 coughs/hour in public settings like restaurants or grocery stores.

Example Real-World Scenarios:  

- Office worker with a family: Exposure averaged 2.6 non-user coughs/day across home, office, and public spaces.    
- Business traveler: Exposure averaged 4.61 non-user coughs/day across hotels, planes, offices, and restaurants.  

### Methods

Volunteers wore a Hyfe CoughMonitor smartwatch and recorded exactly when they themselves coughed.

Analysts then compared smartwatch-detected coughs with participants’ self-reports to identify and quantify non-user coughs (i.e., coughs not belonging to the wearer).

Visuals in the poster (e.g., acoustic environment diagram on page 1) illustrate how non-user coughs are detected and distinguished.

### Conclusion

This pilot study provides a framework for quantifying how often wearable microphones detect coughs from nearby individuals. Findings help clarify the real-world extent of “other people’s cough” contamination, supporting better interpretation of cough monitoring data from the Hyfe smartwatch.


### Link to poser and associated abstract

<a href="../pdfs/opc2.pdf" target="_blank">Poster on non-user coughs</a>

<a href="https://publications.ersnet.org/content/erj/64/suppl68/pa789" target="_blank">Poster summary</a>



## White paper

This paper examines the problem of other people’s coughs (OPCs)—coughs produced by people near a user but mistakenly recorded by a wearable cough monitor. Such contamination can distort measurements and undermine the clinical reliability of remote cough monitoring systems.

###Key Points

Motivation:  
Wearable audio devices can automatically detect and count coughs for remote health monitoring. However, distinguishing the wearer’s cough from nearby coughs remains a major challenge, especially in shared environments.

Prior Approaches:  
Techniques such as “cougher verification” (analogous to speaker verification) and multimodal sensing (heart rate, accelerometry) can help, but they suffer from practical limitations, variability in cough sounds, noise, privacy concerns, and poor performance when the cougher is far from the microphone.

Proposed Solution:  
The authors focus on an audio-only, single-microphone solution using distance classification — identifying whether a cough is “near” (≤1 m) or “far” (>1 m).

Dataset:  
They collected 1,207 coughs (829 near, 378 far) from 22 subjects, recorded at distances from 5–300 cm under varied environments and loudness levels. All audio was processed into Mel-frequency energy (MFE) representations.

### Models Tested:

Traditional ML: Logistic Regression, SVM, Random Forest, XGBoost.

Deep Learning: Two convolutional neural networks (CNN1 = deep, CNN2 = shallow).

### Results:

Classical ML models performed moderately well (best ROC-AUC ≈ 0.89 for SVMs).

Deep CNNs performed best, with CNN1 achieving a ROC-AUC of 0.94, along with high precision and sensitivity.

This demonstrates that distance estimation from cough audio is feasible with good accuracy.

### Conclusion

The study shows that distinguishing between near and far coughs using only a smartwatch microphone is achievable. This could help filter out OPCs and improve the reliability of remote cough monitoring. Future work will require larger and more diverse datasets to ensure robustness in real-world deployment.

### Link to full paper

<a href="../pdfs/opc.pdf" target="_blank">White Paper on Other People's Coughs</a>


