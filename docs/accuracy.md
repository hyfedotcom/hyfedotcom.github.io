# Cough detection accuracy on human-labeled audio files

Prior to the acceptance of a candidate model being passed on for field testing, it must first outperform other models in testing on audio files with known high-reliability labels. 

For this purpose, there is a specific "holdout" dataset (meaning that the model was not trained on these audio) consisting of data with the following characteristics and provenance:

- ID206: 1545 coughs and 544.2 minutes of non-cough sounds.
- Domino watch: 248 coughs and 503.8 minutes of non-cough sounds.
- Phone: 715 coughs and 348.5 minutes of non-cough sounds.

The candidate model is run over all sounds from the hold-out dataset. Sensitivity to cough and false positives per hour are calculated at varying thresholds. The optimal threshold is considered via visual analysis, striving to approximate 90% sensitivity while keeping false positives at a low rate.

Further details regarding this process and results are available upon request.
