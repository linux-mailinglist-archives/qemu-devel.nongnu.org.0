Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82A484F72
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 09:39:25 +0100 (CET)
Received: from localhost ([::1]:35606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n51pM-0004fE-G6
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 03:39:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n51ny-0003z5-Se
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:37:59 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n51nv-0005Ka-Ku
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:37:58 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JTNBQ1L68z9s05;
 Wed,  5 Jan 2022 16:36:46 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 16:37:48 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Wed, 5 Jan 2022 16:37:48 +0800
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>, pbonzini
 <pbonzini@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan
 <yechuan@huawei.com>, Huangzhichao <huangzhichao@huawei.com>, qemu-devel
 <qemu-devel@nongnu.org>
Subject: RE: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
Thread-Topic: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
Thread-Index: AQHYAc9wPMXmSOXfFU+/REf6MOZJ4KxTUbaAgAAo9wCAAA5zgIAAjrDg
Date: Wed, 5 Jan 2022 08:37:48 +0000
Message-ID: <1d157f74fdac49ff8ae734808bd3c518@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
 <20220105020008-mutt-send-email-mst@kernel.org>
 <CACGkMEsPqADAR1LhjP=Y4ShhSogdrf2T8O2Km22G7FwGCe+hrQ@mail.gmail.com>
In-Reply-To: <CACGkMEsPqADAR1LhjP=Y4ShhSogdrf2T8O2Km22G7FwGCe+hrQ@mail.gmail.com>
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
bHRvOmphc293YW5nQHJlZGhhdC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSA1LCAy
MDIyIDM6NTQgUE0NCj4gVG86IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+
IENjOiBMb25ncGVuZyAoTWlrZSwgQ2xvdWQgSW5mcmFzdHJ1Y3R1cmUgU2VydmljZSBQcm9kdWN0
IERlcHQuKQ0KPiA8bG9uZ3BlbmcyQGh1YXdlaS5jb20+OyBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+OyBTdGVmYW5vDQo+IEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5j
b20+OyBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT47IHBib256aW5pDQo+IDxwYm9u
emluaUByZWRoYXQuY29tPjsgR29uZ2xlaSAoQXJlaSkgPGFyZWkuZ29uZ2xlaUBodWF3ZWkuY29t
PjsgWWVjaHVhbg0KPiA8eWVjaHVhbkBodWF3ZWkuY29tPjsgSHVhbmd6aGljaGFvIDxodWFuZ3po
aWNoYW9AaHVhd2VpLmNvbT47IHFlbXUtZGV2ZWwNCj4gPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtSRkMgMDIvMTBdIHZob3N0OiBhZGQgMyBjb21tYW5kcyBmb3Igdmhv
c3QtdmRwYQ0KPiANCj4gT24gV2VkLCBKYW4gNSwgMjAyMiBhdCAzOjAyIFBNIE1pY2hhZWwgUy4g
VHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gV2VkLCBKYW4gMDUs
IDIwMjIgYXQgMTI6MzU6NTNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToNCj4gPiA+IE9uIFdl
ZCwgSmFuIDUsIDIwMjIgYXQgODo1OSBBTSBMb25ncGVuZyhNaWtlKSA8bG9uZ3BlbmcyQGh1YXdl
aS5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBGcm9tOiBMb25ncGVuZyA8bG9uZ3Blbmcy
QGh1YXdlaS5jb20+DQo+ID4gPiA+DQo+ID4gPiA+IFRvIHN1cHBvcnQgZ2VuZXJpYyB2ZHBhIGRl
aXZjZSwgd2UgbmVlZCBhZGQgdGhlIGZvbGxvd2luZyBpb2N0bHM6DQo+ID4gPiA+IC0gR0VUX1ZF
Q1RPUlNfTlVNOiB0aGUgY291bnQgb2YgdmVjdG9ycyB0aGF0IHN1cHBvcnRlZA0KPiA+ID4NCj4g
PiA+IERvZXMgdGhpcyBtZWFuIE1TSSB2ZWN0b3JzPyBJZiB5ZXMsIGl0IGxvb2tzIGxpa2UgYSBs
YXllciB2aW9sYXRpb246DQo+ID4gPiB2aG9zdCBpcyB0cmFuc3BvcnQgaW5kZXBlbmRlbnQuDQo+
ID4NCj4gPiBXZWxsICpndWVzdCogbmVlZHMgdG8ga25vdyBob3cgbWFueSB2ZWN0b3JzIGRldmlj
ZSBzdXBwb3J0cy4NCj4gPiBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYSB3YXkgYXJvdW5kIHRoYXQu
IERvIHlvdT8NCj4gDQo+IFdlIGhhdmUgVkhPU1RfU0VUX1ZSSU5HL0NPTkZJR19DQUxMIHdoaWNo
IGlzIHBlciB2cS4gSSB0aGluayB3ZSBjYW4NCj4gc2ltcGx5IGFzc3VtZSAjdnFzICsgMT8NCj4g
DQo+ID4gT3RoZXJ3aXNlIGd1ZXN0cyB3aWxsIGF0IGJlc3QgYmUgc3Vib3B0aW1hbC4NCj4gPg0K
PiA+ID4gIEFuZCBpdCByZXZlYWxzIGRldmljZSBpbXBsZW1lbnRhdGlvbg0KPiA+ID4gZGV0YWls
cyB3aGljaCBibG9jayAoY3Jvc3MgdmVuZG9yKSBtaWdyYXRpb24uDQo+ID4gPg0KPiA+ID4gVGhh
bmtzDQo+ID4NCj4gPiBOb3QgbmVjZXNzYXJpbHksIHVzZXJzcGFjZSBjYW4gaGlkZSB0aGlzIGZy
b20gZ3Vlc3QgaWYgaXQNCj4gPiB3YW50cyB0bywganVzdCB2YWxpZGF0ZS4NCj4gDQo+IElmIHdl
IGNhbiBoaWRlIGl0IGF0IHZob3N0L3VBUEkgbGV2ZWwsIGl0IHdvdWxkIGJlIGV2ZW4gYmV0dGVy
Pw0KPiANCg0KTm90IG9ubHkgTVNJIHZlY3RvcnMsIGJ1dCBhbHNvIHF1ZXVlLXNpemUsICN2cXMs
IGV0Yy4NCg0KTWF5YmUgdGhlIHZob3N0IGxldmVsIGNvdWxkIGV4cG9zZSB0aGUgaGFyZHdhcmUn
cyByZWFsIGNhcGFiaWxpdGllcw0KYW5kIGxldCB0aGUgdXNlcnNwYWNlIChRRU1VKSBkbyB0aGUg
aGlkaW5nPyBUaGUgdXNlcnNwYWNlIGtub3cgaG93DQp0byBwcm9jZXNzIHRoZW0uDQoNCj4gVGhh
bmtzDQo+IA0KPiA+DQo+ID4NCj4gPiA+ID4gLSBHRVRfQ09ORklHX1NJWkU6IHRoZSBzaXplIG9m
IHRoZSB2aXJ0aW8gY29uZmlnIHNwYWNlDQo+ID4gPiA+IC0gR0VUX1ZRU19OVU06IHRoZSBjb3Vu
dCBvZiB2aXJ0cXVldWVzIHRoYXQgZXhwb3J0ZWQNCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogTG9uZ3BlbmcgPGxvbmdwZW5nMkBodWF3ZWkuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+
ID4gIGxpbnV4LWhlYWRlcnMvbGludXgvdmhvc3QuaCB8IDEwICsrKysrKysrKysNCj4gPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYg
LS1naXQgYS9saW51eC1oZWFkZXJzL2xpbnV4L3Zob3N0LmggYi9saW51eC1oZWFkZXJzL2xpbnV4
L3Zob3N0LmgNCj4gPiA+ID4gaW5kZXggYzk5ODg2MGQ3Yi4uYzVlZGQ3NWQxNSAxMDA2NDQNCj4g
PiA+ID4gLS0tIGEvbGludXgtaGVhZGVycy9saW51eC92aG9zdC5oDQo+ID4gPiA+ICsrKyBiL2xp
bnV4LWhlYWRlcnMvbGludXgvdmhvc3QuaA0KPiA+ID4gPiBAQCAtMTUwLDQgKzE1MCwxNCBAQA0K
PiA+ID4gPiAgLyogR2V0IHRoZSB2YWxpZCBpb3ZhIHJhbmdlICovDQo+ID4gPiA+ICAjZGVmaW5l
IFZIT1NUX1ZEUEFfR0VUX0lPVkFfUkFOR0UgICAgICBfSU9SKFZIT1NUX1ZJUlRJTywgMHg3OCwg
XA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3Qgdmhvc3RfdmRwYV9pb3ZhX3JhbmdlKQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsvKiBHZXQg
dGhlIG51bWJlciBvZiB2ZWN0b3JzICovDQo+ID4gPiA+ICsjZGVmaW5lIFZIT1NUX1ZEUEFfR0VU
X1ZFQ1RPUlNfTlVNICAgICBfSU9SKFZIT1NUX1ZJUlRJTywgMHg3OSwgaW50KQ0KPiA+ID4gPiAr
DQo+ID4gPiA+ICsvKiBHZXQgdGhlIHZpcnRpbyBjb25maWcgc2l6ZSAqLw0KPiA+ID4gPiArI2Rl
ZmluZSBWSE9TVF9WRFBBX0dFVF9DT05GSUdfU0laRSAgICAgX0lPUihWSE9TVF9WSVJUSU8sIDB4
ODAsIGludCkNCj4gPiA+ID4gKw0KPiA+ID4gPiArLyogR2V0IHRoZSBudW1iZXIgb2YgdmlydHF1
ZXVlcyAqLw0KPiA+ID4gPiArI2RlZmluZSBWSE9TVF9WRFBBX0dFVF9WUVNfTlVNICAgICAgICAg
X0lPUihWSE9TVF9WSVJUSU8sIDB4ODEsIGludCkNCj4gPiA+ID4gKw0KPiA+ID4gPiAgI2VuZGlm
DQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuMjMuMA0KPiA+ID4gPg0KPiA+DQoNCg==

