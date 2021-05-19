Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43B3888CD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 09:56:41 +0200 (CEST)
Received: from localhost ([::1]:54416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljH4K-0002pP-Fr
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 03:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1ljH2b-0001yb-CX; Wed, 19 May 2021 03:54:53 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1ljH2Y-0003tx-BY; Wed, 19 May 2021 03:54:53 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FlQ7H2s5vzsRKS;
 Wed, 19 May 2021 15:51:55 +0800 (CST)
Received: from dggemm753-chm.china.huawei.com (10.1.198.59) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 15:54:41 +0800
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 dggemm753-chm.china.huawei.com (10.1.198.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 15:54:40 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.2176.012; 
 Wed, 19 May 2021 08:54:38 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>
Subject: RE: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Thread-Topic: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Thread-Index: AQHXMDzb5q8WzYljr0ilpO+8Rxsx7Krg+0EAgAgNE7D///kagIAAE+FggACrCICAABT0MIAAdLEAgABcmnA=
Date: Wed, 19 May 2021 07:54:37 +0000
Message-ID: <f766805215ac439bb988dab02247ec71@huawei.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
 <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
 <b61a7413f98a430685b838eecc2db74f@huawei.com>
 <224d54ac-0c03-afc4-4aec-ea3435aa68e7@huawei.com>
In-Reply-To: <224d54ac-0c03-afc4-4aec-ea3435aa68e7@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.67.225]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=salil.mehta@huawei.com; helo=szxga05-in.huawei.com
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
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong <yangyicong@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>, "lijiajie \(H\)" <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiB3YW5neWFuYW4gKFkpDQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDE5LCAyMDIxIDQ6
MTggQU0NCj4gDQo+IA0KPiBPbiAyMDIxLzUvMTkgMzoyMiwgU2FsaWwgTWVodGEgd3JvdGU6DQo+
ID4+IEZyb206IEFuZHJldyBKb25lcyBbbWFpbHRvOmRyam9uZXNAcmVkaGF0LmNvbV0NCj4gPj4g
U2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDg6MDYgUE0NCj4gPj4gVG86IFNhbGlsIE1laHRh
IDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiA+PiBDYzogd2FuZ3lhbmFuIChZKSA8d2FuZ3lh
bmFuNTVAaHVhd2VpLmNvbT47IFBldGVyIE1heWRlbGwNCj4gPj4gPHBldGVyLm1heWRlbGxAbGlu
YXJvLm9yZz47IE1pY2hhZWwgUyAuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPjsgV2FuZ2hhaWJp
bg0KPiA+PiAoRCkgPHdhbmdoYWliaW4ud2FuZ0BodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25n
bnUub3JnOyBTaGFubm9uIFpoYW8NCj4gPj4gPHNoYW5ub24uemhhb3NsQGdtYWlsLmNvbT47IHFl
bXUtYXJtQG5vbmdudS5vcmc7IEFsaXN0YWlyIEZyYW5jaXMNCj4gPj4gPGFsaXN0YWlyLmZyYW5j
aXNAd2RjLmNvbT47IFplbmd0YW8gKEIpIDxwcmltZS56ZW5nQGhpc2lsaWNvbi5jb20+Ow0KPiA+
PiB5YW5neWljb25nIDx5YW5neWljb25nQGh1YXdlaS5jb20+OyB5dXplbmdodWkgPHl1emVuZ2h1
aUBodWF3ZWkuY29tPjsgSWdvcg0KPiA+PiBNYW1tZWRvdiA8aW1hbW1lZG9AcmVkaGF0LmNvbT47
IHpodWtlcWlhbiA8emh1a2VxaWFuMUBodWF3ZWkuY29tPjsgbGlqaWFqaWUNCj4gKEgpDQo+ID4+
IDxsaWppYWppZTExQGh1YXdlaS5jb20+OyBEYXZpZCBHaWJzb24gPGRhdmlkQGdpYnNvbi5kcm9w
YmVhci5pZC5hdT47DQo+IExpbnV4YXJtDQo+ID4+IDxsaW51eGFybUBodWF3ZWkuY29tPjsgbGlu
dXhhcm1Ab3BlbmV1bGVyLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2MiA1LzZd
IGh3L2FybS92aXJ0LWFjcGktYnVpbGQ6IEFkZCBQUFRUIHRhYmxlDQo+ID4+DQo+ID4+IE9uIFR1
ZSwgTWF5IDE4LCAyMDIxIGF0IDA2OjM0OjA4UE0gKzAwMDAsIFNhbGlsIE1laHRhIHdyb3RlOg0K
PiA+Pj4gICBUaG9zZSBiZW5lZml0cywgd2hlbiB2Y3B1IHBpbm5pbmcgaXMgdXNlZCwgYXJlIHRo
ZSBzYW1lIGJlbmVmaXRzDQo+ID4+Pj4gYXMgZm9yIHRoZSBob3N0LCB3aGljaCBhbHJlYWR5IHVz
ZSBQUFRUIHRhYmxlcyB0byBkZXNjcmliZSB0b3BvbG9neSwgZXZlbg0KPiA+Pj4+IHRob3VnaCBo
b3QgcGx1ZyBpc24ndCBzdXBwb3J0ZWQuDQo+ID4+PiB5ZXMgc3VyZSwgeW91IG1lYW4gcGlubmlu
ZyB2Y3B1cyBhY2NvcmRpbmcgdG8gdGhlIGNwdSB0b3BvbG9neSBmb3IgcGVyZm9ybWFuY2U/DQo+
ID4+IFl1cA0KPiA+IEFscmVhZHkgQWdyZWVkIDopDQo+ID4NCj4gPj4+PiBOb3csIGlmIHlvdSdy
ZSBzYXlpbmcgd2Ugc2hvdWxkIG9ubHkgZ2VuZXJhdGUgdGFibGVzIGZvciBzbXAuY3B1cywgbm90
DQo+ID4+PiBDb3JyZWN0LiBUaGlzIGlzIHdoYXQgSSB0aG91Z2h0IHdlIG11c3QgYmUgZG9pbmcg
ZXZlbiBub3cNCj4gPj4+DQo+ID4+Pj4gc21wLm1heGNwdXMsIGJlY2F1c2UgaG90IHBsdWcgaXNu
J3Qgc3VwcG9ydGVkIGFueXdheSwgdGhlbiBJIHNlZSB5b3VyDQo+ID4+Pj4gcG9pbnQuIEJ1dCwg
aXQnZCBiZSBiZXR0ZXIgdG8gcmVxdWlyZSBzbXAuY3B1cyA9PSBzbXAubWF4Y3B1cyBpbiBvdXIN
Cj4gPj4+PiBzbXBfcGFyc2UgZnVuY3Rpb24gdG8gZG8gdGhhdCwgd2hpY2ggd2UndmUgbmV2ZXIg
ZG9uZSBiZWZvcmUsIHNvIHdlIG1heQ0KPiA+Pj4+IGhhdmUgdHJvdWJsZSBzdXBwb3J0aW5nIGV4
aXN0aW5nIGNvbW1hbmQgbGluZXMuDQo+ID4+PiBJIGFtIHRyeWluZyB0byByZWNhbGwsIGlmIHRo
ZSB2Y3B1IEhvdHBsdWcgaXMgbm90IHN1cHBvcnRlZCB0aGVuIGNhbiB0aGV5DQo+ID4+PiBldmVy
IGJlIGRpZmZlcmVudD8NCj4gPj4+DQo+ID4+PiBjcHVzID0gICh0aHJlYWRzICogY29yZXMgKiBz
b2NrZXRzKQ0KPiA+Pj4NCj4gPj4+IHN0YXRpYyB2b2lkIHNtcF9wYXJzZShNYWNoaW5lU3RhdGUg
Km1zLCBRZW11T3B0cyAqb3B0cykNCj4gPj4+IHsNCj4gPj4+ICAgICAgIFsuLi5dDQo+ID4+Pg0K
PiA+Pj4gICAgICAgICAgaWYgKHNvY2tldHMgKiBjb3JlcyAqIHRocmVhZHMgIT0gbXMtPnNtcC5t
YXhfY3B1cykgew0KPiA+Pj4gICAgICAgICAgICAgIHdhcm5fcmVwb3J0KCJJbnZhbGlkIENQVSB0
b3BvbG9neSBkZXByZWNhdGVkOiAiDQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgInNv
Y2tldHMgKCV1KSAqIGNvcmVzICgldSkgKiB0aHJlYWRzICgldSkgIg0KPiA+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICIhPSBtYXhjcHVzICgldSkiLA0KPiA+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgIHNvY2tldHMsIGNvcmVzLCB0aHJlYWRzLA0KPiA+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgIG1zLT5zbXAubWF4X2NwdXMpOw0KPiA+Pj4gICAgICAgICAgfQ0KPiA+Pj4gICAg
ICAgWy4uLl0NCj4gPj4+IH0NCj4gPj4+DQo+ID4+PiBBbHRob3VnaCwgYWJvdmUgY2hlY2sgZG9l
cyBub3QgZXhpdCgxKSBhbmQganVzdCB3YXJucyBvbiBkZXRlY3RpbmcgaW52YWxpZA0KPiA+Pj4g
Q1BVIHRvcG9sb2d5LiBOb3Qgc3VyZSB3aHk/DQo+ID4+IEhtbSwgbm90IHN1cmUgd2hhdCBjb2Rl
IHlvdSBoYXZlIHRoZXJlLiBJIHNlZSB0aGlzIGluDQo+ID4+IGh3L2NvcmUvbWFjaGluZS5jOnNt
cF9wYXJzZQ0KPiA+Pg0KPiA+PiAgICAgICAgICBpZiAobXMtPnNtcC5tYXhfY3B1cyA8IGNwdXMp
IHsNCj4gPj4gICAgICAgICAgICAgIGVycm9yX3JlcG9ydCgibWF4Y3B1cyBtdXN0IGJlIGVxdWFs
IHRvIG9yIGdyZWF0ZXIgdGhhbiBzbXAiKTsNCj4gPj4gICAgICAgICAgICAgIGV4aXQoMSk7DQo+
ID4+ICAgICAgICAgIH0NCj4gPj4NCj4gPj4gICAgICAgICAgaWYgKHNvY2tldHMgKiBjb3JlcyAq
IHRocmVhZHMgIT0gbXMtPnNtcC5tYXhfY3B1cykgew0KPiA+PiAgICAgICAgICAgICAgZXJyb3Jf
cmVwb3J0KCJJbnZhbGlkIENQVSB0b3BvbG9neTogIg0KPiA+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJzb2NrZXRzICgldSkgKiBjb3JlcyAoJXUpICogdGhyZWFkcyAoJXUpICINCj4gPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAiIT0gbWF4Y3B1cyAoJXUpIiwNCj4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICBzb2NrZXRzLCBjb3JlcywgdGhyZWFkcywNCj4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICBtcy0+c21wLm1heF9jcHVzKTsNCj4gPj4gICAgICAgICAgICAg
IGV4aXQoMSk7DQo+ID4+ICAgICAgICAgIH0NCj4gPj4NCj4gPj4+IFdlbGwgaWYgeW91IHRoaW5r
IHRoZXJlIGFyZSBzdWJ0bGV0aWVzIHRvIHN1cHBvcnQgYWJvdmUgaW1wbGVtZW50YXRpb24gYW5k
DQo+ID4+PiB3ZSBjYW5ub3QgZG8gaXQgbm93IHRoZW4gc3VyZSBpdCBpcyB5b3VyIGNhbGwuIDop
DQo+IEhpIFNhbGlsLCBEcmV3LA0KPiA+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IC1zbXAgNCxtYXhj
cHVzPTggZG9lc24ndCBlcnJvciBvdXQgdG9kYXksIGV2ZW4gdGhvdWdoDQo+ID4+IGl0IGRvZXNu
J3QgZG8gYW55dGhpbmcuIE9UT0gsIC1zbXAgNCxjb3Jlcz0yIGRvZXNuJ3QgZXJyb3Igb3V0IGVp
dGhlciwgYnV0DQo+ID4+IHdlJ3JlIHByb3Bvc2luZyB0aGF0IGl0IHNob3VsZC4gTWF5YmUgd2Ug
Y2FuIHN0YXJ0IGVycm9yaW5nIG91dCB3aGVuDQo+ID4+IGNwdXMgIT0gbWF4Y3B1cyB1bnRpbCBo
b3QgcGx1ZyBpcyBzdXBwb3J0ZWQ/DQo+ID4gQWdyZWVkLCBib3RoIGRvbid0IG1ha2UgYW55IHNl
bnNlIGlmIGhvdHBsdWcgaXMgbm90IHN1cHBvcnRlZCBhbmQgaWRlYWxseSBzaG91bGQNCj4gPiBm
YWlsIHdpdGggZXJyb3IuIFdlIHNob3VsZCBibG9jayBhbnkgc3VjaCB0b3BvbG9neSBjb25maWd1
cmF0aW9uLg0KPiBJbiB0aGUgQVJNLXNwZWNpZmljIGZ1bmN0aW9uIHZpcnRfc21wX3BhcnNlKCkg
KHBhdGNoIDkpLCB0aGVyZSBhbHJlYWR5DQo+IGhhdmUgYmVlbiBzb21lIHJlc3RyaWN0aW9ucyBm
b3IgdGhlIGdpdmVuIC1zbXAgY29uZmlndXJhdGlvbi4NCj4gV2Ugbm93IG9ubHkgYWxsb3c6DQo+
IC1zbXAgTg0KPiAtc21wIG1heGNwdXM9TQ0KPiAtc21wIE4sIG1heGNwdXM9TQ0KPiANCj4gLXNt
cCBOLCBzb2NrZXRzPVgsIGNvcmVzPVkNCj4gLXNtcCBOLCBzb2NrZXRzPVgsIGNvcmVzPVksIHRo
cmVhZHM9Wg0KPiANCj4gLXNtcCBtYXhjcHVzPU0sIHNvY2tldHM9WCwgY29yZXM9WQ0KPiAtc21w
IG1heGNwdXM9TSwgc29ja2V0cz1YLCBjb3Jlcz1ZLCB0aHJlYWRzPVoNCj4gDQo+IC1zbXAgTiwg
bWF4Y3B1cz1NLCBzb2NrZXRzPVgsIGNvcmVzPVkNCj4gLXNtcCBOLCBtYXhjcHVzPU0sIHNvY2tl
dHM9WCwgY29yZXM9WSwgdGhyZWFkcz1aDQo+IA0KPiBhbmQgZGlzYWxsb3cgdGhlIG90aGVyIHN0
cmFuZ2UgYW5kIHJhcmUgZm9ybWF0cyB0aGF0IHNob3VsZG4ndCBiZSBwcm92aWRlZC4NCj4gDQo+
IEl0J3MgcmVhc29uYWJsZSB0byBibG9jayB0aGUgdG9wb2xvZ3kgY29uZmlndXJhdGlvbiB3aGlj
aCBpcyBub3QgdXNlZnVsDQo+IGN1cnJlbnRseS4gSSB3aWxsIGFkZCB0aGUgcmVxdWlyZW1lbnQg
Zm9yICJjcHVzPT1tYXhjcHVzIiBpbiB0aGlzIGZ1Y3Rpb24NCj4gaWYgdGhlIHBvc3NpYmxlIGNv
bmZsaWN0IHdpdGggZXhpc3RpbmcgY29tbWFuZCBsaW5lcyBpcyBub3QgYSBiaWcgcHJvYmxlbS4N
Cg0KSGkgWWFuYW4sDQpNYWtlcyBzZW5zZS4gSSBkaWQgc2VlIHlvdXIgb3RoZXIgcGF0Y2gtc2V0
IGluIHdoaWNoIGNsdXN0ZXIgc3VwcG9ydCBoYXMgYmVlbg0KYWRkZWQuIEFyZSB3ZSBkZWZlcnJp
bmcgdGhhdCB0b28/DQoNClRoYW5rcw0K

