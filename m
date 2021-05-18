Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F603872D6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 09:06:13 +0200 (CEST)
Received: from localhost ([::1]:37248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1litnw-0004vB-52
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 03:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1litmr-0003eU-PV; Tue, 18 May 2021 03:05:05 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1litmo-0002pe-WF; Tue, 18 May 2021 03:05:05 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fkn3V4MmwzQpKQ;
 Tue, 18 May 2021 15:01:26 +0800 (CST)
Received: from dggema721-chm.china.huawei.com (10.3.20.85) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 15:04:55 +0800
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 dggema721-chm.china.huawei.com (10.3.20.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 18 May 2021 15:04:54 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.2176.012; 
 Tue, 18 May 2021 08:04:52 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: RE: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu members
Thread-Topic: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu
 members
Thread-Index: AQHXSj7Bs+01wvGUNEWbtmBiG2lmC6rn8VxQgACpzgCAADVmEA==
Date: Tue, 18 May 2021 07:04:51 +0000
Message-ID: <6d8b9142e8a34d1390f2f0b4bfb53a00@huawei.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-5-wangyanan55@huawei.com>
 <6c8f9c3502384f648f30c7381e87dda9@huawei.com>
 <68883a1b-5303-da13-a051-e909e1d1f71b@huawei.com>
In-Reply-To: <68883a1b-5303-da13-a051-e909e1d1f71b@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.31.227]
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
Cc: "Song Bao Hua \(Barry Song\)" <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 yangyicong <yangyicong@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Alistair
 Francis <alistair.francis@wdc.com>, "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui <yuzenghui@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiB3YW5neWFuYW4gKFkpDQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAxOCwgMjAyMSA1OjQz
IEFNDQo+IA0KPiBIaSBTYWxpbCwNCj4gDQo+IE9uIDIwMjEvNS8xOCA0OjQ4LCBTYWxpbCBNZWh0
YSB3cm90ZToNCj4gPj4gRnJvbTogUWVtdS1hcm0NCj4gW21haWx0bzpxZW11LWFybS1ib3VuY2Vz
K3NhbGlsLm1laHRhPWh1YXdlaS5jb21Abm9uZ251Lm9yZ10NCj4gPj4gT24gQmVoYWxmIE9mIFlh
bmFuIFdhbmcNCj4gPj4gU2VudDogU3VuZGF5LCBNYXkgMTYsIDIwMjEgMTE6MjkgQU0NCj4gPj4g
VG86IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz47IEFuZHJldyBKb25l
cw0KPiA+PiA8ZHJqb25lc0ByZWRoYXQuY29tPjsgTWljaGFlbCBTIC4gVHNpcmtpbiA8bXN0QHJl
ZGhhdC5jb20+OyBJZ29yIE1hbW1lZG92DQo+ID4+IDxpbWFtbWVkb0ByZWRoYXQuY29tPjsgU2hh
bm5vbiBaaGFvIDxzaGFubm9uLnpoYW9zbEBnbWFpbC5jb20+OyBBbGlzdGFpcg0KPiA+PiBGcmFu
Y2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+OyBEYXZpZCBHaWJzb24NCj4gPj4gPGRhdmlk
QGdpYnNvbi5kcm9wYmVhci5pZC5hdT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1hcm1A
bm9uZ251Lm9yZw0KPiA+PiBDYzogU29uZyBCYW8gSHVhIChCYXJyeSBTb25nKSA8c29uZy5iYW8u
aHVhQGhpc2lsaWNvbi5jb20+OyB6aHVrZXFpYW4NCj4gPj4gPHpodWtlcWlhbjFAaHVhd2VpLmNv
bT47IHlhbmd5aWNvbmcgPHlhbmd5aWNvbmdAaHVhd2VpLmNvbT47IFplbmd0YW8gKEIpDQo+ID4+
IDxwcmltZS56ZW5nQGhpc2lsaWNvbi5jb20+OyBXYW5naGFpYmluIChEKSA8d2FuZ2hhaWJpbi53
YW5nQGh1YXdlaS5jb20+Ow0KPiA+PiB5dXplbmdodWkgPHl1emVuZ2h1aUBodWF3ZWkuY29tPjsg
UGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT47DQo+ID4+IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4NCj4gPj4gU3ViamVjdDogW1JGQyBQQVRDSCB2
MyA0LzldIGh3L2FybS92aXJ0OiBJbml0aWFsaXplIHRoZSBwcmVzZW50IGNwdSBtZW1iZXJzDQo+
ID4+DQo+ID4+IFdlIGNyZWF0ZSBhbmQgaW5pdGlhbGl6ZSBhIGNwdW9iaiBmb3IgZWFjaCBwcmVz
ZW50IGNwdSBpbg0KPiA+PiBtYWNodmlydF9pbml0KCkuIE5vdyB3ZSBhbHNvIGluaXRpYWxpemUg
dGhlIGNwdSBtZW1iZXIgb2YNCj4gPj4gc3RydWN0dXJlIENQVUFyY2hJZCBmb3IgZWFjaCBwcmVz
ZW50IGNwdSBpbiB0aGUgZnVuY3Rpb24uDQo+ID4gWy4uLl0NCj4gPg0KPiA+PiAgICAgICAgICAg
cWRldl9yZWFsaXplKERFVklDRShjcHVvYmopLCBOVUxMLCAmZXJyb3JfZmF0YWwpOw0KPiA+PiAr
DQo+ID4+ICsgICAgICAgIC8qDQo+ID4+ICsgICAgICAgICAqIEFzIEFSTSBjcHUgaG90cGx1ZyBp
cyBub3Qgc3VwcG9ydGVkIHlldCwgd2UgaW5pdGlhbGl6ZQ0KPiA+PiArICAgICAgICAgKiB0aGUg
cHJlc2VudCBjcHUgbWVtYmVycyBoZXJlLg0KPiA+PiArICAgICAgICAgKi8NCj4gPj4gKyAgICAg
ICAgbWFjaGluZS0+cG9zc2libGVfY3B1cy0+Y3B1c1tuXS5jcHUgPSBjcHVvYmo7DQo+ID4NCj4g
PiB3aGVuIHZjcHUgSG90cGx1ZyBpcyBub3Qgc3VwcG9ydGVkIHlldCwgd2hhdCBuZWNlc3NpdGF0
ZXMgdGhpcyBjaGFuZ2Ugbm93Pw0KPiA+DQo+IFRoZSBpbml0aWFsaXphdGlvbiB3aWxsIGdpdmVz
IGEgd2F5IHRvIGRldGVybWluZSB3aGV0aGVyIGEgQ1BVIGlzDQo+IHByZXNlbnQgb3Igbm90Lg0K
PiBBdCBsZWFzdCwgZm9yIG5vdyBpdCB3aWxsIGJlIHVzZWQgd2hlbiBnZW5lcmF0aW5nIEFDUEkg
dGFibGVzLCBlLmcuDQo+IERTRFQsIE1BRFQuDQo+IFNlZSBwYXRjaCA1IGFuZCA2Lg0KDQp5ZXMs
ICBidXQgd2h5IGRvIHlvdSByZXF1aXJlIGl0IG5vdyBhcyBwYXJ0IG9mIHRoZSB2Y3B1IHRvcG9s
b2d5IGNoYW5nZT8NCg0KQXMtZmFyLWFzLWktY2FuLXNlZSwgUFBUVCB0YWJsZSBjaGFuZ2VzKHBh
cnQgb2YgcGF0Y2ggNS85KSBkbyBub3QgcmVxdWlyZQ0KdGhpcyBjaGFuZ2UuIENoYW5nZSBpbiBQ
YXRjaCA1LzkgaGFzIGFsc28gYmVlbiBkb25lIGluIGFudGljaXBhdGlvbiBvZg0Kc29tZSBmdXR1
cmUgcmVxdWlyZW1lbnQodmNwdSBIb3RwbHVnPykuDQoNClBsZWFzZSBjb3JyZWN0IG1lIGhlcmUg
aWYgSSBhbSB3cm9uZz8NCg0KVGhhbmtzDQoNCg==

