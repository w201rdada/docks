#!/bin/bash

cd ~/rdada/docks/portfolio && time docker build --pull -t w201rdada/portfolio . && docker push w201rdada/portfolio

