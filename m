Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4066D44E9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:53:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJeq-00078f-MC; Mon, 03 Apr 2023 08:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sergey.kambalin@auriga.com>)
 id 1pjEgQ-0000Ls-8o
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:32:54 -0400
Received: from hq-ms.auriga.com ([82.97.202.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sergey.kambalin@auriga.com>)
 id 1pjEgN-0004VN-RW
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:32:54 -0400
Received: from HQ-MS1.office.auriga.msk (82.97.202.32) by
 hq-ms1.office.auriga.msk (82.97.202.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Mon, 3 Apr 2023 10:21:34 +0300
Received: from HQ-MS1.office.auriga.msk ([fe80::4260:7fa4:9d90:6a4]) by
 hq-ms1.office.auriga.msk ([fe80::4260:7fa4:9d90:6a4%4]) with mapi id
 15.02.1118.020; Mon, 3 Apr 2023 10:21:34 +0300
From: "Kambalin, Sergey" <sergey.kambalin@auriga.com>
To: =?gb2312?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkqKY=?= <philmd@linaro.org>, "Sergey
 Kambalin" <serg.oker@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] Make bootable RPi4B model
Thread-Topic: [PATCH] Make bootable RPi4B model
Thread-Index: AQHZZYOjYBGb8AwaJkq25tl8aVt1VK8Y9AeAgAA3h5I=
Date: Mon, 3 Apr 2023 07:21:33 +0000
Message-ID: <49d14fcd4ece4b5bb5f8671b43d8c2af@auriga.com>
References: <20230402165306.137092-1-sergey.kambalin@auriga.com>,
 <a83dd975-2270-1be6-0264-516badbacc38@linaro.org>
In-Reply-To: <a83dd975-2270-1be6-0264-516badbacc38@linaro.org>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [134.191.220.81]
x-tm-as-product-ver: SMEX-14.0.0.1158-9.0.1002-27542.001
x-tm-as-result: No-10--14.659200-8.000000
x-tmase-matchedrid: IWY1H69iwzqJVA+ukO+5MWg4D2QV/2zL6r3HCixfuKcc4ri4RJV/1W/R
 DAZTdSI3QnEYvg6//klFmXhQ6rgRVOyDy8V8lTWUzH6d90mb4+Ih6cl1707zKlZxVB3B2qbP6Xk
 ezPna397QLE3MitZAfl9/IWsrV5Ek1LFdtmiebE5itzfafzhYerzutTz14s8peZ45ULYLKJNNsi
 /bk0au/dXoB9VhhQjLkal2kc7jh2YQcafPsw1WnC+PrAd8gbHJb0NcOFSwefIhm837eIt7zYtH2
 SdBWxvyRKy3EMcSFoDJspWbiyjo+lcXzsaYdfq0rmLeMrcoM6iZmLDnd2pI3+PsX9qV3arkaV+s
 9jXgu68DCvV3UwP6eBY8qLUhOhRKsEBAuoaUqK+If3m0sUfx5+io2PgrXLs41YzbHoRn9L2R5xt
 feKAptiER4oyikLD9/76CM4Z/MGbQ3sOMB3Fk1OLzNWBegCW2Fw5hfb1M/f6wxhlzj2zwm6KVxQ
 goNH15XRw2IdQKZOGaYJyl6AkboUGyQ7v//E9hlExlQIQeRG0=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--14.659200-8.000000
x-tmase-version: SMEX-14.0.0.1158-9.0.1002-27542.001
x-tm-snts-smtp: 3956783C8207A1CAB4928AC2C4DA81283C66EB7EC762B33A84B7D5E261DDC2882000:8
Content-Type: multipart/alternative;
 boundary="_000_49d14fcd4ece4b5bb5f8671b43d8c2afaurigacom_"
MIME-Version: 1.0
Received-SPF: pass client-ip=82.97.202.32;
 envelope-from=sergey.kambalin@auriga.com; helo=hq-ms.auriga.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 MIME_CHARSET_FARAWAY=2.45, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 03 Apr 2023 08:51:34 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_49d14fcd4ece4b5bb5f8671b43d8c2afaurigacom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUGhpbCENCg0KDQpJJ3ZlIHB1dCB1bml0IHRlc3RzIHRvIGEgc2VwYXJhdGUgcGF0Y2ggaW4g
b3JkZXIgdG8gbm90IG92ZXJ3aGVsbSB5b3Ugd2l0aCBjb2RlLg0KDQpJdCBpcyBhbHJlYWR5IGEg
aHVnZSBwaWVjZSwgYW5kIEkgYWdyZWUgdGhhdCAgMzAwMCsgbGluZXMgYXJlIGEgc29ydCBvZiBh
IGNoYWxsZW5nZSB0byBhIHJldmlld2VyLg0KDQpPSywgSSdsbCB0cnkgdG8gc3BsaXQgaXQgaW50
byBhIHNldmVyYWwgcGF0Y2hlcyAtIGNvcmUgZnVuY3Rpb25hbGl0eSArIGEgc2luZ2xlIHBhdGNo
IGZvciBlYWNoIGRldmljZSAoZ3BpbywgdHJuZywgdGhlcm1hbCBzZW5zb3JzKQ0KDQoNCkJSLA0K
DQpTZXJnZXkNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCqewp+Q6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZKimIDxwaGlsbWRAbGluYXJvLm9yZz4NCqewp+Sn4afip9Gn06fdp9an
36fgOiAzIKfRp+Gn4qfWp92n8SAyMDIzIKfULiA5OjUxOjExDQqnrKfgp96n5TogU2VyZ2V5IEth
bWJhbGluOyBxZW11LWRldmVsQG5vbmdudS5vcmcNCqesp+Cn4afap/E6IEthbWJhbGluLCBTZXJn
ZXkNCqe0p9an3qfROiBSZTogW1BBVENIXSBNYWtlIGJvb3RhYmxlIFJQaTRCIG1vZGVsDQoNCkhp
IFNlcmdleSwNCg0KT24gMi80LzIzIDE4OjUzLCBTZXJnZXkgS2FtYmFsaW4gd3JvdGU6DQo+IFNp
Z25lZC1vZmYtYnk6IFNlcmdleSBLYW1iYWxpbiA8c2VyZ2V5LmthbWJhbGluQGF1cmlnYS5jb20+
DQo+IC0tLQ0KPiAgIGNvbmZpZ3MvZGV2aWNlcy9hYXJjaDY0LXNvZnRtbXUvZGVmYXVsdC5tYWsg
fCAgIDEgKw0KPiAgIGh3L2FybS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDcgKw0KPiAgIGh3L2FybS9iY20yODM1X3BlcmlwaGVyYWxzLmMgICAgICAgICAgICAgICAg
fCAyMTggKysrKysrLS0tLQ0KPiAgIGh3L2FybS9iY20yODM2LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxMjkgKysrLS0tDQo+ICAgaHcvYXJtL2JjbTI4MzguYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDI5NCArKysrKysrKysrKysrKw0KPiAgIGh3L2FybS9iY20yODM4X3Bj
aWUuYyAgICAgICAgICAgICAgICAgICAgICAgfCAzMDAgKysrKysrKysrKysrKysNCj4gICBody9h
cm0vYmNtMjgzOF9wZXJpcGhlcmFscy5jICAgICAgICAgICAgICAgIHwgMjYyICsrKysrKysrKysr
Kw0KPiAgIGh3L2FybS9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYg
Kw0KPiAgIGh3L2FybS9yYXNwaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMjgg
KysrLS0tDQo+ICAgaHcvYXJtL3Jhc3BpNGIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDIzMiArKysrKysrKysrKw0KPiAgIGh3L2FybS90cmFjZS1ldmVudHMgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDYgKw0KPiAgIGh3L2dwaW8vYmNtMjgzOF9ncGlvLmMgICAgICAgICAgICAg
ICAgICAgICAgfCAzOTUgKysrKysrKysrKysrKysrKysrDQo+ICAgaHcvZ3Bpby9tZXNvbi5idWls
ZCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ICAgaHcvbWlzYy9iY20yODM1X3By
b3BlcnR5LmMgICAgICAgICAgICAgICAgICB8IDMxOCArKysrKysrKysrKystLS0NCj4gICBody9t
aXNjL2JjbTI4Mzhfcm5nMjAwLmMgICAgICAgICAgICAgICAgICAgIHwgNDIxICsrKysrKysrKysr
KysrKysrKysrDQo+ICAgaHcvbWlzYy9iY20yODM4X3RoZXJtYWwuYyAgICAgICAgICAgICAgICAg
ICB8ICA5NyArKysrKw0KPiAgIGh3L21pc2MvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDQgKw0KPiAgIGh3L21pc2MvdHJhY2UtZXZlbnRzICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMTAgKw0KPiAgIGluY2x1ZGUvaHcvYXJtL2JjbTI4MzVfcGVyaXBoZXJhbHMuaCAg
ICAgICAgfCAgMjkgKy0NCj4gICBpbmNsdWRlL2h3L2FybS9iY20yODM2LmggICAgICAgICAgICAg
ICAgICAgIHwgIDMwICstDQo+ICAgaW5jbHVkZS9ody9hcm0vYmNtMjgzOC5oICAgICAgICAgICAg
ICAgICAgICB8ICAyNiArKw0KPiAgIGluY2x1ZGUvaHcvYXJtL2JjbTI4MzhfcGNpZS5oICAgICAg
ICAgICAgICAgfCAgNjcgKysrKw0KPiAgIGluY2x1ZGUvaHcvYXJtL2JjbTI4MzhfcGVyaXBoZXJh
bHMuaCAgICAgICAgfCAgNTYgKysrDQo+ICAgaW5jbHVkZS9ody9hcm0vcmFzcGk0Yl9wbGF0Zm9y
bS5oICAgICAgICAgICB8ICA1NCArKysNCj4gICBpbmNsdWRlL2h3L2FybS9yYXNwaV9wbGF0Zm9y
bS5oICAgICAgICAgICAgIHwgIDM0ICsrDQo+ICAgaW5jbHVkZS9ody9kaXNwbGF5L2JjbTI4MzVf
ZmIuaCAgICAgICAgICAgICB8ICAgMiArDQo+ICAgaW5jbHVkZS9ody9ncGlvL2JjbTI4MzhfZ3Bp
by5oICAgICAgICAgICAgICB8ICA0NSArKysNCj4gICBpbmNsdWRlL2h3L21pc2MvYmNtMjgzOF9y
bmcyMDAuaCAgICAgICAgICAgIHwgIDc3ICsrKysNCj4gICBpbmNsdWRlL2h3L21pc2MvYmNtMjgz
OF90aGVybWFsLmggICAgICAgICAgIHwgIDI0ICsrDQo+ICAgaW5jbHVkZS9ody9taXNjL3Jhc3Bi
ZXJyeXBpLWZ3LWRlZnMuaCAgICAgICB8IDE2OSArKysrKysrKw0KPiAgIDMwIGZpbGVzIGNoYW5n
ZWQsIDMxNzUgaW5zZXJ0aW9ucygrKSwgMjY3IGRlbGV0aW9ucygtKQ0KDQpUaGUgcGF0Y2ggc3Vi
amVjdCBzb3VuZHMgcHJvbWlzaW5nISBIb3dldmVyIDMxNzUgbGluZXMgb2YNCmNvZGUgdG8gcmV2
aWV3IGlzIGEgYml0IGhhcmRjb3JlLi4uIENvdWxkIHlvdSBzcGxpdCB5b3VyDQpwYXRjaCBwZXIg
ZGV2aWNlIChhdCBsZWFzdCk/DQoNCklkZWFsbHkgb25lIHBhdGNoIHNob3VsZCBjb250YWluIGEg
c2luZ2xlIGxvZ2ljYWwgY2hhbmdlLg0KDQpBbHNvLCBjYW4geW91IHByb3ZpZGUgaG93IHlvdSB0
ZXN0ZWQgeW91ciBwYXRjaD8NCg0KVGhhbmtzLA0KDQpQaGlsLg0K

--_000_49d14fcd4ece4b5bb5f8671b43d8c2afaurigacom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Hi Phil!</p>
<p><br>
</p>
<p>I've put unit tests to a separate patch in order to not overwhelm you wi=
th code.</p>
<p>It is already a huge piece, and I agree that<span style=3D"font-size:12p=
t">&nbsp;</span><span style=3D"font-size:12pt">&nbsp;3000&#43; lines
</span><span style=3D"font-size:12pt">are</span><span style=3D"font-size:12=
pt"> a sort of a challenge to a reviewer.</span></p>
<p>OK, I'll try to split it into a several patches - core functionality &#4=
3; a single patch for each&nbsp;device (gpio, trng, thermal sensors)</p>
<p><br>
</p>
<p>BR,</p>
<p>Sergey</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=A7=B0=A7=E4:</b> Philippe Ma=
thieu-Daud=A8=A6 &lt;philmd@linaro.org&gt;<br>
<b>=A7=B0=A7=E4=A7=E1=A7=E2=A7=D1=A7=D3=A7=DD=A7=D6=A7=DF=A7=E0:</b> 3 =A7=
=D1=A7=E1=A7=E2=A7=D6=A7=DD=A7=F1 2023 =A7=D4. 9:51:11<br>
<b>=A7=AC=A7=E0=A7=DE=A7=E5:</b> Sergey Kambalin; qemu-devel@nongnu.org<br>
<b>=A7=AC=A7=E0=A7=E1=A7=DA=A7=F1:</b> Kambalin, Sergey<br>
<b>=A7=B4=A7=D6=A7=DE=A7=D1:</b> Re: [PATCH] Make bootable RPi4B model</fon=
t>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi Sergey,<br>
<br>
On 2/4/23 18:53, Sergey Kambalin wrote:<br>
&gt; Signed-off-by: Sergey Kambalin &lt;sergey.kambalin@auriga.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; configs/devices/aarch64-softmmu/default.mak |&nbsp;&nbsp; =
1 &#43;<br>
&gt;&nbsp;&nbsp; hw/arm/Kconfig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 7 &#4=
3;<br>
&gt;&nbsp;&nbsp; hw/arm/bcm2835_peripherals.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 218 &#43;&#4=
3;&#43;&#43;&#43;&#43;----<br>
&gt;&nbsp;&nbsp; hw/arm/bcm2836.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 129 &#43;&#43;&#43;---<br>
&gt;&nbsp;&nbsp; hw/arm/bcm2838.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 294 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; hw/arm/bcm2838_pcie.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; | 300 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; hw/arm/bcm2838_peripherals.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 262 &#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; hw/arm/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;<br>
&gt;&nbsp;&nbsp; hw/arm/raspi.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 128 &#43;&#43;&#4=
3;---<br>
&gt;&nbsp;&nbsp; hw/arm/raspi4b.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 232 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; hw/arm/trace-events&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;<br>
&gt;&nbsp;&nbsp; hw/gpio/bcm2838_gpio.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; | 395 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; hw/gpio/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 &#43;<br>
&gt;&nbsp;&nbsp; hw/misc/bcm2835_property.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 31=
8 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---<br>
&gt;&nbsp;&nbsp; hw/misc/bcm2838_rng200.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; | 421 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; hw/misc/bcm2838_thermal.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp; 97 &#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; hw/misc/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;<br>
&gt;&nbsp;&nbsp; hw/misc/trace-events&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 &#43;<br>
&gt;&nbsp;&nbsp; include/hw/arm/bcm2835_peripherals.h&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; |&nbsp; 29 &#43;-<br>
&gt;&nbsp;&nbsp; include/hw/arm/bcm2836.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; |&nbsp; 30 &#43;-<br>
&gt;&nbsp;&nbsp; include/hw/arm/bcm2838.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; |&nbsp; 26 &#43;&#43;<br>
&gt;&nbsp;&nbsp; include/hw/arm/bcm2838_pcie.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 67 &#43;&#4=
3;&#43;&#43;<br>
&gt;&nbsp;&nbsp; include/hw/arm/bcm2838_peripherals.h&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; |&nbsp; 56 &#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; include/hw/arm/raspi4b_platform.h&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 54 &#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; include/hw/arm/raspi_platform.h&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 34 &#43;&#43;<br>
&gt;&nbsp;&nbsp; include/hw/display/bcm2835_fb.h&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;<br>
&gt;&nbsp;&nbsp; include/hw/gpio/bcm2838_gpio.h&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 45 &#43;&#43;&#4=
3;<br>
&gt;&nbsp;&nbsp; include/hw/misc/bcm2838_rng200.h&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 77 &#43;&#43;&#43;&#43;<br=
>
&gt;&nbsp;&nbsp; include/hw/misc/bcm2838_thermal.h&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 24 &#43;&#43;<br>
&gt;&nbsp;&nbsp; include/hw/misc/raspberrypi-fw-defs.h&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; | 169 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; 30 files changed, 3175 insertions(&#43;), 267 deletions(-)=
<br>
<br>
The patch subject sounds promising! However 3175 lines of<br>
code to review is a bit hardcore... Could you split your<br>
patch per device (at least)?<br>
<br>
Ideally one patch should contain a single logical change.<br>
<br>
Also, can you provide how you tested your patch?<br>
<br>
Thanks,<br>
<br>
Phil.<br>
</div>
</span></font>
</body>
</html>

--_000_49d14fcd4ece4b5bb5f8671b43d8c2afaurigacom_--

