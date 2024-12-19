import argparse
from ultralytics import YOLO

import torch
import gc

def train():
    parser = argparse.ArgumentParser(description="Train a YOLO model using specified parameters.")

    # Adding arguments
    parser.add_argument('--teacher_train', action='store_true', default=False, help="teacher_train")
    parser.add_argument('--teacher_data', type=str, required=True, help="Path to the dataset configuration file.")
    parser.add_argument('--teacher_epochs', type=int, default=100, help="Number of training epochs.")
    parser.add_argument('--teacher_imgsz', type=int, default=640, help="Image size for training.")
    parser.add_argument('--teacher_device', type=str, default='0', help="Device to use for training (e.g., 'cpu' or GPU ID).")
    parser.add_argument('--teacher_batch', type=int, default=8, help="Batch size for training.")
    parser.add_argument('--teacher_model', type=str, default='yolo11l.pt', help="Path to the teacher YOLO model file.")

    parser.add_argument('--student_train', action='store_true', default=False, help="student_train")
    parser.add_argument('--student_data', type=str, required=True, help="Path to the dataset configuration file.")
    parser.add_argument('--student_epochs', type=int, default=100, help="Number of training epochs.")
    parser.add_argument('--student_imgsz', type=int, default=640, help="Image size for training.")
    parser.add_argument('--student_device', type=str, default='0', help="Device to use for training (e.g., 'cpu' or GPU ID).")
    parser.add_argument('--student_batch', type=int, default=8, help="Batch size for training.")
    parser.add_argument('--student_model', type=str, default='yolo11n.pt', help="Path to the student YOLO model file.")

    parser.add_argument('--distill_layers', type=str, default='[6, 8, 13, 16, 19, 22]', help="layers for distillation")

    args = parser.parse_args()

    if args.teacher_train:
        # Load the model
        teacher_model = YOLO(args.teacher_model)

        # Start training
        teacher_model.train(
            data=args.teacher_data,
            epochs=args.teacher_epochs,
            imgsz=args.teacher_imgsz,
            device=args.teacher_device,
            batch=args.teacher_batch,
            Distillation=None,
            distill_layers=None
        )

        torch.cuda.empty_cache()
        gc.collect()

    if args.student_train:
        # Load the model
        teacher_model = YOLO(args.teacher_model)
        student_model = YOLO(args.student_model)

        # Start training
        student_model.train(
            data=args.student_data,
            epochs=args.student_epochs,
            imgsz=args.student_imgsz,
            device=args.student_device,
            batch=args.student_batch,
            Distillation=teacher_model,
            distill_layers=args.distill_layers
        )

    if not args.teacher_train and not args.student_train:
        print('Either --teacher_train or --student_train must be True, or both must be True.')



if __name__ == "__main__":
    train()