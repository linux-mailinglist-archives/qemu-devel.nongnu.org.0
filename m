Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508992B15A8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 06:55:29 +0100 (CET)
Received: from localhost ([::1]:36812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdS3T-0001CQ-Tx
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 00:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kdS2W-0000eb-Or; Fri, 13 Nov 2020 00:54:28 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kdS2T-0002zq-OT; Fri, 13 Nov 2020 00:54:28 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CXSMR6jSnz54QC;
 Fri, 13 Nov 2020 13:53:55 +0800 (CST)
Received: from DGGEMM511-MBS.china.huawei.com ([169.254.2.226]) by
 DGGEMM404-HUB.china.huawei.com ([10.3.20.212]) with mapi id 14.03.0487.000;
 Fri, 13 Nov 2020 13:53:57 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: [PATCH v2 4/5] plugins/loader: fix uninitialized variable
 warning in plugin_reset_uninstall()
Thread-Topic: [PATCH v2 4/5] plugins/loader: fix uninitialized variable
 warning in plugin_reset_uninstall()
Thread-Index: AQHWuDYb6OXdfSZfk0SbcQPzlPJ9f6nCqAqAgALBMsA=
Date: Fri, 13 Nov 2020 05:53:57 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BA6372B@dggemm511-mbs.china.huawei.com>
References: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
 <20201111142203.2359370-5-kuhn.chenqun@huawei.com>
 <87d00j7qqa.fsf@linaro.org>
In-Reply-To: <87d00j7qqa.fsf@linaro.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga02-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 00:54:07
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 ganqixin <ganqixin@huawei.com>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IEJlbm7DqWUgW21haWx0
bzphbGV4LmJlbm5lZUBsaW5hcm8ub3JnXQ0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMTIs
IDIwMjAgMToyMyBBTQ0KPiBUbzogQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3ZWku
Y29tPg0KPiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LXRyaXZpYWxAbm9uZ251Lm9y
ZzsNCj4gcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyBaaGFuZ2hhaWxpYW5nIDx6aGFuZy56aGFu
Z2hhaWxpYW5nQGh1YXdlaS5jb20+Ow0KPiBnYW5xaXhpbiA8Z2FucWl4aW5AaHVhd2VpLmNvbT47
IEV1bGVyIFJvYm90IDxldWxlci5yb2JvdEBodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDQvNV0gcGx1Z2lucy9sb2FkZXI6IGZpeCB1bmluaXRpYWxpemVkIHZhcmlhYmxlIHdh
cm5pbmcgaW4NCj4gcGx1Z2luX3Jlc2V0X3VuaW5zdGFsbCgpDQo+IA0KPiANCj4gQ2hlbiBRdW4g
PGt1aG4uY2hlbnF1bkBodWF3ZWkuY29tPiB3cml0ZXM6DQo+IA0KPiA+IEFmdGVyIHRoZSBXSVRI
X1FFTVVfTE9DS19HVUFSRCBtYWNybyBpcyBhZGRlZCwgdGhlIGNvbXBpbGVyIGNhbm5vdA0KPiA+
IGlkZW50aWZ5ICB0aGF0IHRoZSBzdGF0ZW1lbnRzIGluIHRoZSBtYWNybyBtdXN0IGJlIGV4ZWN1
dGVkLiBBcyBhDQo+ID4gcmVzdWx0LCBzb21lIHZhcmlhYmxlcyAgYXNzaWdubWVudCBzdGF0ZW1l
bnRzIGluIHRoZSBtYWNybyBtYXkgYmUNCj4gY29uc2lkZXJlZCBhcyB1bmV4ZWN1dGVkIGJ5IHRo
ZSBjb21waWxlci4NCj4gPg0KPiA+IFdoZW4gdGhlIC1XbWF5YmUtdW5pbml0aWFsaXplZCBjYXBh
YmlsaXR5IGlzIGVuYWJsZWQgb24gR0NDOSx0aGUgY29tcGlsZXINCj4gc2hvd2VkIHdhcm5pbmc6
DQo+ID4gcGx1Z2lucy9sb2FkZXIuYzogSW4gZnVuY3Rpb24g4oCYcGx1Z2luX3Jlc2V0X3VuaW5z
dGFsbOKAmToNCj4gPiBwbHVnaW5zL2xvYWRlci5jOjM4MjoxNTogd2FybmluZzog4oCYY3R44oCZ
IG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcw0KPiBmdW5jdGlvbiBbLVdtYXliZS11
bmluaXRpYWxpemVkXQ0KPiA+ICAzODIgfCAgICAgZGF0YS0+Y3R4ID0gY3R4Ow0KPiA+ICAgICAg
fCAgICAgfn5+fn5+fn5+fl5+fn5+DQo+ID4NCj4gPiBBZGQgYSBkZWZhdWx0IHZhbHVlIGZvciAn
ZXhwaXJlX3RpbWUnIHRvIHByZXZlbnRlZCB0aGUgd2FybmluZy4NCj4gPg0KPiA+IFJlcG9ydGVk
LWJ5OiBFdWxlciBSb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDaGVuIFF1biA8a3Vobi5jaGVucXVuQGh1YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gQ2M6
ICJBbGV4IEJlbm7DqWUiIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiA+IC0tLQ0KPiA+ICBw
bHVnaW5zL2xvYWRlci5jIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9wbHVnaW5zL2xvYWRlci5j
IGIvcGx1Z2lucy9sb2FkZXIuYyBpbmRleA0KPiA+IDhhYzVkYmMyMGYuLjg4NTkzZmUxMzggMTAw
NjQ0DQo+ID4gLS0tIGEvcGx1Z2lucy9sb2FkZXIuYw0KPiA+ICsrKyBiL3BsdWdpbnMvbG9hZGVy
LmMNCj4gPiBAQCAtMzY3LDcgKzM2Nyw3IEBAIHZvaWQgcGx1Z2luX3Jlc2V0X3VuaW5zdGFsbChx
ZW11X3BsdWdpbl9pZF90IGlkLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9v
bCByZXNldCkgIHsNCj4gPiAgICAgIHN0cnVjdCBxZW11X3BsdWdpbl9yZXNldF9kYXRhICpkYXRh
Ow0KPiA+IC0gICAgc3RydWN0IHFlbXVfcGx1Z2luX2N0eCAqY3R4Ow0KPiA+ICsgICAgc3RydWN0
IHFlbXVfcGx1Z2luX2N0eCAqY3R4ID0gTlVMTDsNCj4gDQo+IFRoaXMgZG9lc24ndCByZWFsbHkg
Zml4IGFueXRoaW5nIGJlY2F1c2UgeW91IHdvdWxkIGVuZCB1cCBmYXVsdGluZyBpZiB5b3UNCj4g
YXR0ZW1wdGVkIHRvIGRlLXJlZiBhIE5VTEwgY3R4LiBIb3dldmVyLi4uDQo+IA0KPiA+DQo+ID4g
ICAgICBXSVRIX1FFTVVfTE9DS19HVUFSRCgmcGx1Z2luLmxvY2spIHsNCj4gPiAgICAgICAgICBj
dHggPSBwbHVnaW5faWRfdG9fY3R4X2xvY2tlZChpZCk7DQo+IA0KPiAuLi50aGlzIGNhbid0IGZh
aWwuIElmIHRoZSBsb29rdXAgZmFpbGVkIGFuZCByZXR1cm5lZCBhIE5VTEwgcGx1Z2luIHRoZW4g
d2Ugd291bGQNCj4gYWJvcnQoKS4gU28gd2h5IGNhbid0IHRoZSBFdWxlciBSb2JvdCBzZWUgdGhh
dD8NCj4NCkhpIEFsZXggLA0KICBBcyB0aGUgY29tbWl0IG1lc3NhZ2Ugc2F5cywgdGhpcyB3YXJu
aW5nIGlzIHJlcG9ydGVkIGJ5IEdDQyA5LjMgY29tcGlsYXRpb24uDQpFdWxlclJvYm90IGNvbmZp
Z3VyZXMgdmFyaW91cyBjb21waWxhdGlvbiBvcHRpb25zIGFuZCB1c2VzIEdDQyBvciBDbGFuZyB0
byBjb21waWxhdGlvbiB0ZXN0cy4NCg0KVGhpcyB3YXJuaW5nIGhhcyBvY2N1cnJlZCBzaW5jZSBX
SVRIX1FFTVVfTE9DS19HVUFSRCB3YXMgYWRkZWQsIGJlY2F1c2UgdGhlIGN1cnJlbnQgY29tcGls
ZXIgdGhpbmtzIHRoYXQgdGhlIHN0YXRlbWVudHMgaW4gV0lUSF9RRU1VX0xPQ0tfR1VBUkR7IH0g
bWF5IG5vdCBiZSBleGVjdXRlZCBzdWNjZXNzZnVsbHkuDQpJbiBmYWN0LCBpdCBtYXkgYmUgd3Jv
bmcsIGJ1dCB0aGUgY3VycmVudCBjb21waWxlciBpcyBub3QgdmVyeSBzbWFydC4gU28sIHRoaXMg
cGF0Y2ggb25seSBhZGRzIGFuIGluaXRpYWxpemF0aW9uLCBpZiBpdCBkb2VzIG5vdCBoYXZlIGEg
YmFkIGVmZmVjdCwgaXQgY2FuIGZpeCB0aGUgd2FybmluZyB3aGljaCBtYXkgZXhpc3QgZm9yIGEg
bG9uZyB0aW1lLg0KDQpUaGFua3MsDQpDaGVuIFF1bg0KDQoNCg==

