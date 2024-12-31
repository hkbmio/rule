#!name = 哔哩哔哩
#!desc = 去广告

[Rule]

DOMAIN,dns.google,REJECT

URL-REGEX,"^https:\/\/app\.bilibili\.com\/bilibili\.app\.resource\.v1\.Module\/List$",REJECT

URL-REGEX,"^https:\/\/app\.bilibili\.com\/x\/v2\/splash\/show\?",REJECT

[Rewrite]
https:\/\/app\.bilibili\.com\/x\/v2\/search\/square mock-response-body data-type=text data="{}" status-code=200
^https:\/\/app\.bilibili\.com\/x\/resource\/patch\/tab\? mock-response-body data-type=text data="{}" status-code=200
splash\/list mock-response-body data-type=text data="{}" status-code=200
^https:\/\/app\.bilibili\.com\/x\/resource\/ip mock-response-body data-type=text data="{}" status-code=200
^https:\/\/api\.bilibili\.com\/x\/web-interface\/zone\?jsonp mock-response-body data-type=text data="{}" status-code=200

https:\/\/app\.bilibili\.com\/x\/resource\/show\/tab\/v2 response-body-json-jq '.data |= (.tab |= del(.[] | select(.id | IN(3371, 39, 41, 136117)))| .bottom |= del(.[] | select(.name == "发布" or .id == 2757)))'
https:\/\/app\.bilibili\.com\/x\/v2\/feed\/index response-body-json-jq '.data.items |= map( select(.ad_info != true) | del(.ad_info) | if .banner_item != null then empty else . end)'
https:\/\/app\.bilibili\.com\/x\/v2\/account\/mine response-body-json-jq '.data.sections_v2 |= map(select(.title as $title | ["创作中心", "推荐服务"] | index($title) == null) | .items |= map(select(.id != 964)))'

[Mitm]
hostname = app.bilibili.com
