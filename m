Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD9539DE68
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:13:27 +0200 (CEST)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqG0M-0003wb-A4
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <LIZHAOXIN1@kingsoft.com>)
 id 1lqFzS-0003GW-BA
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:12:30 -0400
Received: from mail.kingsoft.com ([114.255.44.145]:42942)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <LIZHAOXIN1@kingsoft.com>) id 1lqFzK-00043P-Uu
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:12:29 -0400
X-AuditID: 0a580155-3d1ff7000005011f-0d-60be25ae49a8
Received: from mail.kingsoft.com (localhost [10.88.1.79])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mail.kingsoft.com (SMG-2-NODE-85) with SMTP id 91.75.00287.EA52EB06;
 Mon,  7 Jun 2021 21:57:02 +0800 (HKT)
Received: from KSbjmail3.kingsoft.cn (10.88.1.78) by KSBJMAIL4.kingsoft.cn
 (10.88.1.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 7 Jun
 2021 21:57:02 +0800
Received: from KSbjmail3.kingsoft.cn ([fe80::a143:8393:3ff1:cd3]) by
 KSBJMAIL3.kingsoft.cn ([fe80::a143:8393:3ff1:cd3%10]) with mapi id
 15.01.2176.014; Mon, 7 Jun 2021 21:57:02 +0800
From: =?gb2312?B?TElaSEFPWElOMSBbwO7V1fbOXQ==?= <LIZHAOXIN1@kingsoft.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: [PATCH] migration/rdma: Use huge page register VM memory
Thread-Topic: [PATCH] migration/rdma: Use huge page register VM memory
Thread-Index: AddbpN+kEXe4Oe1WQuqS3KFy+fOdUQ==
Date: Mon, 7 Jun 2021 13:57:02 +0000
Message-ID: <51819991cecb42f6a619768bc61d0bfd@kingsoft.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.88.1.106]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRmVeSWpSXmKPExsXCFcHor7tOdV+CwbXLMha92+6xWxzv3cFi
 cWdLH5MDs8eTa5uZPN7vu8oWwBTFZZOSmpNZllqkb5fAlfGxYzVzwTOJiu/N/9kaGKdIdDFy
 ckgImEi0t69m6mLk4hASmM4ksX7fcxYI5zmjxMlplxlBqoQEdjFKTFjJBmKzCXhKfFp1hg2k
 SESgn1HixvoHYO3MAj1MEr/ftLKCVAkLOEosXz+BBcQWEXCT+LW6E8rWk7i38jZQNwcHi4CK
 xOurSSBhXgFriYW7X4EtYxSQlZj26D4TiM0sIC4xd9osVohTBSSW7DnPDGGLSrx8/I8VZIyE
 gLzE6o/CEOVaEvMafkO1KkpM6X7IDjFeUOLkzCcsExhFZiGZOgtJyywkLbOQtCxgZFnFyFKc
 m260iRES+KE7GGc0fdQ7xMjEwXiIUYKDWUmE10tmT4IQb0piZVVqUX58UWlOavEhRmkOFiVx
 3rVGOxKEBNITS1KzU1MLUotgskwcnFINTLymH9KFn5r1pz6bktLaz75j068nClFMPTJ/9Xeb
 6Rieu3YgPiqLx/aNq9Bk1RnmMbNsJ0+/ndqmcG35j2SevvN3krhMLZ2it35odm9Y2PvSlS8u
 aUn70xv7zmvPeLJCWnebb+Ur/yvPzTYlC/3otP12/esXlSQLxdlfsjY9Pn6xY53+x8sJZQsm
 py3Mmf5/01aGo548jsyPr0xNuLBUcpLT7sKUJY/V02ujlP1FF/x7Fvf99fZzjEvqd4lpiBqp
 KiQKGGbVnp1kGXK9I1RV5eHvCfPe3g599qu4Z41P3p5TybsXcZu2XH6wq+Hq6VDDvbPmbyvc
 d41Dwehb0sajXlwB5wRveuzjWMOi99Jvx3IlluKMREMt5qLiRABbqqSn6wIAAA==
Received-SPF: pass client-ip=114.255.44.145;
 envelope-from=LIZHAOXIN1@kingsoft.com; helo=mail.kingsoft.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?gb2312?B?TElaSEFPWElOMSBbwO7V1fbOXQ==?= <LIZHAOXIN1@kingsoft.com>,
 =?gb2312?B?c3VuaGFvMiBby+/qu10=?= <sunhao2@kingsoft.com>,
 =?gb2312?B?REVOR0xJTldFTiBbtcvB1s7EXQ==?= <DENGLINWEN@kingsoft.com>,
 =?gb2312?B?WUFOR0ZFTkcxIFvR7rflXQ==?= <YANGFENG1@kingsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V2hlbiB1c2luZyBsaWJ2aXJ0IGZvciBSRE1BIGxpdmUgbWlncmF0aW9uLCBpZiB0aGUgVk0gbWVt
b3J5IGlzIHRvbyBsYXJnZSwNCml0IHdpbGwgdGFrZSBhIGxvdCBvZiB0aW1lIHRvIGRlcmVnaXN0
ZXIgdGhlIFZNIGF0IHRoZSBzb3VyY2Ugc2lkZSwgcmVzdWx0aW5nDQppbiBhIGxvbmcgZG93bnRp
bWUgKFZNIDY0RywgZGVyZWdpc3RlciB2bSB0aW1lIGlzIGFib3V0IDQwMG1zKS4NCiAgICANCkFs
dGhvdWdoIHRoZSBWTSdzIG1lbW9yeSB1c2VzIDJNIGh1Z2UgcGFnZXMsIHRoZSBNTE5YIGRyaXZl
ciBzdGlsbCB1c2VzIDRLDQpwYWdlcyBmb3IgcGluIG1lbW9yeSwgYXMgd2VsbCBhcyBmb3IgdW5w
aW4uIFNvIHdlIHVzZSBodWdlIHBhZ2VzIHRvIHNraXAgdGhlDQpwcm9jZXNzIG9mIHBpbiBtZW1v
cnkgYW5kIHVucGluIG1lbW9yeSB0byByZWR1Y2UgZG93bnRpbWUuDQogICANClRoZSB0ZXN0IGVu
dmlyb25tZW50Og0Ka2VybmVsOiBsaW51eC01LjEyDQpNTE5YOiBDb25uZWN0WC00IExYDQpsaWJ2
aXJ0IGNvbW1hbmQ6DQp2aXJzaCBtaWdyYXRlIC0tbGl2ZSAtLXAycCAtLXBlcnNpc3RlbnQgLS1j
b3B5LXN0b3JhZ2UtaW5jIC0tbGlzdGVuLWFkZHJlc3MgXA0KMC4wLjAuMCAtLXJkbWEtcGluLWFs
bCAtLW1pZ3JhdGV1cmkgcmRtYTovLzE5Mi4xNjguMC4yIFtWTV0gcWVtdSt0Y3A6Ly8xOTIuMTY4
LjAuMi9zeXN0ZW0NCiAgICANClNpZ25lZC1vZmYtYnk6IGxpemhhb3hpbiA8bGl6aGFveGluMUBr
aW5nc29mdC5jb20+DQoNCmRpZmYgLS1naXQgYS9taWdyYXRpb24vcmRtYS5jIGIvbWlncmF0aW9u
L3JkbWEuYw0KaW5kZXggMWNkYjQ1NjFmMy4uOTgyMzQ0OTI5NyAxMDA2NDQNCi0tLSBhL21pZ3Jh
dGlvbi9yZG1hLmMNCisrKyBiL21pZ3JhdGlvbi9yZG1hLmMNCkBAIC0xMTIzLDEzICsxMTIzLDI2
IEBAIHN0YXRpYyBpbnQgcWVtdV9yZG1hX3JlZ193aG9sZV9yYW1fYmxvY2tzKFJETUFDb250ZXh0
ICpyZG1hKQ0KICAgICBSRE1BTG9jYWxCbG9ja3MgKmxvY2FsID0gJnJkbWEtPmxvY2FsX3JhbV9i
bG9ja3M7DQogDQogICAgIGZvciAoaSA9IDA7IGkgPCBsb2NhbC0+bmJfYmxvY2tzOyBpKyspIHsN
Ci0gICAgICAgIGxvY2FsLT5ibG9ja1tpXS5tciA9DQotICAgICAgICAgICAgaWJ2X3JlZ19tcihy
ZG1hLT5wZCwNCi0gICAgICAgICAgICAgICAgICAgIGxvY2FsLT5ibG9ja1tpXS5sb2NhbF9ob3N0
X2FkZHIsDQotICAgICAgICAgICAgICAgICAgICBsb2NhbC0+YmxvY2tbaV0ubGVuZ3RoLA0KLSAg
ICAgICAgICAgICAgICAgICAgSUJWX0FDQ0VTU19MT0NBTF9XUklURSB8DQotICAgICAgICAgICAg
ICAgICAgICBJQlZfQUNDRVNTX1JFTU9URV9XUklURQ0KLSAgICAgICAgICAgICAgICAgICAgKTsN
CisgICAgICAgIGlmIChzdHJjbXAobG9jYWwtPmJsb2NrW2ldLmJsb2NrX25hbWUsInBjLnJhbSIp
ID09IDApIHsNCisgICAgICAgICAgICBsb2NhbC0+YmxvY2tbaV0ubXIgPQ0KKyAgICAgICAgICAg
ICAgICBpYnZfcmVnX21yKHJkbWEtPnBkLA0KKyAgICAgICAgICAgICAgICAgICAgICAgIGxvY2Fs
LT5ibG9ja1tpXS5sb2NhbF9ob3N0X2FkZHIsDQorICAgICAgICAgICAgICAgICAgICAgICAgbG9j
YWwtPmJsb2NrW2ldLmxlbmd0aCwNCisgICAgICAgICAgICAgICAgICAgICAgICBJQlZfQUNDRVNT
X0xPQ0FMX1dSSVRFIHwNCisgICAgICAgICAgICAgICAgICAgICAgICBJQlZfQUNDRVNTX1JFTU9U
RV9XUklURSB8DQorICAgICAgICAgICAgICAgICAgICAgICAgSUJWX0FDQ0VTU19PTl9ERU1BTkQg
fA0KKyAgICAgICAgICAgICAgICAgICAgICAgIElCVl9BQ0NFU1NfSFVHRVRMQg0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICk7DQorICAgICAgICB9IGVsc2Ugew0KKyAgICAgICAgICAgIGxvY2Fs
LT5ibG9ja1tpXS5tciA9DQorICAgICAgICAgICAgICAgIGlidl9yZWdfbXIocmRtYS0+cGQsDQor
ICAgICAgICAgICAgICAgICAgICAgICAgbG9jYWwtPmJsb2NrW2ldLmxvY2FsX2hvc3RfYWRkciwN
CisgICAgICAgICAgICAgICAgICAgICAgICBsb2NhbC0+YmxvY2tbaV0ubGVuZ3RoLA0KKyAgICAg
ICAgICAgICAgICAgICAgICAgIElCVl9BQ0NFU1NfTE9DQUxfV1JJVEUgfA0KKyAgICAgICAgICAg
ICAgICAgICAgICAgIElCVl9BQ0NFU1NfUkVNT1RFX1dSSVRFDQorICAgICAgICAgICAgICAgICAg
ICAgICAgKTsNCisgICAgICAgIH0NCisNCiAgICAgICAgIGlmICghbG9jYWwtPmJsb2NrW2ldLm1y
KSB7DQogICAgICAgICAgICAgcGVycm9yKCJGYWlsZWQgdG8gcmVnaXN0ZXIgbG9jYWwgZGVzdCBy
YW0gYmxvY2shXG4iKTsNCiAgICAgICAgICAgICBicmVhazsNCg==

