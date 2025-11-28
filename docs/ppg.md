# Wear vs non-wear detection using Hyfe's PPG-based algorithm

Hyfe has created and validated a lightweight photoplethysmography (PPG)-based algorithm that reliably determines whether the CoughWatch smartwatch is being worn. Importantly, this method does not depend on accelerometer signals. Conventional accelerometer-driven wear-detection approaches often misclassify periods of inactivity (e.g., when a user is resting) as non-wear and typically require long observation windows to achieve acceptable accuracy.

Hyfe’s approach periodically activates the PPG sensor for 20 seconds every 5 minutes, processes the resulting optical-reflection data with a simple decision-tree classifier, and delivers real-time wear status. Trained on approximately 100 person-hours and validated against over 2,700 hours of human-annotated data, the algorithm demonstrated 98.93% overall accuracy, with 0.55% false negatives and 2.06% false positives. Battery consumption remained low, averaging 24.2% over 24 hours, which matches typical device usage.

This advancement provides a high-frequency, low-burden, and highly precise method for monitoring device adherence, thereby improving the reliability of continuous physiological and behavioral data—an essential requirement for clinical trials and long-term observational studies.

The Hyfe wear vs non-wear PPG-based algorithm has been validated. [Full details available here](https://www.hyfe.com/white-papers/high-granularity-wear-detection-using-ppg-on-hyfes-coughwatch)
