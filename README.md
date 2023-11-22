# HAADF-STEM atom localization
This code is a modified version of the original code by Mitchell at al.
https://pubs.acs.org/doi/10.1021/jacs.1c12466
https://github.com/HPAI-BSC/AtomDetection_ACSTEM
They work under the same principle but small modifications were applied for the compatibility issue

### Requirements
This code was tested on python 3.7.6

```
boto3                     1.17.3
botocore                  1.20.3
cycler                    0.10.0
decorator                 4.4.2
imageio                   2.9.0
jmespath                  0.10.0
joblib                    1.0.1
kiwisolver                1.4.4
matplotlib                3.5.3
networkx                  2.5.1
numpy                     1.20.1
opencv-contrib-python     4.5.1.48
opencv-python             4.5.1.48
pandas                    1.2.2
pillow                    8.1.0
pyparsing                 2.4.7
python-dateutil           2.8.1
pytz                      2021.1
pywavelets                1.1.1
s3transfer                0.3.4
scikit-image              0.19.3
scikit-learn              0.24.1
scipy                     1.6.0
seaborn                   0.11.1
six                       1.15.0
threadpoolctl             2.1.0
tifffile                  2021.2.1
torch                     1.8.1
torchvision               0.9.1
typing-extensions         3.7.4.3
urllib3                   1.26.3
```

### Run 
Below is an exemplary command.
```
python dl_full_pipeline.py Rebpy basic dataset/Re_detection.csv -t 0.3
```
This will perform the following works
 1. Generate a crops dataset using the imageset and the coordination data
 2. Training the CNN
 3. Detect atoms in the images marked as test in the dataset file

```
python Mark_on_image.py
```
This will calculate the surface coveraged from the image, mark the atoms on the image, and save them in the output folder under data/tif_data folder.

# K-function 


## Installation and requirements
```
The code was tested under following environment /n

RStudio 2023.06.1+524 "Mountain Hydrangea" Release (547dcf861cac0253a8abb52c135e44e02ba407a1, 2023-07-07) for windows
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) RStudio/2023.06.1+524 Chrome/110.0.5481.208 Electron/23.3.0 Safari/537.36

Users should install the following packages prior to installing `mgc`, from an `R` terminal:
install.packages(c('ggplot2', 'spatstat', 'dplyr'))
```

## Package Versions
```
ggplot2: 3.4.3
spatstat: 3.0-6
dplyr: 1.1-2
```
