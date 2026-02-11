# Frigate YOLOv9 Pre-Built Models

This repository provides a minimal Docker image containing pre-built [YOLOv9](https://github.com/WongKinYiu/yolov9) models, ready for use with [Frigate NVR](https://github.com/blakeblackshear/frigate). The image is designed to be lightweight and to provide pre-built YOLOv9 models in ONNX format for use in automated camera object detection.

I use a Kubernetes init container to copy the models into the frigate container when a new pod starts. The models are located at `/*.onnx`.