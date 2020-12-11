Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565922D6E1B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 03:24:31 +0100 (CET)
Received: from localhost ([::1]:58158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knY6f-0007KY-TK
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 21:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1knY5X-0006gS-TS; Thu, 10 Dec 2020 21:23:20 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1knY5O-0001mR-Md; Thu, 10 Dec 2020 21:23:17 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4CsZKx1S41z13SvQ;
 Fri, 11 Dec 2020 10:21:57 +0800 (CST)
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.162]) by
 DGGEMM403-HUB.china.huawei.com ([10.3.20.211]) with mapi id 14.03.0487.000;
 Fri, 11 Dec 2020 10:22:47 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: RE: [PATCH v3 0/7] silence the compiler warnings
Thread-Topic: [PATCH v3 0/7] silence the compiler warnings
Thread-Index: AQHWu8MDcL2NMyEpUEmMIaaRxnAU9anxT8yA
Date: Fri, 11 Dec 2020 02:22:47 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BAEA98B@dggemm531-mbx.china.huawei.com>
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga08-in.huawei.com
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 ganqixin <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

S2luZGx5IHBpbmchDQoNCkhpIGFsbCwNCiAgUGF0Y2ggMSB0byBQYXRjaCA1IGFyZSBub3QgaW4g
dGhlIHF1ZXVlLiAgQ291bGQgc29tZW9uZSBwaWNrIHRoZW0gdXDvvJ8NCg0KUGF0Y2gxflBhdGNo
NToNCiAgdGFyZ2V0L2kzODY6IHNpbGVuY2UgdGhlIGNvbXBpbGVyIHdhcm5pbmdzIGluIGdlbl9z
aGlmdGRfcm1fVDENCiAgaHcvaW50Yy9hcm1fZ2ljdjNfa3ZtOiBzaWxlbmNlIHRoZSBjb21waWxl
ciB3YXJuaW5ncw0KICBhY2NlbC90Y2cvdXNlci1leGVjOiBzaWxlbmNlIHRoZSBjb21waWxlciB3
YXJuaW5ncw0KICB0YXJnZXQvc3BhcmMvdHJhbnNsYXRlOiBzaWxlbmNlIHRoZSBjb21waWxlciB3
YXJuaW5ncw0KICB0YXJnZXQvc3BhcmMvd2luX2hlbHBlcjogc2lsZW5jZSB0aGUgY29tcGlsZXIg
d2FybmluZ3MNCg0KVGhhbmtzLA0KQ2hlbiBRdW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBDaGVucXVuIChrdWhuKQ0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDE2
LCAyMDIwIDEwOjQ4IEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtdHJpdmlh
bEBub25nbnUub3JnDQo+IENjOiBaaGFuZ2hhaWxpYW5nIDx6aGFuZy56aGFuZ2hhaWxpYW5nQGh1
YXdlaS5jb20+OyBnYW5xaXhpbg0KPiA8Z2FucWl4aW5AaHVhd2VpLmNvbT47IENoZW5xdW4gKGt1
aG4pIDxrdWhuLmNoZW5xdW5AaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYzIDAvN10g
c2lsZW5jZSB0aGUgY29tcGlsZXIgd2FybmluZ3MNCj4gDQo+IEhpIGZvbGtzLA0KPiAgIFRoaXMg
c2VyaWVzIGZpeCBzb21lICJmYWxsIHRocm91Z2giIHdhcm5pbmdzIHJlcG9ydGVkIGJ5IEdDQ185
LjMuIFRoZXkndmUNCj4gYmVlbiByZXZpZXdlZCBmb3IgYSBsb25nIHRpbWUuIFNvbWUgb2YgdGhl
c2UgcGF0Y2hzIG1heSBiZSBpbXBvcnRhbnQgZm9yDQo+IFFFTVUgNS4yLg0KPiBTdWNoIGFzIHRo
ZSBQYXRjaDYgbWlzcyBhIGJyZWFrIHN0YXRlbWVudC4gT3RoZXJzIG9ubHkgYWRkICJmYWxsIHRo
cm91Z2giDQo+IGNvbW1lbnRzIGFuZCBtYXkgbm90IGhhdmUgYSBuZWdhdGl2ZSBpbXBhY3QgZm9y
IFFFTVUgNS4yLg0KPiANCj4gDQo+IFRoYW5rcywNCj4gQ2hlbiBRdW4NCj4gDQo+IA0KPiBTaW5j
ZSB2MjoNCj4gLSBQYXRjaDPvvJpBZGQgUmljaGFyZCBIZW5kZXJzb27jgIFQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSBhbmQgVGhvbWFzIEh1dGgNCj4gcmV2aWV3ZWQgdGFnLg0KPiAtIFBhdGNoNDog
TGF1cmVudCBwdWxsIGl0IHRvIG1hc3RlciwgcmVtb3ZlIGl0Lg0KPiAtIFBhdGNoNi0+UGF0Y2g1
OiBBZGQgUmljaGFyZCBIZW5kZXJzb24gYW5kIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpDQo+IHJl
dmlld2VkIHRhZy4NCj4gLSBQYXRjaDctPlBhdGNoNjogQWRkIFRob21hcyBIdXRoIHJldmlld2Vk
IHRhZyBhbmQgRGF2aWQgR2lic29uIGFja2VkIHRhZy4NCj4gLSBQYXRjaDgtPlBhdGNoNzogVHdl
YWsgTE9HX1VOSU1QIG1lc3NhZ2UgYmFzZSBvbiBUaG9tYXMgSHV0aA0KPiBjb21tZW50Ow0KPiAg
IEFkZCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSBhbmQgVGhvbWFzIEh1dGggcmV2aWV3ZWQgdGFn
OyBBZGQgRGF2aWQNCj4gR2lic29uIGFja2VkIHRhZy4NCj4gDQo+IFNpbmNlIHYxOg0KPiAtIFBh
dGNoMTogQWRkIGNvbW1lbnRzIHRvIGV4cGxhaW4gdGhlIHR3byBjYXNlIG9mIGZhbGwgdGhyb3Vn
aC4NCj4gICBBZGRyZXNzZWQgUmljaGFyZCBIZW5kZXJzb24gYW5kIFRob21hcyBIdXRoIHJldmll
dyBjb21tZW50Lg0KPiAtIFBhdGNoMjogQWRkcmVzc2VkIFBldGVyIE1heWRlbGwgcmV2aWV3IGNv
bW1lbnQuDQo+IC0gUGF0Y2gzOiBBZGQgUUVNVV9OT1JFVFVSTiB0byBjcHVfZXhpdF90Yl9mcm9t
X3NpZ2hhbmRsZXIoKSBmdW5jdGlvbiB0bw0KPiAgIGF2b2lkIHRoZSBjb21waWxlciB3YXJuaW5n
cy4NCj4gLSBQYXRjaDQ6IEFkZHJlc3NlZCBUaG9tYXMgSHV0aCByZXZpZXcgY29tbWVudC4NCj4g
LSBQYXRjaDU6IEFkZHJlc3NlZCBBcnR5b20gVGFyYXNlbmtvIGFuZCBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSByZXZpZXcNCj4gICBjb21tZW50Lg0KPiAtIFBhdGNoNjogQ29tYmluZSB0aGUgLyog
ZmFsbCB0aHJvdWdoICovIHRvIHRoZSBwcmVjZWRpbmcgY29tbWVudHMuDQo+ICAgQWRkcmVzc2Vk
ICBBcnR5b20gVGFyYXNlbmtvIHJldmlldyBjb21tZW50Lg0KPiAtIFBhdGNoNzogQWRkIGEgImJy
ZWFrIiBzdGF0ZW1lbnQgaGVyZSBpbnN0ZWFkIG9mIC8qIGZhbGwgdGhyb3VnaCAqLw0KPiAgIGNv
bW1lbnRzLg0KPiAtIFBhdGNoODogUmVwbGFjZSB0aGUgVE9ETyBieSBhIExPR19VTklNUCBjYWxs
IGFuZCBhZGQgYnJlYWsgc3RhdGVtZW50DQo+IC0gUGF0Y2g5OiBEaXNjYXJkIHRoaXMgcGF0Y2gg
c2luY2UgYSBwYXRjaCBhbHJlYWR5IGV4aXN0cyBmb3IgZml4IHRoaXMNCj4gDQo+IGlzc3VlKGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvMjAyMDA3MTExNTQyNDIuNDEyMjItMS15
c2F0b0B1cw0KPiBlcnMpDQo+IA0KPiANCj4gQ2hlbiBRdW4gKDcpOg0KPiAgIHRhcmdldC9pMzg2
OiBzaWxlbmNlIHRoZSBjb21waWxlciB3YXJuaW5ncyBpbiBnZW5fc2hpZnRkX3JtX1QxDQo+ICAg
aHcvaW50Yy9hcm1fZ2ljdjNfa3ZtOiBzaWxlbmNlIHRoZSBjb21waWxlciB3YXJuaW5ncw0KPiAg
IGFjY2VsL3RjZy91c2VyLWV4ZWM6IHNpbGVuY2UgdGhlIGNvbXBpbGVyIHdhcm5pbmdzDQo+ICAg
dGFyZ2V0L3NwYXJjL3RyYW5zbGF0ZTogc2lsZW5jZSB0aGUgY29tcGlsZXIgd2FybmluZ3MNCj4g
ICB0YXJnZXQvc3BhcmMvd2luX2hlbHBlcjogc2lsZW5jZSB0aGUgY29tcGlsZXIgd2FybmluZ3MN
Cj4gICBwcGM6IEFkZCBhIG1pc3NpbmcgYnJlYWsgZm9yIFBQQzZ4eF9JTlBVVF9UQkVODQo+ICAg
dGFyZ2V0L3BwYzogcmVwbGFjZWQgdGhlIFRPRE8gd2l0aCBMT0dfVU5JTVAgYW5kIGFkZCBicmVh
ayBmb3Igc2lsZW5jZQ0KPiAgICAgd2FybmluZ3MNCj4gDQo+ICBhY2NlbC90Y2cvdXNlci1leGVj
LmMgICAgIHwgMyArKy0NCj4gIGh3L2ludGMvYXJtX2dpY3YzX2t2bS5jICAgfCA4ICsrKysrKysr
DQo+ICBody9wcGMvcHBjLmMgICAgICAgICAgICAgIHwgMSArDQo+ICB0YXJnZXQvaTM4Ni90cmFu
c2xhdGUuYyAgIHwgNyArKysrKy0tDQo+ICB0YXJnZXQvcHBjL21tdV9oZWxwZXIuYyAgIHwgNSAr
KystLQ0KPiAgdGFyZ2V0L3NwYXJjL3RyYW5zbGF0ZS5jICB8IDIgKy0NCj4gIHRhcmdldC9zcGFy
Yy93aW5faGVscGVyLmMgfCAyICstDQo+ICA3IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjI3LjANCg0K

