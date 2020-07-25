import cv2

def show_webcam():
	cam = cv2.VideoCapture(0)
	while True:
		ret_val, img = cam.read()
		cv2.imshow('Webcam', img)
		if cv2.waitKey(1) == 27: 
			break
	cam.release()
	cv2.destroyAllWindows()

def main():
	show_webcam()

main()
