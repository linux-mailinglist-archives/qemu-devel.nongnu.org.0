Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80546EEF4A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 09:26:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prZWa-00036M-5l; Wed, 26 Apr 2023 03:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangc66@chinatelecom.cn>)
 id 1prZWS-000368-36
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 03:25:04 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangc66@chinatelecom.cn>) id 1prZWO-0001Wl-Hm
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 03:25:03 -0400
HMM_SOURCE_IP: 172.18.0.188:58660.472047856
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-106.120.101.58 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 160382800E1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 15:17:20 +0800 (CST)
X-189-SAVE-TO-SEND: 71139813@chinatelecom.cn
Received: from  ([106.120.101.58])
 by app0023 with ESMTP id f9d84a7f841f4375a36ae2c367a17441 for
 qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:17:22 CST
X-Transaction-ID: f9d84a7f841f4375a36ae2c367a17441
X-Real-From: wangc66@chinatelecom.cn
X-Receive-IP: 106.120.101.58
X-MEDUSA-Status: 0
Date: Wed, 26 Apr 2023 15:17:17 +0800
From: "wangc66@chinatelecom.cn" <wangc66@chinatelecom.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: patch:avoid-to-create-a-null-watch-in-flush_buf
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.121[cn]
Mime-Version: 1.0
Message-ID: <2023042615171480918124@chinatelecom.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart623071302066_=----"
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=wangc66@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: 32
X-Spam_score: 3.2
X-Spam_bar: +++
X-Spam_report: (3.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 MIME_BASE64_TEXT=1.741, RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
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

This is a multi-part message in MIME format.

------=_001_NextPart623071302066_=----
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: base64

SGksIEkgYW0gdGVzdGluZyB3aGVuIHFnYSBwdXNoIG1zZyB0byBsaWJ2aXJ0LCB3aGVuIHRoZSB2
bSBzYXZlZCBhbmQgcmVzdG9yZSBmcm9tIHRoZSBtZW1vcnkgZmlsZSwgdGhlIHFnYSB3aWxsIGJl
IGh1bmdlZCBpbiB3cml0aW5nLg0KDQpJbiBmbHVzaF9idWY6DQooZ2RiKSBmIDQNCiM0ICAweDAw
MDA1NWZmYzcxNjg5NGEgaW4gZmx1c2hfYnVmIChwb3J0PTB4NTVmZmM4N2JmODAwLCBidWY9PG9w
dGltaXplZCBvdXQ+LCBsZW49PG9wdGltaXplZCBvdXQ+KSBhdCAuLi9ody9jaGFyL3ZpcnRpby1j
b25zb2xlLmM6MTAwDQoxMDAgICAgICAgICAgICAgICAgICAgICB2Y29uLT53YXRjaCA9IHFlbXVf
Y2hyX2ZlX2FkZF93YXRjaCgmdmNvbi0+Y2hyLA0KKGdkYikgbA0KOTUgICAgICAgICAgICAgICAq
IHVzZSB0aHJvdHRsaW5nIG9uIGhvc3Qgc2lkZS4NCjk2ICAgICAgICAgICAgICAgKi8NCjk3ICAg
ICAgICAgICAgICBpZiAoIWstPmlzX2NvbnNvbGUpIHsNCjk4ICAgICAgICAgICAgICAgICAgdmly
dGlvX3NlcmlhbF90aHJvdHRsZV9wb3J0KHBvcnQsIHRydWUpOw0KOTkgICAgICAgICAgICAgICAg
ICBpZiAoIXZjb24tPndhdGNoKSB7DQoxMDAgICAgICAgICAgICAgICAgICAgICB2Y29uLT53YXRj
aCA9IHFlbXVfY2hyX2ZlX2FkZF93YXRjaCgmdmNvbi0+Y2hyLA0KMTAxICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR19JT19PVVR8R19JT19I
VVAsDQoxMDIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjaHJfd3JpdGVfdW5ibG9ja2VkLCB2Y29uKTsNCjEwMyAgICAgICAgICAgICAgICAg
fQ0KMTA0ICAgICAgICAgICAgIH0NCnZjb24tPndhdGNoIGlzIDAsIGJ1dCB0aGUgcG9ydCBpcyB0
aHJvdHRsZWQsIHNvIGl0IHdpbGwgbm90IHByb2Nlc3MgdGhlIGZlIGV2ZW50LCB1bnRpbCByZXN0
YXJ0IHFnYSBvciByZXN0YXJ0IGxpYnZpcnRkLg0KVGhpcyBpc3N1ZSBpcyBoYXBwZW5kIHdoZW4g
dGhlIHZtIGlzIG1pZ3JhdGluZyBvciByZXN0b3JlIGZyb20gYSBtZW1vcnkgZmlsZSBzYXZlZC4N
ClNvIEkgdGhpbmsgaXQgY2FuIGJlIGZpeGVkIGJ5IGZvbGxvd2luZzoNCjEwMCAgICAgICAgICAg
ICAgICAgICAgIHZjb24tPndhdGNoID0gcWVtdV9jaHJfZmVfYWRkX3dhdGNoKCZ2Y29uLT5jaHIs
DQooZ2RiKSBsDQo5NSAgICAgICAgICAgICAgICogdXNlIHRocm90dGxpbmcgb24gaG9zdCBzaWRl
Lg0KOTYgICAgICAgICAgICAgICAqLw0KOTcgICAgICAgICAgICAgIGlmICghay0+aXNfY29uc29s
ZSkgew0KOTggICAgICAgICAgICAgICAgICB2aXJ0aW9fc2VyaWFsX3Rocm90dGxlX3BvcnQocG9y
dCwgdHJ1ZSk7DQo5OSAgICAgICAgICAgICAgICAgIGlmICghdmNvbi0+d2F0Y2gpIHsNCjEwMCAg
ICAgICAgICAgICAgICAgICAgIHZjb24tPndhdGNoID0gcWVtdV9jaHJfZmVfYWRkX3dhdGNoKCZ2
Y29uLT5jaHIsDQoxMDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBHX0lPX09VVHxHX0lPX0hVUCwNCjEwMiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNocl93cml0ZV91bmJsb2NrZWQs
IHZjb24pOw0KKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCF2Y29uLT53YXRjaCkNCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdmlydGlvX3NlcmlhbF90aHJvdHRsZV9wb3J0KHBvcnQs
IGZhbHNlKTsNCjEwMyAgICAgICAgICAgICAgICAgfQ0KMTA0ICAgICAgICAgICAgIH0NCkkgaGF2
ZSB0ZXN0IHRoZSBjb2RlLCBhbmQgaXQgd29ya3MuDQoNCg0KDQp3YW5nYzY2QGNoaW5hdGVsZWNv
bS5jbg0K

------=_001_NextPart623071302066_=----
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3Dus-ascii"><style>body { line-height: 1.5; }body { font-size: 14px; fon=
t-family: "Microsoft YaHei UI"; color: rgb(0, 0, 0); line-height: 1.5; }</=
style></head><body>=0A<div><span></span>Hi, I am testing when qga push msg=
 to libvirt, when the vm saved and restore from the memory file, the qga w=
ill be hunged in writing.</div><div><br></div><div>In flush_buf:</div><div=
><div class=3D"line number1 index0 alt2" style=3D"margin: 0px; padding: 0p=
x 1em 0px 0em; border-radius: 0px; background-image: none; background-posi=
tion: initial; background-size: initial; background-repeat: initial; backg=
round-attachment: initial; background-origin: initial; background-clip: in=
itial; border: 0px; float: none; height: auto; line-height: 20px; outline:=
 0px; overflow: visible; position: static; vertical-align: baseline; width=
: auto; box-sizing: content-box; font-family: Consolas, &quot;Bitstream Ve=
ra Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; min-heigh=
t: inherit; white-space: nowrap; color: rgb(51, 51, 51);"><code class=3D"c=
pp plain" style=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono&q=
uot;, &quot;Courier New&quot;, Courier, monospace; border-radius: 0px; bac=
kground: none; border: 0px; float: none; height: auto; line-height: 20px; =
margin: 0px; outline: 0px; overflow: visible; padding: 0px; position: stat=
ic; vertical-align: baseline; width: auto; box-sizing: content-box; min-he=
ight: inherit; color: rgb(0, 0, 0) !important;">(gdb) f 4</code></div><div=
 class=3D"line number2 index1 alt1" style=3D"margin: 0px; padding: 0px 1em=
 0px 0em; border-radius: 0px; background-image: none; background-position:=
 initial; background-size: initial; background-repeat: initial; background=
-attachment: initial; background-origin: initial; background-clip: initial=
; border: 0px; float: none; height: auto; line-height: 20px; outline: 0px;=
 overflow: visible; position: static; vertical-align: baseline; width: aut=
o; box-sizing: content-box; font-family: Consolas, &quot;Bitstream Vera Sa=
ns Mono&quot;, &quot;Courier New&quot;, Courier, monospace; min-height: in=
herit; white-space: nowrap; color: rgb(51, 51, 51);"><code class=3D"cpp pr=
eprocessor" style=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono=
&quot;, &quot;Courier New&quot;, Courier, monospace; border-radius: 0px; b=
ackground: none; border: 0px; float: none; height: auto; line-height: 20px=
; margin: 0px; outline: 0px; overflow: visible; padding: 0px; position: st=
atic; vertical-align: baseline; width: auto; box-sizing: content-box; min-=
height: inherit; color: gray !important;">#4&nbsp; 0x000055ffc716894a in f=
lush_buf (port=3D0x55ffc87bf800, buf=3D&lt;optimized out&gt;, len=3D&lt;op=
timized out&gt;) at ../hw/char/virtio-console.c:100</code></div><div class=
=3D"line number3 index2 alt2" style=3D"margin: 0px; padding: 0px 1em 0px 0=
em; border-radius: 0px; background-image: none; background-position: initi=
al; background-size: initial; background-repeat: initial; background-attac=
hment: initial; background-origin: initial; background-clip: initial; bord=
er: 0px; float: none; height: auto; line-height: 20px; outline: 0px; overf=
low: visible; position: static; vertical-align: baseline; width: auto; box=
-sizing: content-box; font-family: Consolas, &quot;Bitstream Vera Sans Mon=
o&quot;, &quot;Courier New&quot;, Courier, monospace; min-height: inherit;=
 white-space: nowrap; color: rgb(51, 51, 51);"><code class=3D"cpp plain" s=
tyle=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot=
;Courier New&quot;, Courier, monospace; border-radius: 0px; background: no=
ne; border: 0px; float: none; height: auto; line-height: 20px; margin: 0px=
; outline: 0px; overflow: visible; padding: 0px; position: static; vertica=
l-align: baseline; width: auto; box-sizing: content-box; min-height: inher=
it; color: rgb(0, 0, 0) !important;">100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; vcon-&gt;watch =3D qemu_chr_fe_add_watch(&amp;vcon-&gt;chr,</=
code></div><div class=3D"line number4 index3 alt1" style=3D"margin: 0px; p=
adding: 0px 1em 0px 0em; border-radius: 0px; background-image: none; backg=
round-position: initial; background-size: initial; background-repeat: init=
ial; background-attachment: initial; background-origin: initial; backgroun=
d-clip: initial; border: 0px; float: none; height: auto; line-height: 20px=
; outline: 0px; overflow: visible; position: static; vertical-align: basel=
ine; width: auto; box-sizing: content-box; font-family: Consolas, &quot;Bi=
tstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace;=
 min-height: inherit; white-space: nowrap; color: rgb(51, 51, 51);"><code =
class=3D"cpp plain" style=3D"font-family: Consolas, &quot;Bitstream Vera S=
ans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; border-radius=
: 0px; background: none; border: 0px; float: none; height: auto; line-heig=
ht: 20px; margin: 0px; outline: 0px; overflow: visible; padding: 0px; posi=
tion: static; vertical-align: baseline; width: auto; box-sizing: content-b=
ox; min-height: inherit; color: rgb(0, 0, 0) !important;">(gdb) l</code></=
div><div class=3D"line number5 index4 alt2" style=3D"margin: 0px; padding:=
 0px 1em 0px 0em; border-radius: 0px; background-image: none; background-p=
osition: initial; background-size: initial; background-repeat: initial; ba=
ckground-attachment: initial; background-origin: initial; background-clip:=
 initial; border: 0px; float: none; height: auto; line-height: 20px; outli=
ne: 0px; overflow: visible; position: static; vertical-align: baseline; wi=
dth: auto; box-sizing: content-box; font-family: Consolas, &quot;Bitstream=
 Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; min-he=
ight: inherit; white-space: nowrap; color: rgb(51, 51, 51);"><code class=
=3D"cpp plain" style=3D"font-family: Consolas, &quot;Bitstream Vera Sans M=
ono&quot;, &quot;Courier New&quot;, Courier, monospace; border-radius: 0px=
; background: none; border: 0px; float: none; height: auto; line-height: 2=
0px; margin: 0px; outline: 0px; overflow: visible; padding: 0px; position:=
 static; vertical-align: baseline; width: auto; box-sizing: content-box; m=
in-height: inherit; color: rgb(0, 0, 0) !important;">95&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * use th=
rottling on host side.</code></div><div class=3D"line number6 index5 alt1"=
 style=3D"margin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; backg=
round-image: none; background-position: initial; background-size: initial;=
 background-repeat: initial; background-attachment: initial; background-or=
igin: initial; background-clip: initial; border: 0px; float: none; height:=
 auto; line-height: 20px; outline: 0px; overflow: visible; position: stati=
c; vertical-align: baseline; width: auto; box-sizing: content-box; font-fa=
mily: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&qu=
ot;, Courier, monospace; min-height: inherit; white-space: nowrap; color: =
rgb(51, 51, 51);"><code class=3D"cpp plain" style=3D"font-family: Consolas=
, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, =
monospace; border-radius: 0px; background: none; border: 0px; float: none;=
 height: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: vis=
ible; padding: 0px; position: static; vertical-align: baseline; width: aut=
o; box-sizing: content-box; min-height: inherit; color: rgb(0, 0, 0) !impo=
rtant;">96&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; */</code></div><div class=3D"line number7 index6 alt2=
" style=3D"margin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; back=
ground-image: none; background-position: initial; background-size: initial=
; background-repeat: initial; background-attachment: initial; background-o=
rigin: initial; background-clip: initial; border: 0px; float: none; height=
: auto; line-height: 20px; outline: 0px; overflow: visible; position: stat=
ic; vertical-align: baseline; width: auto; box-sizing: content-box; font-f=
amily: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&q=
uot;, Courier, monospace; min-height: inherit; white-space: nowrap; color:=
 rgb(51, 51, 51);"><code class=3D"cpp plain" style=3D"font-family: Consola=
s, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier,=
 monospace; border-radius: 0px; background: none; border: 0px; float: none=
; height: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: vi=
sible; padding: 0px; position: static; vertical-align: baseline; width: au=
to; box-sizing: content-box; min-height: inherit; color: rgb(0, 0, 0) !imp=
ortant;">97&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;</code><code class=3D"cpp keyword bold" style=3D"font=
-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New=
&quot;, Courier, monospace; border-radius: 0px; background: none; border: =
0px; float: none; height: auto; line-height: 20px; margin: 0px; outline: 0=
px; overflow: visible; padding: 0px; position: static; vertical-align: bas=
eline; width: auto; box-sizing: content-box; min-height: inherit; font-wei=
ght: bold !important; color: rgb(51, 102, 153) !important;">if</code>&nbsp=
;<code class=3D"cpp plain" style=3D"font-family: Consolas, &quot;Bitstream=
 Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; border=
-radius: 0px; background: none; border: 0px; float: none; height: auto; li=
ne-height: 20px; margin: 0px; outline: 0px; overflow: visible; padding: 0p=
x; position: static; vertical-align: baseline; width: auto; box-sizing: co=
ntent-box; min-height: inherit; color: rgb(0, 0, 0) !important;">(!k-&gt;i=
s_console) {</code></div><div class=3D"line number8 index7 alt1" style=3D"=
margin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; background-imag=
e: none; background-position: initial; background-size: initial; backgroun=
d-repeat: initial; background-attachment: initial; background-origin: init=
ial; background-clip: initial; border: 0px; float: none; height: auto; lin=
e-height: 20px; outline: 0px; overflow: visible; position: static; vertica=
l-align: baseline; width: auto; box-sizing: content-box; font-family: Cons=
olas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Couri=
er, monospace; min-height: inherit; white-space: nowrap; color: rgb(51, 51=
, 51);"><code class=3D"cpp plain" style=3D"font-family: Consolas, &quot;Bi=
tstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace;=
 border-radius: 0px; background: none; border: 0px; float: none; height: a=
uto; line-height: 20px; margin: 0px; outline: 0px; overflow: visible; padd=
ing: 0px; position: static; vertical-align: baseline; width: auto; box-siz=
ing: content-box; min-height: inherit; color: rgb(0, 0, 0) !important;">98=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; virtio_serial_throttle_port(port,&nbsp;</code=
><code class=3D"cpp keyword bold" style=3D"font-family: Consolas, &quot;Bi=
tstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace;=
 border-radius: 0px; background: none; border: 0px; float: none; height: a=
uto; line-height: 20px; margin: 0px; outline: 0px; overflow: visible; padd=
ing: 0px; position: static; vertical-align: baseline; width: auto; box-siz=
ing: content-box; min-height: inherit; font-weight: bold !important; color=
: rgb(51, 102, 153) !important;">true</code><code class=3D"cpp plain" styl=
e=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Co=
urier New&quot;, Courier, monospace; border-radius: 0px; background: none;=
 border: 0px; float: none; height: auto; line-height: 20px; margin: 0px; o=
utline: 0px; overflow: visible; padding: 0px; position: static; vertical-a=
lign: baseline; width: auto; box-sizing: content-box; min-height: inherit;=
 color: rgb(0, 0, 0) !important;">);</code></div><div class=3D"line number=
9 index8 alt2" style=3D"margin: 0px; padding: 0px 1em 0px 0em; border-radi=
us: 0px; background-image: none; background-position: initial; background-=
size: initial; background-repeat: initial; background-attachment: initial;=
 background-origin: initial; background-clip: initial; border: 0px; float:=
 none; height: auto; line-height: 20px; outline: 0px; overflow: visible; p=
osition: static; vertical-align: baseline; width: auto; box-sizing: conten=
t-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;=
Courier New&quot;, Courier, monospace; min-height: inherit; white-space: n=
owrap; color: rgb(51, 51, 51);"><code class=3D"cpp plain" style=3D"font-fa=
mily: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&qu=
ot;, Courier, monospace; border-radius: 0px; background: none; border: 0px=
; float: none; height: auto; line-height: 20px; margin: 0px; outline: 0px;=
 overflow: visible; padding: 0px; position: static; vertical-align: baseli=
ne; width: auto; box-sizing: content-box; min-height: inherit; color: rgb(=
0, 0, 0) !important;">99&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code cla=
ss=3D"cpp keyword bold" style=3D"font-family: Consolas, &quot;Bitstream Ve=
ra Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; border-ra=
dius: 0px; background: none; border: 0px; float: none; height: auto; line-=
height: 20px; margin: 0px; outline: 0px; overflow: visible; padding: 0px; =
position: static; vertical-align: baseline; width: auto; box-sizing: conte=
nt-box; min-height: inherit; font-weight: bold !important; color: rgb(51, =
102, 153) !important;">if</code>&nbsp;<code class=3D"cpp plain" style=3D"f=
ont-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier =
New&quot;, Courier, monospace; border-radius: 0px; background: none; borde=
r: 0px; float: none; height: auto; line-height: 20px; margin: 0px; outline=
: 0px; overflow: visible; padding: 0px; position: static; vertical-align: =
baseline; width: auto; box-sizing: content-box; min-height: inherit; color=
: rgb(0, 0, 0) !important;">(!vcon-&gt;watch) {</code></div><div class=3D"=
line number10 index9 alt1" style=3D"margin: 0px; padding: 0px 1em 0px 0em;=
 border-radius: 0px; background-image: none; background-position: initial;=
 background-size: initial; background-repeat: initial; background-attachme=
nt: initial; background-origin: initial; background-clip: initial; border:=
 0px; float: none; height: auto; line-height: 20px; outline: 0px; overflow=
: visible; position: static; vertical-align: baseline; width: auto; box-si=
zing: content-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&q=
uot;, &quot;Courier New&quot;, Courier, monospace; min-height: inherit; wh=
ite-space: nowrap; color: rgb(51, 51, 51);"><code class=3D"cpp plain" styl=
e=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Co=
urier New&quot;, Courier, monospace; border-radius: 0px; background: none;=
 border: 0px; float: none; height: auto; line-height: 20px; margin: 0px; o=
utline: 0px; overflow: visible; padding: 0px; position: static; vertical-a=
lign: baseline; width: auto; box-sizing: content-box; min-height: inherit;=
 color: rgb(0, 0, 0) !important;">100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; vcon-&gt;watch =3D qemu_chr_fe_add_watch(&amp;vcon-&gt;chr,</cod=
e></div><div class=3D"line number11 index10 alt2" style=3D"margin: 0px; pa=
dding: 0px 1em 0px 0em; border-radius: 0px; background-image: none; backgr=
ound-position: initial; background-size: initial; background-repeat: initi=
al; background-attachment: initial; background-origin: initial; background=
-clip: initial; border: 0px; float: none; height: auto; line-height: 20px;=
 outline: 0px; overflow: visible; position: static; vertical-align: baseli=
ne; width: auto; box-sizing: content-box; font-family: Consolas, &quot;Bit=
stream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; =
min-height: inherit; white-space: nowrap; color: rgb(51, 51, 51);"><code c=
lass=3D"cpp plain" style=3D"font-family: Consolas, &quot;Bitstream Vera Sa=
ns Mono&quot;, &quot;Courier New&quot;, Courier, monospace; border-radius:=
 0px; background: none; border: 0px; float: none; height: auto; line-heigh=
t: 20px; margin: 0px; outline: 0px; overflow: visible; padding: 0px; posit=
ion: static; vertical-align: baseline; width: auto; box-sizing: content-bo=
x; min-height: inherit; color: rgb(0, 0, 0) !important;">101&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; G_IO_OUT|G_IO_HUP,</code></div><div class=3D"li=
ne number12 index11 alt1" style=3D"margin: 0px; padding: 0px 1em 0px 0em; =
border-radius: 0px; background-image: none; background-position: initial; =
background-size: initial; background-repeat: initial; background-attachmen=
t: initial; background-origin: initial; background-clip: initial; border: =
0px; float: none; height: auto; line-height: 20px; outline: 0px; overflow:=
 visible; position: static; vertical-align: baseline; width: auto; box-siz=
ing: content-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&qu=
ot;, &quot;Courier New&quot;, Courier, monospace; min-height: inherit; whi=
te-space: nowrap; color: rgb(51, 51, 51);"><code class=3D"cpp plain" style=
=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Cou=
rier New&quot;, Courier, monospace; border-radius: 0px; background: none; =
border: 0px; float: none; height: auto; line-height: 20px; margin: 0px; ou=
tline: 0px; overflow: visible; padding: 0px; position: static; vertical-al=
ign: baseline; width: auto; box-sizing: content-box; min-height: inherit; =
color: rgb(0, 0, 0) !important;">102&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; chr_write_unblocked, vcon);</code></div><div class=3D"line number13 ind=
ex12 alt2" style=3D"margin: 0px; padding: 0px 1em 0px 0em; border-radius: =
0px; background-image: none; background-position: initial; background-size=
: initial; background-repeat: initial; background-attachment: initial; bac=
kground-origin: initial; background-clip: initial; border: 0px; float: non=
e; height: auto; line-height: 20px; outline: 0px; overflow: visible; posit=
ion: static; vertical-align: baseline; width: auto; box-sizing: content-bo=
x; font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Cour=
ier New&quot;, Courier, monospace; min-height: inherit; white-space: nowra=
p; color: rgb(51, 51, 51);"><code class=3D"cpp plain" style=3D"font-family=
: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;,=
 Courier, monospace; border-radius: 0px; background: none; border: 0px; fl=
oat: none; height: auto; line-height: 20px; margin: 0px; outline: 0px; ove=
rflow: visible; padding: 0px; position: static; vertical-align: baseline; =
width: auto; box-sizing: content-box; min-height: inherit; color: rgb(0, 0=
, 0) !important;">103&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</code></div><div class=3D"li=
ne number14 index13 alt1" style=3D"margin: 0px; padding: 0px 1em 0px 0em; =
border-radius: 0px; background-image: none; background-position: initial; =
background-size: initial; background-repeat: initial; background-attachmen=
t: initial; background-origin: initial; background-clip: initial; border: =
0px; float: none; height: auto; line-height: 20px; outline: 0px; overflow:=
 visible; position: static; vertical-align: baseline; width: auto; box-siz=
ing: content-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&qu=
ot;, &quot;Courier New&quot;, Courier, monospace; min-height: inherit; whi=
te-space: nowrap; color: rgb(51, 51, 51);"><code class=3D"cpp plain" style=
=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Cou=
rier New&quot;, Courier, monospace; border-radius: 0px; background: none; =
border: 0px; float: none; height: auto; line-height: 20px; margin: 0px; ou=
tline: 0px; overflow: visible; padding: 0px; position: static; vertical-al=
ign: baseline; width: auto; box-sizing: content-box; min-height: inherit; =
color: rgb(0, 0, 0) !important;">104&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</code></div></div>=0A<div><span style=
=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Cou=
rier New&quot;, Courier, monospace; white-space: nowrap;">vcon-&gt;watch i=
s 0, but the port is throttled, so it will not process the fe event, until=
 restart qga or restart libvirtd.</span></div><div><span style=3D"font-fam=
ily: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quo=
t;, Courier, monospace; white-space: nowrap;">This issue is happend when t=
he vm is migrating or restore from a memory file saved.</span></div><div><=
font face=3D"Consolas, Bitstream Vera Sans Mono, Courier New, Courier, mon=
ospace"><span style=3D"white-space: nowrap;">So I think it can be fixed by=
 following:</span></font></div><div><div class=3D"line number3 index2 alt2=
" style=3D"background-image: none; background-position: initial; backgroun=
d-size: initial; background-repeat: initial; background-attachment: initia=
l; background-origin: initial; background-clip: initial; margin: 0px; padd=
ing: 0px 1em 0px 0em; border-radius: 0px; border: 0px; float: none; height=
: auto; line-height: 20px; outline: 0px; overflow: visible; position: stat=
ic; vertical-align: baseline; width: auto; box-sizing: content-box; font-f=
amily: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&q=
uot;, Courier, monospace; min-height: inherit; white-space: nowrap; color:=
 rgb(51, 51, 51);"><code class=3D"cpp plain" style=3D"font-family: Consola=
s, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier,=
 monospace; border-radius: 0px; background: none; border: 0px; float: none=
; height: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: vi=
sible; padding: 0px; position: static; vertical-align: baseline; width: au=
to; box-sizing: content-box; min-height: inherit; color: rgb(0, 0, 0) !imp=
ortant;">100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vcon-&gt;watch =
=3D qemu_chr_fe_add_watch(&amp;vcon-&gt;chr,</code></div><div class=3D"lin=
e number4 index3 alt1" style=3D"background-image: none; background-positio=
n: initial; background-size: initial; background-repeat: initial; backgrou=
nd-attachment: initial; background-origin: initial; background-clip: initi=
al; margin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; border: 0px=
; float: none; height: auto; line-height: 20px; outline: 0px; overflow: vi=
sible; position: static; vertical-align: baseline; width: auto; box-sizing=
: content-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;=
, &quot;Courier New&quot;, Courier, monospace; min-height: inherit; white-=
space: nowrap; color: rgb(51, 51, 51);"><code class=3D"cpp plain" style=3D=
"font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courie=
r New&quot;, Courier, monospace; border-radius: 0px; background: none; bor=
der: 0px; float: none; height: auto; line-height: 20px; margin: 0px; outli=
ne: 0px; overflow: visible; padding: 0px; position: static; vertical-align=
: baseline; width: auto; box-sizing: content-box; min-height: inherit; col=
or: rgb(0, 0, 0) !important;">(gdb) l</code></div><div class=3D"line numbe=
r5 index4 alt2" style=3D"background-image: none; background-position: init=
ial; background-size: initial; background-repeat: initial; background-atta=
chment: initial; background-origin: initial; background-clip: initial; mar=
gin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; border: 0px; float=
: none; height: auto; line-height: 20px; outline: 0px; overflow: visible; =
position: static; vertical-align: baseline; width: auto; box-sizing: conte=
nt-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot=
;Courier New&quot;, Courier, monospace; min-height: inherit; white-space: =
nowrap; color: rgb(51, 51, 51);"><code class=3D"cpp plain" style=3D"font-f=
amily: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&q=
uot;, Courier, monospace; border-radius: 0px; background: none; border: 0p=
x; float: none; height: auto; line-height: 20px; margin: 0px; outline: 0px=
; overflow: visible; padding: 0px; position: static; vertical-align: basel=
ine; width: auto; box-sizing: content-box; min-height: inherit; color: rgb=
(0, 0, 0) !important;">95&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * use throttling on host side.</code><=
/div><div class=3D"line number6 index5 alt1" style=3D"background-image: no=
ne; background-position: initial; background-size: initial; background-rep=
eat: initial; background-attachment: initial; background-origin: initial; =
background-clip: initial; margin: 0px; padding: 0px 1em 0px 0em; border-ra=
dius: 0px; border: 0px; float: none; height: auto; line-height: 20px; outl=
ine: 0px; overflow: visible; position: static; vertical-align: baseline; w=
idth: auto; box-sizing: content-box; font-family: Consolas, &quot;Bitstrea=
m Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; min-h=
eight: inherit; white-space: nowrap; color: rgb(51, 51, 51);"><code class=
=3D"cpp plain" style=3D"font-family: Consolas, &quot;Bitstream Vera Sans M=
ono&quot;, &quot;Courier New&quot;, Courier, monospace; border-radius: 0px=
; background: none; border: 0px; float: none; height: auto; line-height: 2=
0px; margin: 0px; outline: 0px; overflow: visible; padding: 0px; position:=
 static; vertical-align: baseline; width: auto; box-sizing: content-box; m=
in-height: inherit; color: rgb(0, 0, 0) !important;">96&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */</code=
></div><div class=3D"line number7 index6 alt2" style=3D"background-image: =
none; background-position: initial; background-size: initial; background-r=
epeat: initial; background-attachment: initial; background-origin: initial=
; background-clip: initial; margin: 0px; padding: 0px 1em 0px 0em; border-=
radius: 0px; border: 0px; float: none; height: auto; line-height: 20px; ou=
tline: 0px; overflow: visible; position: static; vertical-align: baseline;=
 width: auto; box-sizing: content-box; font-family: Consolas, &quot;Bitstr=
eam Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; min=
-height: inherit; white-space: nowrap; color: rgb(51, 51, 51);"><code clas=
s=3D"cpp plain" style=3D"font-family: Consolas, &quot;Bitstream Vera Sans =
Mono&quot;, &quot;Courier New&quot;, Courier, monospace; border-radius: 0p=
x; background: none; border: 0px; float: none; height: auto; line-height: =
20px; margin: 0px; outline: 0px; overflow: visible; padding: 0px; position=
: static; vertical-align: baseline; width: auto; box-sizing: content-box; =
min-height: inherit; color: rgb(0, 0, 0) !important;">97&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><=
code class=3D"cpp keyword bold" style=3D"font-family: Consolas, &quot;Bits=
tream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; b=
order-radius: 0px; background: none; border: 0px; float: none; height: aut=
o; line-height: 20px; margin: 0px; outline: 0px; overflow: visible; paddin=
g: 0px; position: static; vertical-align: baseline; width: auto; box-sizin=
g: content-box; min-height: inherit; font-weight: bold !important; color: =
rgb(51, 102, 153) !important;">if</code>&nbsp;<code class=3D"cpp plain" st=
yle=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;=
Courier New&quot;, Courier, monospace; border-radius: 0px; background: non=
e; border: 0px; float: none; height: auto; line-height: 20px; margin: 0px;=
 outline: 0px; overflow: visible; padding: 0px; position: static; vertical=
-align: baseline; width: auto; box-sizing: content-box; min-height: inheri=
t; color: rgb(0, 0, 0) !important;">(!k-&gt;is_console) {</code></div><div=
 class=3D"line number8 index7 alt1" style=3D"background-image: none; backg=
round-position: initial; background-size: initial; background-repeat: init=
ial; background-attachment: initial; background-origin: initial; backgroun=
d-clip: initial; margin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px=
; border: 0px; float: none; height: auto; line-height: 20px; outline: 0px;=
 overflow: visible; position: static; vertical-align: baseline; width: aut=
o; box-sizing: content-box; font-family: Consolas, &quot;Bitstream Vera Sa=
ns Mono&quot;, &quot;Courier New&quot;, Courier, monospace; min-height: in=
herit; white-space: nowrap; color: rgb(51, 51, 51);"><code class=3D"cpp pl=
ain" style=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;,=
 &quot;Courier New&quot;, Courier, monospace; border-radius: 0px; backgrou=
nd: none; border: 0px; float: none; height: auto; line-height: 20px; margi=
n: 0px; outline: 0px; overflow: visible; padding: 0px; position: static; v=
ertical-align: baseline; width: auto; box-sizing: content-box; min-height:=
 inherit; color: rgb(0, 0, 0) !important;">98&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
virtio_serial_throttle_port(port,&nbsp;</code><code class=3D"cpp keyword b=
old" style=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;,=
 &quot;Courier New&quot;, Courier, monospace; border-radius: 0px; backgrou=
nd: none; border: 0px; float: none; height: auto; line-height: 20px; margi=
n: 0px; outline: 0px; overflow: visible; padding: 0px; position: static; v=
ertical-align: baseline; width: auto; box-sizing: content-box; min-height:=
 inherit; font-weight: bold !important; color: rgb(51, 102, 153) !importan=
t;">true</code><code class=3D"cpp plain" style=3D"font-family: Consolas, &=
quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, mon=
ospace; border-radius: 0px; background: none; border: 0px; float: none; he=
ight: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: visibl=
e; padding: 0px; position: static; vertical-align: baseline; width: auto; =
box-sizing: content-box; min-height: inherit; color: rgb(0, 0, 0) !importa=
nt;">);</code></div><div class=3D"line number9 index8 alt2" style=3D"backg=
round-image: none; background-position: initial; background-size: initial;=
 background-repeat: initial; background-attachment: initial; background-or=
igin: initial; background-clip: initial; margin: 0px; padding: 0px 1em 0px=
 0em; border-radius: 0px; border: 0px; float: none; height: auto; line-hei=
ght: 20px; outline: 0px; overflow: visible; position: static; vertical-ali=
gn: baseline; width: auto; box-sizing: content-box; font-family: Consolas,=
 &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, m=
onospace; min-height: inherit; white-space: nowrap; color: rgb(51, 51, 51)=
;"><code class=3D"cpp plain" style=3D"font-family: Consolas, &quot;Bitstre=
am Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; bord=
er-radius: 0px; background: none; border: 0px; float: none; height: auto; =
line-height: 20px; margin: 0px; outline: 0px; overflow: visible; padding: =
0px; position: static; vertical-align: baseline; width: auto; box-sizing: =
content-box; min-height: inherit; color: rgb(0, 0, 0) !important;">99&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=3D"cpp keyword bold" style=
=3D"font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Cou=
rier New&quot;, Courier, monospace; border-radius: 0px; background: none; =
border: 0px; float: none; height: auto; line-height: 20px; margin: 0px; ou=
tline: 0px; overflow: visible; padding: 0px; position: static; vertical-al=
ign: baseline; width: auto; box-sizing: content-box; min-height: inherit; =
font-weight: bold !important; color: rgb(51, 102, 153) !important;">if</co=
de>&nbsp;<code class=3D"cpp plain" style=3D"font-family: Consolas, &quot;B=
itstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace=
; border-radius: 0px; background: none; border: 0px; float: none; height: =
auto; line-height: 20px; margin: 0px; outline: 0px; overflow: visible; pad=
ding: 0px; position: static; vertical-align: baseline; width: auto; box-si=
zing: content-box; min-height: inherit; color: rgb(0, 0, 0) !important;">(=
!vcon-&gt;watch) {</code></div><div class=3D"line number10 index9 alt1" st=
yle=3D"background-image: none; background-position: initial; background-si=
ze: initial; background-repeat: initial; background-attachment: initial; b=
ackground-origin: initial; background-clip: initial; margin: 0px; padding:=
 0px 1em 0px 0em; border-radius: 0px; border: 0px; float: none; height: au=
to; line-height: 20px; outline: 0px; overflow: visible; position: static; =
vertical-align: baseline; width: auto; box-sizing: content-box; font-famil=
y: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;=
, Courier, monospace; min-height: inherit; white-space: nowrap; color: rgb=
(51, 51, 51);"><code class=3D"cpp plain" style=3D"font-family: Consolas, &=
quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, mon=
ospace; border-radius: 0px; background: none; border: 0px; float: none; he=
ight: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: visibl=
e; padding: 0px; position: static; vertical-align: baseline; width: auto; =
box-sizing: content-box; min-height: inherit; color: rgb(0, 0, 0) !importa=
nt;">100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vcon-&gt;watch =3D =
qemu_chr_fe_add_watch(&amp;vcon-&gt;chr,</code></div><div class=3D"line nu=
mber11 index10 alt2" style=3D"background-image: none; background-position:=
 initial; background-size: initial; background-repeat: initial; background=
-attachment: initial; background-origin: initial; background-clip: initial=
; margin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; border: 0px; =
float: none; height: auto; line-height: 20px; outline: 0px; overflow: visi=
ble; position: static; vertical-align: baseline; width: auto; box-sizing: =
content-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, =
&quot;Courier New&quot;, Courier, monospace; min-height: inherit; white-sp=
ace: nowrap; color: rgb(51, 51, 51);"><code class=3D"cpp plain" style=3D"f=
ont-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier =
New&quot;, Courier, monospace; border-radius: 0px; background: none; borde=
r: 0px; float: none; height: auto; line-height: 20px; margin: 0px; outline=
: 0px; overflow: visible; padding: 0px; position: static; vertical-align: =
baseline; width: auto; box-sizing: content-box; min-height: inherit; color=
: rgb(0, 0, 0) !important;">101&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_=
IO_OUT|G_IO_HUP,</code></div><div class=3D"line number12 index11 alt1" sty=
le=3D"background-image: none; background-position: initial; background-siz=
e: initial; background-repeat: initial; background-attachment: initial; ba=
ckground-origin: initial; background-clip: initial; margin: 0px; padding: =
0px 1em 0px 0em; border-radius: 0px; border: 0px; float: none; height: aut=
o; line-height: 20px; outline: 0px; overflow: visible; position: static; v=
ertical-align: baseline; width: auto; box-sizing: content-box; font-family=
: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;,=
 Courier, monospace; min-height: inherit; white-space: nowrap; color: rgb(=
51, 51, 51);"><code class=3D"cpp plain" style=3D"font-family: Consolas, &q=
uot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, mono=
space; border-radius: 0px; background: none; border: 0px; float: none; hei=
ght: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: visible=
; padding: 0px; position: static; vertical-align: baseline; width: auto; b=
ox-sizing: content-box; min-height: inherit; color: rgb(0, 0, 0) !importan=
t;">102&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chr_write_unblocked, vcon)=
;</code></div><div class=3D"line number12 index11 alt1" style=3D"backgroun=
d-image: none; background-position: initial; background-size: initial; bac=
kground-repeat: initial; background-attachment: initial; background-origin=
: initial; background-clip: initial; margin: 0px; padding: 0px 1em 0px 0em=
; border-radius: 0px; border: 0px; float: none; height: auto; line-height:=
 20px; outline: 0px; overflow: visible; position: static; vertical-align: =
baseline; width: auto; box-sizing: content-box; font-family: Consolas, &qu=
ot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monos=
pace; min-height: inherit; white-space: nowrap; color: rgb(51, 51, 51);"><=
code class=3D"cpp plain" style=3D"font-family: Consolas, &quot;Bitstream V=
era Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; border-r=
adius: 0px; background: none; border: 0px; float: none; height: auto; line=
-height: 20px; margin: 0px; outline: 0px; overflow: visible; padding: 0px;=
 position: static; vertical-align: baseline; width: auto; box-sizing: cont=
ent-box; min-height: inherit; color: rgb(0, 0, 0) !important;">+&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i=
f (!vcon-&gt;watch)</code></div><div class=3D"line number12 index11 alt1" =
style=3D"background-image: none; background-position: initial; background-=
size: initial; background-repeat: initial; background-attachment: initial;=
 background-origin: initial; background-clip: initial; margin: 0px; paddin=
g: 0px 1em 0px 0em; border-radius: 0px; border: 0px; float: none; height: =
auto; line-height: 20px; outline: 0px; overflow: visible; position: static=
; vertical-align: baseline; width: auto; box-sizing: content-box; font-fam=
ily: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quo=
t;, Courier, monospace; min-height: inherit; white-space: nowrap; color: r=
gb(51, 51, 51);"><code class=3D"cpp plain" style=3D"font-family: Consolas,=
 &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, m=
onospace; border-radius: 0px; background: none; border: 0px; float: none; =
height: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: visi=
ble; padding: 0px; position: static; vertical-align: baseline; width: auto=
; box-sizing: content-box; min-height: inherit; color: rgb(0, 0, 0) !impor=
tant;">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</code><code class=3D"cpp plain" styl=
e=3D"color: rgb(0, 0, 0); background: none; font-family: Consolas, &quot;B=
itstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace=
; border-radius: 0px; border: 0px; float: none; height: auto; line-height:=
 20px; margin: 0px; outline: 0px; overflow: visible; padding: 0px; positio=
n: static; vertical-align: baseline; width: auto; box-sizing: content-box;=
 min-height: inherit;">virtio_serial_throttle_port(port,&nbsp;</code><code=
 class=3D"cpp keyword bold" style=3D"background: none; font-family: Consol=
as, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier=
, monospace; border-radius: 0px; border: 0px; float: none; height: auto; l=
ine-height: 20px; margin: 0px; outline: 0px; overflow: visible; padding: 0=
px; position: static; vertical-align: baseline; width: auto; box-sizing: c=
ontent-box; min-height: inherit; font-weight: bold !important; color: rgb(=
51, 102, 153) !important;">false</code><code class=3D"cpp plain" style=3D"=
color: rgb(0, 0, 0); background: none; font-family: Consolas, &quot;Bitstr=
eam Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; bor=
der-radius: 0px; border: 0px; float: none; height: auto; line-height: 20px=
; margin: 0px; outline: 0px; overflow: visible; padding: 0px; position: st=
atic; vertical-align: baseline; width: auto; box-sizing: content-box; min-=
height: inherit;">);</code></div><div class=3D"line number13 index12 alt2"=
 style=3D"background-image: none; background-position: initial; background=
-size: initial; background-repeat: initial; background-attachment: initial=
; background-origin: initial; background-clip: initial; margin: 0px; paddi=
ng: 0px 1em 0px 0em; border-radius: 0px; border: 0px; float: none; height:=
 auto; line-height: 20px; outline: 0px; overflow: visible; position: stati=
c; vertical-align: baseline; width: auto; box-sizing: content-box; font-fa=
mily: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&qu=
ot;, Courier, monospace; min-height: inherit; white-space: nowrap; color: =
rgb(51, 51, 51);"><code class=3D"cpp plain" style=3D"font-family: Consolas=
, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, =
monospace; border-radius: 0px; background: none; border: 0px; float: none;=
 height: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: vis=
ible; padding: 0px; position: static; vertical-align: baseline; width: aut=
o; box-sizing: content-box; min-height: inherit; color: rgb(0, 0, 0) !impo=
rtant;">103&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</code></div><div class=3D"line number1=
4 index13 alt1" style=3D"background-image: none; background-position: init=
ial; background-size: initial; background-repeat: initial; background-atta=
chment: initial; background-origin: initial; background-clip: initial; mar=
gin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; border: 0px; float=
: none; height: auto; line-height: 20px; outline: 0px; overflow: visible; =
position: static; vertical-align: baseline; width: auto; box-sizing: conte=
nt-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot=
;Courier New&quot;, Courier, monospace; min-height: inherit; white-space: =
nowrap; color: rgb(51, 51, 51);"><code class=3D"cpp plain" style=3D"font-f=
amily: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&q=
uot;, Courier, monospace; border-radius: 0px; background: none; border: 0p=
x; float: none; height: auto; line-height: 20px; margin: 0px; outline: 0px=
; overflow: visible; padding: 0px; position: static; vertical-align: basel=
ine; width: auto; box-sizing: content-box; min-height: inherit; color: rgb=
(0, 0, 0) !important;">104&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; }</code></div></div><div><font face=3D"Consolas, =
Bitstream Vera Sans Mono, Courier New, Courier, monospace"><span style=3D"=
white-space: nowrap;">I have test the code, and it works.</span></font></d=
iv><div><font face=3D"Consolas, Bitstream Vera Sans Mono, Courier New, Cou=
rier, monospace"><span style=3D"white-space: nowrap;"><br></span></font></=
div><hr style=3D"width: 210px; height: 1px;" color=3D"#b5c4df" size=3D"1" =
align=3D"left">=0A<div><span><div style=3D"MARGIN: 10px; FONT-FAMILY: verd=
ana; FONT-SIZE: 10pt"><div>wangc66@chinatelecom.cn</div></div></span></div=
>=0A</body></html>
------=_001_NextPart623071302066_=------


