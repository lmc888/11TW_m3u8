#!/bin/bash
e=$(cat id.txt)
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"

tmpresult1=$(curl  --user-agent "${UA_Browser}" -4 -s --max-time 10 "https://apis.v-saas.com:9501/member/api/viewAuthorization?contentId=1&memberId=${e}&menuId=3&platform=5&imei=c959b475-f846-4a86-8e9b-508048372407") 
qq1=$(echo $tmpresult1 | python -m json.tool 2> /dev/null | grep '"qq"' | cut -f4 -d'"')
st1=$(echo $tmpresult1 | python -m json.tool 2> /dev/null | grep '"st"' | cut -f4 -d'"')
m3u_url1=$(echo $tmpresult1 | python -m json.tool 2> /dev/null | grep boostStreamUrl | cut -f4 -d'"')
ch01="${m3u_url1}?st=${st1}&qq=${qq1}"

tmpresult2=$(curl  --user-agent "${UA_Browser}" -4 -s --max-time 10 "https://apis.v-saas.com:9501/member/api/viewAuthorization?contentId=2&memberId=${e}&menuId=3&platform=5&imei=c959b475-f846-4a86-8e9b-508048372407")
qq2=$(echo $tmpresult2 | python -m json.tool 2> /dev/null | grep '"qq"' | cut -f4 -d'"')
st2=$(echo $tmpresult2 | python -m json.tool 2> /dev/null | grep '"st"' | cut -f4 -d'"')
m3u_url2=$(echo $tmpresult2 | python -m json.tool 2> /dev/null | grep boostStreamUrl | cut -f4 -d'"')
ch02="${m3u_url2}?st=${st2}&qq=${qq2}"

tmpresult3=$(curl  --user-agent "${UA_Browser}" -4 -s --max-time 10 "https://apis.v-saas.com:9501/member/api/viewAuthorization?contentId=10&memberId=${e}&menuId=3&platform=5&imei=c959b475-f846-4a86-8e9b-508048372407")
qq3=$(echo $tmpresult3 | python -m json.tool 2> /dev/null | grep '"qq"' | cut -f4 -d'"')
st3=$(echo $tmpresult3 | python -m json.tool 2> /dev/null | grep '"st"' | cut -f4 -d'"')
m3u_url3=$(echo $tmpresult3 | python -m json.tool 2> /dev/null | grep boostStreamUrl | cut -f4 -d'"')
ch03="${m3u_url3}?st=${st3}&qq=${qq3}"

sed -i "2c ${ch01}" Eleven.m3u
sed -i "4c ${ch02}" Eleven.m3u
sed -i "6c ${ch03}" Eleven.m3u
