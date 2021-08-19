Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0AE3F1C8C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:22:50 +0200 (CEST)
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjsX-0006PD-LI
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1mGjre-0005X7-RN; Thu, 19 Aug 2021 11:21:54 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1mGjrb-0000HE-OT; Thu, 19 Aug 2021 11:21:54 -0400
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Gr7kY2D9Xz6DKlv;
 Thu, 19 Aug 2021 23:20:37 +0800 (CST)
Received: from lhreml715-chm.china.huawei.com (10.201.108.66) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 19 Aug 2021 17:21:37 +0200
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml715-chm.china.huawei.com (10.201.108.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 19 Aug 2021 16:21:37 +0100
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2308.008; Thu, 19 Aug 2021 16:21:37 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, "Ani
 Sinha" <ani@anisinha.ca>
Subject: RE: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
Thread-Topic: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
Thread-Index: AQHXjyshD1ecXEbjmUeOqcPoduSk96t3FiQAgAOwnoCAAAWCAIAAAyEAgAAUcgCAABem0A==
Date: Thu, 19 Aug 2021 15:21:37 +0000
Message-ID: <2ce72c03d5864522a3e886287c2c6fa7@huawei.com>
References: <20210812033405.362985-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2108171014500.202364@anisinha-lenovo>
 <CAFEAcA8Fu+mkzFi9JdTtbqMcnnV74Swk04xx2a1G4L_oATY2eQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2108191849260.417749@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108191905100.418214@anisinha-lenovo>
 <16b11751-7ab2-8d68-0bf2-5453bc2938fc@redhat.com>
In-Reply-To: <16b11751-7ab2-8d68-0bf2-5453bc2938fc@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.94.122]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgW21haWx0bzpwaGlsbWRAcmVkaGF0LmNvbV0NCj4gU2VudDogMTkgQXVndXN0IDIw
MjEgMTU6NTANCj4gVG86IEFuaSBTaW5oYSA8YW5pQGFuaXNpbmhhLmNhPg0KPiBDYzogUGV0ZXIg
TWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgUUVNVSBEZXZlbG9wZXJzDQo+IDxx
ZW11LWRldmVsQG5vbmdudS5vcmc+OyBxZW11LWFybSA8cWVtdS1hcm1Abm9uZ251Lm9yZz47IE1p
Y2hhZWwgUy4NCj4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+OyBJZ29yIE1hbW1lZG92IDxpbWFt
bWVkb0ByZWRoYXQuY29tPjsNCj4gU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFs
aS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBody9h
cm0vS2NvbmZpZzogbm8gbmVlZCB0byBlbmFibGUNCj4gQUNQSV9NRU1PUllfSE9UUExVRyBleHBs
aWNpdGx5DQo+IA0KPiBDYydpbmcgU2hhbWVlciBLb2xvdGh1bS4NCj4gDQo+IE9uIDgvMTkvMjEg
MzozNiBQTSwgQW5pIFNpbmhhIHdyb3RlOg0KPiA+IE9uIFRodSwgMTkgQXVnIDIwMjEsIEFuaSBT
aW5oYSB3cm90ZToNCj4gPj4gT24gVGh1LCAxOSBBdWcgMjAyMSwgUGV0ZXIgTWF5ZGVsbCB3cm90
ZToNCj4gPj4+IE9uIFR1ZSwgMTcgQXVnIDIwMjEgYXQgMDU6NDUsIEFuaSBTaW5oYSA8YW5pQGFu
aXNpbmhhLmNhPiB3cm90ZToNCj4gDQo+ID4+PiBJcyBpdCBpbnRlbmRlZCB0aGF0IEFDUElfSFdf
UkVEVUNFRCBtdXN0IGFsd2F5cyBpbXBseQ0KPiA+Pj4gQUNQSV9NRU1PUllfSE9UUExVRywgb3Ig
aXMgaXQganVzdCBhIGNvaW5jaWRlbmNlIHRoYXQgdGhlIHZpcnQgYm9hcmQNCj4gPj4+IGhhcHBl
bnMgdG8gd2FudCBib3RoLCBhbmQgc28gd2Ugc2VsZWN0IGJvdGggPw0KPiANCj4gVGhlIEFDUEkg
ZGVwZW5kZW5jeSB3YXMgbWlzc2luZyAoc2VlIGNvbW1pdCAzNmI3OWUzMjE5ZCwNCj4gImh3L2Fj
cGkvS2NvbmZpZzogQWRkIG1pc3NpbmcgS2NvbmZpZyBkZXBlbmRlbmNpZXMgKGJ1aWxkIGVycm9y
KSIsIG5vdyB3ZQ0KPiBkb24ndCBuZWVkIGl0IGV4cGxpY2l0bHkuDQoNClllcy4gQW5kIGl0IGxv
b2tzIGxpa2UgQUNQSV9OVkRJTU0gYWxzbyBjYW4gYmUgcmVtb3ZlZCBub3cuDQoNClJlZ2FyZHMs
DQpTaGFtZWVyDQoNCj4gPj4gRnJvbSBhIHB1cmVseSBjb2RlIGluc3BlY3Rpb24gcG9pbnQgb2Yg
dmlldywgSSBub3RpY2VkIHRoYXQNCj4gPj4gZ2VuZXJpY19ldmVudF9kZXZpY2UuYyBkZXBlbmRz
IG9uIENPTkZJR19BQ1BJX0hXX1JFRFVDRUQuIFRoZSBHRUQNCj4gPj4gZG9lcyB1c2UgbWVtb3J5
IGhvdHBsdWcgYXBpcyAtIGZvciBleGFtcGxlIGFjcGlfZ2VkX2RldmljZV9wbHVnX2NiKCkNCj4g
Pj4gdXNlcw0KPiA+PiBhY3BpX21lbW9yeV9wbHVnX2NiKCkgZXRjLg0KPiA+Pg0KPiA+PiBIZW5j
ZSwgYXMgaXQgc3RhbmRzIHRvZGF5LCBDT05GSUdfQUNQSV9IV19SRURVQ0VEIHdpbGwgbmVlZCB0
byBzZWxlY3QNCj4gPj4gQUNQSSBtZW1vcnkgaG90cGx1Zy4gVW5sZXNzIHdlIHJlbW92ZSB0aGUg
R0VEIGRldmljZSdzIGRlcGVuZGVuY2Ugb24NCj4gPj4gQUNQSV9IV19SRURVQ0VEIHRoYXQgaXMu
IEkgY2Fubm90IGNvbW1lbnQgd2hldGhlciB0aGF0IHdvdWxkIGJlIHdpc2UNCj4gPj4gb3IgaWYg
d2Ugc2hvdWxkIHJlb3JnIHRoZSBjb2RlIGluIHNvbWUgb3RoZXIgd2F5Lg0KPiA+DQo+ID4gVGhl
IG90aGVyIHF1ZXN0aW9uIHdlIHNob3VsZCBhc2sgaXMgd2hldGhlciBhcm0gcGxhdGZvcm0gcmVx
dWlyZXMNCj4gPiBBQ1BJX01FTU9SWV9IT1RQTFVHIGluZGVwZW5kZW50IG9mIEFDUElfSFdfUkVE
VUNFRC9HRUQgZGV2aWNlPw0KPiBJZiB0aGF0DQo+ID4gaXMgdGhlIGNhc2UsIHRoZW4gbWF5YmUg
d2Ugc2hvdWxkIGtlZXAgdGhhdCBjb25maWcgb3B0aW9uIGFzIGlzLg0KPiA+IE1heWJlIEBxZW11
LWFybSBjYW4gYW5zd2VyIHRoYXQ/DQo+IA0KPiBPciBnaXQtbG9nOg0KPiANCj4gY29tbWl0IGNm
ZjUxYWM5NzhjNGZhMGIzZDBkZTBmZDYyZDc3MmQ5MDAzZjEyM2UNCj4gQXV0aG9yOiBTaGFtZWVy
IEtvbG90aHVtIDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+DQo+IERhdGU6
ICAgV2VkIFNlcCAxOCAxNDowNjoyNyAyMDE5ICswMTAwDQo+IA0KPiAgICAgaHcvYXJtL3ZpcnQ6
IEVuYWJsZSBkZXZpY2UgbWVtb3J5IGNvbGQvaG90IHBsdWcgd2l0aCBBQ1BJIGJvb3QNCj4gDQo+
ICAgICBUaGlzIGluaXRpYWxpemVzIHRoZSBHRUQgZGV2aWNlIHdpdGggYmFzZSBtZW1vcnkgYW5k
IGlycSwgY29uZmlndXJlcw0KPiAgICAgZ2VkIG1lbW9yeSBob3RwbHVnIGV2ZW50IGFuZCBidWls
ZHMgdGhlIGNvcnJlc3BvbmRpbmcgYW1sIGNvZGUuIFdpdGgNCj4gICAgIHRoaXMsIGJvdGggaG90
IGFuZCBjb2xkIHBsdWcgb2YgZGV2aWNlIG1lbW9yeSBpcyBlbmFibGVkIG5vdyBmb3INCj4gICAg
IEd1ZXN0IHdpdGggQUNQSSBib290LiBNZW1vcnkgY29sZCBwbHVnIHN1cHBvcnQgd2l0aCBHdWVz
dCBEVCBib290IGlzDQo+ICAgICBub3QgeWV0IHN1cHBvcnRlZC4NCj4gDQo+ID4+Pj4gT24gVGh1
LCAxMiBBdWcgMjAyMSwgQW5pIFNpbmhhIHdyb3RlOg0KPiA+Pj4+DQo+IA0KPiBQbGVhc2UgcHJl
cGVuZCBoZXJlICdTaW5jZSBjb21taXQgMzZiNzllMzIxOWQgKCJody9hY3BpL0tjb25maWc6IEFk
ZA0KPiBtaXNzaW5nIEtjb25maWcgZGVwZW5kZW5jaWVzIiksJw0KPiANCj4gV2l0aCBpdDoNCj4g
UmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4N
Cj4gDQo+ID4+Pj4+IEFDUElfTUVNT1JZX0hPVFBMVUcgaXMgaW1wbGljaXRseSB0dXJuZWQgb24g
d2hlbg0KPiBBQ1BJX0hXX1JFRFVDRUQgaXMgc2VsZWN0ZWQuDQo+ID4+Pj4+IEFDUElfSFdfUkVE
VUNFRCBpcyBhbHJlYWR5IGVuYWJsZWQuIE5vIG5lZWQgdG8gdHVybiBvbg0KPiA+Pj4+PiBBQ1BJ
X01FTU9SWV9IT1RQTFVHIGV4cGxpY2l0bHkuIFRoaXMgaXMgYSBtaW5vciBjbGVhbnVwLg0KPiA+
Pj4+Pg0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmkgU2luaGEgPGFuaUBhbmlzaW5oYS5jYT4N
Cj4gPj4+Pj4gLS0tDQo+ID4+Pj4+ICBody9hcm0vS2NvbmZpZyB8IDEgLQ0KPiA+Pj4+PiAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gPj4+Pj4NCj4gPj4+Pj4gZGlmZiAtLWdpdCBh
L2h3L2FybS9LY29uZmlnIGIvaHcvYXJtL0tjb25maWcgaW5kZXgNCj4gPj4+Pj4gNGJhMGFjYTA2
Ny4uMzhjZjlmNDRlMiAxMDA2NDQNCj4gPj4+Pj4gLS0tIGEvaHcvYXJtL0tjb25maWcNCj4gPj4+
Pj4gKysrIGIvaHcvYXJtL0tjb25maWcNCj4gPj4+Pj4gQEAgLTI1LDcgKzI1LDYgQEAgY29uZmln
IEFSTV9WSVJUDQo+ID4+Pj4+ICAgICAgc2VsZWN0IEFDUElfUENJDQo+ID4+Pj4+ICAgICAgc2Vs
ZWN0IE1FTV9ERVZJQ0UNCj4gPj4+Pj4gICAgICBzZWxlY3QgRElNTQ0KPiA+Pj4+PiAtICAgIHNl
bGVjdCBBQ1BJX01FTU9SWV9IT1RQTFVHDQo+ID4+Pj4+ICAgICAgc2VsZWN0IEFDUElfSFdfUkVE
VUNFRA0KPiA+Pj4+PiAgICAgIHNlbGVjdCBBQ1BJX05WRElNTQ0KPiA+Pj4+PiAgICAgIHNlbGVj
dCBBQ1BJX0FQRUkNCj4gPj4+Pj4gLS0NCj4gPj4+Pj4gMi4yNS4xDQoNCg==

