#!/bin/bash

# Default parameters
TEACHER_TRAIN=false # or false
TEACHER_DATA="" # data yaml path
TEACHER_EPOCHS=100
TEACHER_IMGSZ=640
TEACHER_DEVICE="0"
TEACHER_BATCH=8
TEACHER_MODEL="" # yolov8n,s,m,l,x / yolo11n,s,m,l,x

STUDENT_TRAIN=true # or false
STUDENT_DATA="" # data yaml path
STUDENT_EPOCHS=300
STUDENT_IMGSZ=640
STUDENT_DEVICE="0"
STUDENT_BATCH=8
STUDENT_MODEL="yolo11n.pt" # yolov8n,s,m,l,x / yolo11n,s,m,l,x

DISTILL_LAYERS="[2, 4, 6, 8, 9, 10, 13, 16, 19, 22]"
DISTILL_LOSS='mgd'

# Run the Python script with the parsed arguments
python distillation_train.py \
  $( [[ "$TEACHER_TRAIN" == true ]] && echo "--teacher_train" ) \
  --teacher_data "$TEACHER_DATA" \
  --teacher_epochs "$TEACHER_EPOCHS" \
  --teacher_imgsz "$TEACHER_IMGSZ" \
  --teacher_device "$TEACHER_DEVICE" \
  --teacher_batch "$TEACHER_BATCH" \
  --teacher_model "$TEACHER_MODEL" \
  $( [[ "$STUDENT_TRAIN" == true ]] && echo "--student_train" ) \
  --student_data "$STUDENT_DATA" \
  --student_epochs "$STUDENT_EPOCHS" \
  --student_imgsz "$STUDENT_IMGSZ" \
  --student_device "$STUDENT_DEVICE" \
  --student_batch "$STUDENT_BATCH" \
  --distill_layers "$DISTILL_LAYERS" \
  --distill_loss "$DISTILL_LOSS"