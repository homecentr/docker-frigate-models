FROM ghcr.io/astral-sh/uv:0.10.12 AS uv

FROM python:3.11 AS build

ENV DEBIAN_FRONTEND=noninteractive
ENV USE_NNPACK=0

RUN apt-get update && \
    apt-get install --no-install-recommends -y libgl1=1.7.0-1+b2 && \
    rm -rf /var/lib/apt/lists/*
    
COPY --from=uv /uv /bin/
RUN git clone https://github.com/WongKinYiu/yolov9.git /yolov9

WORKDIR /yolov9

RUN uv pip install --system -r requirements.txt && \
    uv pip install --system onnx==1.18.0 onnxruntime onnx-simplifier>=0.4.1 onnxscript

ADD https://github.com/WongKinYiu/yolov9/releases/download/v0.1/yolov9-t-converted.pt yolov9-t.pt
ADD https://github.com/WongKinYiu/yolov9/releases/download/v0.1/yolov9-s-converted.pt yolov9-s.pt

RUN sed -i "s/ckpt = torch.load(attempt_download(w), map_location='cpu')/ckpt = torch.load(attempt_download(w), map_location='cpu', weights_only=False)/g" models/experimental.py && \  
    python3 export.py --weights ./yolov9-s.pt --imgsz 320 --simplify --include onnx && \
    python3 export.py --weights ./yolov9-t.pt --imgsz 320 --simplify --include onnx

FROM alpine:3.23

COPY --from=build /yolov9/yolov9-s.onnx /yolov9-s-320.onnx
COPY --from=build /yolov9/yolov9-t.onnx /yolov9-t-320.onnx
