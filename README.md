# yolov11_knowledge_distillation

This code applies knowledge distillation to YOLOv11 from [ultralytics](https://github.com/ultralytics/ultralytics) using MGDLoss.

## Reference
- This project is forked from [ultralytics](https://github.com/ultralytics/ultralytics)
- This project is based on [yolov8_Distillation](https://github.com/huangzongmou/yolov8_Distillation)

## Installation

## 1. Clone the repository  
Clone the repository using the following command:  
```bash
git clone https://github.com/deeprine/yolov11_Knowledge_Distillation
```
   
## 2. Install the required libraries  
Install all the necessary libraries listed in `requirements.txt`:  
```bash
pip install -r requirements.txt
```

## 3. Modify and execute `run.sh`  
Edit the `run.sh` file as needed and execute it:  
- You can train only the teacher model.  
- If the teacher model has already been trained, you can train the student model.  

Run the script:  
```bash
bash run.sh
```
   
   

