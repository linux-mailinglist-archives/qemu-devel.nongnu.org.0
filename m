Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49D02B90E0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:24:45 +0100 (CET)
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfi3Q-0008UY-Fu
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kfi1i-00082s-Me; Thu, 19 Nov 2020 06:22:58 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kfi1c-0007b3-98; Thu, 19 Nov 2020 06:22:58 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CcHMh4PzSz566J;
 Thu, 19 Nov 2020 19:22:24 +0800 (CST)
Received: from DGGEMM423-HUB.china.huawei.com (10.1.198.40) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 19 Nov 2020 19:22:39 +0800
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.128]) by
 dggemm423-hub.china.huawei.com ([10.1.198.40]) with mapi id 14.03.0487.000;
 Thu, 19 Nov 2020 19:22:32 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by
 g_autofree need to be initialized
Thread-Topic: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by
 g_autofree need to be initialized
Thread-Index: AQHWvaH7LAlqtNTNq0CJSxOYz75c7KnOmeyAgACGw+D//3zDgIAArxFw
Date: Thu, 19 Nov 2020 11:22:31 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BA869D1@dggemm531-mbx.china.huawei.com>
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
 <CAFEAcA81CeW=RdrABuAZx2pL6L-nE_AaQ2vbryqm7amUbRjM-g@mail.gmail.com>
 <7412CDE03601674DA8197E2EBD8937E83BA86327@dggemm531-mbx.china.huawei.com>
 <CAFEAcA9nwqj-7bDa5oPo9z8h9uaeHAC0dX-KdeZ6hkgZJQDqZA@mail.gmail.com>
In-Reply-To: <CAFEAcA9nwqj-7bDa5oPo9z8h9uaeHAC0dX-KdeZ6hkgZJQDqZA@mail.gmail.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 06:22:41
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Hao Wu <wuhaotsh@google.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWls
dG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIg
MTksIDIwMjAgNDozOSBQTQ0KPiBUbzogQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3
ZWkuY29tPg0KPiBDYzogUUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBR
RU1VIFRyaXZpYWwNCj4gPHFlbXUtdHJpdmlhbEBub25nbnUub3JnPjsgSGFvIFd1IDx3dWhhb3Rz
aEBnb29nbGUuY29tPjsgSGF2YXJkDQo+IFNraW5uZW1vZW4gPGhza2lubmVtb2VuQGdvb2dsZS5j
b20+OyBaaGFuZ2hhaWxpYW5nDQo+IDx6aGFuZy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20+OyBU
aG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT47DQo+IExhdXJlbnQgVml2aWVyIDxsdml2aWVy
QHJlZGhhdC5jb20+OyBFdWxlciBSb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSC1mb3ItNS4yPyAxLzJdIHRlc3RzL3F0ZXN0OiB2YXJpYWJsZSBkZWZp
bmVkIGJ5IGdfYXV0b2ZyZWUNCj4gbmVlZCB0byBiZSBpbml0aWFsaXplZA0KPiANCj4gT24gVGh1
LCAxOSBOb3YgMjAyMCBhdCAwODozNSwgQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3
ZWkuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiA+ID4gIHN0YXRpYyB2b2lkIHRpbV9hZGRfdGVzdChjb25zdCBjaGFyICpuYW1lLCBjb25z
dCBUZXN0RGF0YSAqdGQsDQo+ID4gPiA+IEdUZXN0RGF0YUZ1bmMgZm4pICB7DQo+ID4gPiA+IC0g
ICAgZ19hdXRvZnJlZSBjaGFyICpmdWxsX25hbWU7DQo+ID4gPiA+IC0NCj4gPiA+ID4gLSAgICBm
dWxsX25hbWUgPQ0KPiBnX3N0cmR1cF9wcmludGYoIm5wY203eHhfdGltZXIvdGltWyVkXS90aW1l
clslZF0vJXMiLA0KPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aW1f
aW5kZXgodGQtPnRpbSksDQo+ID4gPiB0aW1lcl9pbmRleCh0ZC0+dGltZXIpLA0KPiA+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuYW1lKTsNCj4gPiA+ID4gKyAgICBnX2F1
dG9mcmVlIGNoYXIgKmZ1bGxfbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigNCj4gPiA+ID4gKyAgICAg
ICAgIm5wY203eHhfdGltZXIvdGltWyVkXS90aW1lclslZF0vJXMiLCB0aW1faW5kZXgodGQtPnRp
bSksDQo+ID4gPiA+ICsgICAgICAgIHRpbWVyX2luZGV4KHRkLT50aW1lciksIG5hbWUpOw0KPiA+
ID4NCj4gPiA+IFdoaWNoIGNvbXBpbGVyIGlzIHNvIHVuaW50ZWxsaWdlbnQgdGhhdCBpdCBjYW5u
b3Qgc2VlIHRoYXQgYQ0KPiA+ID4gZGVjbGFyYXRpb24gaW1tZWRpYXRlbHkgZm9sbG93ZWQgYnkg
YW4gYXNzaWdubWVudCBtdXN0IGFsd2F5cyBpbml0aWFsaXplDQo+IHRoZSB2YXJpYWJsZSA/Pz8N
Cj4gPiA+DQo+ID4gSGkgUGV0ZXIsDQo+ID4gICBHbGliIHJlcXVpcmVzIHRoYXQgYWxsIGdfYXV0
byogbWFjcm9zIG11c3QgYmUgaW5pdGlhbGl6ZWQuDQo+ID4NCj4gPiBodHRwczovL2RldmVsb3Bl
ci5nbm9tZS5vcmcvZ2xpYi9zdGFibGUvZ2xpYi1NaXNjZWxsYW5lb3VzLU1hY3Jvcy5odG1sDQo+
ID4gI2ctYXV0b2ZyZWUNCj4gDQo+IFllcywgYW5kIHdlIGluaXRpYWxpemUgaXQgd2l0aCB0aGUg
ImZ1bGxfbmFtZSA9IC4uLiIgbGluZS4NCj4gVGhlIGdfYXV0b2ZyZWUgZG9jdW1lbnRhdGlvbiBz
YXlzICJ0aGlzIG1hY3JvIGhhcyBzaW1pbGFyIGNvbnN0cmFpbnRzIGFzDQo+IGdfYXV0b3B0cigp
IiwgYW5kIHRoZSBnX2F1dG9wdHIoKSBkb2N1bWVudGF0aW9uIHNheXMgIllvdSBtdXN0IGluaXRp
YWxpc2UgdGhlDQo+IHZhcmlhYmxlIGluIHNvbWUgd2F5IOKAlCBlaXRoZXIgYnkgdXNlIG9mIGFu
IGluaXRpYWxpc2VyIG9yIGJ5IGVuc3VyaW5nIHRoYXQgaXQgaXMNCj4gYXNzaWduZWQgdG8gdW5j
b25kaXRpb25hbGx5IGJlZm9yZSBpdCBnb2VzIG91dCBvZiBzY29wZS4iDQo+IA0KPiBJbiB0aGlz
IGNhc2UgdGhlIHRlc3QgY29kZSBpcyBkb2luZyB0aGUgc2Vjb25kIG9mIHRob3NlIHR3byB0aGlu
Z3MuDQoNCkVtbSwgbWF5YmUgSSBkaWRuJ3QgZ2V0IGl0IHJpZ2h0LiBJJ3ZlIHRyaWVkIHNvbWV0
aGluZyBhcyBmb2xsb3dpbmc6DQpUaGVyZSBhcmUgdGhyZWUgcGllY2VzIG9mIGNvZGUgY29tcGxp
ZWQgaW4gR0NDOS4zIGFuZCBHQ0M3LjMuDQpDb2RlMe+8mg0KICAgZ19hdXRvZnJlZSBjaGFyICpm
dWxsX25hbWU7DQogICBmdWxsX25hbWUgPSBnX3N0cmR1cF9wcmludGYoIm5wY203eHhfdGltZXIi
KTsNCg0KQ29kZTI6DQogICBnX2F1dG9mcmVlIGNoYXIgKmZ1bGxfbmFtZSA9IGdfc3RyZHVwX3By
aW50ZigibnBjbTd4eF90aW1lciIpOw0KDQpDb2RlM++8mg0KICAgZ19hdXRvZnJlZSBjaGFyICpm
dWxsX25hbWU7DQogICBmdWxsX25hbWUgPSBOVUxMOw0KDQpUaGUgcmVzdWx0IGlzIGFzIGZvbGxv
d3M6DQogIENvZGUxOiBBbiB3YXJuaWcgaXMgZ2VuZXJhdGVkIGZvciBHQ0M3LjMgb3IgR0NDOS4z
Lg0KDQogIENvZGUyIGFuZCBDb2RlMzogbm8gYW55IHdhcm5pZyB3aGV0aGVyIGNvbXBpbGVyIGlz
IEdDQzcuMyBvciBHQ0M5LjMuDQoNCkkgY2Fubm90IGV4cGxhaW4gd2h5IHRoZSBDb2RlMSB3YXJu
aW5nIGlzIGdlbmVyYXRlZC4gQnV0IGl0IGFsd2F5cyBnZW5lcmF0ZXMgd2FybmluZyBvbiB0aGUg
R0NDIGNvbXBpbGVyLg0KDQpUaGFua3MsDQpDaGVuIFF1bg0KDQoNCg0KDQoNCg0KDQoNCg0KDQo=

