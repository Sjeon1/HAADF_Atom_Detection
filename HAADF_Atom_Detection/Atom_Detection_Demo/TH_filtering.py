import numpy as np
import os
from skimage import filters, morphology
from skimage.filters import difference_of_gaussians
import cv2

def norm(im):
    return (im - np.min(im)) / (np.max(im - np.min(im)))

def top_hat_filtering(im):
    im1f = difference_of_gaussians(im, 1.5, 90)
    test = norm(filters.gaussian(morphology.white_tophat(im1f, footprint=morphology.disk(3)), 3))
    return test * 255

def load_images_from_folder(folder):
    images = []
    fni1 = "Re_bpy_1h11.tif"
    img1 = cv2.imread(os.path.join(folder, fni1))
    fni2 = "Re_phen_15min_again_3.tif"
    img2 = cv2.imread(os.path.join(folder, fni2))
    images.append(img1)
    images.append(img2)
    return images, [fni1, fni2]

def disconnect_circles(im):
    kernel = np.ones((3, 3), np.uint8)
    opening = cv2.morphologyEx(im, cv2.MORPH_OPEN, kernel, iterations=2)
    sure_bg = cv2.dilate(opening, kernel, iterations=2)
    dist_transform = cv2.distanceTransform(opening, cv2.DIST_L2, 3)
    ret, sure_fg = cv2.threshold(dist_transform, 0.1 * dist_transform.max(), 255, 0)
    sure_fg = np.uint8(sure_fg)
    unknown = cv2.subtract(sure_bg, sure_fg)
    ret, markers = cv2.connectedComponents(sure_fg)
    markers = markers + 1
    markers[unknown == 255] = 0
    return markers

# Main part of the code
current_directory = os.getcwd()
fpi = os.path.join(current_directory, "data", "tif_data")

ims, fni = load_images_from_folder(fpi)

for ii, img_color in enumerate(ims):
    img = img_color[:, :, 0]  # Extracting the first channel
    im2 = top_hat_filtering(img)
    ret, thresh = cv2.threshold(im2.astype("uint8"), 55, 255, cv2.THRESH_BINARY)
    markers = disconnect_circles(thresh)
    markers = cv2.watershed(img_color, markers)
    img_color[markers == -1] = [255, 0, 0]

    for jj in range(2, np.amax(markers)):
        aa = 1 * (markers == jj)
        im_jj = aa * img
        (minVal, maxVal, minLoc, maxLoc) = cv2.minMaxLoc(im_jj)
        [maxx, maxy] = np.asarray(maxLoc)
        img_color[maxy - 2:maxy + 2, maxx - 2:maxx + 2, 0] = 0
        img_color[maxy - 2:maxy + 2, maxx - 2:maxx + 2, 1] = 255
        img_color[maxy - 2:maxy + 2, maxx - 2:maxx + 2, 2] = 0

    output_folder = os.path.join(current_directory, "data", "tif_data", "out", fni[ii])
    os.makedirs(output_folder, exist_ok=True)
    cv2.imwrite(os.path.join(output_folder, "THF.tif"), img_color)

