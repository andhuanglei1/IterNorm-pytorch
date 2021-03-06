#!/usr/bin/env bash
cd "$(dirname $0)/.."
CUDA_VISIBLE_DEVICES=4,5,6,7 python3 imagenet.py \
-a=resnet50 \
--arch-cfg=last=True \
--batch-size=256 \
--epochs=100 \
-oo=sgd \
-oc=momentum=0.9 \
-wd=1e-4 \
--lr=0.1 \
--lr-method=step \
--lr-steps=30 \
--lr-gamma=0.1 \
--dataset-root=/data/lei/imageNet/input_torch/ \
--dataset=folder \
--norm=ItN \
--norm-cfg=T=5,num_channels=64 \
--log-suffix=DF \
$@
