#!/bin/bash

PASS_MARK=33
one_fail_count=0
all_pass_count=0

failed_one_list=()
passed_all_list=()

while IFS=',' read -r roll name m1 m2 m3
do
    m3=$(echo "$m3" | tr -d '\r')

    fail_count=0

    if [ "$m1" -lt "$PASS_MARK" ]; then
        fail_count=$((fail_count + 1))
    fi

    if [ "$m2" -lt "$PASS_MARK" ]; then
        fail_count=$((fail_count + 1))
    fi

    if [ "$m3" -lt "$PASS_MARK" ]; then
        fail_count=$((fail_count + 1))
    fi

    if [ "$fail_count" -eq 1 ]; then
        failed_one_list+=("$roll - $name")
        one_fail_count=$((one_fail_count + 1))
    fi

    if [ "$fail_count" -eq 0 ]; then
        passed_all_list+=("$roll - $name")
        all_pass_count=$((all_pass_count + 1))
    fi

done < marks.txt

echo "Students who FAILED in exactly ONE subject:"
echo "-------------------------------------------"
for student in "${failed_one_list[@]}"; do
    echo "$student"
done

echo
echo "Students who PASSED in all subjects:"
echo "------------------------------------"
for student in "${passed_all_list[@]}"; do
    echo "$student"
done

echo
echo "Summary:"
echo "--------"
echo "Students failed in exactly ONE subject: $one_fail_count"
echo "Students passed in ALL subjects: $all_pass_count"
