Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7F32CBA06
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:03:33 +0100 (CET)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOyy-0005ui-Sy
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kkNxu-0004ip-Fc
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:58:24 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kkNxp-0002s8-Qt
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:58:22 -0500
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CmCXr3tfKzXj5m;
 Wed,  2 Dec 2020 16:57:48 +0800 (CST)
Received: from DGGEMM511-MBX.china.huawei.com ([169.254.1.157]) by
 DGGEMM402-HUB.china.huawei.com ([10.3.20.210]) with mapi id 14.03.0487.000;
 Wed, 2 Dec 2020 16:58:05 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, =?utf-8?B?THVrw6HFoSBEb2t0b3I=?=
 <ldoktor@redhat.com>
Subject: RE: Proposal for a regular upstream performance testing
Thread-Topic: Proposal for a regular upstream performance testing
Thread-Index: AQHWw8wQK8Tj15jeAk6Yp/GMwv23BangKtcAgAE5A4CAACYZAIAAHSyAgAAINYCAAdPrYA==
Date: Wed, 2 Dec 2020 08:58:05 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BABC5D2@dggemm511-mbx.china.huawei.com>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <20201130132530.GE422962@stefanha-x1.localdomain>
 <35db4764-22c4-521b-d8ee-27ec39aebd3e@redhat.com>
 <20201201102210.GC567514@stefanha-x1.localdomain>
 <d6b002c6-2e64-ac17-a301-9dd351fdb3a5@redhat.com>
 <20201201123557.GD585157@stefanha-x1.localdomain>
In-Reply-To: <20201201123557.GD585157@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga01-in.huawei.com
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
Cc: Charles Shih <cheshi@redhat.com>,
 "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, wufengguang <wufengguang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBPbiBUdWUsIERlYyAwMSwgMjAyMCBhdCAwMTowNjozNVBNICswMTAwLCBMdWvDocWhIERva3Rv
ciB3cm90ZToNCj4gPiBEbmUgMDEuIDEyLiAyMCB2IDExOjIyIFN0ZWZhbiBIYWpub2N6aSBuYXBz
YWwoYSk6DQo+ID4gPiBPbiBUdWUsIERlYyAwMSwgMjAyMCBhdCAwOTowNTo0OUFNICswMTAwLCBM
dWvDocWhIERva3RvciB3cm90ZToNCj4gPiA+ID4gRG5lIDMwLiAxMS4gMjAgdiAxNDoyNSBTdGVm
YW4gSGFqbm9jemkgbmFwc2FsKGEpOg0KPiA+ID4gPiA+IE9uIFRodSwgTm92IDI2LCAyMDIwIGF0
IDA5OjEwOjE0QU0gKzAxMDAsIEx1a8OhxaEgRG9rdG9yIHdyb3RlOg0KPiA+ID4gPiA+IFdoYXQg
aXMgdGhlIG1pbmltYWwgZW52aXJvbm1lbnQgbmVlZGVkIGZvciBiYXJlIG1ldGFsIGhvc3RzPw0K
PiA+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IE5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgdGhh
dC4gRm9yIHByb3Zpc2lvbmluZyBJIGhhdmUgYSBiZWFrZXIgcGx1Z2luLA0KPiBvdGhlciBwbHVn
aW5zIGNhbiBiZSBhZGRlZCBpZiBuZWVkZWQuIEV2ZW4gd2l0aG91dCBiZWFrZXIgb25lIGNhbiBh
bHNvIHByb3ZpZGUNCj4gYW4gaW5zdGFsbGVkIG1hY2hpbmUgYW5kIHNraXAgdGhlIHByb3Zpc2lv
bmluZyBzdGVwLiBSdW5wZXJmIHdvdWxkIHRoZW4gb25seQ0KPiBhcHBseSB0aGUgcHJvZmlsZXMg
KGluY2x1ZGluZyBmZXRjaGluZyB0aGUgVk0gaW1hZ2VzIGZyb20gcHVibGljIHNvdXJjZXMpIGFu
ZA0KPiBydW4gdGhlIHRlc3RzIG9uIHRoZW0uIE5vdGUgdGhhdCBmb3IgY2VydGFpbiBwcm9maWxl
cyBtaWdodCBuZWVkIHRvIHJlYm9vdCB0aGUNCj4gbWFjaGluZSBhbmQgaW4gc3VjaCBjYXNlIHRo
ZSB0ZXN0ZWQgbWFjaGluZSBjYW4gbm90IGJlIHRoZSBvbmUgcnVubmluZw0KPiBydW4tcGVyZiwg
b3RoZXIgcHJvZmlsZXMgY2FuIHVzZSB0aGUgY3VycmVudCBtYWNoaW5lIGJ1dCBpdCdzIHN0aWxs
IG5vdCBhIHZlcnkgZ29vZA0KPiBpZGVhIGFzIHRoZSBhZGRpdGlvbmFsIG92ZXJoZWFkIG1pZ2h0
IHNwb2lsIHRoZSByZXN1bHRzLg0KPiA+ID4gPg0KPiA+ID4gPiBOb3RlIHRoYXQgZm9yIGEgdmVy
eSBzaW1wbGUgaXNzdWUgd2hpY2ggZG8gbm90IHJlcXVpcmUgYSBzcGVjaWFsIHNldHVwIEkgYW0N
Cj4gdXN1YWxseSBqdXN0IHJ1bm5pbmcgYSBjdXN0b20gVk0gb24gbXkgbGFwdG9wIGFuZCB1c2Ug
YSBMb2NhbGhvc3QgcHJvZmlsZSBvbg0KPiB0aGF0IFZNLCB3aGljaCBiYXNpY2FsbHkgcmVzdWx0
cyBpbiB0ZXN0aW5nIHRoYXQgY3VzdG9tLXNldHVwIFZNJ3MNCj4gcGVyZm9ybWFuY2UuIEl0J3Mg
ZGlydHkgYnV0IHZlcnkgZmFzdCBmb3IgdGhlIGZpcnN0LWxldmVsIGNoZWNrLg0KPiA+ID4NCj4g
PiA+IEkgd2FzIHRoaW5raW5nIGFib3V0IHJlcHJvdmlzaW9uaW5nIHRoZSBtYWNoaW5lIHRvIGVu
c3VyZSBlYWNoIHJ1bg0KPiA+ID4gc3RhcnRzIGZyb20gdGhlIHNhbWUgY2xlYW4gc3RhdGUuIFRo
aXMgcmVxdWlyZXMgcmVwcm92aXNpb25pbmcuDQo+ID4gPg0KPiA+ID4gU3RlZmFuDQo+ID4gPg0K
PiA+DQo+ID4gU3VyZSwgSSBwcm9iYWJseSBzaG9ydGVuIGl0IHVubmVjZXNzYXJ5IHRvbyBtdWNo
LiBJbiBteSBzZXR1cCBJIGFtIHVzaW5nIGENCj4gYmVha2VyIHBsdWdpbiB0aGF0IHJlcHJvdmlz
aW9ucyB0aGUgbWFjaGluZS4gQXMgZm9yIG90aGVycyB0aGV5IGNhbiBlaXRoZXIgdXNlDQo+IGJl
YWtlciBwbHVnaW4gYXMgd2VsbCBvciB0aGV5IGNhbiBqdXN0IHByZXBhcmUgdGhlIG1hY2hpbmUg
cHJpb3IgdG8gdGhlDQo+IGV4ZWN1dGlvbiBhcyBkZXNjcmliZWQgaW4gdGhlIHByZXZpb3VzIHBh
cmFncmFwaC4NCj4gDQo+IEZXSVcgSSdtIG5vdCBhd2FyZSBvZiBhbnlvbmUgZWxzZSB0YWtpbmcg
b24gdGhpcyB3b3JrIHVwc3RyZWFtLiBXaGF0ZXZlcg0KPiB5b3UgY2FuIGRvIGZvciB1cHN0cmVh
bSB3aWxsIGJlIHRoZSBRRU1VIGRpc2svbmV0d29yay9ldGMgcHJlZm9ybWFuY2UNCj4gcmVncmVz
c2lvbiB0ZXN0aW5nIGVmZm9ydC4gU29tZW9uZSBtaWdodCBzaG93IHVwIHdpdGggZW5naW5lZXJp
bmcgdGltZSBhbmQNCj4gbWFjaGluZSByZXNvdXJjZXMsIGJ1dCB0aGUgY2hhbmNlIGlzIGxvdy4N
Cg0KTWF5YmUgd2UgY291bGQgcHJvdmlkZSBDSSBwbGF0Zm9ybXMsIG1hY2hpbmUgcmVzb3VyY2Vz
IGFuZCBzb21lIG90aGVyIHBvc3NpYmxlIGhlbHAgOiApDQoNCkN1cnJlbnRseSwgdGhlcmUgaXMg
b25seSBhIHNob3J0IHJlYWRtZSwgd2Ugd2lsbCBjb21wbGV0ZSB0aGUgZG9jdW1lbnRzIGFzIHNv
b24gYXMgcG9zc2libGUuDQpodHRwczovL2dpdGVlLmNvbS93dV9mZW5nZ3VhbmcvY29tcGFzcy1j
aS9ibG9iL21hc3Rlci9SRUFETUUuZW4ubWQNCg0KVGhhbmtzLA0KQ2hlbiBRdW4NCg0K

