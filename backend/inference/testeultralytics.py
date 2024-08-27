from ultralytics import YOLO

# model = YOLO(r"C:\Users\Willian Murayama\Downloads\yolov8l.pt")
model = YOLO(r"C:\Users\Willian Murayama\Downloads\yolov5x6u.pt")
results = model.predict(r"C:\Users\Willian Murayama\Downloads\bus.jpg",conf=0.1)
for result in results:
    boxes = result.boxes  # Boxes object for bounding box outputs
    masks = result.masks  # Masks object for segmentation masks outputs
    keypoints = result.keypoints  # Keypoints object for pose outputs
    probs = result.probs  # Probs object for classification outputs
    obb = result.obb  # Oriented boxes object for OBB outputs
    result.show()  # display to screen
    result.save(filename="result.jpg")  # save to disk

# print(results)