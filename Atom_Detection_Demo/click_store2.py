# importing the module
import cv2
import os
import csv

# function to display the coordinates of
# of the points clicked on the image
def click_event(event, x, y, flags, params):
    # checking for left mouse clicks
    if event == cv2.EVENT_LBUTTONDOWN:
        # displaying the coordinates
        # on the Shell
        print(x,',',y)
        f = open('F:/acstem_clean/backup/bpy_crop_new/crop/marked/bpy_crop{0}.csv'.format(ii+18), 'a')
        writer = csv.writer(f)
        writer.writerow([x, y])
        f.close()

        # displaying the coordinates
        # on the image window
        font = cv2.FONT_HERSHEY_SIMPLEX
        # cv2.putText(img, str(x) + ',' +
        #             str(y), (x, y), font,
        #             1, (255, 0, 0), 2)
        image = cv2.drawMarker(img, (x, y), (255, 0, 0), 0, 30, 4)
        cv2.imshow('image', img)


def load_images_from_folder(folder):
    images = []
    for filename in os.listdir(folder):
        img = cv2.imread(os.path.join(folder, filename))
        print(filename)
        if img is not None:
            images.append(img)
    return images

# driver function
if __name__ == "__main__":
    # reading the image

    ims = load_images_from_folder("F:/acstem_clean/backup/bpy_crop_new/crop/marked/")
    for ii in range(0, len(ims)):

        img = ims[ii]

        # displaying the image
        cv2.imshow('image', img)

        # setting mouse handler for the image
        # and calling the click_event() function
        cv2.setMouseCallback('image', click_event)

        # wait for a key to be pressed to exit
        cv2.waitKey(0)

        # close the window
        cv2.destroyAllWindows()