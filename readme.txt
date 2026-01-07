============================================================================================
Improving InSAR-Based Digital Elevation Model Accuracy through InSAR Interferogram Filtering
============================================================================================

Abstract
---------
This study investigates the influence of various interferogram filtering techniques on the accuracy
of Digital Elevation Models (DEMs) generated through Synthetic Aperture Radar Interferometry (InSAR). 
While most studies in the literature evaluate filter performance solely based on interferogram-domain 
metrics, this work extends the analysis to assess how denoising affects the accuracy of the final DEM product. 
Both conventional filters—such as mean, median, pivoting median, Lee, Frost, Modified Frost, Kuan, Kuwahara, 
and Baran—and advanced algorithms including NL-InSAR, PPB, MuLoG, BM3D, and InSAR-BM3D are systematically compared. 
Simulations are performed on both synthetic and real SAR datasets to ensure reliability and generalizability. 
The filters are evaluated using metrics such as Peak Signal-to-Noise Ratio (PSNR), Edge Preserving Index (EPI), 
Sum of Phase Differences (SPD), and number of residues, while DEM accuracy is quantified through Root Mean Square 
Error (RMSE). The results aim to identify the most effective denoising strategies for enhancing DEM generation 
and to provide guidance for future InSAR-based terrain mapping applications.

Keywords
--------
Synthetic Aperture Radar Interferometry (InSAR/IFSAR), Interferogram, Despeckling, Denoising, Phase map filtering

Citation
--------
E. Onat and Y. Ozkazanc, “Improving InSAR-Based Digital Elevation Model Accuracy through InSAR Interferogram Filtering”, 
Turkish Journal of Remote Sensing, vol. 8, no. X, pp. AA-BB, 2026, doi: 10.51489/tuzal.

Content
-------
This repository currently includes main.m file , inputexamples.m & noisy/noiseless input images (Longs & Peaks).
The purpose of main file is to provide an overview of the academic work and its implementation framework.

License
-------
This repository will be released under an academic open-use license after publication.
Until then, redistribution or modification of the included code is not permitted without the author’s consent.

Contact
-------
For questions or collaboration inquiries, please contact:
Dr. Emrah Onat
eonat87 at yahoo.com


Algorithms
----------
01 - Mean
02 - Median
03 - Pivoting Median
04 - Frost
05 - Modified Frost
06 - Lee
07 - Kuan
08 - Kuwahara
09 - Goldstein
10 - Baran
11 - NL InSAR (only Linux and Windows x32)
12 - PPB
13 - PPB-Ite
14 - MuLoG-BM3D
15 - BM3D (only Linux)
16 - BM3D-ADMM
17 - InSAR-BM3D Step-1
18 - InSAR-BM3D Step-2