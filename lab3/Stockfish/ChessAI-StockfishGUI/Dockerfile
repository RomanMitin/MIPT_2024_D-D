FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt-get -y install python3 git python3-tk idle3 python3.10-venv python-is-python3

RUN git clone https://github.com/Linos1391/ChessAI-StockfishGUI.git --depth=1

WORKDIR /ChessAI-StockfishGUI
COPY ChessAI/setting.json ChessAI/setting.json

COPY deploy_app.sh ./deploy_app.sh
COPY run_app.sh ./run_app.sh
RUN ./deploy_app.sh

ENV DISPLAY=unix:0

CMD ./run_app.sh
