#!/bin/bash

scores=()   # 점수를 저장할 배열

while true
do
    echo "===================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급(GPA) 변환"
    echo "5) 종료"
    echo "===================="
    read -p "메뉴 번호를 입력하세요: " menu

    case $menu in
        1)
            read -p "추가할 점수를 입력하세요: " score
            scores+=($score)
            echo "성적이 추가되었습니다."
            ;;
        2)
            echo "입력된 점수들: ${scores[@]}"
            ;;
        3)
            sum=0
            for s in "${scores[@]}"; do
                sum=$((sum + s))
            done
            if [ ${#scores[@]} -gt 0 ]; then
                avg=$((sum / ${#scores[@]}))
                echo "평균 점수: $avg"
            else
                echo "입력된 점수가 없습니다."
            fi
            ;;
        4)
            sum=0
            for s in "${scores[@]}"; do
                sum=$((sum + s))
            done
            if [ ${#scores[@]} -gt 0 ]; then
                avg=$((sum / ${#scores[@]}))

                if [ $avg -ge 90 ]; then
                    echo "평균 등급: A"
                elif [ $avg -ge 80 ]; then
                    echo "평균 등급: B"
                elif [ $avg -ge 70 ]; then
                    echo "평균 등급: C"
                elif [ $avg -ge 60 ]; then
                    echo "평균 등급: D"
                else
                    echo "평균 등급: F"
                fi
            else
                echo "입력된 점수가 없습니다."
            fi
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "잘못된 입력입니다."
            ;;
    esac
done
