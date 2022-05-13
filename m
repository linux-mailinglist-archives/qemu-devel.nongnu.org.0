Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D64E9525B30
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 08:10:30 +0200 (CEST)
Received: from localhost ([::1]:49340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npOVP-0002lr-SS
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 02:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1npOMz-00082t-UN
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:01:45 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:47687
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1npOMv-0005Hg-KT
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:01:44 -0400
HMM_SOURCE_IP: 172.18.0.218:47860.660362818
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id C9AF52800D1;
 Fri, 13 May 2022 14:01:29 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id ab652c46f7b94b1983b616aeacdc7070 for
 armbru@redhat.com; Fri, 13 May 2022 14:01:32 CST
X-Transaction-ID: ab652c46f7b94b1983b616aeacdc7070
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Date: Fri, 13 May 2022 14:01:27 +0800
From: =?utf-8?B?6Jma5ouf5YyWLem7hOWLhw==?= <huangy81@chinatelecom.cn>
To: =?utf-8?Q?armbru=40redhat.com?= <armbru@redhat.com>, 
 =?utf-8?Q?dgilbert=40redhat.com?= <dgilbert@redhat.com>
Cc: =?utf-8?Q?peterx=40redhat.com?= <peterx@redhat.com>, 
 =?utf-8?Q?qemu-devel=40nongnu.org?= <qemu-devel@nongnu.org>, 
 =?utf-8?Q?pbonzini=40redhat.com?= <pbonzini@redhat.com>, 
 =?utf-8?Q?eduardo=40habkost.net?= <eduardo@habkost.net>, 
 =?utf-8?Q?marcel.apfelbaum=40gmail.com?= <marcel.apfelbaum@gmail.com>, 
 =?utf-8?Q?david=40redhat.com?= <david@redhat.com>, 
 =?utf-8?Q?philmd=40redhat.com?= <philmd@redhat.com>, 
 =?utf-8?Q?richard.henderson=40linaro.org?= <richard.henderson@linaro.org>
Message-ID: <F7D6A6AC-926A-47A4-AD94-FE131FB3594B@chinatelecom.cn>
In-Reply-To: <87h76favx1.fsf@pond.sub.org>
References: <cover.1648748793.git.huangy81@chinatelecom.cn>
 <fb74d6af-49e7-ffd9-6bb0-66acb7407c8c@chinatelecom.cn>
 <YmXHRrZZA21Sxfv7@xz-m1.local> <87h76favx1.fsf@pond.sub.org>
Subject: Re: [PATCH v22 0/8] support dirty restraint on vCPU
X-Mailer: MailMasterPC/4.15.5.1004 (Windows 10 20H2)
X-CUSTOM-MAIL-MASTER-SENT-ID: 6209950F-1118-4653-9A43-5CEA27E21DDD
MIME-Version: 1.0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 MIME_HTML_ONLY=0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PGh0bWw+DQo8aGVhZD4NCiAgICA8bWV0YSBodHRwLWVxdWl2PSdDb250ZW50LVR5cGUnIGNvbnRl
bnQ9J3RleHQvaHRtbDsgY2hhcnNldD1VVEYtOCc+DQo8L2hlYWQ+DQo8Ym9keT4NCjxzdHlsZT4N
CiAgICBmb250ew0KICAgICAgICBsaW5lLWhlaWdodDogMS42Ow0KICAgIH0NCiAgICB1bCxvbHsN
CiAgICAgICAgcGFkZGluZy1sZWZ0OiAyMHB4Ow0KICAgICAgICBsaXN0LXN0eWxlLXBvc2l0aW9u
OiBpbnNpZGU7DQogICAgfQ0KPC9zdHlsZT4NCjxkaXYgc3R5bGUgPSAnZm9udC1mYW1pbHk65b6u
6L2v6ZuF6buRLFZlcmRhbmEsJnF1b3Q7TWljcm9zb2Z0IFlhaGVpJnF1b3Q7LFNpbVN1bixzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxNHB4OyBsaW5lLWhlaWdodDoxLjY7Jz4NCiAgICA8ZGl2ID48L2Rp
dj48ZGl2PgogICAgPGRpdj4KICAgICAgICA8c3BhbiBzdHlsZT0ibGluZS1oZWlnaHQ6IDIyLjRw
eDsiPldob3NlIHJldmlldyBpcyBzdGlsbCBuZWVkZWQ/ICZuYnNwO09yIGlzIHRoaXMgcmVhZHk/
PC9zcGFuPjxzcGFuPgogICAgICAgICAgICAKICAgICAgICA8L3NwYW4+CiAgICA8L2Rpdj48ZGl2
Pi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTwvZGl2
PjxkaXY+VGhlcmUgaXMgbm8gcmV2aWV3IGluIHRoZSB0aGUgcHJvY2Vzcy4mbmJzcDs8L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PlR3byBtb250aCBhZ28sICZuYnNwOzxzcGFuIHN0eWxlPSJsaW5l
LWhlaWdodDogMS42OyI+RGF2aWQgaGFzIHRyaWVkIHRvIHF1ZXVlIHRoaXMgcGF0Y2ggYW5kIHJl
cG9ydGVkIGEgdGVzdCBmYWlsdXJlLCBpIGZpeCB0aGlzIGJ5IGFkZCBhIHRlc3QgY2FzZSBmb3Ig
ZGlydHlsaW1pdC48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0ibGluZS1oZWlnaHQ6IDEu
NjsiPjxicj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0ibGluZS1oZWlnaHQ6IDEuNjsi
PlNvJm5ic3A7PC9zcGFuPjxzcGFuIHN0eWxlPSJsaW5lLWhlaWdodDogMjIuNHB4OyI+aSB0aGlu
ayBpdCdzIHJlYWR5IGZvciB0aGUgbmV4dCBtaWdyYXRpb24gcXVldWUuIEhvdyBkbyB5b3UgdGhp
bmsgb2YgdGhpcz8gJm5ic3A7PC9zcGFuPjxzcGFuIHN0eWxlPSJsaW5lLWhlaWdodDogMjIuNHB4
OyI+RGF2aWQ8L3NwYW4+PHNwYW4gc3R5bGU9ImxpbmUtaGVpZ2h0OiAyMi40cHg7Ij4mbmJzcDs8
L3NwYW4+PC9kaXY+CiAgICA8ZGl2PgogICAgICAgIDxzcGFuPgogICAgICAgICAgICA8YnI+CiAg
ICAgICAgPC9zcGFuPgogICAgPC9kaXY+PGRpdj48c3Bhbj4tLTwvc3Bhbj48L2Rpdj4KICAgIDxk
aXYgaWQ9Im50ZXMtcGNtYWMtc2lnbmF0dXJlIiBzdHlsZT0iZm9udC1mYW1pbHk6J+W+rui9r+mb
hem7kSciPgogICAgICAgICA8ZGl2IHN0eWxlPSJmb250LXNpemU6MTRweDsgcGFkZGluZzogMDsg
IG1hcmdpbjowOyI+CiAgICAgICAgPGRpdiBzdHlsZT0icGFkZGluZy1ib3R0b206MTBweDttYXJn
aW4tYm90dG9tOjEwcHg7ZGlzcGxheTppbmxpbmUtYmxvY2s7Ij4KICAgICAgICAgICAgPGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q75b6u6L2v6ZuF6buRJnF1b3Q7OyBmb250LXNpemU6IDE0
cHg7IGNvbG9yOiMwMDAwMDAiPgogICAgPHN0eWxlPgogICAgICAgIGZvbnR7CiAgICAgICAgICAg
IGxpbmUtaGVpZ2h0OiAxLjY7CiAgICAgICAgfQogICAgPC9zdHlsZT4KPGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6JnF1b3Q75b6u6L2v6ZuF6buRJnF1b3Q7OyBmb250LXNpemU6IDE0cHg7IGNvbG9y
OiMwMDAwMDAiPgogICAgPHN0eWxlPgogICAgICAgIGZvbnR7CiAgICAgICAgICAgIGxpbmUtaGVp
Z2h0OiAxLjY7CiAgICAgICAgfQogICAgPC9zdHlsZT4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
JnF1b3Q75b6u6L2v6ZuF6buRJnF1b3Q7OyBmb250LXNpemU6IDE0cHg7IGNvbG9yOiMwMDAwMDAi
PgogICAgPHN0eWxlPgogICAgICAgIGZvbnR7CiAgICAgICAgICAgIGxpbmUtaGVpZ2h0OiAxLjY7
CiAgICAgICAgfQogICAgPC9zdHlsZT4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q75b6u
6L2v6ZuF6buRJnF1b3Q7OyBmb250LXNpemU6IDE0cHg7IGNvbG9yOiMwMDAwMDAiPjxkaXY+WW9u
ZzwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KICAgICAgICA8L2Rpdj4KICAgIDwv
ZGl2PgogICAgIDwvZGl2Pgo8L2Rpdj48ZGl2IGNsYXNzPSJKLXJlcGx5IiBzdHlsZT0iYmFja2dy
b3VuZC1jb2xvcjojZjJmMmYyO2NvbG9yOmJsYWNrO3BhZGRpbmctdG9wOjZweDtwYWRkaW5nLWJv
dHRvbTo2cHg7Ym9yZGVyLXJhZGl1czozcHg7LW1vei1ib3JkZXItcmFkaXVzOjNweDstd2Via2l0
LWJvcmRlci1yYWRpdXM6M3B4O21hcmdpbi10b3A6NDVweDttYXJnaW4tYm90dG9tOjIwcHg7Zm9u
dC1mYW1pbHk6J+W+rui9r+mbhem7kSc7Ij4KICAgIDxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxMnB4
O2xpbmUtaGVpZ2h0OjEuNTt3b3JkLWJyZWFrOmJyZWFrLWFsbDttYXJnaW4tbGVmdDoxMHB4O21h
cmdpbi1yaWdodDoxMHB4Ij5PbiA8c3BhbiBjbGFzcz0ibWFpbC1kYXRlIj40LzI3LzIwMjIgMTQ6
MjE8L3NwYW4+77yMPGEgY2xhc3M9Im1haWwtdG8iIHN0eWxlPSJ0ZXh0LWRlY29yYXRpb246bm9u
ZTtjb2xvcjojMmE4M2YyOyIgaHJlZj0ibWFpbHRvOmFybWJydUByZWRoYXQuY29tIj5NYXJrdXMg
QXJtYnJ1c3RlciZsdDthcm1icnVAcmVkaGF0LmNvbSZndDs8L2E+IHdyb3Rl77yaIDwvZGl2Pgo8
L2Rpdj4KPGJsb2NrcXVvdGUgaWQ9Im50ZXMtcGNtYWlsLXF1b3RlIiBzdHlsZT0ibWFyZ2luOiAw
OyBwYWRkaW5nOiAwOyBmb250LXNpemU6IDE0cHg7IGZvbnQtZmFtaWx5OiAn5b6u6L2v6ZuF6buR
JzsiPgpQZXRlciBYdSAmbHQ7cGV0ZXJ4QHJlZGhhdC5jb20mZ3Q7IHdyaXRlczo8YnI+PGJyPiA8
YmxvY2txdW90ZSBjbGFzcz0ibW1icWMxIj5IaSwgWW9uZyw8YnI+PGJyPiBPbiBNb24sIEFwciAy
NSwgMjAyMiBhdCAxMjo1Mjo0NUFNICswODAwLCBIeW1hbiB3cm90ZTo8YnI+IDxibG9ja3F1b3Rl
IGNsYXNzPSJtbWJxYzIiPlBpbmcuPGJyPiAgSGksIERhdmlkIGFuZCBQZXRlciwgaG93IGRvIHlv
dSB0aGluayB0aGlzIHBhdGNoc2V0Pzxicj4gIElzIGl0IHN1aXRhYmxlIGZvciBxdWV1ZWluZyA/
IG9yIGlzIHRoZXJlIHN0aWxsIHNvbWV0aGluZyBuZWVkIHRvIGJlIGRvbmUgPzxicj48L2Jsb2Nr
cXVvdGU+PGJyPiBJdCBrZWVwcyBsb29raW5nIGdvb2QgdG8gbWUgaW4gZ2VuZXJhbCwgbGV0J3Mg
c2VlIHdoZXRoZXIgdGhlIG1haW50YWluZXJzPGJyPiBoYXZlIGFueSBjb21tZW50cy4gJm5ic3A7
VGhhbmtzLDxicj48L2Jsb2NrcXVvdGU+PGJyPldob3NlIHJldmlldyBpcyBzdGlsbCBuZWVkZWQ/
ICZuYnNwO09yIGlzIHRoaXMgcmVhZHk/PGJyPjxicj48L2Jsb2NrcXVvdGU+PCEtLfCfmIAtLT4N
CjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg==


