Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CDE3A2F84
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:40:25 +0200 (CEST)
Received: from localhost ([::1]:38284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrMnA-0003s6-Ii
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <LIZHAOXIN1@kingsoft.com>)
 id 1lrMmO-0003Br-ON
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:39:36 -0400
Received: from [114.255.44.146] (port=31709 helo=mail.kingsoft.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <LIZHAOXIN1@kingsoft.com>) id 1lrMmM-0001Vu-5Q
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:39:36 -0400
X-AuditID: 0a580157-8cdff700000015d4-47-60c23232250d
Received: from mail.kingsoft.com (localhost [10.88.1.79])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mail.kingsoft.com (SMG-1-NODE-87) with SMTP id 0D.46.05588.23232C06;
 Thu, 10 Jun 2021 23:39:30 +0800 (HKT)
Received: from KSbjmail3.kingsoft.cn (10.88.1.78) by KSBJMAIL4.kingsoft.cn
 (10.88.1.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 10 Jun
 2021 23:39:30 +0800
Received: from KSbjmail3.kingsoft.cn ([fe80::a143:8393:3ff1:cd3]) by
 KSBJMAIL3.kingsoft.cn ([fe80::a143:8393:3ff1:cd3%10]) with mapi id
 15.01.2176.014; Thu, 10 Jun 2021 23:39:30 +0800
From: =?gb2312?B?TElaSEFPWElOMSBbwO7V1fbOXQ==?= <LIZHAOXIN1@kingsoft.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: [PATCH v2] migration/rdma: Use huge page register VM memory
Thread-Topic: [PATCH v2] migration/rdma: Use huge page register VM memory
Thread-Index: AddeDoRRKABeLUUiRGG9h//M45eppQ==
Date: Thu, 10 Jun 2021 15:39:30 +0000
Message-ID: <a67bba1280e54ed0bc65a01e6a3b0d1a@kingsoft.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.88.1.106]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOLMWRmVeSWpSXmKPExsXCFcHor2tkdCjBYNI1XYvebffYLY737mCx
 uLOlj8mB2ePJtc1MHu/3XWULYIrisklJzcksSy3St0vgylhxX6pgmnbFv2V+DYwdWl2MnBwS
 AiYSFy/dY+li5OIQEpjOJPH1TBs7hPOCUWLOudtMEM5uRon2y5eZQFrYBDwlPq06wwaSEBHo
 Z5S4sf4BWBWzQA+TxO83raxdjBwcwgIuEs+f+IM0iAA1LN6xkR3C1pO4dvkeG4jNIqAq8f7B
 TFYQm1fAWuLLjwWMIDajgKzEtEf3wZYxC4hLzJ02ixXiVgGJJXvOM0PYohIvH/8DWyUhIC+x
 +qMwRLmWxLyG31CtihJTuh+yQ4wXlDg58wnLBEaRWUimzkLSMgtJyywkLQsYWVYxshTnphtu
 YoSEffgOxnlNH/UOMTJxMB5ilOBgVhLhzVE7lCDEm5JYWZValB9fVJqTWnyIUZqDRUmc93PO
 wQQhgfTEktTs1NSC1CKYLBMHp1QD0zb/OpG/3BHcV+aLJEtXTTgksuNtglp3bd9z+TcpnxVS
 r9qU1+duWa70P+WDFsP29O0LPlduZH29d2IJr7vupmtblE71izZyLWHgMNgnVH7pR0Kn+MoT
 c+c/cq8QKXcSyKjdYGqz/smPzMUmnA/WLuXZlPC6Mb+vl4tVq+rR0RXh5pf7N6Wkxl+/Kxlk
 K292fNs+Gc9j5jWiYSdNuSdtL/azD3v0vXHR+l97t8xzuJl43vvQuyM7uDy014Y0ai3qKNhz
 MWli/qcZik03nnJInvJhF3Y3WMkSX8fxtL3pl72i7szq0KQG9X28djbzy3/l3356s/7o6c+7
 87Nmv436sCX2tuama+3+4ob58p/7lViKMxINtZiLihMBtU3nQOoCAAA=
X-Host-Lookup-Failed: Reverse DNS lookup failed for 114.255.44.146 (failed)
Received-SPF: pass client-ip=114.255.44.146;
 envelope-from=LIZHAOXIN1@kingsoft.com; helo=mail.kingsoft.com
X-Spam_score_int: 21
X-Spam_score: 2.1
X-Spam_bar: ++
X-Spam_report: (2.1 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
b3J5DQppcyB0b28gbGFyZ2UsIGl0IHdpbGwgdGFrZSBhIGxvdCBvZiB0aW1lIHRvIGRlcmVnaXN0
ZXIgdGhlIFZNDQphdCB0aGUgc291cmNlIHNpZGUsIHJlc3VsdGluZyBpbiBhIGxvbmcgZG93bnRp
bWUgKFZNIDY0RywNCmRlcmVnaXN0ZXIgdm0gdGltZSBpcyBhYm91dCA0MDBtcykuDQogICAgDQpB
bHRob3VnaCB0aGUgVk0ncyBtZW1vcnkgdXNlcyAyTSBodWdlIHBhZ2VzLCB0aGUgTUxOWCBkcml2
ZXINCnN0aWxsIHVzZXMgNEsgcGFnZXMgZm9yIHBpbiBtZW1vcnksIGFzIHdlbGwgYXMgZm9yIHVu
cGluLg0KU28gd2UgdXNlIGh1Z2UgcGFnZXMgdG8gc2tpcCB0aGUgcHJvY2VzcyBvZiBwaW4gbWVt
b3J5IGFuZA0KdW5waW4gbWVtb3J5IHRvIHJlZHVjZSBkb3dudGltZS4NCiAgICANCi0tLQ0KdjIN
Ci0gQWRkIHBhZ2Vfc2l6ZSBpbiBzdHJ1Y3QgUkRNQUxvY2FsQmxvY2sNCi0gVXNlIHBhZ2Vfc2l6
ZSB0byBkZXRlcm1pbmUgd2hldGhlciBWTSB1c2VzIGh1Z2UgcGFnZQ0KLS0tDQogICAgDQpTaWdu
ZWQtb2ZmLWJ5OiBsaXpoYW94aW4gPGxpemhhb3hpbjFAa2luZ3NvZnQuY29tPg0KDQpkaWZmIC0t
Z2l0IGEvbWlncmF0aW9uL3JkbWEuYyBiL21pZ3JhdGlvbi9yZG1hLmMNCmluZGV4IDFjZGI0NTYx
ZjMuLjcwMzgxNmViYzcgMTAwNjQ0DQotLS0gYS9taWdyYXRpb24vcmRtYS5jDQorKysgYi9taWdy
YXRpb24vcmRtYS5jDQpAQCAtMjE1LDYgKzIxNSw3IEBAIHR5cGVkZWYgc3RydWN0IFJETUFMb2Nh
bEJsb2NrIHsNCiAgICAgdWludDY0X3QgICAgICAgcmVtb3RlX2hvc3RfYWRkcjsgLyogcmVtb3Rl
IHZpcnR1YWwgYWRkcmVzcyAqLw0KICAgICB1aW50NjRfdCAgICAgICBvZmZzZXQ7DQogICAgIHVp
bnQ2NF90ICAgICAgIGxlbmd0aDsNCisgICAgdWludDY0X3QgICAgICAgcGFnZV9zaXplOw0KICAg
ICBzdHJ1Y3QgICAgICAgICBpYnZfbXIgKipwbXI7ICAgIC8qIE1ScyBmb3IgY2h1bmstbGV2ZWwg
cmVnaXN0cmF0aW9uICovDQogICAgIHN0cnVjdCAgICAgICAgIGlidl9tciAqbXI7ICAgICAgLyog
TVIgZm9yIG5vbi1jaHVuay1sZXZlbCByZWdpc3RyYXRpb24gKi8NCiAgICAgdWludDMyX3QgICAg
ICAqcmVtb3RlX2tleXM7ICAgICAvKiBya2V5cyBmb3IgY2h1bmstbGV2ZWwgcmVnaXN0cmF0aW9u
ICovDQpAQCAtNTY1LDcgKzU2Niw4IEBAIHN0YXRpYyBpbmxpbmUgdWludDhfdCAqcmFtX2NodW5r
X2VuZChjb25zdCBSRE1BTG9jYWxCbG9jayAqcmRtYV9yYW1fYmxvY2ssDQogDQogc3RhdGljIGlu
dCByZG1hX2FkZF9ibG9jayhSRE1BQ29udGV4dCAqcmRtYSwgY29uc3QgY2hhciAqYmxvY2tfbmFt
ZSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqaG9zdF9hZGRyLA0KLSAgICAgICAg
ICAgICAgICAgICAgICAgICByYW1fYWRkcl90IGJsb2NrX29mZnNldCwgdWludDY0X3QgbGVuZ3Ro
KQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICByYW1fYWRkcl90IGJsb2NrX29mZnNldCwgdWlu
dDY0X3QgbGVuZ3RoLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBwYWdlX3Np
emUpDQogew0KICAgICBSRE1BTG9jYWxCbG9ja3MgKmxvY2FsID0gJnJkbWEtPmxvY2FsX3JhbV9i
bG9ja3M7DQogICAgIFJETUFMb2NhbEJsb2NrICpibG9jazsNCkBAIC01OTUsNiArNTk3LDcgQEAg
c3RhdGljIGludCByZG1hX2FkZF9ibG9jayhSRE1BQ29udGV4dCAqcmRtYSwgY29uc3QgY2hhciAq
YmxvY2tfbmFtZSwNCiAgICAgYmxvY2stPmxvY2FsX2hvc3RfYWRkciA9IGhvc3RfYWRkcjsNCiAg
ICAgYmxvY2stPm9mZnNldCA9IGJsb2NrX29mZnNldDsNCiAgICAgYmxvY2stPmxlbmd0aCA9IGxl
bmd0aDsNCisgICAgYmxvY2stPnBhZ2Vfc2l6ZSA9IHBhZ2Vfc2l6ZTsNCiAgICAgYmxvY2stPmlu
ZGV4ID0gbG9jYWwtPm5iX2Jsb2NrczsNCiAgICAgYmxvY2stPnNyY19pbmRleCA9IH4wVTsgLyog
RmlsbGVkIGluIGJ5IHRoZSByZWNlaXB0IG9mIHRoZSBibG9jayBsaXN0ICovDQogICAgIGJsb2Nr
LT5uYl9jaHVua3MgPSByYW1fY2h1bmtfaW5kZXgoaG9zdF9hZGRyLCBob3N0X2FkZHIgKyBsZW5n
dGgpICsgMVVMOw0KQEAgLTYzNCw3ICs2MzcsOCBAQCBzdGF0aWMgaW50IHFlbXVfcmRtYV9pbml0
X29uZV9ibG9jayhSQU1CbG9jayAqcmIsIHZvaWQgKm9wYXF1ZSkNCiAgICAgdm9pZCAqaG9zdF9h
ZGRyID0gcWVtdV9yYW1fZ2V0X2hvc3RfYWRkcihyYik7DQogICAgIHJhbV9hZGRyX3QgYmxvY2tf
b2Zmc2V0ID0gcWVtdV9yYW1fZ2V0X29mZnNldChyYik7DQogICAgIHJhbV9hZGRyX3QgbGVuZ3Ro
ID0gcWVtdV9yYW1fZ2V0X3VzZWRfbGVuZ3RoKHJiKTsNCi0gICAgcmV0dXJuIHJkbWFfYWRkX2Js
b2NrKG9wYXF1ZSwgYmxvY2tfbmFtZSwgaG9zdF9hZGRyLCBibG9ja19vZmZzZXQsIGxlbmd0aCk7
DQorICAgIHJhbV9hZGRyX3QgcGFnZV9zaXplID0gcWVtdV9yYW1fcGFnZXNpemUocmIpOw0KKyAg
ICByZXR1cm4gcmRtYV9hZGRfYmxvY2sob3BhcXVlLCBibG9ja19uYW1lLCBob3N0X2FkZHIsIGJs
b2NrX29mZnNldCwgbGVuZ3RoLCBwYWdlX3NpemUpOw0KIH0NCiANCiAvKg0KQEAgLTExMjMsMTMg
KzExMjcsMjUgQEAgc3RhdGljIGludCBxZW11X3JkbWFfcmVnX3dob2xlX3JhbV9ibG9ja3MoUkRN
QUNvbnRleHQgKnJkbWEpDQogICAgIFJETUFMb2NhbEJsb2NrcyAqbG9jYWwgPSAmcmRtYS0+bG9j
YWxfcmFtX2Jsb2NrczsNCiANCiAgICAgZm9yIChpID0gMDsgaSA8IGxvY2FsLT5uYl9ibG9ja3M7
IGkrKykgew0KLSAgICAgICAgbG9jYWwtPmJsb2NrW2ldLm1yID0NCi0gICAgICAgICAgICBpYnZf
cmVnX21yKHJkbWEtPnBkLA0KLSAgICAgICAgICAgICAgICAgICAgbG9jYWwtPmJsb2NrW2ldLmxv
Y2FsX2hvc3RfYWRkciwNCi0gICAgICAgICAgICAgICAgICAgIGxvY2FsLT5ibG9ja1tpXS5sZW5n
dGgsDQotICAgICAgICAgICAgICAgICAgICBJQlZfQUNDRVNTX0xPQ0FMX1dSSVRFIHwNCi0gICAg
ICAgICAgICAgICAgICAgIElCVl9BQ0NFU1NfUkVNT1RFX1dSSVRFDQotICAgICAgICAgICAgICAg
ICAgICApOw0KKyAgICAgICAgaWYgKGxvY2FsLT5ibG9ja1tpXS5wYWdlX3NpemUgIT0gcWVtdV9y
ZWFsX2hvc3RfcGFnZV9zaXplKSB7DQorICAgICAgICAgICAgbG9jYWwtPmJsb2NrW2ldLm1yID0N
CisgICAgICAgICAgICAgICAgaWJ2X3JlZ19tcihyZG1hLT5wZCwNCisgICAgICAgICAgICAgICAg
ICAgICAgICBsb2NhbC0+YmxvY2tbaV0ubG9jYWxfaG9zdF9hZGRyLA0KKyAgICAgICAgICAgICAg
ICAgICAgICAgIGxvY2FsLT5ibG9ja1tpXS5sZW5ndGgsDQorICAgICAgICAgICAgICAgICAgICAg
ICAgSUJWX0FDQ0VTU19MT0NBTF9XUklURSB8DQorICAgICAgICAgICAgICAgICAgICAgICAgSUJW
X0FDQ0VTU19SRU1PVEVfV1JJVEUgfA0KKyAgICAgICAgICAgICAgICAgICAgICAgIElCVl9BQ0NF
U1NfT05fREVNQU5EIHwNCisgICAgICAgICAgICAgICAgICAgICAgICBJQlZfQUNDRVNTX0hVR0VU
TEINCisgICAgICAgICAgICAgICAgICAgICAgICApOw0KKyAgICAgICAgfSBlbHNlIHsNCisgICAg
ICAgICAgICBsb2NhbC0+YmxvY2tbaV0ubXIgPQ0KKyAgICAgICAgICAgICAgICBpYnZfcmVnX21y
KHJkbWEtPnBkLA0KKyAgICAgICAgICAgICAgICAgICAgICAgIGxvY2FsLT5ibG9ja1tpXS5sb2Nh
bF9ob3N0X2FkZHIsDQorICAgICAgICAgICAgICAgICAgICAgICAgbG9jYWwtPmJsb2NrW2ldLmxl
bmd0aCwNCisgICAgICAgICAgICAgICAgICAgICAgICBJQlZfQUNDRVNTX0xPQ0FMX1dSSVRFIHwN
CisgICAgICAgICAgICAgICAgICAgICAgICBJQlZfQUNDRVNTX1JFTU9URV9XUklURQ0KKyAgICAg
ICAgICAgICAgICAgICAgICAgICk7DQorICAgICAgICB9DQogICAgICAgICBpZiAoIWxvY2FsLT5i
bG9ja1tpXS5tcikgew0KICAgICAgICAgICAgIHBlcnJvcigiRmFpbGVkIHRvIHJlZ2lzdGVyIGxv
Y2FsIGRlc3QgcmFtIGJsb2NrIVxuIik7DQogICAgICAgICAgICAgYnJlYWs7DQo=

