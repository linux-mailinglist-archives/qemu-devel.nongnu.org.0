Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C942D0B79
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 09:07:00 +0100 (CET)
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmBXv-0005EB-4k
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 03:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kmBWd-0004aZ-Gk; Mon, 07 Dec 2020 03:05:39 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kmBWY-00072U-KF; Mon, 07 Dec 2020 03:05:39 -0500
Received: from dggemi405-hub.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CqG6z3y49zVm08;
 Mon,  7 Dec 2020 16:04:27 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.228]) by
 dggemi405-hub.china.huawei.com ([10.3.17.143]) with mapi id 14.03.0487.000;
 Mon, 7 Dec 2020 16:05:13 +0800
From: ganqixin <ganqixin@huawei.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: RE: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
Thread-Topic: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
Thread-Index: AQHWu/oMyb2Urt3Gu0q8d02Pkq8oI6nKRNcAgAIPoiCAGjZOgIAE10ZQ
Date: Mon, 7 Dec 2020 08:05:12 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065E4158@DGGEMI525-MBS.china.huawei.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-10-ganqixin@huawei.com>
 <49d4e8e3-7138-18cf-3972-c18e8275d3be@redhat.com>
 <A5B86EC83C48EF4CB2BC58BEF3A2F496065C27CD@DGGEMI525-MBS.china.huawei.com>
 <babff5a6-4c78-7d44-4d97-d095e627639d@redhat.com>
In-Reply-To: <babff5a6-4c78-7d44-4d97-d095e627639d@redhat.com>
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
Cc: "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSBbbWFpbHRvOnBoaWxtZEByZWRoYXQuY29tXQ0KPiBTZW50OiBGcmlkYXksIERlY2VtYmVy
IDQsIDIwMjAgOTo1MCBQTQ0KPiBUbzogZ2FucWl4aW4gPGdhbnFpeGluQGh1YXdlaS5jb20+OyBx
ZW11LWRldmVsQG5vbmdudS5vcmc7DQo+IHFlbXUtdHJpdmlhbEBub25nbnUub3JnDQo+IENjOiBD
aGVucXVuIChrdWhuKSA8a3Vobi5jaGVucXVuQGh1YXdlaS5jb20+OyBaaGFuZ2hhaWxpYW5nDQo+
IDx6aGFuZy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20+OyBHZXJkIEhvZmZtYW5uDQo+IDxrcmF4
ZWxAcmVkaGF0LmNvbT47IHRodXRoQHJlZGhhdC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAw
OS8xM10gdTJmLXBhc3N0aHJ1OiBwdXQgaXQgaW50byB0aGUgJ3VzYicgY2F0ZWdvcnkNCj4gDQo+
IE9uIDExLzE3LzIwIDI6MzcgUE0sIGdhbnFpeGluIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSBbbWFpbHRv
OnBoaWxtZEByZWRoYXQuY29tXQ0KPiA+PiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDE2LCAyMDIw
IDEwOjA1IFBNDQo+ID4+IFRvOiBnYW5xaXhpbiA8Z2FucWl4aW5AaHVhd2VpLmNvbT47IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZzsNCj4gPj4gcWVtdS10cml2aWFsQG5vbmdudS5vcmc7IE1hcmMtQW5k
csOpIEx1cmVhdQ0KPiA+PiA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPjsgdGh1dGhAcmVk
aGF0LmNvbQ0KPiA+PiBDYzogQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3ZWkuY29t
PjsgWmhhbmdoYWlsaWFuZw0KPiA+PiA8emhhbmcuemhhbmdoYWlsaWFuZ0BodWF3ZWkuY29tPjsg
R2VyZCBIb2ZmbWFubg0KPiA8a3JheGVsQHJlZGhhdC5jb20+Ow0KPiA+PiBFZHVhcmRvIEhhYmtv
c3QgPGVoYWJrb3N0QHJlZGhhdC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDkvMTNd
IHUyZi1wYXNzdGhydTogcHV0IGl0IGludG8gdGhlICd1c2InDQo+ID4+IGNhdGVnb3J5DQo+ID4+
DQo+ID4+IE9uIDExLzE1LzIwIDc6NDggUE0sIEdhbiBRaXhpbiB3cm90ZToNCj4gPj4+IFRoZSBj
YXRlZ29yeSBvZiB0aGUgdTJmLXBhc3N0aHJ1IGRldmljZSBpcyBub3Qgc2V0LCBwdXQgaXQgaW50
byB0aGUgJ3VzYicNCj4gPj4+IGNhdGVnb3J5Lg0KPiA+Pg0KPiA+PiBJIGd1ZXNzIHdlIGRpc2N1
c3NlZCB0aGlzIHdpdGggVGhvbWFzIDEgb3IgMiB5ZWFycyBhZ28gYnV0IEkgZG9uJ3QNCj4gcmVt
ZW1iZXIuDQo+ID4+IEkgdGhpbmsgaXQgd2FzIGFib3V0IHVzaW5nIHNldF9iaXRzKCkgc28gZGV2
aWNlcyBjYW4gYXBwZWFyIGluDQo+ID4+IG11bHRpcGxlIGNhdGVnb3JpZXMuDQo+ID4+DQo+ID4+
IEdlcmQsIGRvIHlvdSBrbm93IHdoYXQgaXMgdGhlIHBvaW50IG9mIHRoZSAidXNiIiBjYXRlZ29y
eSBmb3INCj4gPj4gbWFuYWdlbWVudCBhcHBzPyBUaGlzIGlzIGEgYnVzIGFjY2VwdGluZyBtdWx0
aXBsZSBiZXR0ZXIgY2F0ZWdvcml6ZWQNCj4gPj4gZGV2aWNlcyAoZGlzcGxheSwgc3RvcmFnZSwg
aW5wdXQsIG5ldHdvcmssIHNvdW5kKS4NCj4gPj4NCj4gPj4gVW5yZWxhdGVkIGJ1dCBtdWx0aXBs
ZSBkZXZpY2VzIGFyZSByZWxhdGVkIHRvIFNFQ1VSSVRZLg0KPiA+PiBNYXliZSBpdCBpcyB0aW1l
IHRvIGludHJvZHVjZSB0aGUgREVWSUNFX0NBVEVHT1JZX1NFQ1VSSVRZPw0KPiA+DQo+ID4gSGks
IFBoaWxpcHBlDQo+ID4gVGhhbmtzIGZvciB5b3VyIHJlcGx5LCBidXQgSSdtIG5vdCBzdXJlIGlm
IGl0IGlzIGFwcHJvcHJpYXRlIHRvIGFkZCBhDQo+IHNlY3VyaXR5IGNhdGVnb3J5IHRvIHBsYWNl
IHRoaXMgZGV2aWNlLg0KPiA+IChNYXliZSBpdCdzIGJlY2F1c2UgSSBkb24ndCBrbm93IG11Y2gg
YWJvdXQgdGhlc2UgZGV2aWNlLCBJIGhhdmVuJ3QNCj4gPiBmaW5kIG1hbnkgc2FmZXR5LXJlbGF0
ZWQgZGV2aWNlcyBpbiAnbWlzYycgY2F0ZWdvcnkgb3IgdW5jYXRlZ29yaXplZA0KPiA+IGRldmlj
ZXMpDQo+IA0KPiBXaGF0IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gJ21pc2MnIGFuZCAndW5j
YXRlZ29yaXplZCc/DQoNCkluIG15IG9waW5pb24sIGRldmljZXMgdGhhdCB3ZSBmb3Jnb3QgdG8g
Y2xhc3NpZnkgd2lsbCBhcHBlYXIgaW4gInVuY2F0ZWdvcml6ZWQiIGxpc3QsIGFuZCBkZXZpY2Vz
IHRoYXQgZG9uJ3QgaGF2ZSBhIHN1aXRhYmxlIGNhdGVnb3J5IHRvIGNob29zZSB3aWxsIGJlIHB1
dCBpbnRvICJtaXNjIiBjYXRlZ29yeS4NCg0KPiANCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBHYW4g
UWl4aW4NCj4gPg0KDQo=

