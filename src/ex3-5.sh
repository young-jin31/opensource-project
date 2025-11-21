#!/bin/bash

# 내부 함수: 사용자가 입력한 명령어와 옵션을 실행
run_cmd() {
    cmd=$1   # 첫 번째 인자: 명령어 이름
    shift    # 나머지는 옵션/인자
    eval "$cmd $*"   # eval로 명령어 실행
}

echo "실행할 리눅스 명령어를 입력하세요 (예: ls, pwd, date): "
read command

echo "옵션/인자를 입력하세요 (없으면 그냥 엔터): "
read params

run_cmd "$command" $params
