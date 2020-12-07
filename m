Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A32D0CAA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 10:11:28 +0100 (CET)
Received: from localhost ([::1]:59762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmCYJ-0006YE-Ka
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 04:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kmCWY-0005fh-Uz; Mon, 07 Dec 2020 04:09:38 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kmCWT-0003Fa-Ky; Mon, 07 Dec 2020 04:09:38 -0500
Received: from dggemi405-hub.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CqHYQ1l18zXkXQ;
 Mon,  7 Dec 2020 17:08:58 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.228]) by
 dggemi405-hub.china.huawei.com ([10.3.17.143]) with mapi id 14.03.0487.000;
 Mon, 7 Dec 2020 17:09:17 +0800
From: ganqixin <ganqixin@huawei.com>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Subject: RE: [PATCH v2 01/12] pc-dimm: put it into the 'storage' category
Thread-Topic: [PATCH v2 01/12] pc-dimm: put it into the 'storage' category
Thread-Index: AQHWxvQB7Oi14cb7Ik2dpMwmMFfSI6nf8FWAgAT8dnCAARj9gIAFWNMw
Date: Mon, 7 Dec 2020 09:09:15 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065E41B5@DGGEMI525-MBS.china.huawei.com>
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-2-ganqixin@huawei.com>
 <CAM9Jb+iXWAQq7gg8RxS=aVX1MHBVuZucb4rXGaTU40kJ6-TmTw@mail.gmail.com>
 <A5B86EC83C48EF4CB2BC58BEF3A2F496065DD609@DGGEMI525-MBS.china.huawei.com>
 <CAM9Jb+hJRyQzCEcoHG3kepbjyJ2dA341WmR+4CtR3L1oMYWJkg@mail.gmail.com>
In-Reply-To: <CAM9Jb+hJRyQzCEcoHG3kepbjyJ2dA341WmR+4CtR3L1oMYWJkg@mail.gmail.com>
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
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
bzpwYW5rYWouZ3VwdGEubGludXhAZ21haWwuY29tXQ0KPiBTZW50OiBGcmlkYXksIERlY2VtYmVy
IDQsIDIwMjAgMzoxMyBQTQ0KPiBUbzogZ2FucWl4aW4gPGdhbnFpeGluQGh1YXdlaS5jb20+DQo+
IENjOiBRZW11IERldmVsb3BlcnMgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47DQo+IHFlbXUtdHJp
dmlhbEBub25nbnUub3JnOyBDaGVucXVuIChrdWhuKQ0KPiA8a3Vobi5jaGVucXVuQGh1YXdlaS5j
b20+OyB0aHV0aEByZWRoYXQuY29tOyBaaGFuZ2hhaWxpYW5nDQo+IDx6aGFuZy56aGFuZ2hhaWxp
YW5nQGh1YXdlaS5jb20+OyBNaWNoYWVsIFMgLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMS8xMl0gcGMtZGltbTogcHV0IGl0IGludG8gdGhlICdz
dG9yYWdlJyBjYXRlZ29yeQ0KPiANCj4gID4gICAgICBtZGMtPmdldF9tZW1vcnlfcmVnaW9uID0N
Cj4gcGNfZGltbV9tZF9nZXRfbWVtb3J5X3JlZ2lvbjsNCj4gPiA+ID4gICAgICBtZGMtPmZpbGxf
ZGV2aWNlX2luZm8gPSBwY19kaW1tX21kX2ZpbGxfZGV2aWNlX2luZm87DQo+ID4gPiA+ICsgICAg
c2V0X2JpdChERVZJQ0VfQ0FURUdPUllfU1RPUkFHRSwgZGMtPmNhdGVnb3JpZXMpOw0KPiA+ID4N
Cj4gPiA+IEFueSByZWFzb24gd2h5IHBjLWRpbW0gd291bGQgYmUgaW4gdGhlIHN0b3JhZ2UgY2F0
ZWdvcnk/DQo+IC4uLg0KPiA+IFRoYW5rcyBmb3IgeW91IHJlcGx5LiBBcyBmYXIgYXMgSSBrbm93
LCBwYy1kaW1tIGlzIGEgZGltbSBkZXZpY2UgZm9yDQo+IG1lbW9yeSBob3RwbHVnLCBkZXNjcmli
ZWQgYXMgYSAiRElNTSBtZW1vcnkgbW9kdWxlIiBpbiAiLWRldmljZQ0KPiBoZWxwIi4NCj4gPiBU
aGlzIGRldmljZSBsb29rcyByZWxhdGVkIHRvIHN0b3JhZ2UsIHNvIEkgcHV0IGl0IGludG8gdGhl
ICJzdG9yYWdlIg0KPiBjYXRlZ29yeSB0byBtYWtlIGl0IGVhc3kgdG8gZmluZC4gSSdtIG5vdCBz
dXJlIGlmIHRoaXMgaXMgYXBwcm9wcmlhdGUsIGRvIHlvdQ0KPiBoYXZlIGFueSBiZXR0ZXIgaWRl
YXM/DQo+IA0KPiBPLmsuIEkgc2VlIHN0b3JhZ2UgJiBtZW1vcnkgYXMgZGlmZmVyZW50IGRldmlj
ZXMuIFNpbmNlIHdlIGRvbid0IGhhdmUgYW55DQo+IG1lbW9yeSBkZXZpY2UgdHlwZSBkZWZpbmVk
LCBtYXliZSBpdHMgb2theSB0byBwdXQgaXQgaW4gTUlTQyBkZXZpY2UuDQoNCllvdSdyZSByaWdo
dC4gTWF5YmUgSSBzaG91bGQgc2VuZCBhIHNlcGFyYXRlIHBhdGNoIHRvIGFkZCB0aGUgIm1lbW9y
eSIgY2F0ZWdvcnkgYW5kIG1vdmUgdGhlIG1lbW9yeSBkZXZpY2UgZnJvbSAidW5jYXRlZ29yaXpl
ZCIgYW5kICJtaXNjIiB0byAibWVtb3J5Ii4NCg0KVGhhbmtzLA0KR2FuIFFpeGluDQoNCj4gDQo+
IFRoYW5rcywNCj4gUGFua2FqDQo=

