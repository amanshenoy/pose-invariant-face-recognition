# Pose Invariant Face Recognition

  Face images captured in unconstrained environments usually contain pose variation, which significantly degrades the performance of algorithms designed to recognize frontal faces. This project implements a novel face identification framework capable of handling pose variations within ±45° of yaw.

# Flowchart and Methodology

<p align="center">
  <img width="500" height="500" src="https://github.com/amanshenoy/pose-invariant-face-recognition/blob/master/flowchart.png">
</p>


~ The proposed framework first transforms the original pose-invariant face recognition problem into a partial frontal face recognition problem. A robust patch-based face representation scheme is then developed to represent the synthesized partial frontal faces. For each patch, a transformation dictionary is learnt under the proposed multitask learning scheme. The transformation dictionary transforms the features of different poses into a discriminative subspace.

<p align="center">
  <img width="600" height="400" src="https://github.com/amanshenoy/pose-invariant-face-recognition/blob/master/frontalization.png">
</p>

 ~ Finally, face matching is performed using a PCA-based Face Recognition system called *‘Eigenface’* where the synthesised frontal face is matched with the correct frontal face from within a frontal face dataset. Experimentation was done using captured image of a subject at multiple angles and the frontalization algorithm was tested on multiple images in the *LFW (Labelled Faces in the Wild)* dataset.

# Citations and Implementation

Details on running the code for [frontalization](https://github.com/amanshenoy/pose-invariant-face-recognition/tree/master/frontalization) and [face-matching](https://github.com/amanshenoy/pose-invariant-face-recognition/tree/master/eigenface) and all citations and references are in the respective readme files

# Additional Details

Further details can be found in the [report](https://github.com/amanshenoy/pose-invariant-face-recognition/blob/master/literature/PIFR-Report.pdf) and in [other relevant material](https://github.com/amanshenoy/pose-invariant-face-recognition/tree/master/literature)

*Implemented on MATLAB R2016b*  
