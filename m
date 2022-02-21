Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C16A4BDA58
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:45:02 +0100 (CET)
Received: from localhost ([::1]:34380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9vx-0002CH-0z
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:45:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nM9nI-0001MP-UW
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:36:04 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nM9nD-0004ZT-Oy
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:36:04 -0500
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4K2Pvn1n1VzdZT0;
 Mon, 21 Feb 2022 22:34:45 +0800 (CST)
Received: from dggpemm100007.china.huawei.com (7.185.36.116) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Feb 2022 22:35:55 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm100007.china.huawei.com (7.185.36.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Feb 2022 22:35:55 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Mon, 21 Feb 2022 22:35:55 +0800
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Gonglei
 (Arei)" <arei.gonglei@huawei.com>
Subject: RE: [RFC 1/2] sem-posix: remove the posix semaphore support
Thread-Topic: [RFC 1/2] sem-posix: remove the posix semaphore support
Thread-Index: AQHYJwlJn7isIyG4zUClcPcy2DEk16ydU3eAgAC5B3A=
Date: Mon, 21 Feb 2022 14:35:54 +0000
Message-ID: <012c3b918b9b494e97b34a44e791636f@huawei.com>
References: <20220221095617.1974-1-longpeng2@huawei.com>
 <20220221095617.1974-2-longpeng2@huawei.com> <YhNzd6bGT2ejTRLx@redhat.com>
In-Reply-To: <YhNzd6bGT2ejTRLx@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

SGkgRGFuaWVsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERhbmll
bCBQLiBCZXJyYW5nw6kgW21haWx0bzpiZXJyYW5nZUByZWRoYXQuY29tXQ0KPiBTZW50OiBNb25k
YXksIEZlYnJ1YXJ5IDIxLCAyMDIyIDc6MTIgUE0NCj4gVG86IExvbmdwZW5nIChNaWtlLCBDbG91
ZCBJbmZyYXN0cnVjdHVyZSBTZXJ2aWNlIFByb2R1Y3QgRGVwdC4pDQo+IDxsb25ncGVuZzJAaHVh
d2VpLmNvbT4NCj4gQ2M6IHBib256aW5pQHJlZGhhdC5jb207IG1zdEByZWRoYXQuY29tOyBxZW11
LWRldmVsQG5vbmdudS5vcmc7IEdvbmdsZWkgKEFyZWkpDQo+IDxhcmVpLmdvbmdsZWlAaHVhd2Vp
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgMS8yXSBzZW0tcG9zaXg6IHJlbW92ZSB0aGUgcG9z
aXggc2VtYXBob3JlIHN1cHBvcnQNCj4gDQo+IE9uIE1vbiwgRmViIDIxLCAyMDIyIGF0IDA1OjU2
OjE2UE0gKzA4MDAsIExvbmdwZW5nKE1pa2UpIHZpYSB3cm90ZToNCj4gPiBQT1NJWCBzcGVjaWZp
ZXMgYW4gYWJzb2x1dGUgdGltZSBmb3Igc2VtX3RpbWVkd2FpdCgpLCBpdCB3b3VsZCBiZQ0KPiA+
IGFmZmVjdGVkIGlmIHRoZSBzeXN0ZW0gdGltZSBpcyBjaGFuZ2luZywgYnV0IHRoZXJlIGlzIG5v
dCBhIHJlbGF0aXZlDQo+ID4gdGltZSBvciBtb25vdG9uaWMgY2xvY2sgdmVyc2lvbiBvZiBzZW1f
dGltZWR3YWl0LCBzbyB3ZSBjYW5ub3QgZ2Fpbg0KPiA+IGZyb20gUE9TSVggc2VtYXBob3JlIGFu
eW1vcmUuDQo+IA0KPiBJdCBkb2Vzbid0IGFwcGVhciBpbiBhbnkgbWFuIHBhZ2VzIG9uIG15IHN5
c3RlbXMsIGJ1dCB0aGVyZSBpcyBhDQo+IG5ldy1pc2ggQVBJICBzZW1fY2xvY2t3YWl0KCkgdGhh
dCBhY2NlcHRzIGEgY2hvaWNlIG9mIGNsb2NrIGFzIGENCj4gcGFyYW1ldGVyLg0KPiANCj4gVGhp
cyBpcyBhcHBhcmVudGx5IGEgcHJvcG9zZWQgUE9TSVggc3RhbmRhcmQgQVBJIGludHJvZHVjZWQg
aW4NCj4gZ2xpYmMgMi4zMCwgYWxvbmcgd2l0aCBzZXZlcmFsIG90aGVyczoNCj4gDQoNCkJ1dCB0
aGUgQVBJIGlzIG9ubHkgc3VwcG9ydGVkIGluIGdsaWJjLg0KDQpodHRwczovL3d3dy5nbnUub3Jn
L3NvZnR3YXJlL2dudWxpYi9tYW51YWwvaHRtbF9ub2RlL3NlbV8wMDVmY2xvY2t3YWl0Lmh0bWwN
Cg0KPiBodHRwczovL3NvdXJjZXdhcmUub3JnL2xlZ2FjeS1tbC9saWJjLWFubm91bmNlLzIwMTkv
bXNnMDAwMDEuaHRtbA0KPiANCj4gW3F1b3RlXQ0KPiAqIEFkZCBuZXcgUE9TSVgtcHJvcG9zZWQg
cHRocmVhZF9jb25kX2Nsb2Nrd2FpdCwgcHRocmVhZF9tdXRleF9jbG9ja2xvY2ssDQo+ICAgcHRo
cmVhZF9yd2xvY2tfY2xvY2tyZGxvY2ssIHB0aHJlYWRfcndsb2NrX2Nsb2Nrd3Jsb2NrIGFuZCBz
ZW1fY2xvY2t3YWl0DQo+ICAgZnVuY3Rpb25zLiAgVGhlc2UgYmVoYXZlIHNpbWlsYXJseSB0byB0
aGVpciAidGltZWQiIGVxdWl2YWxlbnRzLCBidXQgYWxzbw0KPiAgIGFjY2VwdCBhIGNsb2NraWRf
dCBwYXJhbWV0ZXIgdG8gZGV0ZXJtaW5lIHdoaWNoIGNsb2NrIHRoZWlyIHRpbWVvdXQgc2hvdWxk
DQo+ICAgYmUgbWVhc3VyZWQgYWdhaW5zdC4gIEFsbCBmdW5jdGlvbnMgYWxsb3cgd2FpdGluZyBh
Z2FpbnN0IENMT0NLX01PTk9UT05JQw0KPiAgIGFuZCBDTE9DS19SRUFMVElNRS4gIFRoZSBkZWNp
c2lvbiBvZiB3aGljaCBjbG9jayB0byBiZSB1c2VkIGlzIG1hZGUgYXQgdGhlDQo+ICAgdGltZSBv
ZiB0aGUgd2FpdCAodW5saWtlIHdpdGggcHRocmVhZF9jb25kYXR0cl9zZXRjbG9jaywgd2hpY2gg
cmVxdWlyZXMNCj4gICB0aGUgY2xvY2sgY2hvaWNlIGF0IGluaXRpYWxpemF0aW9uIHRpbWUpLg0K
PiBbL3F1b3RlXQ0KPiANCg0KSXQgc2VlbXMgcHRocmVhZF9jb25kYXR0cl9zZXRjbG9jaygpIGNh
biBtZWV0IG91ciByZXF1aXJlbWVudCBoZXJlLCBpdCdzIE9LDQpmb3IgdXMgdG8gY2hvb3NlIHRo
ZSBjbG9jayBhdCBpbml0aWFsaXphdGlvbiB0aW1lLg0KDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvcWVtdS90aHJlYWQtcG9zaXguaCBiL2luY2x1ZGUvcWVtdS90aHJlYWQtcG9zaXguaA0KPiA+
IGluZGV4IGI3OTJlNmUuLjU0NjY2MDggMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9xZW11L3Ro
cmVhZC1wb3NpeC5oDQo+ID4gKysrIGIvaW5jbHVkZS9xZW11L3RocmVhZC1wb3NpeC5oDQo+ID4g
QEAgLTI3LDEzICsyNyw5IEBAIHN0cnVjdCBRZW11Q29uZCB7DQo+ID4gIH07DQo+ID4NCj4gPiAg
c3RydWN0IFFlbXVTZW1hcGhvcmUgew0KPiA+IC0jaWZuZGVmIENPTkZJR19TRU1fVElNRURXQUlU
DQo+ID4gICAgICBwdGhyZWFkX211dGV4X3QgbG9jazsNCj4gPiAgICAgIHB0aHJlYWRfY29uZF90
IGNvbmQ7DQo+ID4gICAgICB1bnNpZ25lZCBpbnQgY291bnQ7DQo+ID4gLSNlbHNlDQo+ID4gLSAg
ICBzZW1fdCBzZW07DQo+ID4gLSNlbmRpZg0KPiA+ICAgICAgYm9vbCBpbml0aWFsaXplZDsNCj4g
PiAgfTsNCj4gDQo+IEFzIGEgcG9pbnQgb2YgaGlzdG9yeSwgdGhlIG9yaWdpbmFsICBjb2RlIG9u
bHkgdXNlZCBzZW1fdC4gVGhlIHB0aHJlYWRzDQo+IGJhc2VkIGZhbGxiYWNrIHdhcyBpbnRyb2R1
Y2VkIGJ5IFBhb2xvIGluDQo+IA0KPiAgIGNvbW1pdCBjMTY2Y2I3MmYxNjc2ODU1ODE2MzQwNjY2
YzNiNjE4YmVlZjRiOTc2DQo+ICAgQXV0aG9yOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRo
YXQuY29tPg0KPiAgIERhdGU6ICAgRnJpIE5vdiAyIDE1OjQzOjIxIDIwMTIgKzAxMDANCj4gDQo+
ICAgICBzZW1hcGhvcmU6IGltcGxlbWVudCBmYWxsYmFjayBjb3VudGluZyBzZW1hcGhvcmVzIHdp
dGggbXV0ZXgrY29uZHZhcg0KPiANCj4gICAgIE9wZW5CU0QgYW5kIERhcndpbiBkbyBub3QgaGF2
ZSBzZW1fdGltZWR3YWl0LiAgSW1wbGVtZW50IGEgZmFsbGJhY2sNCj4gICAgIGZvciB0aGVtLg0K
PiANCj4gICAgIFNpZ25lZC1vZmYtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5j
b20+DQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBBbnRob255IExpZ3VvcmkgPGFsaWd1b3JpQHVzLmli
bS5jb20+DQo+IA0KPiBJJ20gZ29pbmcgdG8gYXNzdW1lIHRoaXMgZmFsbGJhY2sgaW1wbCBpcyBs
ZXNzIGVmZmljaWVudCB0aGFuIHRoZQ0KPiBuYXRpdmUgc2VtX3QgaW1wbCBhcyB0aGUgcmVhc29u
IGZvciBsZWF2aW5nIHRoZSBvcmlnaW5hbCBpbXBsLCBvcg0KPiBtYXliZSBQYW9sbyBqdXN0IHdh
bnQgdG8gcmlzayBhY2NpZGVudGFsIGJ1Z3MgYnkgcmVtb3ZpbmcgdGhlDQo+IGV4aXN0aW5nIHVz
YWdlID8NCj4gDQoNClBhb2xvIGhhcyByZXBsaWVkLCBzZWVtcyB0aGlzIGNoYW5nZSBpcyBhY2Nl
cHRhYmxlLCBzbyBJJ2xsIGNvbnRpbnVlIHRvDQp3b3JrIG9uIHRoaXMgc29sdXRpb24uIFRoYW5r
cyA6KQ0KDQo+IA0KPiBSZWdhcmRzLA0KPiBEYW5pZWwNCj4gLS0NCj4gfDogaHR0cHM6Ly9iZXJy
YW5nZS5jb20gICAgICAtby0NCj4gaHR0cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3MvZGJlcnJh
bmdlIDp8DQo+IHw6IGh0dHBzOi8vbGlidmlydC5vcmcgICAgICAgICAtby0gICAgICAgICAgICBo
dHRwczovL2ZzdG9wMTM4LmJlcnJhbmdlLmNvbSA6fA0KPiB8OiBodHRwczovL2VudGFuZ2xlLXBo
b3RvLm9yZyAgICAtby0NCj4gaHR0cHM6Ly93d3cuaW5zdGFncmFtLmNvbS9kYmVycmFuZ2UgOnwN
Cg0K

