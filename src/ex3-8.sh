#!/bin/bash

DB_DIR="./DB"
TRAIN_DIR="./train"

# 1. DB 폴더 확인 후 없으면 생성
if [ ! -d "$DB_DIR" ]; then
    mkdir "$DB_DIR"
    echo "DB 폴더를 생성했습니다."
else
    echo "DB 폴더가 이미 존재합니다."
fi

# 2. DB 폴더 안에 임의의 5개 파일 생성
for i in 1 2 3 4 5
do
    FILE="$DB_DIR/file${i}.txt"
    echo "This is file $i" > "$FILE"
done
echo "DB 폴더 안에 5개의 파일을 생성했습니다."

# 2-2. DB 폴더 안의 파일들을 하나의 압축 파일로 만들기 (tar 사용)
tar -czf DB_files.tar.gz -C "$DB_DIR" .
echo "DB_files.tar.gz 파일로 압축했습니다."

# 3. train 폴더 생성 (없으면)
if [ ! -d "$TRAIN_DIR" ]; then
    mkdir "$TRAIN_DIR"
    echo "train 폴더를 생성했습니다."
else
    echo "train 폴더가 이미 존재합니다."
fi

# 3-2. train 폴더 안에 DB 폴더의 5개 파일을 링크로 생성
for f in "$DB_DIR"/*
do
    base_name=$(basename "$f")
    link_path="$TRAIN_DIR/$base_name"

    # 이미 같은 이름의 파일/링크가 있으면 지우고 다시 생성
    if [ -e "$link_path" ]; then
        rm -f "$link_path"
    fi

    ln -s "../DB/$base_name" "$link_path"
done

echo "train 폴더에 DB 폴더의 파일들에 대한 링크를 생성했습니다."
