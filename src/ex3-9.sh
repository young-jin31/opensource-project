#!/bin/bash

DB_FILE="DB.txt"

# DB 파일이 없으면 새로 생성
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

while true
do
    echo "============================"
    echo " 1) 팀원 정보 추가"
    echo " 2) 팀원과 한 일 기록"
    echo " 3) 팀원 검색 (이름으로)"
    echo " 4) 수행 내용 검색 (날짜로)"
    echo " 5) 종료"
    echo "============================"
    read -p "메뉴를 선택하세요: " choice

    case "$choice" in
        1)
            echo "[팀원 정보 추가]"
            read -p "이름을 입력하세요: " name
            read -p "생일 또는 전화번호를 입력하세요: " info
            echo "M|$name|$info" >> "$DB_FILE"
            echo "팀원 정보가 저장되었습니다."
            ;;
        2)
            echo "[팀원과 한 일 기록]"
            read -p "날짜를 입력하세요 (예: 2024-11-21): " date
            read -p "수행한 일을 입력하세요: " work
            echo "W|$date|$work" >> "$DB_FILE"
            echo "수행 내용이 저장되었습니다."
            ;;
        3)
            echo "[팀원 검색]"
            read -p "검색할 이름을 입력하세요: " search_name
            echo "== 팀원 검색 결과 =="
            grep "^M|.*$search_name" "$DB_FILE" || echo "검색 결과가 없습니다."
            ;;
        4)
            echo "[수행 내용 검색]"
            read -p "검색할 날짜를 입력하세요 (예: 2024-11-21): " search_date
            echo "== 수행 내용 검색 결과 =="
            grep "^W|$search_date" "$DB_FILE" || echo "검색 결과가 없습니다."
            ;;
        5)
            echo "프로그램을 종료합니다."
            break
            ;;
        *)
            echo "잘못 입력했습니다. 1~5 중에서 선택하세요."
            ;;
    esac

    echo    # 한 줄 띄우기
done
