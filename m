Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61620484E79
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 07:52:07 +0100 (CET)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n509W-0001pQ-0l
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 01:52:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4zya-0008EZ-JS
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:40:50 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:3260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4zy0-00037X-I9
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:40:19 -0500
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JTKWp6Dv0z1DKLg;
 Wed,  5 Jan 2022 14:36:38 +0800 (CST)
Received: from dggpeml100025.china.huawei.com (7.185.36.37) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 14:40:05 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml100025.china.huawei.com (7.185.36.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 14:40:05 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Wed, 5 Jan 2022 14:40:05 +0800
To: Jason Wang <jasowang@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, mst <mst@redhat.com>, "Stefano
 Garzarella" <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 pbonzini <pbonzini@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Yechuan <yechuan@huawei.com>, Huangzhichao <huangzhichao@huawei.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: RE: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
Thread-Topic: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
Thread-Index: AQHYAc9wPMXmSOXfFU+/REf6MOZJ4KxTUbaAgACgFdA=
Date: Wed, 5 Jan 2022 06:40:04 +0000
Message-ID: <9595dde01f434f1a9a683f3ca3477ff9@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
In-Reply-To: <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
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
MDIyIDEyOjM2IFBNDQo+IFRvOiBMb25ncGVuZyAoTWlrZSwgQ2xvdWQgSW5mcmFzdHJ1Y3R1cmUg
U2VydmljZSBQcm9kdWN0IERlcHQuKQ0KPiA8bG9uZ3BlbmcyQGh1YXdlaS5jb20+DQo+IENjOiBT
dGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+OyBtc3QgPG1zdEByZWRoYXQuY29t
PjsgU3RlZmFubw0KPiBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPjsgQ29ybmVsaWEg
SHVjayA8Y29odWNrQHJlZGhhdC5jb20+OyBwYm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNv
bT47IEdvbmdsZWkgKEFyZWkpIDxhcmVpLmdvbmdsZWlAaHVhd2VpLmNvbT47IFllY2h1YW4NCj4g
PHllY2h1YW5AaHVhd2VpLmNvbT47IEh1YW5nemhpY2hhbyA8aHVhbmd6aGljaGFvQGh1YXdlaS5j
b20+OyBxZW11LWRldmVsDQo+IDxxZW11LWRldmVsQG5vbmdudS5vcmc+DQo+IFN1YmplY3Q6IFJl
OiBbUkZDIDAyLzEwXSB2aG9zdDogYWRkIDMgY29tbWFuZHMgZm9yIHZob3N0LXZkcGENCj4gDQo+
IE9uIFdlZCwgSmFuIDUsIDIwMjIgYXQgODo1OSBBTSBMb25ncGVuZyhNaWtlKSA8bG9uZ3Blbmcy
QGh1YXdlaS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogTG9uZ3BlbmcgPGxvbmdwZW5nMkBo
dWF3ZWkuY29tPg0KPiA+DQo+ID4gVG8gc3VwcG9ydCBnZW5lcmljIHZkcGEgZGVpdmNlLCB3ZSBu
ZWVkIGFkZCB0aGUgZm9sbG93aW5nIGlvY3RsczoNCj4gPiAtIEdFVF9WRUNUT1JTX05VTTogdGhl
IGNvdW50IG9mIHZlY3RvcnMgdGhhdCBzdXBwb3J0ZWQNCj4gDQo+IERvZXMgdGhpcyBtZWFuIE1T
SSB2ZWN0b3JzPyBJZiB5ZXMsIGl0IGxvb2tzIGxpa2UgYSBsYXllciB2aW9sYXRpb246DQo+IHZo
b3N0IGlzIHRyYW5zcG9ydCBpbmRlcGVuZGVudC4gIEFuZCBpdCByZXZlYWxzIGRldmljZSBpbXBs
ZW1lbnRhdGlvbg0KPiBkZXRhaWxzIHdoaWNoIGJsb2NrIChjcm9zcyB2ZW5kb3IpIG1pZ3JhdGlv
bi4NCj4gDQoNCkNhbiB3ZSBzZXQgdGhlIFZpcnRJT1BDSVByb3h5Lm52ZWN0b3JzIHRvICJ0aGUg
Y291bnQgb2YgdmlydHF1ZXVlcyArIDEgKGNvbmZpZykiID8NCg0KPiBUaGFua3MNCj4gDQo+ID4g
LSBHRVRfQ09ORklHX1NJWkU6IHRoZSBzaXplIG9mIHRoZSB2aXJ0aW8gY29uZmlnIHNwYWNlDQo+
ID4gLSBHRVRfVlFTX05VTTogdGhlIGNvdW50IG9mIHZpcnRxdWV1ZXMgdGhhdCBleHBvcnRlZA0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTG9uZ3BlbmcgPGxvbmdwZW5nMkBodWF3ZWkuY29tPg0K
PiA+IC0tLQ0KPiA+ICBsaW51eC1oZWFkZXJzL2xpbnV4L3Zob3N0LmggfCAxMCArKysrKysrKysr
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvbGludXgtaGVhZGVycy9saW51eC92aG9zdC5oIGIvbGludXgtaGVhZGVycy9saW51eC92
aG9zdC5oDQo+ID4gaW5kZXggYzk5ODg2MGQ3Yi4uYzVlZGQ3NWQxNSAxMDA2NDQNCj4gPiAtLS0g
YS9saW51eC1oZWFkZXJzL2xpbnV4L3Zob3N0LmgNCj4gPiArKysgYi9saW51eC1oZWFkZXJzL2xp
bnV4L3Zob3N0LmgNCj4gPiBAQCAtMTUwLDQgKzE1MCwxNCBAQA0KPiA+ICAvKiBHZXQgdGhlIHZh
bGlkIGlvdmEgcmFuZ2UgKi8NCj4gPiAgI2RlZmluZSBWSE9TVF9WRFBBX0dFVF9JT1ZBX1JBTkdF
ICAgICAgX0lPUihWSE9TVF9WSVJUSU8sIDB4NzgsIFwNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdmhvc3RfdmRwYV9pb3ZhX3JhbmdlKQ0K
PiA+ICsNCj4gPiArLyogR2V0IHRoZSBudW1iZXIgb2YgdmVjdG9ycyAqLw0KPiA+ICsjZGVmaW5l
IFZIT1NUX1ZEUEFfR0VUX1ZFQ1RPUlNfTlVNICAgICBfSU9SKFZIT1NUX1ZJUlRJTywgMHg3OSwg
aW50KQ0KPiA+ICsNCj4gPiArLyogR2V0IHRoZSB2aXJ0aW8gY29uZmlnIHNpemUgKi8NCj4gPiAr
I2RlZmluZSBWSE9TVF9WRFBBX0dFVF9DT05GSUdfU0laRSAgICAgX0lPUihWSE9TVF9WSVJUSU8s
IDB4ODAsIGludCkNCj4gPiArDQo+ID4gKy8qIEdldCB0aGUgbnVtYmVyIG9mIHZpcnRxdWV1ZXMg
Ki8NCj4gPiArI2RlZmluZSBWSE9TVF9WRFBBX0dFVF9WUVNfTlVNICAgICAgICAgX0lPUihWSE9T
VF9WSVJUSU8sIDB4ODEsIGludCkNCj4gPiArDQo+ID4gICNlbmRpZg0KPiA+IC0tDQo+ID4gMi4y
My4wDQo+ID4NCg0K

