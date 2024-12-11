#!/bin/bash

# Default parameters
TEACHER_TRAIN=true # or false
TEACHER_DATA="/home/leeyongseong/nas_folder/kisa/yolo_datasets/kisa_yolo_싸움데이터셋/data.yaml" # data yaml path
TEACHER_EPOCHS=100
TEACHER_IMGSZ=640
TEACHER_DEVICE="0"
TEACHER_BATCH=8
TEACHER_MODEL="yolo11l.pt" # yolov8n,s,m,l,x / yolo11n,s,m,l,x
TEACHER_VERSION="v11l" # v8n,s,m,l,x / v11n,s,m,l,x

STUDENT_TRAIN=false # or false
STUDENT_DATA="/home/leeyongseong/nas_folder/kisa/yolo_datasets/kisa_yolo_싸움데이터셋/data.yaml" # data yaml path
STUDENT_EPOCHS=100
STUDENT_IMGSZ=640
STUDENT_DEVICE="0"
STUDENT_BATCH=8
STUDENT_MODEL="yolo11n.pt" # yolov8n,s,m,l,x / yolo11n,s,m,l,x
STUDENT_VERSION="v11n" # v8n,s,m,l,x / v11n,s,m,l,x

# Run the Python script with the parsed arguments
python distillation_train.py \
  $( [[ "$TEACHER_TRAIN" == true ]] && echo "--teacher_train" ) \
  --teacher_data "$TEACHER_DATA" \
  --teacher_epochs "$TEACHER_EPOCHS" \
  --teacher_imgsz "$TEACHER_IMGSZ" \
  --teacher_device "$TEACHER_DEVICE" \
  --teacher_batch "$TEACHER_BATCH" \
  --teacher_model "$TEACHER_MODEL" \
  --teacher_version "$TEACHER_VERSION" \
  $( [[ "$STUDENT_TRAIN" == true ]] && echo "--student_train" ) \
  --student_data "$STUDENT_DATA" \
  --student_epochs "$STUDENT_EPOCHS" \
  --student_imgsz "$STUDENT_IMGSZ" \
  --student_device "$STUDENT_DEVICE" \
  --student_batch "$STUDENT_BATCH" \
  --student_version "$STUDENT_VERSION"