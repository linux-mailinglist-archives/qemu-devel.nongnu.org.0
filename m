Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55B2B7DAA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 13:34:20 +0100 (CET)
Received: from localhost ([::1]:56302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfMfD-0002cc-Sf
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 07:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kfMe7-0001j4-AB; Wed, 18 Nov 2020 07:33:12 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kfMe4-0003x1-EB; Wed, 18 Nov 2020 07:33:11 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CbhzM4bGFzQsSw;
 Wed, 18 Nov 2020 20:32:47 +0800 (CST)
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.128]) by
 DGGEMM401-HUB.china.huawei.com ([10.3.20.209]) with mapi id 14.03.0487.000;
 Wed, 18 Nov 2020 20:32:51 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: RE: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by
 g_autofree need to be initialized
Thread-Topic: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by
 g_autofree need to be initialized
Thread-Index: AQHWvaH7LAlqtNTNq0CJSxOYz75c7KnNRyyAgACHeGA=
Date: Wed, 18 Nov 2020 12:32:50 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BA81997@dggemm531-mbx.china.huawei.com>
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
 <cd63f998-e3fe-d93f-f515-a47103592e05@redhat.com>
In-Reply-To: <cd63f998-e3fe-d93f-f515-a47103592e05@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 07:33:01
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
Cc: "lvivier@redhat.com" <lvivier@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "thuth@redhat.com" <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "hskinnemoen@google.com" <hskinnemoen@google.com>,
 "wuhaotsh@google.com" <wuhaotsh@google.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSBbbWFpbHRvOnBoaWxtZEByZWRoYXQuY29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVt
YmVyIDE4LCAyMDIwIDg6MTQgUE0NCj4gVG86IENoZW5xdW4gKGt1aG4pIDxrdWhuLmNoZW5xdW5A
aHVhd2VpLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsNCj4gcWVtdS10cml2aWFsQG5vbmdu
dS5vcmcNCj4gQ2M6IGx2aXZpZXJAcmVkaGF0LmNvbTsgcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3Jn
OyB0aHV0aEByZWRoYXQuY29tOw0KPiBaaGFuZ2hhaWxpYW5nIDx6aGFuZy56aGFuZ2hhaWxpYW5n
QGh1YXdlaS5jb20+Ow0KPiBoc2tpbm5lbW9lbkBnb29nbGUuY29tOyB3dWhhb3RzaEBnb29nbGUu
Y29tOyBFdWxlciBSb2JvdA0KPiA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSC1mb3ItNS4yPyAxLzJdIHRlc3RzL3F0ZXN0OiB2YXJpYWJsZSBkZWZpbmVkIGJ5
IGdfYXV0b2ZyZWUNCj4gbmVlZCB0byBiZSBpbml0aWFsaXplZA0KPiANCj4gT24gMTEvMTgvMjAg
MTI6NTYgUE0sIENoZW4gUXVuIHdyb3RlOg0KPiA+IEFjY29yZGluZyB0byB0aGUgZ2xpYiBmdW5j
dGlvbiByZXF1aXJlbWVudHMsIHdlIG5lZWQgaW5pdGlhbGlzZSAgdGhlDQo+ID4gdmFyaWFibGUu
IE90aGVyd2lzZSB0aGVyZSB3aWxsIGJlIGNvbXBpbGF0aW9uIHdhcm5pbmdzOg0KPiA+DQo+ID4g
Z2xpYi1hdXRvY2xlYW51cHMuaDoyODozOiB3YXJuaW5nOiDigJhmdWxsX25hbWXigJkgbWF5IGJl
IHVzZWQNCj4gPiB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XbWF5YmUtdW5pbml0
aWFsaXplZF0NCj4gPiAgICAyOCB8ICAgZ19mcmVlICgqcHApOw0KPiA+ICAgICAgIHwgICBefn5+
fn5+fn5+fn4NCj4gPg0KPiA+IFJlcG9ydGVkLWJ5OiBFdWxlciBSb2JvdCA8ZXVsZXIucm9ib3RA
aHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFF1biA8a3Vobi5jaGVucXVuQGh1
YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL3F0ZXN0L25wY203eHhfdGltZXItdGVzdC5j
IHwgOCArKystLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0L25wY203eHhfdGlt
ZXItdGVzdC5jDQo+ID4gYi90ZXN0cy9xdGVzdC9ucGNtN3h4X3RpbWVyLXRlc3QuYw0KPiA+IGlu
ZGV4IGYwOGIwY2Q2MmEuLjgzNzc0YTViOTAgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvcXRlc3Qv
bnBjbTd4eF90aW1lci10ZXN0LmMNCj4gPiArKysgYi90ZXN0cy9xdGVzdC9ucGNtN3h4X3RpbWVy
LXRlc3QuYw0KPiA+IEBAIC01MTIsMTEgKzUxMiw5IEBAIHN0YXRpYyB2b2lkDQo+IHRlc3RfZGlz
YWJsZV9vbl9leHBpcmF0aW9uKGdjb25zdHBvaW50ZXIgdGVzdF9kYXRhKQ0KPiA+ICAgKi8NCj4g
PiAgc3RhdGljIHZvaWQgdGltX2FkZF90ZXN0KGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IFRlc3RE
YXRhICp0ZCwNCj4gPiBHVGVzdERhdGFGdW5jIGZuKSAgew0KPiANCj4gT3I6DQo+IA0KPiA+IC0g
ICAgZ19hdXRvZnJlZSBjaGFyICpmdWxsX25hbWU7DQo+ICAgKyAgICBnX2F1dG9mcmVlIGNoYXIg
KmZ1bGxfbmFtZSA9IE5VTEw7DQo+IA0KWWVzLCB0aGlzIGFsc28gbWVldHMgdGhlIGdsaWIgcmVx
dWlyZW1lbnRzLg0KQnV0LCB0aGUgYXNzaWdubWVudCBzdGF0ZW1lbnQgZm9sbG93aW5nIGlzIG5v
dCBjb21wbGV4LCBzbyB3ZSBjb3VsZCBkbyBib3RoIG9mIHZhcmlhYmxlIGRlZmluaXRpb24gYW5k
IGFzc2lnbm1lbnQgaW4gYSBzdGF0ZW1lbnQuDQoNClRoYW5rcywNCkNoZW4gUXVuDQo+ID4gLQ0K
PiA+IC0gICAgZnVsbF9uYW1lID0gZ19zdHJkdXBfcHJpbnRmKCJucGNtN3h4X3RpbWVyL3RpbVsl
ZF0vdGltZXJbJWRdLyVzIiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0
aW1faW5kZXgodGQtPnRpbSksDQo+IHRpbWVyX2luZGV4KHRkLT50aW1lciksDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbmFtZSk7DQo+ID4gKyAgICBnX2F1dG9mcmVlIGNo
YXIgKmZ1bGxfbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigNCj4gPiArICAgICAgICAibnBjbTd4eF90
aW1lci90aW1bJWRdL3RpbWVyWyVkXS8lcyIsIHRpbV9pbmRleCh0ZC0+dGltKSwNCj4gPiArICAg
ICAgICB0aW1lcl9pbmRleCh0ZC0+dGltZXIpLCBuYW1lKTsNCj4gPiAgICAgIHF0ZXN0X2FkZF9k
YXRhX2Z1bmMoZnVsbF9uYW1lLCB0ZCwgZm4pOyAgfQ0KPiA+DQo+ID4NCg0K

