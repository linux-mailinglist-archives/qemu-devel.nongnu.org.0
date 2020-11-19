Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDCA2B92B0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 13:43:28 +0100 (CET)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjHb-0008VH-3P
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 07:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kfjGR-0007uL-Cg; Thu, 19 Nov 2020 07:42:15 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kfjGN-0002Ee-KN; Thu, 19 Nov 2020 07:42:14 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CcK6s6zP0z55YG;
 Thu, 19 Nov 2020 20:41:25 +0800 (CST)
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.128]) by
 DGGEMM403-HUB.china.huawei.com ([10.3.20.211]) with mapi id 14.03.0487.000;
 Thu, 19 Nov 2020 20:41:38 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by
 g_autofree need to be initialized
Thread-Topic: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by
 g_autofree need to be initialized
Thread-Index: AQHWvaH7LAlqtNTNq0CJSxOYz75c7KnOmeyAgACGw+D//3zDgIAArxFwgAAVFkA=
Date: Thu, 19 Nov 2020 12:41:37 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BA87090@dggemm531-mbx.china.huawei.com>
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
 <CAFEAcA81CeW=RdrABuAZx2pL6L-nE_AaQ2vbryqm7amUbRjM-g@mail.gmail.com>
 <7412CDE03601674DA8197E2EBD8937E83BA86327@dggemm531-mbx.china.huawei.com>
 <CAFEAcA9nwqj-7bDa5oPo9z8h9uaeHAC0dX-KdeZ6hkgZJQDqZA@mail.gmail.com> 
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga03-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 07:41:47
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Hao Wu <wuhaotsh@google.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiA+IE9uIFRodSwgMTkgTm92IDIwMjAgYXQgMDg6MzUsIENoZW5xdW4gKGt1aG4pDQo+IDxrdWhu
LmNoZW5xdW5AaHVhd2VpLmNvbT4NCj4gPiB3cm90ZToNCj4gPiA+DQo+ID4gPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gIHN0YXRpYyB2b2lkIHRpbV9hZGRfdGVzdChj
b25zdCBjaGFyICpuYW1lLCBjb25zdCBUZXN0RGF0YSAqdGQsDQo+ID4gPiA+ID4gR1Rlc3REYXRh
RnVuYyBmbikgIHsNCj4gPiA+ID4gPiAtICAgIGdfYXV0b2ZyZWUgY2hhciAqZnVsbF9uYW1lOw0K
PiA+ID4gPiA+IC0NCj4gPiA+ID4gPiAtICAgIGZ1bGxfbmFtZSA9DQo+ID4gZ19zdHJkdXBfcHJp
bnRmKCJucGNtN3h4X3RpbWVyL3RpbVslZF0vdGltZXJbJWRdLyVzIiwNCj4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aW1faW5kZXgodGQtPnRpbSksDQo+ID4gPiA+
IHRpbWVyX2luZGV4KHRkLT50aW1lciksDQo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbmFtZSk7DQo+ID4gPiA+ID4gKyAgICBnX2F1dG9mcmVlIGNoYXIgKmZ1bGxf
bmFtZSA9IGdfc3RyZHVwX3ByaW50ZigNCj4gPiA+ID4gPiArICAgICAgICAibnBjbTd4eF90aW1l
ci90aW1bJWRdL3RpbWVyWyVkXS8lcyIsDQo+IHRpbV9pbmRleCh0ZC0+dGltKSwNCj4gPiA+ID4g
PiArICAgICAgICB0aW1lcl9pbmRleCh0ZC0+dGltZXIpLCBuYW1lKTsNCj4gPiA+ID4NCj4gPiA+
ID4gV2hpY2ggY29tcGlsZXIgaXMgc28gdW5pbnRlbGxpZ2VudCB0aGF0IGl0IGNhbm5vdCBzZWUg
dGhhdCBhDQo+ID4gPiA+IGRlY2xhcmF0aW9uIGltbWVkaWF0ZWx5IGZvbGxvd2VkIGJ5IGFuIGFz
c2lnbm1lbnQgbXVzdCBhbHdheXMNCj4gPiA+ID4gaW5pdGlhbGl6ZQ0KPiA+IHRoZSB2YXJpYWJs
ZSA/Pz8NCj4gPiA+ID4NCj4gPiA+IEhpIFBldGVyLA0KPiA+ID4gICBHbGliIHJlcXVpcmVzIHRo
YXQgYWxsIGdfYXV0byogbWFjcm9zIG11c3QgYmUgaW5pdGlhbGl6ZWQuDQo+ID4gPg0KPiA+ID4g
aHR0cHM6Ly9kZXZlbG9wZXIuZ25vbWUub3JnL2dsaWIvc3RhYmxlL2dsaWItTWlzY2VsbGFuZW91
cy1NYWNyb3MuaHQNCj4gPiA+IG1sDQo+ID4gPiAjZy1hdXRvZnJlZQ0KPiA+DQo+ID4gWWVzLCBh
bmQgd2UgaW5pdGlhbGl6ZSBpdCB3aXRoIHRoZSAiZnVsbF9uYW1lID0gLi4uIiBsaW5lLg0KPiA+
IFRoZSBnX2F1dG9mcmVlIGRvY3VtZW50YXRpb24gc2F5cyAidGhpcyBtYWNybyBoYXMgc2ltaWxh
ciBjb25zdHJhaW50cw0KPiA+IGFzIGdfYXV0b3B0cigpIiwgYW5kIHRoZSBnX2F1dG9wdHIoKSBk
b2N1bWVudGF0aW9uIHNheXMgIllvdSBtdXN0DQo+ID4gaW5pdGlhbGlzZSB0aGUgdmFyaWFibGUg
aW4gc29tZSB3YXkg4oCUIGVpdGhlciBieSB1c2Ugb2YgYW4gaW5pdGlhbGlzZXINCj4gPiBvciBi
eSBlbnN1cmluZyB0aGF0IGl0IGlzIGFzc2lnbmVkIHRvIHVuY29uZGl0aW9uYWxseSBiZWZvcmUg
aXQgZ29lcyBvdXQgb2YNCj4gc2NvcGUuIg0KPiA+DQo+ID4gSW4gdGhpcyBjYXNlIHRoZSB0ZXN0
IGNvZGUgaXMgZG9pbmcgdGhlIHNlY29uZCBvZiB0aG9zZSB0d28gdGhpbmdzLg0KPiANCj4gRW1t
LCBtYXliZSBJIGRpZG4ndCBnZXQgaXQgcmlnaHQuIEkndmUgdHJpZWQgc29tZXRoaW5nIGFzIGZv
bGxvd2luZzoNCj4gVGhlcmUgYXJlIHRocmVlIHBpZWNlcyBvZiBjb2RlIGNvbXBsaWVkIGluIEdD
QzkuMyBhbmQgR0NDNy4zLg0KPiBDb2RlMe+8mg0KPiAgICBnX2F1dG9mcmVlIGNoYXIgKmZ1bGxf
bmFtZTsNCj4gICAgZnVsbF9uYW1lID0gZ19zdHJkdXBfcHJpbnRmKCJucGNtN3h4X3RpbWVyIik7
DQpJIGd1ZXNzIHRoZSBHQ0MgdGhpbmtzIHRoYXQgZ19zdHJkdXBfcHJpbnRmKCkgbWF5IGZhaWwg
dG8gYmUgZXhlY3V0ZWQuIEFmdGVyIHRoZSBmdW5jdGlvbiBmYWlscyB0byBiZSBleGVjdXRlZCwg
YW5kIG5vdCBnaXZlIGEgTlVMTCByZXR1cm4gdmFsdWUuDQpJZiB0aGlzIG9jY3VycywgZ19hdXRv
ZnJlZSB3aWxsIHN0aWxsIGV4ZWN1dGVzIGdfZnJlZSgqcHApLiAgU28sIGFuIHdhcm5pbmcgaXMg
Z2VuZXJhdGVkIGluIHRoZSBDb2RlMSBjYXNlLg0KDQpJbiB0aGUgZXhhbXBsZSBjb2RlIHByb3Zp
ZGVkIGJ5IGctYXV0b3B0cigpIGRvY3VtZW50YXRpb24sIHRoZSB2YWx1ZSBhc3NpZ25tZW50IHN0
YXRlbWVudCBvZiB0aGUgJ2Rpcm5hbWUnIHZhcmlhYmxlIHVzZXMgZ192YXJpYW50X2xvb2t1cF92
YWx1ZSgpLg0KSWYgdGhlIGdfdmFyaWFudF9sb29rdXBfdmFsdWUoKSBmdW5jdGlvbiBmYWlscyB0
byBiZSBleGVjdXRlZCwgYSBOVUxMIHZhbHVlIGlzIHJldHVybmVkLiBTbywgdGhpcyBleGFtcGxl
IGNvZGUgaXMgc2FmZS4NCmh0dHBzOi8vZGV2ZWxvcGVyLmdub21lLm9yZy9nbGliL3N0YWJsZS9n
bGliLU1pc2NlbGxhbmVvdXMtTWFjcm9zLmh0bWwjZy1hdXRvcHRyDQo+IA0KPiBDb2RlMjoNCj4g
ICAgZ19hdXRvZnJlZSBjaGFyICpmdWxsX25hbWUgPSBnX3N0cmR1cF9wcmludGYoIm5wY203eHhf
dGltZXIiKTsNCkluIHRoaXMgY2FzZSwgaWYgZ19zdHJkdXBfcHJpbnRmKCkgZmFpbHMsIHRoZSB2
YXJpYWJsZSBkZWZpbml0aW9uIGFsc28gZmFpbHMuIFNvLCB0aGUgQ29kZTIgaXMgc2FmZS4NCj4g
DQo+IENvZGUz77yaDQo+ICAgIGdfYXV0b2ZyZWUgY2hhciAqZnVsbF9uYW1lOw0KPiAgICBmdWxs
X25hbWUgPSBOVUxMOw0KPiANCj4gVGhlIHJlc3VsdCBpcyBhcyBmb2xsb3dzOg0KPiAgIENvZGUx
OiBBbiB3YXJuaWcgaXMgZ2VuZXJhdGVkIGZvciBHQ0M3LjMgb3IgR0NDOS4zLg0KPiANCj4gICBD
b2RlMiBhbmQgQ29kZTM6IG5vIGFueSB3YXJuaWcgd2hldGhlciBjb21waWxlciBpcyBHQ0M3LjMg
b3IgR0NDOS4zLg0KPiANCj4gSSBjYW5ub3QgZXhwbGFpbiB3aHkgdGhlIENvZGUxIHdhcm5pbmcg
aXMgZ2VuZXJhdGVkLiBCdXQgaXQgYWx3YXlzIGdlbmVyYXRlcw0KPiB3YXJuaW5nIG9uIHRoZSBH
Q0MgY29tcGlsZXIuDQoNClRoZSBhYm92ZSBhbmFseXNpcyBpcyBqdXN0IG15IG93biBndWVzcy4g
VGhhdCBtYXkgbm90IGJlIHRoZSB0cnV0aC4NCg0KVGhhbmtzLA0KQ2hlbiBRdW4NCg0KDQo=

