Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D1B486155
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 09:19:03 +0100 (CET)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5NzB-0004WT-48
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 03:19:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5Nhs-0006rT-0j
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:01:08 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5Nhm-00018Q-51
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:01:05 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JTzKR0QtRz91yF;
 Thu,  6 Jan 2022 15:59:55 +0800 (CST)
Received: from dggpeml100026.china.huawei.com (7.185.36.103) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 16:00:57 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml100026.china.huawei.com (7.185.36.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 16:00:57 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Thu, 6 Jan 2022 16:00:57 +0800
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>, pbonzini
 <pbonzini@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan
 <yechuan@huawei.com>, Huangzhichao <huangzhichao@huawei.com>, qemu-devel
 <qemu-devel@nongnu.org>
Subject: RE: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
Thread-Topic: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
Thread-Index: AQHYAc9wPMXmSOXfFU+/REf6MOZJ4KxTUbaAgAAo9wCAAA5zgIAAjrDg//+GPoCAADcLAIAA7PwAgADfuQA=
Date: Thu, 6 Jan 2022 08:00:57 +0000
Message-ID: <e45ecaa1a6b24395868d92d8ffa9a059@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
 <20220105020008-mutt-send-email-mst@kernel.org>
 <CACGkMEsPqADAR1LhjP=Y4ShhSogdrf2T8O2Km22G7FwGCe+hrQ@mail.gmail.com>
 <1d157f74fdac49ff8ae734808bd3c518@huawei.com>
 <CACGkMEukEBFYrmJjj-jXR_UdamFbjrFkj7PbdfQJOGMzekAvSg@mail.gmail.com>
 <20220105072321-mutt-send-email-mst@kernel.org>
 <CACGkMEt+A5-rSq20qTbideO39q-rZ5RKoK8H77OihFQ8VDgUfw@mail.gmail.com>
In-Reply-To: <CACGkMEt+A5-rSq20qTbideO39q-rZ5RKoK8H77OihFQ8VDgUfw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyBbbWFp
bHRvOmphc293YW5nQHJlZGhhdC5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDYsIDIw
MjIgMTA6MzQgQU0NCj4gVG86IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+
IENjOiBMb25ncGVuZyAoTWlrZSwgQ2xvdWQgSW5mcmFzdHJ1Y3R1cmUgU2VydmljZSBQcm9kdWN0
IERlcHQuKQ0KPiA8bG9uZ3BlbmcyQGh1YXdlaS5jb20+OyBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+OyBTdGVmYW5vDQo+IEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5j
b20+OyBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT47IHBib256aW5pDQo+IDxwYm9u
emluaUByZWRoYXQuY29tPjsgR29uZ2xlaSAoQXJlaSkgPGFyZWkuZ29uZ2xlaUBodWF3ZWkuY29t
PjsgWWVjaHVhbg0KPiA8eWVjaHVhbkBodWF3ZWkuY29tPjsgSHVhbmd6aGljaGFvIDxodWFuZ3po
aWNoYW9AaHVhd2VpLmNvbT47IHFlbXUtZGV2ZWwNCj4gPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtSRkMgMDIvMTBdIHZob3N0OiBhZGQgMyBjb21tYW5kcyBmb3Igdmhv
c3QtdmRwYQ0KPiANCj4gT24gV2VkLCBKYW4gNSwgMjAyMiBhdCA4OjI2IFBNIE1pY2hhZWwgUy4g
VHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gV2VkLCBKYW4gMDUs
IDIwMjIgYXQgMDU6MDk6MDdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToNCj4gPiA+IE9uIFdl
ZCwgSmFuIDUsIDIwMjIgYXQgNDozNyBQTSBMb25ncGVuZyAoTWlrZSwgQ2xvdWQgSW5mcmFzdHJ1
Y3R1cmUNCj4gPiA+IFNlcnZpY2UgUHJvZHVjdCBEZXB0LikgPGxvbmdwZW5nMkBodWF3ZWkuY29t
PiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206IEphc29uIFdhbmcgW21haWx0bzpqYXNv
d2FuZ0ByZWRoYXQuY29tXQ0KPiA+ID4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSA1LCAy
MDIyIDM6NTQgUE0NCj4gPiA+ID4gPiBUbzogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0
LmNvbT4NCj4gPiA+ID4gPiBDYzogTG9uZ3BlbmcgKE1pa2UsIENsb3VkIEluZnJhc3RydWN0dXJl
IFNlcnZpY2UgUHJvZHVjdCBEZXB0LikNCj4gPiA+ID4gPiA8bG9uZ3BlbmcyQGh1YXdlaS5jb20+
OyBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+OyBTdGVmYW5vDQo+ID4gPiA+
ID4gR2FyemFyZWxsYSA8c2dhcnphcmVAcmVkaGF0LmNvbT47IENvcm5lbGlhIEh1Y2sgPGNvaHVj
a0ByZWRoYXQuY29tPjsNCj4gcGJvbnppbmkNCj4gPiA+ID4gPiA8cGJvbnppbmlAcmVkaGF0LmNv
bT47IEdvbmdsZWkgKEFyZWkpIDxhcmVpLmdvbmdsZWlAaHVhd2VpLmNvbT47IFllY2h1YW4NCj4g
PiA+ID4gPiA8eWVjaHVhbkBodWF3ZWkuY29tPjsgSHVhbmd6aGljaGFvIDxodWFuZ3poaWNoYW9A
aHVhd2VpLmNvbT47DQo+IHFlbXUtZGV2ZWwNCj4gPiA+ID4gPiA8cWVtdS1kZXZlbEBub25nbnUu
b3JnPg0KPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUkZDIDAyLzEwXSB2aG9zdDogYWRkIDMgY29t
bWFuZHMgZm9yIHZob3N0LXZkcGENCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIFdlZCwgSmFuIDUs
IDIwMjIgYXQgMzowMiBQTSBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPiB3cm90
ZToNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBPbiBXZWQsIEphbiAwNSwgMjAyMiBhdCAxMjoz
NTo1M1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBPbiBXZWQsIEph
biA1LCAyMDIyIGF0IDg6NTkgQU0gTG9uZ3BlbmcoTWlrZSkgPGxvbmdwZW5nMkBodWF3ZWkuY29t
Pg0KPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IEZyb206IExvbmdw
ZW5nIDxsb25ncGVuZzJAaHVhd2VpLmNvbT4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiA+IFRvIHN1cHBvcnQgZ2VuZXJpYyB2ZHBhIGRlaXZjZSwgd2UgbmVlZCBhZGQgdGhlIGZvbGxv
d2luZyBpb2N0bHM6DQo+ID4gPiA+ID4gPiA+ID4gLSBHRVRfVkVDVE9SU19OVU06IHRoZSBjb3Vu
dCBvZiB2ZWN0b3JzIHRoYXQgc3VwcG9ydGVkDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+
IERvZXMgdGhpcyBtZWFuIE1TSSB2ZWN0b3JzPyBJZiB5ZXMsIGl0IGxvb2tzIGxpa2UgYSBsYXll
ciB2aW9sYXRpb246DQo+ID4gPiA+ID4gPiA+IHZob3N0IGlzIHRyYW5zcG9ydCBpbmRlcGVuZGVu
dC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBXZWxsICpndWVzdCogbmVlZHMgdG8ga25vdyBo
b3cgbWFueSB2ZWN0b3JzIGRldmljZSBzdXBwb3J0cy4NCj4gPiA+ID4gPiA+IEkgZG9uJ3QgdGhp
bmsgdGhlcmUncyBhIHdheSBhcm91bmQgdGhhdC4gRG8geW91Pw0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gV2UgaGF2ZSBWSE9TVF9TRVRfVlJJTkcvQ09ORklHX0NBTEwgd2hpY2ggaXMgcGVyIHZxLiBJ
IHRoaW5rIHdlIGNhbg0KPiA+ID4gPiA+IHNpbXBseSBhc3N1bWUgI3ZxcyArIDE/DQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+IE90aGVyd2lzZSBndWVzdHMgd2lsbCBhdCBiZXN0IGJlIHN1Ym9wdGlt
YWwuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAgQW5kIGl0IHJldmVhbHMgZGV2aWNlIGlt
cGxlbWVudGF0aW9uDQo+ID4gPiA+ID4gPiA+IGRldGFpbHMgd2hpY2ggYmxvY2sgKGNyb3NzIHZl
bmRvcikgbWlncmF0aW9uLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBUaGFua3MNCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBOb3QgbmVjZXNzYXJpbHksIHVzZXJzcGFjZSBjYW4gaGlk
ZSB0aGlzIGZyb20gZ3Vlc3QgaWYgaXQNCj4gPiA+ID4gPiA+IHdhbnRzIHRvLCBqdXN0IHZhbGlk
YXRlLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSWYgd2UgY2FuIGhpZGUgaXQgYXQgdmhvc3QvdUFQ
SSBsZXZlbCwgaXQgd291bGQgYmUgZXZlbiBiZXR0ZXI/DQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4g
PiA+ID4gTm90IG9ubHkgTVNJIHZlY3RvcnMsIGJ1dCBhbHNvIHF1ZXVlLXNpemUsICN2cXMsIGV0
Yy4NCj4gPiA+DQo+ID4gPiBNU0kgaXMgUENJIHNwZWNpZmljLCB3ZSBoYXZlIG5vbiBQQ0kgdkRQ
QSBwYXJlbnQgZS5nIFZEVVNFL3NpbXVsYXRvci9tbHg1DQo+ID4gPg0KPiA+ID4gQW5kIGl0J3Mg
c29tZXRoaW5nIHRoYXQgaXMgbm90IGd1YXJhbnRlZWQgdG8gYmUgbm90IGNoYW5nZWQuIEUuZyBz
b21lDQo+ID4gPiBkcml2ZXJzIG1heSBjaG9vc2UgdG8gYWxsb2NhdGUgTVNJIGR1cmluZyBzZXRf
c3RhdHVzKCkgd2hpY2ggY2FuIGZhaWwNCj4gPiA+IGZvciB2YXJpb3VzIHJlYXNvbnMuDQo+ID4g
Pg0KPiA+ID4gPg0KPiA+ID4gPiBNYXliZSB0aGUgdmhvc3QgbGV2ZWwgY291bGQgZXhwb3NlIHRo
ZSBoYXJkd2FyZSdzIHJlYWwgY2FwYWJpbGl0aWVzDQo+ID4gPiA+IGFuZCBsZXQgdGhlIHVzZXJz
cGFjZSAoUUVNVSkgZG8gdGhlIGhpZGluZz8gVGhlIHVzZXJzcGFjZSBrbm93IGhvdw0KPiA+ID4g
PiB0byBwcm9jZXNzIHRoZW0uDQo+ID4gPg0KPiA+ID4gI01TSSB2ZWN0b3JzIGlzIG11Y2ggbW9y
ZSBlYXNpZXIgdG8gYmUgbWVkaWF0ZWQgdGhhbiBxdWV1ZS1zaXplIGFuZCAjdnFzLg0KPiA+ID4N
Cj4gPiA+IEZvciBpbnRlcnJ1cHRzLCB3ZSd2ZSBhbHJlYWR5IGhhZCBWSE9TVF9TRVRfWF9LSUNL
LCB3ZSBjYW4ga2VlcA0KPiA+ID4gYWxsb2NhdGluZyBldmVudGZkIGJhc2VkIG9uICNNU0kgdmVj
dG9ycyB0byBtYWtlIGl0IHdvcmsgd2l0aCBhbnkNCj4gPiA+IG51bWJlciBvZiBNU0kgdmVjdG9y
cyB0aGF0IHRoZSB2aXJ0dWFsIGRldmljZSBoYWQuDQo+ID4NCj4gPiBSaWdodCBidXQgaWYgaGFy
ZHdhcmUgZG9lcyBub3Qgc3VwcG9ydCBzbyBtYW55IHRoZW4gd2hhdD8NCj4gPiBKdXN0IGZhaWw/
DQo+IA0KPiBPciBqdXN0IHRyaWdnZXIgdGhlIGNhbGxiYWNrIG9mIHZxcyB0aGF0IHNoYXJlcyB0
aGUgdmVjdG9yLg0KPiANCg0KVGhlbiB3ZSBzaG91bGQgZGlzYWJsZSBQSSBpZiB3ZSBuZWVkIHRv
IHNoYXJlIGEgdmVjdG9yIGluIHRoaXMgY2FzZT8NCg0KPiA+IEhhdmluZyBhIHF1ZXJ5IEFQSSB3
b3VsZCBtYWtlIHRoaW5ncyBzb21ld2hhdCBjbGVhbmVyIGltaG8uDQo+IA0KPiBJIG1heSBtaXNz
IHNvbWV0aGluZywgIGV2ZW4gaWYgd2Uga25vdyAjdmVjdG9ycywgd2Ugc3RpbGwgZG9uJ3Qga25v
dw0KPiB0aGUgYXNzb2NpYXRlZCB2aXJ0cXVldWVzIGZvciBhIGRlZGljYXRlZCB2ZWN0b3I/DQo+
IA0KPiA+DQo+ID4gPiBGb3IgcXVldWUtc2l6ZSwgaXQncyBPayB0byBoYXZlIGEgbmV3IHVBUEkg
YnV0IGl0J3Mgbm90IGEgbXVzdCwgUWVtdQ0KPiA+ID4gY2FuIHNpbXBseSBmYWlsIGlmIFNFVF9W
UklOR19OVU0gZmFpbC4NCj4gPiA+DQo+ID4gPiBGb3IgI3ZxcywgaXQncyBPSyB0byBoYXZlIGEg
bmV3IHVBUEkgc2luY2UgdGhlIGVtdWxhdGVkIHZpcnRpby1wY2kNCj4gPiA+IGRldmljZSByZXF1
aXJlcyBrbm93bGVkZ2UgdGhlICN2cXMgaW4gdGhlIGNvbmZpZyBzcGFjZS4gKHN0aWxsIG5vdCBh
DQo+ID4gPiBtdXN0LCB3ZSBjYW4gZW51bWVyYXRlICN2cXMgcGVyIGRldmljZSB0eXBlKQ0KPiA+
ID4NCj4gPiA+IEZvciB0aGUgY29uZmlnIHNpemUsIGl0J3MgT0sgYnV0IG5vdCBhIG11c3QsIHRl
Y2huaWNhbGx5IHdlIGNhbiBzaW1wbHkNCj4gPiA+IHJlbGF5IHdoYXQgZ3Vlc3Qgd3JpdGUgdG8g
dmhvc3QtdmRwYS4gSXQncyBqdXN0IGJlY2F1c2UgY3VycmVudCBRZW11DQo+ID4gPiByZXF1aXJl
IHRvIGhhdmUgaXQgZHVyaW5nIHZpcnRpbyBkZXZpY2UgaW5pdGlhbGl6YXRpb24uDQo+ID4gPg0K
PiA+ID4gVGhhbmtzDQo+ID4NCj4gPg0KPiA+IEkgYWdyZWUgYnV0IHRoZXNlIG9rIHRoaW5ncyBt
YWtlIGZvciBhIGNsZWFuZXIgQVBJIEkgdGhpbmsuDQo+IA0KPiBSaWdodC4NCj4gDQo+IFRoYW5r
cw0KPiANCj4gPg0KPiA+ID4gPg0KPiA+ID4gPiA+IFRoYW5rcw0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiAtIEdFVF9DT05GSUdfU0laRTogdGhl
IHNpemUgb2YgdGhlIHZpcnRpbyBjb25maWcgc3BhY2UNCj4gPiA+ID4gPiA+ID4gPiAtIEdFVF9W
UVNfTlVNOiB0aGUgY291bnQgb2YgdmlydHF1ZXVlcyB0aGF0IGV4cG9ydGVkDQo+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMb25ncGVuZyA8bG9uZ3Blbmcy
QGh1YXdlaS5jb20+DQo+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gIGxpbnV4
LWhlYWRlcnMvbGludXgvdmhvc3QuaCB8IDEwICsrKysrKysrKysNCj4gPiA+ID4gPiA+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9saW51eC1oZWFkZXJzL2xpbnV4L3Zob3N0LmgNCj4gYi9s
aW51eC1oZWFkZXJzL2xpbnV4L3Zob3N0LmgNCj4gPiA+ID4gPiA+ID4gPiBpbmRleCBjOTk4ODYw
ZDdiLi5jNWVkZDc1ZDE1IDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2xpbnV4LWhlYWRl
cnMvbGludXgvdmhvc3QuaA0KPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2xpbnV4LWhlYWRlcnMvbGlu
dXgvdmhvc3QuaA0KPiA+ID4gPiA+ID4gPiA+IEBAIC0xNTAsNCArMTUwLDE0IEBADQo+ID4gPiA+
ID4gPiA+ID4gIC8qIEdldCB0aGUgdmFsaWQgaW92YSByYW5nZSAqLw0KPiA+ID4gPiA+ID4gPiA+
ICAjZGVmaW5lIFZIT1NUX1ZEUEFfR0VUX0lPVkFfUkFOR0UgICAgICBfSU9SKFZIT1NUX1ZJUlRJ
TywgMHg3OCwNCj4gXA0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdA0KPiB2aG9zdF92ZHBhX2lvdmFfcmFuZ2UpDQo+ID4g
PiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ICsvKiBHZXQgdGhlIG51bWJlciBvZiB2ZWN0
b3JzICovDQo+ID4gPiA+ID4gPiA+ID4gKyNkZWZpbmUgVkhPU1RfVkRQQV9HRVRfVkVDVE9SU19O
VU0gICAgIF9JT1IoVkhPU1RfVklSVElPLCAweDc5LA0KPiBpbnQpDQo+ID4gPiA+ID4gPiA+ID4g
Kw0KPiA+ID4gPiA+ID4gPiA+ICsvKiBHZXQgdGhlIHZpcnRpbyBjb25maWcgc2l6ZSAqLw0KPiA+
ID4gPiA+ID4gPiA+ICsjZGVmaW5lIFZIT1NUX1ZEUEFfR0VUX0NPTkZJR19TSVpFICAgICBfSU9S
KFZIT1NUX1ZJUlRJTywgMHg4MCwNCj4gaW50KQ0KPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4g
PiA+ID4gPiArLyogR2V0IHRoZSBudW1iZXIgb2YgdmlydHF1ZXVlcyAqLw0KPiA+ID4gPiA+ID4g
PiA+ICsjZGVmaW5lIFZIT1NUX1ZEUEFfR0VUX1ZRU19OVU0gICAgICAgICBfSU9SKFZIT1NUX1ZJ
UlRJTywgMHg4MSwNCj4gaW50KQ0KPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiAg
I2VuZGlmDQo+ID4gPiA+ID4gPiA+ID4gLS0NCj4gPiA+ID4gPiA+ID4gPiAyLjIzLjANCj4gPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPg0KDQo=

