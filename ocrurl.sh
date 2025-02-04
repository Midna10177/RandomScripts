#!/usr/bin/bash
curl -s $* -o - | tesseract - -
