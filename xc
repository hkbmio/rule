#!name= 携程
#!desc：去广告
#!icon= https://raw.githubusercontent.com/luestr/IconResource/main/App_icon/120px/Ctrip.png
#!tag = 去广告,Youtube

[Rewrite]

^https?:\/\/ma-adx\.ctrip\.com\/_ma\.gif reject

^https?:\/\/mbd\.baidu\.com\/newspage\/api\/getmobads\?page\=landingshare reject

[Mitm]
hostname = ma-adx.ctrip.com, mbd.baidu.com
