#!/bin/bash

while true
do
    echo "==========================="
    echo "   시스템 상태 확인 메뉴"
    echo "==========================="
    echo "1) 사용자 정보 확인"
    echo "2) CPU/GPU 사용량 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "==========================="
    read -p "메뉴 번호를 선택하세요: " choice

    case $choice in
        1)
            echo "---- 사용자 정보 ----"
            who
            ;;
        2)
            echo "---- CPU 사용량(top) ----"
            top -b -n 1 | head -n 10
            ;;
        3)
            echo "---- 메모리 사용량(free) ----"
            free -h
            ;;
        4)
            echo "---- 디스크 사용량(df -h) ----"
            df -h
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "잘못된 입력입니다. 다시 선택하세요."
            ;;
    esac

    echo ""   # 보기 편하게 한 줄 띄기
done
