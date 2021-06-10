Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB53A2F6F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:35:56 +0200 (CEST)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrMiq-0003PA-0D
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <LIZHAOXIN1@kingsoft.com>)
 id 1lrMgy-0007KC-H9
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:34:00 -0400
Received: from [114.255.44.146] (port=31708 helo=mail.kingsoft.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <LIZHAOXIN1@kingsoft.com>) id 1lrMgt-0006nl-3j
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:34:00 -0400
X-AuditID: 0a580157-8b5ff700000015d4-6c-60c230cf9efd
Received: from mail.kingsoft.com (localhost [10.88.1.78])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mail.kingsoft.com (SMG-1-NODE-87) with SMTP id 88.36.05588.FC032C06;
 Thu, 10 Jun 2021 23:33:35 +0800 (HKT)
Received: from KSbjmail3.kingsoft.cn (10.88.1.78) by KSBJMAIL3.kingsoft.cn
 (10.88.1.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 10 Jun
 2021 23:33:35 +0800
Received: from KSbjmail3.kingsoft.cn ([fe80::a143:8393:3ff1:cd3]) by
 KSBJMAIL3.kingsoft.cn ([fe80::a143:8393:3ff1:cd3%10]) with mapi id
 15.01.2176.014; Thu, 10 Jun 2021 23:33:35 +0800
From: =?gb2312?B?TElaSEFPWElOMSBbwO7V1fbOXQ==?= <LIZHAOXIN1@kingsoft.com>
To: =?gb2312?B?RGFuaWVsIFAuIEJlcnJhbmeopg==?= <berrange@redhat.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBtaWdyYXRpb24vcmRtYTogVXNlIGh1Z2UgcGFnZSBy?=
 =?gb2312?Q?egister_VM_memory?=
Thread-Topic: [PATCH] migration/rdma: Use huge page register VM memory
Thread-Index: AddbpN+kEXe4Oe1WQuqS3KFy+fOdUf//f+eA//quH7A=
Date: Thu, 10 Jun 2021 15:33:34 +0000
Message-ID: <7b4701af3e6949d6a29e218a0c78b113@kingsoft.com>
References: <51819991cecb42f6a619768bc61d0bfd@kingsoft.com>
 <YL4qh35GquFrbSfq@redhat.com>
In-Reply-To: <YL4qh35GquFrbSfq@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.88.1.106]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsXCFcHop3ve4FCCwf9JUhZv3qxhsujddo/d
 4njvDhaLO1v6mBxYPJ5c28zk8X7fVbYApigum5TUnMyy1CJ9uwSujHPXmlgK7qhWHNp4ibGB
 8YFKFyMHh4SAicTNOSxdjFwcQgLTmSQ6Hm1mg3BeMEo8/nGGGcLZzSjx6+My1i5GTg42AU+J
 T6vOsIHYIgLOEtN+7mAHKWIWuMIk8eTHLEaQhLBAscSKtj2sEEVuEr9Wd7JA2FYSczdfAath
 EVCVeNS0ghnE5hWwluhf2AsWFxKIluhcdpEJxOYU0JL42PEXLM4oICsx7dF9sDizgLjE3Gmz
 wOZLCAhILNlznhnCFpV4+fgfK8Rr8hKrPwpDlGtJzGv4DdWqKDGl+yE7xFpBiZMzn7BMYBSb
 hWTqLCQts5C0zELSsoCRZRUjS3FuuuEmRkjMhO9gnNf0Ue8QIxMH4yFGCQ5mJRHeHLVDCUK8
 KYmVValF+fFFpTmpxYcYpTlYlMR5P+ccTBASSE8sSc1OTS1ILYLJMnFwSjUwbSubf/tCzLQK
 u71K0rPtX71x9DH33DXxaM+fQy3JZ5f/n6T2M03mxDRpniknkgtXnPX6HWEh1Lc48qhga3dX
 ytkJJV83Xai2CGBYXvz7ack/Br7Lqv/zLDOmdB4QNXRhUFr3l3cpg9jF8qQW503OGxbzehzU
 zCv2OveK83VZj8XnQBnJYwLXnrWYf3vn57Fng5XG/8J+Po72a1lurjJxVTwJDid8Ls+s3jVl
 U1nUjlmqzPMbtlSW/axt5VB87yCh+5XjuAkLX9QK50dzisv1Uk4+XuZ/x/uHyYW32o1KV/r3
 65y7VH+yQM/Hb8ffY9Zm109ZXzmpwdx072LdnQsHqtdv9PW5MfXiodDNLk1zlFiKMxINtZiL
 ihMBsg6fyggDAAA=
X-Host-Lookup-Failed: Reverse DNS lookup failed for 114.255.44.146 (failed)
Received-SPF: pass client-ip=114.255.44.146;
 envelope-from=LIZHAOXIN1@kingsoft.com; helo=mail.kingsoft.com
X-Spam_score_int: 45
X-Spam_score: 4.5
X-Spam_bar: ++++
X-Spam_report: (4.5 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 MIME_CHARSET_FARAWAY=2.45, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: =?gb2312?B?c3VuaGFvMiBby+/qu10=?= <sunhao2@kingsoft.com>,
 =?gb2312?B?WUFOR0ZFTkcxIFvR7rflXQ==?= <YANGFENG1@kingsoft.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?gb2312?B?REVOR0xJTldFTiBbtcvB1s7EXQ==?= <DENGLINWEN@kingsoft.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

WWVzLCAncGMucmFtJyBpcyB0aGUgc3BlY2lmaWMgbmFtZSBmb3IgeDg2LiBJIGhhdmUgcmVhZCB0
aGF0DQptZW1vcnlfcmVnaW9uX2FsbG9jYXRlX3N5c3RlbV9tZW1vcnkgYXNzaWducyBkaWZmZXJl
bnQgbmFtZXMNCnRvIG90aGVyIGFyY2hpdGVjdHVyZXMuDQpUaGFua3MgZm9yIHlvdXIgcmVtaW5k
aW5nLg0KDQpSZWdhcmRzLA0KbGl6aGFveGluLg0KDQotLS0tLdPKvP7Urbz+LS0tLS0NCreivP7I
yzogRGFuaWVsIFAuIEJlcnJhbmeopiA8YmVycmFuZ2VAcmVkaGF0LmNvbT4gDQq3osvNyrG85Dog
MjAyMcTqNtTCN8jVIDIyOjE4DQrK1bz+yMs6IExJWkhBT1hJTjEgW8Du1dX2zl0gPExJWkhBT1hJ
TjFAa2luZ3NvZnQuY29tPg0Ks63LzTogcWVtdS1kZXZlbEBub25nbnUub3JnOyBxdWludGVsYUBy
ZWRoYXQuY29tOyBkZ2lsYmVydEByZWRoYXQuY29tOyBzdW5oYW8yIFvL7+q7XSA8c3VuaGFvMkBr
aW5nc29mdC5jb20+OyBERU5HTElOV0VOIFu1y8HWzsRdIDxERU5HTElOV0VOQGtpbmdzb2Z0LmNv
bT47IFlBTkdGRU5HMSBb0e635V0gPFlBTkdGRU5HMUBraW5nc29mdC5jb20+DQrW98ziOiBSZTog
W1BBVENIXSBtaWdyYXRpb24vcmRtYTogVXNlIGh1Z2UgcGFnZSByZWdpc3RlciBWTSBtZW1vcnkN
Cg0KT24gTW9uLCBKdW4gMDcsIDIwMjEgYXQgMDE6NTc6MDJQTSArMDAwMCwgTElaSEFPWElOMSBb
wO7V1fbOXSB3cm90ZToNCj4gV2hlbiB1c2luZyBsaWJ2aXJ0IGZvciBSRE1BIGxpdmUgbWlncmF0
aW9uLCBpZiB0aGUgVk0gbWVtb3J5IGlzIHRvbyANCj4gbGFyZ2UsIGl0IHdpbGwgdGFrZSBhIGxv
dCBvZiB0aW1lIHRvIGRlcmVnaXN0ZXIgdGhlIFZNIGF0IHRoZSBzb3VyY2UgDQo+IHNpZGUsIHJl
c3VsdGluZyBpbiBhIGxvbmcgZG93bnRpbWUgKFZNIDY0RywgZGVyZWdpc3RlciB2bSB0aW1lIGlz
IGFib3V0IDQwMG1zKS4NCj4gICAgIA0KPiBBbHRob3VnaCB0aGUgVk0ncyBtZW1vcnkgdXNlcyAy
TSBodWdlIHBhZ2VzLCB0aGUgTUxOWCBkcml2ZXIgc3RpbGwgDQo+IHVzZXMgNEsgcGFnZXMgZm9y
IHBpbiBtZW1vcnksIGFzIHdlbGwgYXMgZm9yIHVucGluLiBTbyB3ZSB1c2UgaHVnZSANCj4gcGFn
ZXMgdG8gc2tpcCB0aGUgcHJvY2VzcyBvZiBwaW4gbWVtb3J5IGFuZCB1bnBpbiBtZW1vcnkgdG8g
cmVkdWNlIGRvd250aW1lLg0KPiAgICANCj4gVGhlIHRlc3QgZW52aXJvbm1lbnQ6DQo+IGtlcm5l
bDogbGludXgtNS4xMg0KPiBNTE5YOiBDb25uZWN0WC00IExYDQo+IGxpYnZpcnQgY29tbWFuZDoN
Cj4gdmlyc2ggbWlncmF0ZSAtLWxpdmUgLS1wMnAgLS1wZXJzaXN0ZW50IC0tY29weS1zdG9yYWdl
LWluYyANCj4gLS1saXN0ZW4tYWRkcmVzcyBcDQo+IDAuMC4wLjAgLS1yZG1hLXBpbi1hbGwgLS1t
aWdyYXRldXJpIHJkbWE6Ly8xOTIuMTY4LjAuMiBbVk1dIA0KPiBxZW11K3RjcDovLzE5Mi4xNjgu
MC4yL3N5c3RlbQ0KPiAgICAgDQo+IFNpZ25lZC1vZmYtYnk6IGxpemhhb3hpbiA8bGl6aGFveGlu
MUBraW5nc29mdC5jb20+DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWlncmF0aW9uL3JkbWEuYyBiL21p
Z3JhdGlvbi9yZG1hLmMgaW5kZXggDQo+IDFjZGI0NTYxZjMuLjk4MjM0NDkyOTcgMTAwNjQ0DQo+
IC0tLSBhL21pZ3JhdGlvbi9yZG1hLmMNCj4gKysrIGIvbWlncmF0aW9uL3JkbWEuYw0KPiBAQCAt
MTEyMywxMyArMTEyMywyNiBAQCBzdGF0aWMgaW50IHFlbXVfcmRtYV9yZWdfd2hvbGVfcmFtX2Js
b2NrcyhSRE1BQ29udGV4dCAqcmRtYSkNCj4gICAgICBSRE1BTG9jYWxCbG9ja3MgKmxvY2FsID0g
JnJkbWEtPmxvY2FsX3JhbV9ibG9ja3M7DQo+ICANCj4gICAgICBmb3IgKGkgPSAwOyBpIDwgbG9j
YWwtPm5iX2Jsb2NrczsgaSsrKSB7DQo+IC0gICAgICAgIGxvY2FsLT5ibG9ja1tpXS5tciA9DQo+
IC0gICAgICAgICAgICBpYnZfcmVnX21yKHJkbWEtPnBkLA0KPiAtICAgICAgICAgICAgICAgICAg
ICBsb2NhbC0+YmxvY2tbaV0ubG9jYWxfaG9zdF9hZGRyLA0KPiAtICAgICAgICAgICAgICAgICAg
ICBsb2NhbC0+YmxvY2tbaV0ubGVuZ3RoLA0KPiAtICAgICAgICAgICAgICAgICAgICBJQlZfQUND
RVNTX0xPQ0FMX1dSSVRFIHwNCj4gLSAgICAgICAgICAgICAgICAgICAgSUJWX0FDQ0VTU19SRU1P
VEVfV1JJVEUNCj4gLSAgICAgICAgICAgICAgICAgICAgKTsNCj4gKyAgICAgICAgaWYgKHN0cmNt
cChsb2NhbC0+YmxvY2tbaV0uYmxvY2tfbmFtZSwicGMucmFtIikgPT0gMCkgew0KDQoncGMucmFt
JyBpcyBhbiB4ODYgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIG5hbWUsIHNvIHRoaXMgd2lsbCBzdGls
bCBsZWF2ZSBhIHByb2JsZW0gb24gb3RoZXIgYXJjaGl0ZWN0dXJlcyBJIGFzc3VtZS4NCg0KPiAr
ICAgICAgICAgICAgbG9jYWwtPmJsb2NrW2ldLm1yID0NCj4gKyAgICAgICAgICAgICAgICBpYnZf
cmVnX21yKHJkbWEtPnBkLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgbG9jYWwtPmJsb2Nr
W2ldLmxvY2FsX2hvc3RfYWRkciwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGxvY2FsLT5i
bG9ja1tpXS5sZW5ndGgsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBJQlZfQUNDRVNTX0xP
Q0FMX1dSSVRFIHwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIElCVl9BQ0NFU1NfUkVNT1RF
X1dSSVRFIHwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIElCVl9BQ0NFU1NfT05fREVNQU5E
IHwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIElCVl9BQ0NFU1NfSFVHRVRMQg0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgKTsNCj4gKyAgICAgICAgfSBlbHNlIHsNCj4gKyAgICAgICAg
ICAgIGxvY2FsLT5ibG9ja1tpXS5tciA9DQo+ICsgICAgICAgICAgICAgICAgaWJ2X3JlZ19tcihy
ZG1hLT5wZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGxvY2FsLT5ibG9ja1tpXS5sb2Nh
bF9ob3N0X2FkZHIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBsb2NhbC0+YmxvY2tbaV0u
bGVuZ3RoLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgSUJWX0FDQ0VTU19MT0NBTF9XUklU
RSB8DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBJQlZfQUNDRVNTX1JFTU9URV9XUklURQ0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgKTsNCj4gKyAgICAgICAgfQ0KPiArDQo+ICAgICAg
ICAgIGlmICghbG9jYWwtPmJsb2NrW2ldLm1yKSB7DQo+ICAgICAgICAgICAgICBwZXJyb3IoIkZh
aWxlZCB0byByZWdpc3RlciBsb2NhbCBkZXN0IHJhbSBibG9jayFcbiIpOw0KPiAgICAgICAgICAg
ICAgYnJlYWs7DQoNClJlZ2FyZHMsDQpEYW5pZWwNCi0tIA0KfDogaHR0cHM6Ly9iZXJyYW5nZS5j
b20gICAgICAtby0gICAgaHR0cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3MvZGJlcnJhbmdlIDp8
DQp8OiBodHRwczovL2xpYnZpcnQub3JnICAgICAgICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9m
c3RvcDEzOC5iZXJyYW5nZS5jb20gOnwNCnw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3JnICAg
IC1vLSAgICBodHRwczovL3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fA0KDQo=

