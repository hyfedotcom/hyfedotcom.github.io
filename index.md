<link rel="stylesheet" href="style.css">



---


## Verification (V1)

Verification ensures that the hardware and firmware of the device correctly capture, store, and transmit the raw data they are designed to collect—specifically, (i) acoustic signals containing cough (and non-cough sounds), (ii) important events such as charging vs non-charging, (iii) reflected light from the PPG sensor (used to determine wear vs non-wear), and (iv) accurate timestamps associated with the aforementioned elements so as to be able to appropriately contextualize them.

Verification at Hyfe addresses whether the system meets its engineering specifications and that its components work as intended. In this phase, testing confirms that what the device captures is faithful to the physical reality of the events (cough, charge, etc.) and states (battery level, monitoring on/off, etc.) under a range of expected operating conditions.

What follows are tests, experiments, and processes carried out by Hyfe to verify the proper functioning of the system’s sensors and data capture/storage/transmission capabilities.


| Document Type       | Document Name                                                       | Brief Description                                                      | Further Documents |
| ------------------- | ------------------------------------------------------------------- | ---------------------------------------------------------------------- | ----------------- |
| Test Result         | [Equivalence of uniform gain across microphones](docs/gain.html)    | Tests consistency of gain levels across device microphones            | MSM261D3526Z1CM microphone data sheet               |
| Test Result         | [Equivalence of microphone frequency-response curve](docs/frc.html) | Evaluates consistency of frequency response curves across microphones | —                 |
| Test Result         | [Environmental durability](docs/environmental.html)                 | Assesses device durability across environmental conditions            | —                 |
| Test Result         | [Pre‑flight tests](docs/preflight.html)                             | Routine tests ensuring hardware and firmware readiness pre‑deployment | Test-architecture; Pre-flight checklist; Test rig                 |
| SOP / Requirements  | [Software Requirements Specifications](docs/requirements.html)      | Defines software functional and non-functional requirements           | —                 |
| QMS / Validation    | [Quality management and design validation](docs/qms.html)           | Documents QMS processes and design validation framework               | Quality policy; Design validation protocol —                 |
| Traceability        | [Requirements traceability](docs/traceability.html)          | Maps requirements to tests ensuring coverage                          | —                 |
| Safety Verification | [Electrical safety verification](docs/electrical.html)              | Documents tests ensuring compliance with electrical safety standards  | Electrical safety testing report                 |
| Cybersecurity       | [Cybersecurity verification](docs/cybersecurity.html)               | Evaluates cybersecurity protections and testing                       | Cybersecurity reports for Android, iOS, and API                 |

---

## Analytical Validation (V2)

Analytical validation determines whether the algorithmic detection of coughs from raw audio is accurate, precise, and reliable compared to a trusted reference (e.g., human-annotated audio). It asks whether the digital measure— both event-specific detections and aggregated “number of coughs per hour”—faithfully represents reality and behaves consistently across users, devices, and environments. For cough, this step evaluates algorithm performance (sensitivity, specificity, false positives, robustness) and ensures the signal processing pipeline translates verified inputs into valid, quantitative outputs. In short, it proves that the measure itself is scientifically sound.

Analytical validation at Hyfe goes beyond just coughs. It also includes the accuracy, precision, reliability, and generalizability of both (i) the PPG-based wear vs non-wear algorithm, and (ii) the motion-derived wear vs non-wear algorithm. 

What follows are items of evidence pertaining to the analytical validation of the algorithms used in the CMS.



| Document Type        | Document Name                                                                                        | Brief Description                                             | Further Documents                                       |
| -------------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------- |
| Protocol             | [Establishment of ground truth: labeling protocol](docs/labeling.html)                               | Describes labeling procedure for human-annotated cough audio. | Labeling SOP                                                       |
| Test Result          | [Inter/intra-labeler agreement in cough labeling](docs/inter.html)                                   | Measures labeling consistency across and within annotators.   | —     
| Development Method          | [Algorithm development: principles and practice](docs/algo.html)                                   | Describes the standards to which the algorithm development process conforms.   | —                                                   |
| Test Result          | [Cough detection accuracy on human-labeled audio files](docs/accuracy.html)                          | Benchmarks algorithm performance on annotated audio.          | —                                                       |
| Field Test           | [Cough detection accuracy in human field tests](docs/field.html)                                     | Tests algorithm accuracy in field deployment.                 | —                                                       |
| Test Result          | [Effect of distance on cough detection](docs/distance.html)                                          | Examines how distance from device impacts accuracy.           | —                                                       |
| Test Result          | [Effect of non-user coughs on user cough counts](docs/opc.html)                                      | Quantifies influence of other people's coughs on results.     | White paper; poster                                                       |
| Test Result          | [Effect of garment obstruction/muffling on cough detection](docs/garments.html)                      | Evaluates effects of clothing barriers (in progress)                       | —                                                       |
| Test Result          | [Effect of cough volume on cough detection](docs/volume.html)                                        | Analyzes impact of cough loudness on detection (in progress)               | —                                                       |
| Version Control      | [Version control & change management for model](docs/version.html)                                   | Documents model version tracking and update processes.        | —                                                       |
| Performance Standard | [Performance / acceptability thresholds](docs/performance.html)                                      | Defines acceptable analytical performance thresholds.         | —                                                       |
| Validation           | [Wear vs non-wear: validation of Choi et al](docs/choi.html)                                         | Validates Choi et al algorithm for wear detection.            | —                                                       |
| Validation           | [Wear vs non-wear: validation of Hyfe's PPG based algorithm](docs/ppg.html)                          | Validates Hyfe-specific PPG wear detection method.            | —                                                       |
| Characterization     | [Characterization of known failure conditions: false positives and false negatives](docs/failure.html)                                                   | Describes qualitative evaluation of contexts for incorrect data            | —                                                       |
| Characterization     | Characterization of periods of expected poor performance                               | Identifies known circumstances of reduced accuracy (in progress).           | —                                                       |
| Characterization     | Time drift                                                                             | Investigates timestamp drift and synchronization issues (in progress).      | —                                                       |
| Challenge Testing    | Challenge testing                                                                      | Documents stress and edge-case challenge testing (in progress).              | —                                                       |
| Protocol             | [Protocol for Dispersed Clinical Validation of the Hyfe Cough Monitoring System](docs/protocol.html) | Details protocol for dispersed clinical validation.           | Test Rig Architecture (linked within doc if applicable) |
| Clinical Results     | [Results from Dispersed Clinical Validation of the Hyfe Cough Monitoring System](docs/fda.html)      | Reports results from dispersed clinical validation study.     | —                                                       |

---



## Clinical Validation (V3)

Clinical validation tests whether the measurements generated by the device are meaningful in the intended medical context—that is, whether they reflect clinically relevant outcomes or changes in a patient’s health. For a cough monitor, this means showing that measured cough frequency correlates with disease severity, treatment response, or quality of life, and that observed changes align with clinician or patient perception. This phase confirms that the digital cough measure provides actionable clinical insight, beyond mere technical accuracy, and supports its use in patient monitoring or decision-making.

The following contains information on the clinical meaningfulness of the CMS' measurements.



| Document Type     | Document Name                                                               | Brief Description                                               | Further Documents |
| ----------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------- | ----------------- |
| Evidence Summary  | [Meaningfulness to patients & clinicians](docs/meaningfulness.html)         | Demonstrates relevance and interpretability of measures        | —                 |
| Validation        | [Reliability & responsiveness in target population](docs/reliability.html)  | Presents reliability and responsiveness metrics                | —                 |
| Correlation Study | [Endpoint correlation](docs/endpoint.html)                                  | Shows correlation between cough metrics and clinical endpoints | —                 |
| MCID              | [Minimal clinically important difference estimation (MCID)](docs/mcid.html) | Estimates MCID for cough frequency changes                     | —                 |
| RWE               | [Real-world implementation impact](docs/realworld.html)                     | Evaluates device performance and impact in real-world use (in progress)      | —                 |
| Comparison        | [Comparison with patient recall](docs/recall.html)                          | Compares measured cough vs patient recall accuracy             | —                 |
| Usage Study       | [Monitoring duration](docs/duration.html)                                   | Evaluates optimal monitoring duration for clinical insight     | —                 |

---



## Usability validation (V3+)




Usability validation ensures that intended users can successfully and safely use the cough monitor in the real world, under realistic conditions. It covers human-factors engineering: setup, donning, charging, syncing data, and understanding feedback—all without introducing errors that compromise data quality or safety. For Hyfe’s wrist-based device, this means confirming that typical users (patients, clinicians, researchers) can wear and operate the device correctly, leading to reliable data capture and analytical understanding with minimal support.

What follows are evidence points demonstrating that the technology which forms the CMS is usable, acceptable, and scalable in its intended population and context.


| Document Type        | Document Name                                | Brief Description                                         | Further Documents                    |
| -------------------- | -------------------------------------------- | --------------------------------------------------------- | ------------------------------------ |
| Summary              | [Usability summary](docs/usability.html)     | Summarizes usability testing findings                    | —                                    |
| User Materials       | [User‑facing materials](docs/usermaterials.html)           | Recruitment/onboarding/IFU materials supporting HFE work | Informed consent template; Participant brochure; Site manual; Site online training manual |
| Specification        | Use specification for all user groups        | Defines user types, contexts, tasks (in progress)                      | —                                    |
| URRA                 | Use-related risk analysis (URRA)             | Identifies hazards and mitigations (in progress)                       | —                                    |
| Testing results      | Usability testing                            | Iterative evaluation of usability pain points (in progress)            | —                                    |
| Field Metrics        | Field adherence & missing-data metrics       | Analyzes adherence and data completeness (in progress)                 | —                                    |
| Accessibility        | Accessibility & inclusion evidence           | Evaluates usability across diverse populations (in progress)           | —                                    |

---






