#!name = 中国广电
#!desc = 去广告

[General]
real-ip = *.10099.com.cn

[Rewrite]
^https?:\/\/app\.10099\.com\.cn\/contact-web\/api\/version\/getFlashScreenPage mock-response-body data-type=text data=" " status-code=200

[Mitm]
hostname = app.10099.com.cn
