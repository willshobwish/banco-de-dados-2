from ultralytics import YOLO

# model = YOLO(r"C:\Users\Willian Murayama\Downloads\yolov8l.pt")
model = YOLO(r"assets\yolov8x.pt")
results = model.predict(r"assets\pexels-ekrulila-2332914.jpg")
for result in results:
    boxes = result.boxes  # Boxes object for bounding box outputs
    masks = result.masks  # Masks object for segmentation masks outputs
    keypoints = result.keypoints  # Keypoints object for pose outputs
    probs = result.probs  # Probs object for classification outputs
    obb = result.obb  # Oriented boxes object for OBB outputs
    result.show()  # display to screen
    result.save(filename=r"assets\result.jpg")  # save to disk

# print(results)