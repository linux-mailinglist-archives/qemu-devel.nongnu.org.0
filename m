Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D544C65687D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 09:37:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pA5RJ-00020G-CR; Tue, 27 Dec 2022 03:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leixiang@kylinos.cn>)
 id 1pA5R2-0001ve-Lw
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 03:35:45 -0500
Received: from [124.126.103.232] (helo=mailgw.kylinos.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leixiang@kylinos.cn>)
 id 1pA5Qx-0005vk-RB
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 03:35:44 -0500
X-UUID: 867635869f5a4814b8f8b23fcdc0df9b-20221227
X-UUID: 867635869f5a4814b8f8b23fcdc0df9b-20221227
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <leixiang@kylinos.cn>) (Generic MTA)
 with ESMTP id 1766793225; Tue, 27 Dec 2022 16:35:35 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 1ADB1E0084A1;
 Tue, 27 Dec 2022 16:35:32 +0800 (CST)
Received: by mail.kylinos.cn (NSMail, from userid 0)
 id 0F591E0084A1; Tue, 27 Dec 2022 16:35:32 +0800 (CST)
From: =?UTF-8?B?6Zu357+U?= <leixiang@kylinos.cn>
Subject: =?UTF-8?B?5Zue5aSNOiBSZTogW1JFU0VORCBQQVRDSF0gdmlydGlvLXBjaTogZml4IHZlY3Rvcl9pcnFmZCBsZWFrIGluIHZpcnRpb19wY2lfc2V0X2d1ZXN0X25vdGlmaWVycw==?=
To: =?UTF-8?B?bXN0?= <mst@redhat.com>,
Cc: <qemu-devel@nongnu.org>, =?UTF-8?B?6LCi5piO?= <xieming@kylinos.cn>,
 =?UTF-8?B?5pu+6amw?= <zengchi@kylinos.cn>,
Date: Tue, 27 Dec 2022 16:35:31 +0800
X-Mailer: NSMAIL 7.0.0
Message-ID: <mzz7dyv1hb-n00hbsa3b4@nsmail7.0.0--kylin--1>
X-Israising: 0
X-Seclevel-1: 0
X-Seclevel: 0
X-Delaysendtime: Tue, 27 Dec 2022 16:35:31 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=nsmail-218vj5wq3b6-218y31jk6yr
X-ns-mid: webmail-63aaae53-20xfcqyo
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

--nsmail-218vj5wq3b6-218y31jk6yr
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0idmlld2VyX3BhcnQiIHN0eWxlPSJwb3NpdGlvbjogcmVs
YXRpdmU7IG92ZXJmbG93OiBoaWRkZW47Ij4KPHA+QXMgSSBmb3VuZCBpdCBp
bnRyb2R1Y2VkIGZyb20gJm5ic3A7Y29tbWl0OiA3ZDM3ZDM1MWRmZmVlNjBm
YzcwNDhiYmZkODU3MzQyMWYxNWViNzI0PC9wPgo8cD5Gcm9tIHRoZSBjb2Rl
IHlvdSBsb29rIGF0LCBnX2ZyZWUgc2hvdWxkIGJlbG9uZ3MgdG8gdGhlIGxh
YmxlICZuYnNwO2NvbmZpZ19hc3NpZ25fZXJyb3IuJm5ic3A7IHRoaXMgY29k
ZSBwYXRjaCBoYXMgYmVlbiByZXZlcnQsIGxhdGVzdCBjb2RlIGxhYmxlIGlz
ICdhc3NpZ25fZXJyb3InJm5ic3A7Jm5ic3A7PGJyPmFuZCB3ZSB0ZXN0ZWQs
IGl0J3MgYWxzbyBoYXBwZW5kIGluIDYuMi4wLiBidXQmbmJzcDtpbiA3LjEu
MCBvciA3LjIuMCwgbmV3IGFzc2VydCBjcmFzaCBoYXBwZW5kIGJlZm9yZSBp
dCBnb2VzIGludG8gdmlydGlvX3BjaV9zZXRfZ3Vlc3Rfbm90aWZpZXJzLiB3
ZSBjYW4ndCByZXByb2R1Y2UgdGhlIHByb2JsZW0gYmVmb3JlIGZpeCB0aGUg
bmV3IGNyYXNoIHByb2JsZW0uPC9wPgo8cD5jcmFzaCBpbmZvOjxicj4mZ3Q7
MjAyMi0xMi0yM1QwMjo0ODozMlogcWVtdS1zeXN0ZW0tYWFyY2g2NDogdmly
dGlvLXNjc2k6IEZhaWxlZCB0byBzZXQgZ3Vlc3Qgbm90aWZpZXJzICgtMTEp
LCBlbnN1cmUgLWFjY2VsIGt2bSBpcyBzZXQuPGJyPiZndDsyMDIyLTEyLTIz
VDAyOjQ4OjMyWiBxZW11LXN5c3RlbS1hYXJjaDY0OiB2aXJ0aW9fYnVzX3N0
YXJ0X2lvZXZlbnRmZDogZmFpbGVkLiBGYWxsYmFjayB0byB1c2Vyc3BhY2Ug
KHNsb3dlcikuPGJyPiZndDtxZW11LXN5c3RlbS1hYXJjaDY0OiAuLi9ody9z
Y3NpL3ZpcnRpby1zY3NpLmM6ODMyOiB2aXJ0aW9fc2NzaV9yZXNldDogQXNz
ZXJ0aW9uIGAhcy0mZ3Q7ZGF0YXBsYW5lX3N0YXJ0ZWQnIGZhaWxlZC48YnI+
Jmd0OzIwMjItMTItMjMgMDI6NDg6NTMuMjM1KzAwMDA6IHNodXR0aW5nIGRv
d24sIHJlYXNvbj1jcmFzaGVkPGJyPjxicj48YnI+PGJyPi0tLS08L3A+Cjxk
aXYgaWQ9ImNzMmNfbWFpbF9zaWdhdHVyZSI+PC9kaXY+CjxwPiZuYnNwOzwv
cD4KPGRpdiBpZD0icmUiIHN0eWxlPSJtYXJnaW4tbGVmdDogMC41ZW07IHBh
ZGRpbmctbGVmdDogMC41ZW07IGJvcmRlci1sZWZ0OiAxcHggc29saWQgZ3Jl
ZW47Ij48YnI+PGJyPjxicj4KPGRpdiBzdHlsZT0iYmFja2dyb3VuZC1jb2xv
cjogI2Y1ZjdmYTsiPjxzdHJvbmc+5Li744CA6aKY77yaPC9zdHJvbmc+PHNw
YW4gaWQ9InN1YmplY3QiPlJlOiBbUkVTRU5EIFBBVENIXSB2aXJ0aW8tcGNp
OiBmaXggdmVjdG9yX2lycWZkIGxlYWsgaW4gdmlydGlvX3BjaV9zZXRfZ3Vl
c3Rfbm90aWZpZXJzPC9zcGFuPiA8YnI+PHN0cm9uZz7ml6XjgIDmnJ/vvJo8
L3N0cm9uZz48c3BhbiBpZD0iZGF0ZSI+MjAyMi0xMi0yMCAyMjo0Mjwvc3Bh
bj4gPGJyPjxzdHJvbmc+5Y+R5Lu25Lq677yaPC9zdHJvbmc+PHNwYW4gaWQ9
ImZyb20iPk1pY2hhZWwgUy4gVHNpcmtpbjwvc3Bhbj4gPGJyPjxzdHJvbmc+
5pS25Lu25Lq677yaPC9zdHJvbmc+PHNwYW4gaWQ9InRvIiBzdHlsZT0id29y
ZC1icmVhazogYnJlYWstYWxsOyI+6Zu357+UOzwvc3Bhbj48L2Rpdj4KPGJy
Pgo8ZGl2IGlkPSJjb250ZW50Ij4KPGRpdiBjbGFzcz0idmlld2VyX3BhcnQi
IHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IG92ZXJmbG93OiBoaWRkZW47
Ij4KPGRpdj5PbiBXZWQsIE5vdiAzMCwgMjAyMiBhdCAwMTo1NjoxMVBNICsw
ODAwLCBsZWl4aWFuZyB3cm90ZTo8YnI+Jmd0OyBwcm94eS0mZ3Q7dmVjdG9y
X2lycWZkIGRpZCBub3QgZnJlZSB3aGVuIHNldCBndWVzdCBub3RpZmllciBm
YWlsZWQuPGJyPjxicj5DYW4geW91IHBscyBhZGQgYSBGaXhlcyB0YWcgc28g
cGVvcGxlIGtub3cgd2hlcmUgdG8gYmFja3BvcnQgdGhpcz88YnI+PGJyPiZn
dDsgU2lnbmVkLW9mZi1ieTogTGVpIFhpYW5nIDxicj4mZ3Q7IFRlc3RlZC1i
eTogWmVuZyBDaGkgPGJyPiZndDsgU3VnZ2VzdGVkLWJ5OiBYaWUgTWluZyA8
YnI+PGJyPkxvb2tpbmcgYXQgdGhlIGNvZGUgSSBzZWUgdGhpczo8YnI+PGJy
Pi8qIE11c3Qgc2V0IHZlY3RvciBub3RpZmllciBhZnRlciBndWVzdCBub3Rp
ZmllciBoYXMgYmVlbiBhc3NpZ25lZCAqLzxicj5pZiAoKHdpdGhfaXJxZmQg
fHw8YnI+KHZkZXYtJmd0O3VzZV9ndWVzdF9ub3RpZmllcl9tYXNrICZhbXA7
JmFtcDsgay0mZ3Q7Z3Vlc3Rfbm90aWZpZXJfbWFzaykpICZhbXA7JmFtcDs8
YnI+YXNzaWduKSB7PGJyPmlmICh3aXRoX2lycWZkKSB7PGJyPnByb3h5LSZn
dDt2ZWN0b3JfaXJxZmQgPTxicj5nX21hbGxvYzAoc2l6ZW9mKCpwcm94eS0m
Z3Q7dmVjdG9yX2lycWZkKSAqPGJyPm1zaXhfbnJfdmVjdG9yc19hbGxvY2F0
ZWQoJmFtcDtwcm94eS0mZ3Q7cGNpX2RldikpOzxicj5yID0ga3ZtX3ZpcnRp
b19wY2lfdmVjdG9yX3ZxX3VzZShwcm94eSwgbnZxcyk7PGJyPmlmIChyIGdv
dG8gY29uZmlnX2Fzc2lnbl9lcnJvcjs8YnI+fTxicj5yID0ga3ZtX3ZpcnRp
b19wY2lfdmVjdG9yX2NvbmZpZ191c2UocHJveHkpOzxicj5pZiAociBnb3Rv
IGNvbmZpZ19lcnJvcjs8YnI+fTxicj59PGJyPjxicj5yID0gbXNpeF9zZXRf
dmVjdG9yX25vdGlmaWVycygmYW1wO3Byb3h5LSZndDtwY2lfZGV2LCB2aXJ0
aW9fcGNpX3ZlY3Rvcl91bm1hc2ssPGJyPnZpcnRpb19wY2lfdmVjdG9yX21h
c2ssPGJyPnZpcnRpb19wY2lfdmVjdG9yX3BvbGwpOzxicj5pZiAociBnb3Rv
IG5vdGlmaWVyc19lcnJvcjs8YnI+fTxicj59PGJyPjxicj48YnI+ZG9lc24n
dCB0aGlzIG1lYW4gZ19mcmVlIGJlbG9uZ3MgYXQgdGhlIGxhYmVsIGNvbmZp
Z19hc3NpZ25fZXJyb3I/PGJyPjxicj48YnI+Jmd0OyAtLS08YnI+Jmd0OyBo
dy92aXJ0aW8vdmlydGlvLXBjaS5jIHwgNiArKysrKys8YnI+Jmd0OyAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspPGJyPiZndDsgPGJyPiZndDsg
ZGlmZiAtLWdpdCBhL2h3L3ZpcnRpby92aXJ0aW8tcGNpLmMgYi9ody92aXJ0
aW8vdmlydGlvLXBjaS5jPGJyPiZndDsgaW5kZXggYzZiNDdhOWMuLjQ4NjJm
ODNiIDEwMDY0NDxicj4mZ3Q7IC0tLSBhL2h3L3ZpcnRpby92aXJ0aW8tcGNp
LmM8YnI+Jmd0OyArKysgYi9ody92aXJ0aW8vdmlydGlvLXBjaS5jPGJyPiZn
dDsgQEAgLTEwMzgsNiArMTAzOCwxMiBAQCBhc3NpZ25fZXJyb3I6PGJyPiZn
dDsgd2hpbGUgKC0tbiAmZ3Q7PSAwKSB7PGJyPiZndDsgdmlydGlvX3BjaV9z
ZXRfZ3Vlc3Rfbm90aWZpZXIoZCwgbiwgIWFzc2lnbiwgd2l0aF9pcnFmZCk7
PGJyPiZndDsgfTxicj4mZ3Q7ICs8YnI+Jmd0OyArIGdfZnJlZShwcm94eS0m
Z3Q7dmVjdG9yX2lycWZkKTs8YnI+Jmd0OyArIHByb3h5LSZndDt2ZWN0b3Jf
aXJxZmQgPSBOVUxMOzxicj4mZ3Q7ICs8YnI+Jmd0OyByZXR1cm4gcjs8YnI+
Jmd0OyB9PGJyPiZndDsgPGJyPiZndDsgLS0gPGJyPiZndDsgPGJyPiZndDsg
PGJyPiZndDsgTm8gdmlydXMgZm91bmQ8YnI+Jmd0OyBDaGVja2VkIGJ5IEhp
bGxzdG9uZSBOZXR3b3JrIEFudGlWaXJ1czxicj48YnI+PGJyPlRoZSBwYXRj
aCBpcyBjb3JydXB0ZWQuIExpbmUgY291bnRzIGFyZSB3cm9uZywgYW5kIHlv
dXIgYW50aXZpcnVzIGFkZGVkPGJyPnRyYXNoIGF0IHRoZSBlbmQuPGJyPjxi
cj4tLSA8YnI+TVNUPGJyPjxicj48YnI+PC9kaXY+CjwvZGl2Pgo8L2Rpdj4K
PC9kaXY+CjwvZGl2Pg==

--nsmail-218vj5wq3b6-218y31jk6yr--

