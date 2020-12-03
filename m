Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796E62CCFDE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 07:54:52 +0100 (CET)
Received: from localhost ([::1]:59180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkiVv-0006SL-3K
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 01:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkiUv-0005uk-Hi; Thu, 03 Dec 2020 01:53:49 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkiUs-0000xT-PL; Thu, 03 Dec 2020 01:53:49 -0500
Received: from dggemi405-hub.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CmmkS4mWQzXj9S;
 Thu,  3 Dec 2020 14:53:04 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.228]) by
 dggemi405-hub.china.huawei.com ([10.3.17.143]) with mapi id 14.03.0487.000;
 Thu, 3 Dec 2020 14:53:22 +0800
From: ganqixin <ganqixin@huawei.com>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Subject: RE: [PATCH v2 01/12] pc-dimm: put it into the 'storage' category
Thread-Topic: [PATCH v2 01/12] pc-dimm: put it into the 'storage' category
Thread-Index: AQHWxvQB7Oi14cb7Ik2dpMwmMFfSI6nf8FWAgAT8dnA=
Date: Thu, 3 Dec 2020 06:53:21 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065DD609@DGGEMI525-MBS.china.huawei.com>
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-2-ganqixin@huawei.com>
 <CAM9Jb+iXWAQq7gg8RxS=aVX1MHBVuZucb4rXGaTU40kJ6-TmTw@mail.gmail.com>
In-Reply-To: <CAM9Jb+iXWAQq7gg8RxS=aVX1MHBVuZucb4rXGaTU40kJ6-TmTw@mail.gmail.com>
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
Cc: "thuth@redhat.com" <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Qemu Developers <qemu-devel@nongnu.org>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYW5rYWogR3VwdGEgW21haWx0
bzpwYW5rYWouZ3VwdGEubGludXhAZ21haWwuY29tXQ0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVy
IDMwLCAyMDIwIDY6MTkgUE0NCj4gVG86IGdhbnFpeGluIDxnYW5xaXhpbkBodWF3ZWkuY29tPg0K
PiBDYzogUWVtdSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBxZW11LXRyaXZp
YWxAbm9uZ251Lm9yZzsNCj4gQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3ZWkuY29t
PjsgdGh1dGhAcmVkaGF0LmNvbTsNCj4gWmhhbmdoYWlsaWFuZyA8emhhbmcuemhhbmdoYWlsaWFu
Z0BodWF3ZWkuY29tPjsgTWljaGFlbCBTIC4gVHNpcmtpbg0KPiA8bXN0QHJlZGhhdC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDEvMTJdIHBjLWRpbW06IHB1dCBpdCBpbnRvIHRoZSAn
c3RvcmFnZScgY2F0ZWdvcnkNCj4gDQo+ID4gVGhlIGNhdGVnb3J5IG9mIHRoZSBwYy1kaW1tIGRl
dmljZSBpcyBub3Qgc2V0LCBwdXQgaXQgaW50byB0aGUgJ3N0b3JhZ2UnDQo+ID4gY2F0ZWdvcnku
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYW4gUWl4aW4gPGdhbnFpeGluQGh1YXdlaS5jb20+
DQo+ID4gLS0tDQo+ID4gQ2M6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+
ID4gLS0tDQo+ID4gIGh3L21lbS9wYy1kaW1tLmMgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvaHcvbWVtL3BjLWRpbW0uYyBi
L2h3L21lbS9wYy1kaW1tLmMgaW5kZXgNCj4gPiAyZmZjOTg2NzM0Li4wMTcxNDZlM2QxIDEwMDY0
NA0KPiA+IC0tLSBhL2h3L21lbS9wYy1kaW1tLmMNCj4gPiArKysgYi9ody9tZW0vcGMtZGltbS5j
DQo+ID4gQEAgLTI4Miw2ICsyODIsNyBAQCBzdGF0aWMgdm9pZCBwY19kaW1tX2NsYXNzX2luaXQo
T2JqZWN0Q2xhc3MgKm9jLA0KPiB2b2lkICpkYXRhKQ0KPiA+ICAgICAgbWRjLT5nZXRfcGx1Z2dl
ZF9zaXplID0gbWVtb3J5X2RldmljZV9nZXRfcmVnaW9uX3NpemU7DQo+ID4gICAgICBtZGMtPmdl
dF9tZW1vcnlfcmVnaW9uID0gcGNfZGltbV9tZF9nZXRfbWVtb3J5X3JlZ2lvbjsNCj4gPiAgICAg
IG1kYy0+ZmlsbF9kZXZpY2VfaW5mbyA9IHBjX2RpbW1fbWRfZmlsbF9kZXZpY2VfaW5mbzsNCj4g
PiArICAgIHNldF9iaXQoREVWSUNFX0NBVEVHT1JZX1NUT1JBR0UsIGRjLT5jYXRlZ29yaWVzKTsN
Cj4gDQo+IEFueSByZWFzb24gd2h5IHBjLWRpbW0gd291bGQgYmUgaW4gdGhlIHN0b3JhZ2UgY2F0
ZWdvcnk/DQoNCkhpIFBhbmthaiwNClRoYW5rcyBmb3IgeW91IHJlcGx5LiBBcyBmYXIgYXMgSSBr
bm93LCBwYy1kaW1tIGlzIGEgZGltbSBkZXZpY2UgZm9yIG1lbW9yeSBob3RwbHVnLCBkZXNjcmli
ZWQgYXMgYSAiRElNTSBtZW1vcnkgbW9kdWxlIiBpbiAiLWRldmljZSBoZWxwIi4gDQpUaGlzIGRl
dmljZSBsb29rcyByZWxhdGVkIHRvIHN0b3JhZ2UsIHNvIEkgcHV0IGl0IGludG8gdGhlICJzdG9y
YWdlIiBjYXRlZ29yeSB0byBtYWtlIGl0IGVhc3kgdG8gZmluZC4gSSdtIG5vdCBzdXJlIGlmIHRo
aXMgaXMgYXBwcm9wcmlhdGUsIGRvIHlvdSBoYXZlIGFueSBiZXR0ZXIgaWRlYXM/DQoNCkdhbiBR
aXhpbg0KDQo+IA0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIFR5cGVJbmZvIHBjX2RpbW1faW5m
byA9IHsNCj4gPiAtLQ0KPiA+IDIuMjMuMA0KPiA+DQo+ID4NCg==

