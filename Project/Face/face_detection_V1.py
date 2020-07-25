import cv2
import numpy as np

faceCascade = cv2.CascadeClassifier('/home/carapinha/Desktop/Face/haarcascade_frontalface_default.xml')
cam = cv2.VideoCapture(0)
while True:
	ret_val, img = cam.read()
	gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
	faces = faceCascade.detectMultiScale(gray, 1.3, 5)

	for (x,y,w,h) in faces:
		cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)
		roi_gray = gray[y:y+h, x:x+w]
		roi_color = img[y:y+h, x:x+w]

	cv2.imshow('Webcam', img)
	if cv2.waitKey(1) == 27: 
		break
cam.release()
cv2.destroyAllWindows()
