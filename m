Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D53D2D203F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 02:44:18 +0100 (CET)
Received: from localhost ([::1]:48156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmS37-0003mO-83
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 20:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kmS1h-0003KJ-IP
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 20:42:49 -0500
Received: from smtp.h3c.com ([60.191.123.50]:52035 helo=h3cspam02-ex.h3c.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kmS1e-0005EU-9Q
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 20:42:49 -0500
Received: from DAG2EX01-BASE.srv.huawei-3com.com ([10.8.0.64])
 by h3cspam02-ex.h3c.com with ESMTP id 0B81gH55092947;
 Tue, 8 Dec 2020 09:42:17 +0800 (GMT-8)
 (envelope-from tu.guoyi@h3c.com)
Received: from DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66) by
 DAG2EX01-BASE.srv.huawei-3com.com (10.8.0.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 8 Dec 2020 09:42:18 +0800
Received: from DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074])
 by DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074%7])
 with mapi id 15.01.2106.002; Tue, 8 Dec 2020 09:42:18 +0800
From: Tuguoyi <tu.guoyi@h3c.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH v2] migration: Don't allow migration if vm is in
 POSTMIGRATE state
Thread-Topic: [PATCH v2] migration: Don't allow migration if vm is in
 POSTMIGRATE state
Thread-Index: AdbMarpfqkzuH/ZkR9WAT/cFh1Bw2f//pXwA//51mEA=
Date: Tue, 8 Dec 2020 01:42:18 +0000
Message-ID: <819126a3a53d42c1b3b5d5b9ba9fa3bd@h3c.com>
References: <d13857a6196c4bc8bbc6e3e290fc81fe@h3c.com>
 <0657571d-306d-1745-6b05-a5ddc0bc42bd@virtuozzo.com>
In-Reply-To: <0657571d-306d-1745-6b05-a5ddc0bc42bd@virtuozzo.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.125.108.131]
x-sender-location: DAG2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com 0B81gH55092947
Received-SPF: pass client-ip=60.191.123.50; envelope-from=tu.guoyi@h3c.com;
 helo=h3cspam02-ex.h3c.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gRGVjZW1iZXIgMDcsIDIwMjAgNjowNiBQTSBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5
IHdyb3RlOg0KPiAwNy4xMi4yMDIwIDEwOjQ0LCBUdWd1b3lpIHdyb3RlOg0KPiA+IFRoZSBmb2xs
b3dpbmcgc3RlcHMgd2lsbCBjYXVzZSBxZW11IGFzc2VydGlvbiBmYWlsdXJlOg0KPiA+IC0gcGF1
c2Ugdm0gYnkgZXhlY3V0aW5nICd2aXJzaCBzdXNwZW5kJw0KPiA+IC0gY3JlYXRlIGV4dGVybmFs
IHNuYXBzaG90IG9mIG1lbW9yeSBhbmQgZGlzayB1c2luZyAndmlyc2gNCj4gc25hcHNob3QtY3Jl
YXRlLWFzJw0KPiA+IC0gZG9pbmcgdGhlIGFib3ZlIG9wZXJhdGlvbiBhZ2FpbiB3aWxsIGNhdXNl
IHFlbXUgY3Jhc2gNCj4gPg0KPiA+IFRoZSBiYWNrdHJhY2UgbG9va3MgbGlrZToNCj4gPiAjMCAg
MHgwMDAwN2ZiZjk1OGM1YzM3IGluIHJhaXNlICgpIGZyb20gL2xpYi94ODZfNjQtbGludXgtZ251
L2xpYmMuc28uNg0KPiA+ICMxICAweDAwMDA3ZmJmOTU4YzkwMjggaW4gYWJvcnQgKCkgZnJvbSAv
bGliL3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42DQo+ID4gIzIgIDB4MDAwMDdmYmY5NThiZWJm
NiBpbiA/PyAoKSBmcm9tIC9saWIveDg2XzY0LWxpbnV4LWdudS9saWJjLnNvLjYNCj4gPiAjMyAg
MHgwMDAwN2ZiZjk1OGJlY2EyIGluIF9fYXNzZXJ0X2ZhaWwgKCkgZnJvbQ0KPiAvbGliL3g4Nl82
NC1saW51eC1nbnUvbGliYy5zby42DQo+ID4gIzQgIDB4MDAwMDU1Y2E4ZGVjZDM5ZCBpbiBiZHJ2
X2luYWN0aXZhdGVfcmVjdXJzZSAoYnM9MHg1NWNhOTBjODA0MDApDQo+IGF0IC9idWlsZC9xZW11
LTUuMC9ibG9jay5jOjU3MjQNCj4gPiAjNSAgMHgwMDAwNTVjYThkZWNlOTY3IGluIGJkcnZfaW5h
Y3RpdmF0ZV9hbGwgKCkgYXQNCj4gL2J1aWxkLy9xZW11LTUuMC9ibG9jay5jOjU3OTINCj4gPiAj
NiAgMHgwMDAwNTVjYThkZTU1MzlkIGluDQo+IHFlbXVfc2F2ZXZtX3N0YXRlX2NvbXBsZXRlX3By
ZWNvcHlfbm9uX2l0ZXJhYmxlIChpbmFjdGl2YXRlX2Rpc2tzPXRydWUsDQo+IGluX3Bvc3Rjb3B5
PWZhbHNlLCBmPTB4NTVjYTkwNzA0NGIwKQ0KPiA+ICAgICAgYXQgL2J1aWxkL3FlbXUtNS4wL21p
Z3JhdGlvbi9zYXZldm0uYzoxNDAxDQo+ID4gIzcgIHFlbXVfc2F2ZXZtX3N0YXRlX2NvbXBsZXRl
X3ByZWNvcHkgKGY9MHg1NWNhOTA3MDQ0YjAsDQo+IGl0ZXJhYmxlX29ubHk9aXRlcmFibGVfb25s
eUBlbnRyeT1mYWxzZSwNCj4gaW5hY3RpdmF0ZV9kaXNrcz1pbmFjdGl2YXRlX2Rpc2tzQGVudHJ5
PXRydWUpDQo+ID4gICAgICBhdCAvYnVpbGQvcWVtdS01LjAvbWlncmF0aW9uL3NhdmV2bS5jOjE0
NTMNCj4gPiAjOCAgMHgwMDAwNTVjYThkZTRmNTgxIGluIG1pZ3JhdGlvbl9jb21wbGV0aW9uIChz
PTB4NTVjYThmNjRkOWYwKSBhdA0KPiAvYnVpbGQvcWVtdS01LjAvbWlncmF0aW9uL21pZ3JhdGlv
bi5jOjI5NDENCj4gPiAjOSAgbWlncmF0aW9uX2l0ZXJhdGlvbl9ydW4gKHM9MHg1NWNhOGY2NGQ5
ZjApIGF0DQo+IC9idWlsZC9xZW11LTUuMC9taWdyYXRpb24vbWlncmF0aW9uLmM6MzI5NQ0KPiA+
ICMxMCBtaWdyYXRpb25fdGhyZWFkIChvcGFxdWU9b3BhcXVlQGVudHJ5PTB4NTVjYThmNjRkOWYw
KSBhdA0KPiAvYnVpbGQvcWVtdS01LjAvbWlncmF0aW9uL21pZ3JhdGlvbi5jOjM0NTkNCj4gPiAj
MTEgMHgwMDAwNTVjYThkZmM2NzE2IGluIHFlbXVfdGhyZWFkX3N0YXJ0IChhcmdzPTxvcHRpbWl6
ZWQgb3V0PikgYXQNCj4gL2J1aWxkL3FlbXUtNS4wL3V0aWwvcWVtdS10aHJlYWQtcG9zaXguYzo1
MTkNCj4gPiAjMTIgMHgwMDAwN2ZiZjk1YzVmMTg0IGluIHN0YXJ0X3RocmVhZCAoKSBmcm9tDQo+
IC9saWIveDg2XzY0LWxpbnV4LWdudS9saWJwdGhyZWFkLnNvLjANCj4gPiAjMTMgMHgwMDAwN2Zi
Zjk1OThjYmVkIGluIGNsb25lICgpIGZyb20gL2xpYi94ODZfNjQtbGludXgtZ251L2xpYmMuc28u
Ng0KPiA+DQo+ID4gV2hlbiB0aGUgZmlyc3QgbWlncmF0aW9uIGNvbXBsZXRlcywgYnMtPm9wZW5f
ZmxhZ3Mgd2lsbCBzZXQNCj4gQkRSVl9PX0lOQUNUSVZFDQo+ID4gZmxhZyBieSBiZHJ2X2luYWN0
aXZhdGVfYWxsKCksIGFuZCBkdXJpbmcgdGhlIHNlY29uZCBtaWdyYXRpb24gdGhlDQo+ID4gYmRy
dl9pbmFjdGl2YXRlX3JlY3Vyc2UgYXNzZXJ0IHRoYXQgdGhlIGJzLT5vcGVuX2ZsYWdzIGlzIGFs
cmVhZHkNCj4gPiBCRFJWX09fSU5BQ1RJVkUgZW5hYmxlZCB3aGljaCBjYXVzZSBjcmFzaC4NCj4g
Pg0KPiA+IEFzIFZsYWRpbWlyIHN1Z2dlc3RlZCwgdGhpcyBwYXRjaCBqdXN0IG1ha2UgbWlncmF0
aW9uIGpvYiBlcnJvci1vdXQgd2l0aCBhDQo+ID4gbWVzc2FnZSBpbiAgbWlncmF0ZV9mZF9jb25u
ZWN0KCkgaWYgdGhlIHZtIGlzIGluDQo+IFJVTl9TVEFURV9QT1NUTUlHUkFURSBzdGF0ZS4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFR1Z3VveWkgPHR1Lmd1b3lpQGgzYy5jb20+DQo+ID4gLS0t
DQo+ID4gICBtaWdyYXRpb24vbWlncmF0aW9uLmMgfCA3ICsrKysrKysNCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9taWdyYXRpb24v
bWlncmF0aW9uLmMgYi9taWdyYXRpb24vbWlncmF0aW9uLmMNCj4gPiBpbmRleCA4N2E5YjU5Li40
MDkxNjc4IDEwMDY0NA0KPiA+IC0tLSBhL21pZ3JhdGlvbi9taWdyYXRpb24uYw0KPiA+ICsrKyBi
L21pZ3JhdGlvbi9taWdyYXRpb24uYw0KPiA+IEBAIC0zNjIyLDYgKzM2MjIsMTMgQEAgdm9pZCBt
aWdyYXRlX2ZkX2Nvbm5lY3QoTWlncmF0aW9uU3RhdGUgKnMsDQo+IEVycm9yICplcnJvcl9pbikN
Cj4gPiAgICAgICAgICAgcmV0dXJuOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+ICsgICAgaWYgKHJ1
bnN0YXRlX2NoZWNrKFJVTl9TVEFURV9QT1NUTUlHUkFURSkpIHsNCj4gPiArICAgICAgICBlcnJv
cl9yZXBvcnQoIkNhbid0IG1pZ3JhdGUgdGhlIHZtIHRoYXQgaXMgaW4gUE9TVE1JR1JBVEUNCj4g
c3RhdGUiKTsNCj4gPiArICAgICAgICBtaWdyYXRlX3NldF9zdGF0ZSgmcy0+c3RhdGUsIHMtPnN0
YXRlLA0KPiBNSUdSQVRJT05fU1RBVFVTX0ZBSUxFRCk7DQo+ID4gKyAgICAgICAgbWlncmF0ZV9m
ZF9jbGVhbnVwKHMpOw0KPiA+ICsgICAgICAgIHJldHVybjsNCj4gPiArICAgIH0NCj4gPiArDQo+
ID4gICAgICAgaWYgKHJlc3VtZSkgew0KPiA+ICAgICAgICAgICAvKiBUaGlzIGlzIGEgcmVzdW1l
ZCBtaWdyYXRpb24gKi8NCj4gPiAgICAgICAgICAgcmF0ZV9saW1pdCA9IHMtPnBhcmFtZXRlcnMu
bWF4X3Bvc3Rjb3B5X2JhbmR3aWR0aCAvDQo+ID4NCj4gDQo+IA0KPiBJIHRoaW5rLCBjb3JyZWN0
IHBsYWNlIGZvciB0aGUgY2hlY2sgbWlncmF0ZV9wcmVwYXJlLCBhcyBpdCBpcyBjYWxsZWQgZm9y
IGFueSBraW5kDQo+IG9mIG1pZ3JhdGlvbiwgbm90IG9ubHkgZmRfLiBBbmQgaW4gaXQgd2UgaGF2
ZSBhbHJlYWR5IGNoZWNrIGZvciB3cm9uZyBzdGF0ZToNCj4gDQo+ICAgICAgICBpZiAocnVuc3Rh
dGVfY2hlY2soUlVOX1NUQVRFX0lOTUlHUkFURSkpIHsNCj4gICAgICAgICAgICBlcnJvcl9zZXRn
KGVycnAsICJHdWVzdCBpcyB3YWl0aW5nIGZvciBhbiBpbmNvbWluZyBtaWdyYXRpb24iKTsNCj4g
ICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+ICAgICAgICB9DQo+IA0KPiBhbmQgbm8gYWRkaXRp
b25hbCBzdGF0ZSBjaGFuZ2UgYW5kIGNsZWFudXAgaXMgbmVlZGVkLg0KDQpUaGFuayB5b3UgZm9y
IHlvdXIgYWR2aXNlLCBJJ2xsIHNlbmQgYW5vdGhlciBwYXRjaC4gDQoNCj4gLS0NCj4gQmVzdCBy
ZWdhcmRzLA0KPiBWbGFkaW1pcg0K

