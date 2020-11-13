Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA322B19D4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:16:10 +0100 (CET)
Received: from localhost ([::1]:51954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdX3p-0002qQ-4h
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kdX30-0002DI-50; Fri, 13 Nov 2020 06:15:18 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kdX2v-0008Bt-Gu; Fri, 13 Nov 2020 06:15:17 -0500
Received: from dggemi405-hub.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CXbTs1B7QzXj7q;
 Fri, 13 Nov 2020 19:14:57 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.227]) by
 dggemi405-hub.china.huawei.com ([10.3.17.143]) with mapi id 14.03.0487.000;
 Fri, 13 Nov 2020 19:14:56 +0800
From: ganqixin <ganqixin@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v3 2/4] ads7846: put it into the 'input' category
Thread-Topic: [PATCH v3 2/4] ads7846: put it into the 'input' category
Thread-Index: AQHWuW2N1Zke0LNuwkymCaXDtGrUfKnFUgeAgACSGsA=
Date: Fri, 13 Nov 2020 11:14:55 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065A96D8@DGGEMI525-MBS.china.huawei.com>
References: <20201112125824.763182-1-ganqixin@huawei.com>
 <20201112125824.763182-3-ganqixin@huawei.com>
 <CAFEAcA-30x8FS8Kmz3AzvJAR0z7_7utAfPEhCTYmq-dvKW9wFA@mail.gmail.com>
In-Reply-To: <CAFEAcA-30x8FS8Kmz3AzvJAR0z7_7utAfPEhCTYmq-dvKW9wFA@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=ganqixin@huawei.com;
 helo=szxga01-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 06:15:06
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
Cc: Thomas Huth <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWls
dG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDEz
LCAyMDIwIDY6MTMgUE0NCj4gVG86IGdhbnFpeGluIDxnYW5xaXhpbkBodWF3ZWkuY29tPg0KPiBD
YzogUUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBRRU1VIFRyaXZpYWwN
Cj4gPHFlbXUtdHJpdmlhbEBub25nbnUub3JnPjsgVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5j
b20+OyBMYXVyZW50DQo+IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+OyBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ow0KPiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJt
YnJ1QHJlZGhhdC5jb20+OyBNaWNoYWVsIFMuIFRzaXJraW4NCj4gPG1zdEByZWRoYXQuY29tPjsg
Q2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3ZWkuY29tPjsNCj4gWmhhbmdoYWlsaWFu
ZyA8emhhbmcuemhhbmdoYWlsaWFuZ0BodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYzIDIvNF0gYWRzNzg0NjogcHV0IGl0IGludG8gdGhlICdpbnB1dCcgY2F0ZWdvcnkNCj4gDQo+
IE9uIEZyaSwgMTMgTm92IDIwMjAgYXQgMDM6MzIsIEdhbiBRaXhpbiA8Z2FucWl4aW5AaHVhd2Vp
LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGUgY2F0ZWdvcnkgb2YgdGhlIGFkczc4NDYgZGV2aWNl
IGlzIG5vdCBzZXQsIHB1dCBpdCBpbnRvIHRoZSAnaW5wdXQnDQo+ID4gY2F0ZWdvcnkuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHYW4gUWl4aW4gPGdhbnFpeGluQGh1YXdlaS5jb20+DQo+ID4g
LS0tDQo+ID4gQ2M6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4g
PiAtLS0NCj4gPiAgaHcvZGlzcGxheS9hZHM3ODQ2LmMgfCAyICsrDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9ody9kaXNwbGF5L2Fk
czc4NDYuYyBiL2h3L2Rpc3BsYXkvYWRzNzg0Ni5jIGluZGV4DQo+ID4gMDIzMTY1YjJhMy4uY2Iz
YTQzMWNmZCAxMDA2NDQNCj4gPiAtLS0gYS9ody9kaXNwbGF5L2Fkczc4NDYuYw0KPiA+ICsrKyBi
L2h3L2Rpc3BsYXkvYWRzNzg0Ni5jDQo+ID4gQEAgLTE2MywxMCArMTYzLDEyIEBAIHN0YXRpYyB2
b2lkIGFkczc4NDZfcmVhbGl6ZShTU0lTbGF2ZSAqZCwgRXJyb3INCj4gPiAqKmVycnApDQo+ID4N
Cj4gPiAgc3RhdGljIHZvaWQgYWRzNzg0Nl9jbGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywg
dm9pZCAqZGF0YSkgIHsNCj4gPiArICAgIERldmljZUNsYXNzICpkYyA9IERFVklDRV9DTEFTUyhr
bGFzcyk7DQo+ID4gICAgICBTU0lTbGF2ZUNsYXNzICprID0gU1NJX1NMQVZFX0NMQVNTKGtsYXNz
KTsNCj4gPg0KPiA+ICAgICAgay0+cmVhbGl6ZSA9IGFkczc4NDZfcmVhbGl6ZTsNCj4gPiAgICAg
IGstPnRyYW5zZmVyID0gYWRzNzg0Nl90cmFuc2ZlcjsNCj4gPiArICAgIHNldF9iaXQoREVWSUNF
X0NBVEVHT1JZX0lOUFVULCBkYy0+Y2F0ZWdvcmllcyk7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0
aWMgY29uc3QgVHlwZUluZm8gYWRzNzg0Nl9pbmZvID0gew0KPiANCj4gUmV2aWV3ZWQtYnk6IFBl
dGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4gDQo+IFJlYWxseSB3ZSBz
aG91bGQgbW92ZSB0aGUgZmlsZSB0b28uLi4NCj4gDQoNCk9LLCBJIHdpbGwgdHJ5IHRvIG1vdmUg
dGhlIGZpbGUgdG8gdGhlIGNvcnJlY3QgZm9sZGVyOikNCg0KR2FuIFFpeGluDQo=

