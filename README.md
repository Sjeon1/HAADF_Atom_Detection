This repository contains software used to write a paper
Statistical analysis of HAADF-STEM images to determine the surface coverage and distribution of immobilized molecular complexes
https://www.cell.com/matter/fulltext/S2590-2385(24)00588-5

# Tools for the Quantitative Characterization of Immobilized Molecular Catalysts Using HAADF-STEM

This repository includes
1) A framework to train CNN for Metal atom detection in HAADF-STEM images with demonstration data
2) Python codes to visualize the detection and calculate the surface coverage of the catalysts
3) R codes to calculate Ripley's K-function using the detection result.

## 1) A framework to train CNN for Metal atom detection in HAADF-STEM images with demonstration data
The code is a modified code of the original code published below

https://pubs.acs.org/doi/10.1021/jacs.1c12466

https://github.com/HPAI-BSC/AtomDetection_ACSTEM

On top of this software, we included CNN models that can detect molecular catalysts introduced in this paper.

https://chemrxiv.org/engage/chemrxiv/article-details/65491d5dc573f893f1eecd85

We also included training materials used to train the model: i)HAADF-STEM images of the sample and ii)coordinates of the catalysts in those images.

This code works with grayscale 16 bit images.

### Package versions
The code was tested on python 3.13.2 and Ubuntu 20.04.4 LTS with packages below.

```
numpy                     2.2.3
pandas                    2.2.3
pillow                    11.1.0
python                    3.13.2
pytorch                   2.6.0
scipy                     1.15.1
torchvision               0.21.0
```

### Demo
Below is exemplary commands to train a CNN using HAADF-STEM images and detect atoms from another image.

```
python dl_full_pipeline.py Rebpy basic dataset/Re_detection.csv -t 0.7
python dl_full_pipeline.py PtPorph basic dataset/Pt_detection.csv -t 0.7
```
This will perform the following works
 1. Generate a crops of the imageset and the coordinate data
 2. Training the CNN using the dataset
 3. Detect atoms in a representative image

The operation time is less than 1 hour in a "normal" desktop computer.

## 2) Python codes to visualize the detection and calculate the surface coverage of the catalysts

### Package versions
The code was tested on python 3.7.6 and Ubuntu 20.04.4 LTS with packages below.

```
pandas                    1.2.2
matplotlib                3.5.3
scikit-image              0.19.3
opencv-python             4.5.1.48
openpyxl                  3.1.2
```


### Demo
One of the codes above should be run before running this code because it requires the atomic detection result.
```
python Mark_on_image.py
```
This code calculates the surface coverage from the atomic detection result, marks the atoms on the image, and saves them in the output folder.
(Results will be saved in the "Results" folder in the tif_data folder)

```
python TH_filtering.py
```
This code detects atoms on the same images using top-hat filtering which were used for comparison.

## 3) R codes to calculate Ripley's K-function from the detection result


### Installation and requirements
The code was tested under following environment
```

RStudio 2023.06.1+524 "Mountain Hydrangea" Release (547dcf861cac0253a8abb52c135e44e02ba407a1, 2023-07-07) for windows
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) RStudio/2023.06.1+524 Chrome/110.0.5481.208 Electron/23.3.0 Safari/537.36
```

Users should install the following packages from an `R` terminal:

```
install.packages(c('ggplot2', 'spatstat', 'dplyr'))
```

### Package Versions
```
ggplot2: 3.4.3
spatstat: 3.0-6
dplyr: 1.1-2
```

### Demo

```
Rscript Kfunction_data.R
```
The code above calculates and generates the K function using the detection result. The result will be saved in the same folder with the R file.
```
Rscript Kfunction_clustered.R
Rscript Kfunction_dispersed.R
Rscript Kfunction_random.R
```
The code above calculates the exemplary distribution of clustered, dispersed, and random distribution, respectively.
