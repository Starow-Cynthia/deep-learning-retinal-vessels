# 🧠 Deep Learning for Retinal Vessel Segmentation (MATLAB)

This repository contains a MATLAB implementation of **retinal blood vessel segmentation** using matched filtering, Gaussian derivatives, and post-processing techniques.  
It is designed for research and educational purposes in the field of medical image analysis.

Retinal vessel segmentation is a crucial step in diagnosing and monitoring diseases such as **diabetic retinopathy, glaucoma, and hypertension**.  
This project provides MATLAB scripts for preprocessing, segmentation, visualization, and performance evaluation.

---

## 📌 Features
- Preprocessing of retinal fundus images
- Matched filter with Gaussian derivative for vessel enhancement
- Post-processing for thin vessel recovery
- Evaluation against ground truth with sensitivity, specificity, and accuracy
- Visualization of outputs and overlay comparisons
- Example dataset and performance results included

---

## 📂 Project Structure
Deep-Learning-main/
│── code.m # Main execution script
│── combine_thin_vessel.m # Combines thin vessel detections into final output
│── MatchFilterWithGaussDerivative.m # Vessel enhancement using Gaussian derivative filters
│── performance_measure.m # Computes sensitivity, specificity, and accuracy
│── replace_black_ring.m # Preprocessing step to remove black border artifacts
│── vessel_point_selected.m # Vessel point selection utility
│── Performance.xlsx # Quantitative performance results
│── RESULTS/ # Generated output images and metrics
│── Visualization/ # Visualizations of segmented vessels
│── sample image.tif # Sample retinal image
│── sample_groundtruth.tif # Ground truth segmentation for validation
│── F4_comparison_overlay.jpg # Overlay comparison between ground truth and output
│── fig 1.png / fig 2.png / fig 3.png / fig 4.png # Experimental figures
│── all in one.png # Combined visualization summary
│── code implemetation.png # Flow diagram of implementation
│── Final graduation thesis.pdf # Thesis document with methodology and results
│── README.md # Project documentation

---

## 🚀 Getting Started

### ✅ Requirements
- MATLAB R2020a or later (tested on R2021a)
- Image Processing Toolbox
- At least 4 GB RAM recommended for processing images

### ▶️ Running the Project
1. Open MATLAB.
2. Navigate to the project folder:
   ```matlab

