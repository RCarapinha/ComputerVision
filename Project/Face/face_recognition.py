import cv2
import numpy as np
from itertools import izip
from PIL import Image

def CorrFunction():
	i1 = Image.open("opencv2.jpg")
	i2 = Image.open("opencv1.jpg")
	width1, height1 = i1.size
	width2, height2 = i2.size

	if width1 <= width2:
		width = width1
	else:
		width = width2

	if height1 <= height2:
		height = height1
	else:
		height = height2

	NewI1 = i1.resize((width,height))
	NewI2 = i2.resize((width,height))

	assert NewI1.mode == NewI2.mode, "Different kinds of images."
	assert NewI1.size == NewI2.size, "Different sizes."
	pairs = izip(NewI1.getdata(), NewI2.getdata())
	dif = sum(abs(c1-c2) for p1,p2 in pairs for c1,c2 in zip(p1,p2))
	ncomponents = NewI1.size[0] * NewI1.size[1] * 3
	print "Equality (percentage):", 100-((dif / 255.0 * 100) / ncomponents)

def Snapshot(img, num):
        cv2.imwrite('opencv'+str(num)+'.jpg',img)

def main():
	faceCascade = cv2.CascadeClassifier('/home/carapinha/Desktop/Face/haarcascade_frontalface_default.xml')
	cam = cv2.VideoCapture(0)
	num = 0;
	while True:
		ret_val, img = cam.read()
		gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
		faces = faceCascade.detectMultiScale(gray, 1.3, 5)

		for (x,y,w,h) in faces:
			cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)
			roi_color = img[y:y+h, x:x+w]

		cv2.imshow('Webcam', img)
		if cv2.waitKey(1) == 27: 
			break
		if cv2.waitKey(33) == ord(' '):
			Snapshot(roi_color, num)
			print "Image Saved -> " + str(num)
			num = num + 1
		if cv2.waitKey(33) == ord('a'):
			CorrFunction()
	cam.release()	
	cv2.destroyAllWindows()

if __name__ == "__main__":
	main()
