#!/bin/bash

echo "과목1 점수를 입력하세요 (0~100): "
read s1

echo "과목2 점수를 입력하세요 (0~100): "
read s2

if [ $s1 -lt 0 ] || [ $s1 -gt 100 ] || [ $s2 -lt 0 ] || [ $s2 -gt 100 ]; then
    echo "점수는 0~100 사이여야 합니다."
    exit 1
fi

get_grade() {
    if [ $1 -ge 90 ]; then
        echo "A"
    else
        echo "B"
    fi
}

g1=$(get_grade $s1)
g2=$(get_grade $s2)

echo "과목1 등급: $g1"
echo "과목2 등급: $g2"

avg=$(( (s1 + s2) / 2 ))
g_avg=$(get_grade $avg)

echo "평균 점수: $avg"
echo "평균 등급: $g_avg"
