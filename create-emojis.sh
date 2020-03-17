#!/bin/bash

NAME="$1"
OUT_DIR="out"

IN="flags/$NAME.png"
OUT_FLAG_TMP="/tmp/${NAME}_flag_tmp.png"
OUT_FLAG="$OUT_DIR/${NAME}_flag.png"

OUT_HEART_TMP="/tmp/${NAME}_heart.png"
OUT_HEART="$OUT_DIR/${NAME}_heart.png"

echo $IN
echo $OUT_FLAG
echo $OUT_HEART

convert $IN -resize x500 -background transparent -gravity center -extent 630x630 $OUT_FLAG_TMP
composite -compose Dst_In flag_mask.png $OUT_FLAG_TMP -alpha Set $OUT_FLAG
rm $OUT_FLAG_TMP

convert $IN -resize x505 -background transparent -gravity center -extent 630x630+0+16 $OUT_HEART_TMP
composite -compose Dst_In heart_mask.png $OUT_HEART_TMP -alpha Set $OUT_HEART
rm $OUT_HEART_TMP
