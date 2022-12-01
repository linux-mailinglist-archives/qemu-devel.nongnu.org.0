Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000CE63E72C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 02:42:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0YZX-0002D1-3R; Wed, 30 Nov 2022 20:41:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leixiang@kylinos.cn>)
 id 1p0YZT-0002Cs-OH
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 20:41:03 -0500
Received: from [124.126.103.232] (helo=mailgw.kylinos.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leixiang@kylinos.cn>)
 id 1p0YZO-0006s1-En
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 20:41:03 -0500
X-UUID: a06d7cca7d234494b6a0be060a32e0a5-20221201
X-UUID: a06d7cca7d234494b6a0be060a32e0a5-20221201
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <leixiang@kylinos.cn>) (Generic MTA)
 with ESMTP id 1409231084; Thu, 01 Dec 2022 09:40:44 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 1C6D2E008499;
 Thu,  1 Dec 2022 09:40:43 +0800 (CST)
Received: by mail.kylinos.cn (NSMail, from userid 0)
 id 11479E008499; Thu,  1 Dec 2022 09:40:43 +0800 (CST)
From: =?UTF-8?B?6Zu357+U?= <leixiang@kylinos.cn>
Subject: =?UTF-8?B?5Zue5aSNOiBSZTogW1JFU0VORCBQQVRDSF0gdmlydGlvLXBjaTogZml4IHZlY3Rvcl9pcnFmZCBsZWFrIGluIHZpcnRpb19wY2lfc2V0X2d1ZXN0X25vdGlmaWVycw==?=
To: =?UTF-8?B?TWljaGFlbCBTLiBUc2lya2lu?= <mst@redhat.com>,
Cc: =?UTF-8?B?cWVtdS1kZXZlbA==?= <qemu-devel@nongnu.org>,
 =?UTF-8?B?6LCi5piO?= <xieming@kylinos.cn>,
 =?UTF-8?B?5pu+6amw?= <zengchi@kylinos.cn>,
Date: Thu, 01 Dec 2022 09:40:42 +0800
X-Mailer: NSMAIL 7.0.0
Message-ID: <qhe0uqhslh-qhgkqdbw92@nsmail7.0.0--kylin--1>
References: 20221130015901-mutt-send-email-mst@kernel.org
X-Israising: 0
X-Seclevel-1: 0
X-Seclevel: 0
X-Delaysendtime: Thu, 01 Dec 2022 09:40:42 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=nsmail-1zzoign5kaw-1zzpsegkm4p
X-ns-mid: webmail-6388061a-1zmzo63h
X-ope-from: <leixiang@kylinos.cn>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 124.126.103.232 (failed)
Received-SPF: pass client-ip=124.126.103.232; envelope-from=leixiang@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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

This message is in MIME format.

--nsmail-1zzoign5kaw-1zzpsegkm4p
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PHA+QXMgd2UgZm91bmQsIGl0IHdpbGwgY2F1c2UgZ3Vlc3Qgb3MgY3Jhc2gg
d2hlbiByZWJvb3QgZ3Vlc3Qgb3MuIGJlY2F1c2UgaW4gJ3ZpcnRpb19wY2lf
c2V0X2d1ZXN0X25vdGlmaWVycycgZnVuY3Rpb24sIGlmIGl0IGZhaWxlZCB0
byBzZXQgZ3Vlc3Qgbm90aWZpZXIsIHRoZSBlcnJvciBoYW5kbGVyIGRpZCBu
b3QgcmVsZWFzZSB0aGUgJ3Byb3h5LSZndDt2ZWN0b3JfaXJxZmQnIHdoaWNo
IGFscmVhZHkgYWxsb2NlZC4gd2hlbiByZWJvb3QgZ3Vlc3Qgb3MsIGludG8g
J3ZpcnRpb19wY2lfc2V0X2d1ZXN0X25vdGlmaWVycycgZnVuY3Rpb24gYWdh
aW4sIGl0IHdpbGwganVtcCBpbnRvJm5ic3A7ICdtc2l4X3Vuc2V0X3ZlY3Rv
cl9ub3RpZmllcnMnIGZ1bmN0aW9uLCB0aGlzIGZ1bmN0aW9uIHdpbGwgY2hl
Y2sgZGV2aWNlIG5vdGlmaWVyIGhvb2tzLCBjYXVzZSBob29rcyB3ZXJlIG51
bGwsIGl0IHdpbGwgY2F1c2UgYSBhc3NlcnQgZXJyb3IsIHRoZW4gdGhlIGd1
ZXN0IG9zIGNyYXNoIGRvd24uPC9wPgo8cD5XZSBwdXQgdGhlIGVycm9yIG1l
c3NhZ2UgaW4gb3VyIHRlc3QgYmVsb3c6PC9wPgo8cD4yMDIyLTA3LTI5IDA3
OjQ5OjQ2LjU5MSswMDAwOiBEb21haW4gaWQ9MzAgaXMgdGFpbnRlZDogaG9z
dC1jcHUgY2hhciBkZXZpY2UgcmVkaXJlY3RlZCB0byAvZGV2L3B0cy80IChs
YWJlbCBjaGFyc2VyaWFsMCk8YnI+MjAyMi0wNy0yOVQwNzo0OTo0OC4zMTk2
MjJaIHFlbXUtNC4xOiBudnFzOjEscGNpX2RldiBuYW1lOnZpcnRpby1ibGst
cGNpPGJyPjIwMjItMDctMjlUMDc6NDk6NTcuOTc0OTg1WiBxZW11LTQuMTog
bnZxczoxLHBjaV9kZXYgbmFtZTp2aXJ0aW8tYmxrLXBjaTxicj4yMDIyLTA3
LTI5VDA3OjUwOjAxLjgzNDA5MlogcWVtdS00LjE6IG52cXM6MixwY2lfZGV2
IG5hbWU6dmlydGlvLW5ldC1wY2k8YnI+MjAyMi0wNy0yOVQwNzo1MDowMS44
MzQyMDdaIHFlbXUtNC4xOiBFcnJvciBiaW5kaW5nIGd1ZXN0IG5vdGlmaWVy
OiAxMTxicj4yMDIyLTA3LTI5VDA3OjUwOjAxLjgzNDIxOFogcWVtdS00LjE6
IHVuYWJsZSB0byBzdGFydCB2aG9zdCBuZXQ6IDExOiBmYWxsaW5nIGJhY2sg
b24gdXNlcnNwYWNlIHZpcnRpbzxicj4yMDIyLTA3LTI5VDA3OjUwOjAxLjg2
NTM2N1ogcWVtdS00LjE6IG52cXM6MSxwY2lfZGV2IG5hbWU6dmlydGlvLWJs
ay1wY2k8YnI+MjAyMi0wNy0yOVQwNzo1MDowMS44NjU1MDZaIHFlbXUtNC4x
OiB2aXJ0aW8tYmxrIGZhaWxlZCB0byBzZXQgZ3Vlc3Qgbm90aWZpZXIgKC0x
MSksIGVuc3VyZSAtYWNjZWwga3ZtIGlzIHNldC48YnI+MjAyMi0wNy0yOVQw
Nzo1MDowMS44NjU1MThaIHFlbXUtNC4xOiB2aXJ0aW9fYnVzX3N0YXJ0X2lv
ZXZlbnRmZDogZmFpbGVkLiBGYWxsYmFjayB0byB1c2Vyc3BhY2UgKHNsb3dl
cikuPGJyPjIwMjItMDctMjlUMDc6NTA6MDIuMDA1OTMwWiBxZW11LTQuMTog
bnZxczozLHBjaV9kZXYgbmFtZTp2aXJ0aW8tc2NzaS1wY2k8YnI+MjAyMi0w
Ny0yOVQwNzo1MDowMi4wMDYwNzlaIHFlbXUtNC4xOiB2aXJ0aW8tc2NzaTog
RmFpbGVkIHRvIHNldCBndWVzdCBub3RpZmllcnMgKC0xMSksIGVuc3VyZSAt
YWNjZWwga3ZtIGlzIHNldC48YnI+MjAyMi0wNy0yOVQwNzo1MDowMi4wMDYw
OTFaIHFlbXUtNC4xOiB2aXJ0aW9fYnVzX3N0YXJ0X2lvZXZlbnRmZDogZmFp
bGVkLiBGYWxsYmFjayB0byB1c2Vyc3BhY2UgKHNsb3dlcikuPGJyPjIwMjIt
MDctMjlUMDc6NTI6NDQuMTA4ODIwWiBxZW11LTQuMTogbnZxczoxLHBjaV9k
ZXYgbmFtZTp2aXJ0aW8tYmxrLXBjaTxicj4yMDIyLTA3LTI5VDA3OjUyOjUy
Ljg4Njc5MlogcWVtdS00LjE6IG52cXM6MSxwY2lfZGV2IG5hbWU6dmlydGlv
LWJsay1wY2k8YnI+cWVtdS00LjE6IGh3L3BjaS9tc2l4LmM6NjEyOiBtc2l4
X3Vuc2V0X3ZlY3Rvcl9ub3RpZmllcnM6IEFzc2VydGlvbiBgZGV2LSZndDtt
c2l4X3ZlY3Rvcl91c2Vfbm90aWZpZXIgJmFtcDsmYW1wOyBkZXYtJmd0O21z
aXhfdmVjdG9yX3JlbGVhc2Vfbm90aWZpZXInIGZhaWxlZC48YnI+MjAyMi0w
Ny0yOSAwNzo1Mjo1My4zNzcrMDAwMDogc2h1dHRpbmcgZG93biwgcmVhc29u
PWNyYXNoZWQ8L3A+CjxwPjxicj48YnI+PGJyPjxicj48YnI+PGJyPi0tLS08
L3A+CjxkaXYgaWQ9ImNzMmNfbWFpbF9zaWdhdHVyZSI+PC9kaXY+CjxwPiZu
YnNwOzwvcD4KPGRpdiBpZD0icmUiIHN0eWxlPSJtYXJnaW4tbGVmdDogMC41
ZW07IHBhZGRpbmctbGVmdDogMC41ZW07IGJvcmRlci1sZWZ0OiAxcHggc29s
aWQgZ3JlZW47Ij48YnI+PGJyPjxicj4KPGRpdiBzdHlsZT0iYmFja2dyb3Vu
ZC1jb2xvcjogI2Y1ZjdmYTsiPjxzdHJvbmc+5Li744CA6aKY77yaPC9zdHJv
bmc+PHNwYW4gaWQ9InN1YmplY3QiPlJlOiBbUkVTRU5EIFBBVENIXSB2aXJ0
aW8tcGNpOiBmaXggdmVjdG9yX2lycWZkIGxlYWsgaW4gdmlydGlvX3BjaV9z
ZXRfZ3Vlc3Rfbm90aWZpZXJzPC9zcGFuPiA8YnI+PHN0cm9uZz7ml6XjgIDm
nJ/vvJo8L3N0cm9uZz48c3BhbiBpZD0iZGF0ZSI+MjAyMi0xMS0zMCAxNDo1
OTwvc3Bhbj4gPGJyPjxzdHJvbmc+5Y+R5Lu25Lq677yaPC9zdHJvbmc+PHNw
YW4gaWQ9ImZyb20iPk1pY2hhZWwgUy4gVHNpcmtpbjwvc3Bhbj4gPGJyPjxz
dHJvbmc+5pS25Lu25Lq677yaPC9zdHJvbmc+PHNwYW4gaWQ9InRvIiBzdHls
ZT0id29yZC1icmVhazogYnJlYWstYWxsOyI+6Zu357+UOzwvc3Bhbj48L2Rp
dj4KPGJyPgo8ZGl2IGlkPSJjb250ZW50Ij4KPGRpdiBjbGFzcz0idmlld2Vy
X3BhcnQiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IG92ZXJmbG93OiBo
aWRkZW47Ij4KPGRpdj5PbiBXZWQsIE5vdiAzMCwgMjAyMiBhdCAwMTo1Njox
MVBNICswODAwLCBsZWl4aWFuZyB3cm90ZTo8YnI+Jmd0OyBwcm94eS0mZ3Q7
dmVjdG9yX2lycWZkIGRpZCBub3QgZnJlZSB3aGVuIHNldCBndWVzdCBub3Rp
ZmllciBmYWlsZWQuPGJyPiZndDsgPGJyPiZndDsgU2lnbmVkLW9mZi1ieTog
TGVpIFhpYW5nIDxicj4mZ3Q7IFRlc3RlZC1ieTogWmVuZyBDaGkgPGJyPiZn
dDsgU3VnZ2VzdGVkLWJ5OiBYaWUgTWluZyA8YnI+PGJyPlRoYW5rcyBhIGxv
dCEgRml4ZXMgdGFnPyBXaGVuIHdhcyB0aGUgbGVhayBpbnRyb2R1Y2VkPzxi
cj48YnI+Jmd0OyAtLS08YnI+Jmd0OyBody92aXJ0aW8vdmlydGlvLXBjaS5j
IHwgNiArKysrKys8YnI+Jmd0OyAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspPGJyPiZndDsgPGJyPiZndDsgZGlmZiAtLWdpdCBhL2h3L3ZpcnRp
by92aXJ0aW8tcGNpLmMgYi9ody92aXJ0aW8vdmlydGlvLXBjaS5jPGJyPiZn
dDsgaW5kZXggYzZiNDdhOWMuLjQ4NjJmODNiIDEwMDY0NDxicj4mZ3Q7IC0t
LSBhL2h3L3ZpcnRpby92aXJ0aW8tcGNpLmM8YnI+Jmd0OyArKysgYi9ody92
aXJ0aW8vdmlydGlvLXBjaS5jPGJyPiZndDsgQEAgLTEwMzgsNiArMTAzOCwx
MiBAQCBhc3NpZ25fZXJyb3I6PGJyPiZndDsgd2hpbGUgKC0tbiAmZ3Q7PSAw
KSB7PGJyPiZndDsgdmlydGlvX3BjaV9zZXRfZ3Vlc3Rfbm90aWZpZXIoZCwg
biwgIWFzc2lnbiwgd2l0aF9pcnFmZCk7PGJyPiZndDsgfTxicj4mZ3Q7ICs8
YnI+Jmd0OyArIGdfZnJlZShwcm94eS0mZ3Q7dmVjdG9yX2lycWZkKTs8YnI+
Jmd0OyArIHByb3h5LSZndDt2ZWN0b3JfaXJxZmQgPSBOVUxMOzxicj4mZ3Q7
ICs8YnI+Jmd0OyByZXR1cm4gcjs8YnI+Jmd0OyB9PGJyPiZndDsgPGJyPiZn
dDsgLS0gPGJyPiZndDsgPGJyPiZndDsgPGJyPiZndDsgTm8gdmlydXMgZm91
bmQ8YnI+Jmd0OyBDaGVja2VkIGJ5IEhpbGxzdG9uZSBOZXR3b3JrIEFudGlW
aXJ1czxicj48YnI+PC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+

--nsmail-1zzoign5kaw-1zzpsegkm4p--

