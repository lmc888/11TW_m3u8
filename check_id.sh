#! /bin/bash

check_status(){
e=$(cat id.txt)
until [[ "$status" == "true" ]]
do
	sleep 1
	status=$(curl -s "https://apis.v-saas.com:9501/member/api/viewAuthorization?contentId=2&memberId=${e}&menuId=3&platform=5&imei=c959b475-f846-4a86-8e9b-508048372407" | python -m json.tool 2> /dev/null | grep authorization | awk '{print $2}' | cut -f1 -d",")
	((e=$e+1))
	
	if [[ "$e" -gt 999999 ]]
		then 
			echo "无法成功连上节点"
			exit 0
	fi	
	

done
}
check_status

echo $e > id.txt
