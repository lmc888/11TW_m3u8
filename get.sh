#!/bin/bash

UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"

tmpresult=$(curl  --user-agent "${UA_Browser}" -4 -s --max-time 10 "https://apis.v-saas.com:9501/member/api/viewAuthorization?contentId=1&memberId=384030&menuId=3&platform=5&imei=c959b475-f846-4a86-8e9b-508048372508")
qq=$(echo $tmpresult | python -m json.tool 2> /dev/null | grep '"qq"' | cut -f4 -d'"')
st=$(echo $tmpresult | python -m json.tool 2> /dev/null | grep '"st"' | cut -f4 -d'"')
m3u_RUL=$(echo $tmpresult | python -m json.tool 2> /dev/null | grep boostStreamUrl | cut -f4 -d'"')
result="${m3u_RUL}?st=${st}&qq=${qq}"
