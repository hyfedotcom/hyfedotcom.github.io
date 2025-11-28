# Version control

CMS includes embedded firmware on the CoughMonitor, which together support the detection, recording, and transmission of cough event data. The CoughMonitor firmware includes a fully **locked**, on-device cough detection algorithm that processes ambient audio in real time. The signal processing pipeline includes microphone signal buffering, spectral feature extraction using MFCC (Mel-Frequency Cepstral Coefficients), and classification via a convolutional neural network (CNN). 

The system uses standard industry version control methods including git, code reviews, and unit testing. Further details are available upon request.
