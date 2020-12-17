Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BD72DCCFC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 08:33:03 +0100 (CET)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpnmY-0008R8-CU
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 02:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kpnkE-0007fF-Ld
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:30:38 -0500
Received: from smtp.h3c.com ([60.191.123.56]:52037 helo=h3cspam01-ex.h3c.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kpnk8-0004PN-0q
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:30:38 -0500
Received: from DAG2EX10-IDC.srv.huawei-3com.com ([10.8.0.73])
 by h3cspam01-ex.h3c.com with ESMTP id 0BH7Tdfl067947;
 Thu, 17 Dec 2020 15:29:40 +0800 (GMT-8)
 (envelope-from tu.guoyi@h3c.com)
Received: from DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66) by
 DAG2EX10-IDC.srv.huawei-3com.com (10.8.0.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 17 Dec 2020 15:29:42 +0800
Received: from DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074])
 by DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074%7])
 with mapi id 15.01.2106.002; Thu, 17 Dec 2020 15:29:42 +0800
From: Tuguoyi <tu.guoyi@h3c.com>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Subject: RE: [PATCH v3] migration: Don't allow migration if vm is in
 POSTMIGRATE
Thread-Topic: [PATCH v3] migration: Don't allow migration if vm is in
 POSTMIGRATE
Thread-Index: AdbNA412vEo+hmt0TmuQR+h7GaeR1gA79n2AAZSRXGA=
Date: Thu, 17 Dec 2020 07:29:42 +0000
Message-ID: <9653de6ebacb4b0ea42cf7d2e6d68d84@h3c.com>
References: <6b704294ad2e405781c38fb38d68c744@h3c.com>
 <CAM9Jb+jhfBqFurCQj_XpoP0cEOU9oiZcO9xrWm3GA3NAxcCdEg@mail.gmail.com>
In-Reply-To: <CAM9Jb+jhfBqFurCQj_XpoP0cEOU9oiZcO9xrWm3GA3NAxcCdEg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.125.108.131]
x-sender-location: DAG2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: h3cspam01-ex.h3c.com 0BH7Tdfl067947
Received-SPF: pass client-ip=60.191.123.56; envelope-from=tu.guoyi@h3c.com;
 helo=h3cspam01-ex.h3c.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "vsementsov@virtuozzo.com" <vsementsov@virtuozzo.com>,
 "tuguoyi@outlook.com" <tuguoyi@outlook.com>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Li Zhang <li.zhang@cloud.ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGluZy4gDQpJdCBzZWVtcyBubyBvbmUgaGFuZGxlIHRoaXMgcGF0Y2guIA0KDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFua2FqIEd1cHRhIFttYWlsdG86cGFua2Fq
Lmd1cHRhLmxpbnV4QGdtYWlsLmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAwOSwg
MjAyMCAxMDoyMSBQTQ0KPiBUbzogdHVndW95aSAoQ2xvdWQpIDx0dS5ndW95aUBoM2MuY29tPg0K
PiBDYzogSnVhbiBRdWludGVsYSA8cXVpbnRlbGFAcmVkaGF0LmNvbT47IERyLiBEYXZpZCBBbGFu
IEdpbGJlcnQNCj4gPGRnaWxiZXJ0QHJlZGhhdC5jb20+OyB2c2VtZW50c292QHZpcnR1b3p6by5j
b207DQo+IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgTGkgWmhhbmcgPGxpLnpoYW5nQGNsb3VkLmlv
bm9zLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10gbWlncmF0aW9uOiBEb24ndCBhbGxv
dyBtaWdyYXRpb24gaWYgdm0gaXMgaW4NCj4gUE9TVE1JR1JBVEUNCj4gDQo+ID4gVGhlIGZvbGxv
d2luZyBzdGVwcyB3aWxsIGNhdXNlIHFlbXUgYXNzZXJ0aW9uIGZhaWx1cmU6DQo+ID4gLSBwYXVz
ZSB2bSBieSBleGVjdXRpbmcgJ3ZpcnNoIHN1c3BlbmQnDQo+ID4gLSBjcmVhdGUgZXh0ZXJuYWwg
c25hcHNob3Qgb2YgbWVtb3J5IGFuZCBkaXNrIHVzaW5nICd2aXJzaA0KPiBzbmFwc2hvdC1jcmVh
dGUtYXMnDQo+ID4gLSBkb2luZyB0aGUgYWJvdmUgb3BlcmF0aW9uIGFnYWluIHdpbGwgY2F1c2Ug
cWVtdSBjcmFzaA0KPiA+DQo+ID4gVGhlIGJhY2t0cmFjZSBsb29rcyBsaWtlOg0KPiA+ICMwICAw
eDAwMDA3ZmJmOTU4YzVjMzcgaW4gcmFpc2UgKCkgZnJvbSAvbGliL3g4Nl82NC1saW51eC1nbnUv
bGliYy5zby42DQo+ID4gIzEgIDB4MDAwMDdmYmY5NThjOTAyOCBpbiBhYm9ydCAoKSBmcm9tIC9s
aWIveDg2XzY0LWxpbnV4LWdudS9saWJjLnNvLjYNCj4gPiAjMiAgMHgwMDAwN2ZiZjk1OGJlYmY2
IGluID8/ICgpIGZyb20gL2xpYi94ODZfNjQtbGludXgtZ251L2xpYmMuc28uNg0KPiA+ICMzICAw
eDAwMDA3ZmJmOTU4YmVjYTIgaW4gX19hc3NlcnRfZmFpbCAoKSBmcm9tDQo+IC9saWIveDg2XzY0
LWxpbnV4LWdudS9saWJjLnNvLjYNCj4gPiAjNCAgMHgwMDAwNTVjYThkZWNkMzlkIGluIGJkcnZf
aW5hY3RpdmF0ZV9yZWN1cnNlIChicz0weDU1Y2E5MGM4MDQwMCkNCj4gYXQgL2J1aWxkL3FlbXUt
NS4wL2Jsb2NrLmM6NTcyNA0KPiA+ICM1ICAweDAwMDA1NWNhOGRlY2U5NjcgaW4gYmRydl9pbmFj
dGl2YXRlX2FsbCAoKSBhdA0KPiAvYnVpbGQvL3FlbXUtNS4wL2Jsb2NrLmM6NTc5Mg0KPiA+ICM2
ICAweDAwMDA1NWNhOGRlNTUzOWQgaW4NCj4gcWVtdV9zYXZldm1fc3RhdGVfY29tcGxldGVfcHJl
Y29weV9ub25faXRlcmFibGUgKGluYWN0aXZhdGVfZGlza3M9dHJ1ZSwNCj4gaW5fcG9zdGNvcHk9
ZmFsc2UsIGY9MHg1NWNhOTA3MDQ0YjApDQo+ID4gICAgIGF0IC9idWlsZC9xZW11LTUuMC9taWdy
YXRpb24vc2F2ZXZtLmM6MTQwMQ0KPiA+ICM3ICBxZW11X3NhdmV2bV9zdGF0ZV9jb21wbGV0ZV9w
cmVjb3B5IChmPTB4NTVjYTkwNzA0NGIwLA0KPiBpdGVyYWJsZV9vbmx5PWl0ZXJhYmxlX29ubHlA
ZW50cnk9ZmFsc2UsDQo+IGluYWN0aXZhdGVfZGlza3M9aW5hY3RpdmF0ZV9kaXNrc0BlbnRyeT10
cnVlKQ0KPiA+ICAgICBhdCAvYnVpbGQvcWVtdS01LjAvbWlncmF0aW9uL3NhdmV2bS5jOjE0NTMN
Cj4gPiAjOCAgMHgwMDAwNTVjYThkZTRmNTgxIGluIG1pZ3JhdGlvbl9jb21wbGV0aW9uIChzPTB4
NTVjYThmNjRkOWYwKSBhdA0KPiAvYnVpbGQvcWVtdS01LjAvbWlncmF0aW9uL21pZ3JhdGlvbi5j
OjI5NDENCj4gPiAjOSAgbWlncmF0aW9uX2l0ZXJhdGlvbl9ydW4gKHM9MHg1NWNhOGY2NGQ5ZjAp
IGF0DQo+IC9idWlsZC9xZW11LTUuMC9taWdyYXRpb24vbWlncmF0aW9uLmM6MzI5NQ0KPiA+ICMx
MCBtaWdyYXRpb25fdGhyZWFkIChvcGFxdWU9b3BhcXVlQGVudHJ5PTB4NTVjYThmNjRkOWYwKSBh
dA0KPiAvYnVpbGQvcWVtdS01LjAvbWlncmF0aW9uL21pZ3JhdGlvbi5jOjM0NTkNCj4gPiAjMTEg
MHgwMDAwNTVjYThkZmM2NzE2IGluIHFlbXVfdGhyZWFkX3N0YXJ0IChhcmdzPTxvcHRpbWl6ZWQg
b3V0PikgYXQNCj4gL2J1aWxkL3FlbXUtNS4wL3V0aWwvcWVtdS10aHJlYWQtcG9zaXguYzo1MTkN
Cj4gPiAjMTIgMHgwMDAwN2ZiZjk1YzVmMTg0IGluIHN0YXJ0X3RocmVhZCAoKSBmcm9tDQo+IC9s
aWIveDg2XzY0LWxpbnV4LWdudS9saWJwdGhyZWFkLnNvLjANCj4gPiAjMTMgMHgwMDAwN2ZiZjk1
OThjYmVkIGluIGNsb25lICgpIGZyb20gL2xpYi94ODZfNjQtbGludXgtZ251L2xpYmMuc28uNg0K
PiA+DQo+ID4gV2hlbiB0aGUgZmlyc3QgbWlncmF0aW9uIGNvbXBsZXRlcywgYnMtPm9wZW5fZmxh
Z3Mgd2lsbCBzZXQNCj4gQkRSVl9PX0lOQUNUSVZFDQo+ID4gZmxhZyBieSBiZHJ2X2luYWN0aXZh
dGVfYWxsKCksIGFuZCBkdXJpbmcgdGhlIHNlY29uZCBtaWdyYXRpb24gdGhlDQo+ID4gYmRydl9p
bmFjdGl2YXRlX3JlY3Vyc2UgYXNzZXJ0IHRoYXQgdGhlIGJzLT5vcGVuX2ZsYWdzIGlzIGFscmVh
ZHkNCj4gPiBCRFJWX09fSU5BQ1RJVkUgZW5hYmxlZCB3aGljaCBjYXVzZSBjcmFzaC4NCj4gPg0K
PiA+IEFzIFZsYWRpbWlyIHN1Z2dlc3RlZCwgdGhpcyBwYXRjaCBtYWtlcyBtaWdyYXRlX3ByZXBh
cmUgY2hlY2sgdGhlIHN0YXRlIG9mDQo+IHZtIGFuZA0KPiA+IHJldHVybiBlcnJvciBpZiBpdCBp
cyBpbiBSVU5fU1RBVEVfUE9TVE1JR1JBVEUgc3RhdGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBUdWd1b3lpIDx0dS5ndW95aUBoM2MuY29tPg0KPiBTaW1pbGFyIGlzc3VlIGlzIHJlcG9ydGVk
IGJ5IExpIFpoYW5nKCtDQykgd2l0aCBhbG1vc3Qgc2FtZSBwYXRjaFszXQ0KPiB0byBmaXggdGhp
cy4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBMaSBaaGFuZyA8bGkuemhhbmdAY2xvdWQuaW9ub3MuY29t
Pg0KPiBSZXZpZXdlZC1ieTogUGFua2FqIEd1cHRhIDxwYW5rYWouZ3VwdGFAY2xvdWQuaW9ub3Mu
Y29tPg0KPiANCj4gWzNdIGh0dHBzOi8vbWFyYy5pbmZvLz9sPXFlbXUtZGV2ZWwmbT0xNjA3NDk4
NTk4MzEzNTcmdz0yDQo+ID4gLS0tDQo+ID4gIG1pZ3JhdGlvbi9taWdyYXRpb24uYyB8IDYgKysr
KysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9taWdyYXRpb24vbWlncmF0aW9uLmMgYi9taWdyYXRpb24vbWlncmF0aW9uLmMNCj4g
PiBpbmRleCA4N2E5YjU5Li41ZTMzOTYyIDEwMDY0NA0KPiA+IC0tLSBhL21pZ3JhdGlvbi9taWdy
YXRpb24uYw0KPiA+ICsrKyBiL21pZ3JhdGlvbi9taWdyYXRpb24uYw0KPiA+IEBAIC0yMTE1LDYg
KzIxMTUsMTIgQEAgc3RhdGljIGJvb2wgbWlncmF0ZV9wcmVwYXJlKE1pZ3JhdGlvblN0YXRlICpz
LA0KPiBib29sIGJsaywgYm9vbCBibGtfaW5jLA0KPiA+ICAgICAgICAgIHJldHVybiBmYWxzZTsN
Cj4gPiAgICAgIH0NCj4gPg0KPiA+ICsgICAgaWYgKHJ1bnN0YXRlX2NoZWNrKFJVTl9TVEFURV9Q
T1NUTUlHUkFURSkpIHsNCj4gPiArICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJDYW4ndCBtaWdy
YXRlIHRoZSB2bSB0aGF0IHdhcyBwYXVzZWQgZHVlIHRvICINCj4gPiArICAgICAgICAgICAgICAg
ICAgICJwcmV2aW91cyBtaWdyYXRpb24iKTsNCj4gPiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+
ID4gKyAgICB9DQo+ID4gKw0KPiA+ICAgICAgaWYgKG1pZ3JhdGlvbl9pc19ibG9ja2VkKGVycnAp
KSB7DQo+ID4gICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiA+ICAgICAgfQ0KPiA+IC0tDQo+ID4g
Mi43LjQNCj4gPg0KPiA+IFtQYXRjaCB2Ml06DQo+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNo
aXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIwLTEyL21zZzAxMzE4Lmh0bWwNCj4gPiBbUGF0Y2ggdjFd
Og0KPiBodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMC0x
MS9tc2cwNTk1MC5odG1sDQo=

