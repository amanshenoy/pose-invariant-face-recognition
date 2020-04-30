## Pose Invariant Face Recognition - MATLAB implementation
Face images captured in unconstrained environments usually contain pose variation, which significantly degrades the performance of algorithms designed to recognize frontal faces. This project implements a face identification framework capable of handling pose variations within ±45° of yaw.
  
This repository contains implementations of ideas mentioned in the paper as a course project:
> **A Comprehensive Survey on Pose-Invariant Face Recognition**<br>
> https://arxiv.org/abs/1502.04383
>
> **Abstract:** *The capacity to recognize faces under varied poses is a fundamental human ability that presents a unique challenge for computer vision systems. Compared to frontal face recognition, which has been intensively studied and has gradually matured in the past few decades, pose-invariant face recognition (PIFR) remains a largely unsolved problem. However, PIFR is crucial to realizing the full potential of face recognition for real-world applications, since face recognition is intrinsically a passive biometric technology for recognizing uncooperative subjects. In this paper, we discuss the inherent difficulties in PIFR and present a comprehensive review of established techniques. Existing PIFR methods can be grouped into four categories, i.e., pose-robust feature extraction approaches, multi-view subspace learning approaches, face synthesis approaches, and hybrid approaches. The motivations, strategies, pros/cons, and performance of representative appr*    
## Methodology

The proposed framework first transforms the original pose-invariant face recognition problem into a partial frontal face recognition problem. A robust patch-based face representation scheme is then developed to represent the synthesized partial frontal faces. 
  
For each patch, a transformation dictionary is learnt under the proposed multitask learning scheme. The transformation dictionary transforms the features of different poses into a discriminative subspace.

<p align="center">
  <img width="600" height="200" src="https://github.com/amanshenoy/pose-invariant-face-recognition/blob/master/frontalization.png">
</p>

Finally, face matching is performed using a PCA-based Face Recognition system called *‘Eigenface’* where the synthesised frontal face is matched with the correct frontal face from within a frontal face dataset. Experimentation was done using captured image of a subject at multiple angles and the frontalization algorithm was tested on multiple images in the *LFW (Labelled Faces in the Wild)* dataset.

## Citations and Implementation

Details on running the code for [frontalization](https://github.com/amanshenoy/pose-invariant-face-recognition/tree/master/frontalization) and [face-matching](https://github.com/amanshenoy/pose-invariant-face-recognition/tree/master/eigenface) and all citations are in the respective readme files

## Additional Details

Further details can be found in the [report](https://github.com/amanshenoy/pose-invariant-face-recognition/blob/master/literature/PIFR-Report.pdf) and in [other relevant material](https://github.com/amanshenoy/pose-invariant-face-recognition/tree/master/literature) 
