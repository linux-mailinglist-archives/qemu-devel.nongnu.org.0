Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABBC2D38FC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 03:50:58 +0100 (CET)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmpZA-0006pV-Ts
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 21:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kmpXh-0006G4-Mb; Tue, 08 Dec 2020 21:49:25 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kmpXf-0008Et-1T; Tue, 08 Dec 2020 21:49:25 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CrM1Z707Bz534s;
 Wed,  9 Dec 2020 10:48:34 +0800 (CST)
Received: from DGGEMM424-HUB.china.huawei.com (10.1.198.41) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 9 Dec 2020 10:49:06 +0800
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.162]) by
 dggemm424-hub.china.huawei.com ([10.1.198.41]) with mapi id 14.03.0487.000;
 Wed, 9 Dec 2020 10:48:59 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: RE: [PATCH RESEND v2 0/7] some memleak trivial patchs
Thread-Topic: [PATCH RESEND v2 0/7] some memleak trivial patchs
Thread-Index: AQHWqQOAYexAkoH4WUOcMVYmxKZpOamv9+ywgD5fZnA=
Date: Wed, 9 Dec 2020 02:48:59 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BADE398@dggemm531-mbx.china.huawei.com>
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com> 
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga02-in.huawei.com
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
Cc: "lvivier@redhat.com" <lvivier@redhat.com>,
 Pannengyuan <pannengyuan@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, ganqixin <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

S2luZGx5IHBpbmchDQoNCkhpIGFsbCwNCiAgVGhpcyBzZXJpZXMgaGFzIGJlZW4gc3VuayBmb3Ig
YSBsb25nIHRpbWUuDQpDb3VsZCBzb21lb25lIHBpY2sgdGhlbSB1cKO/DQoNClNpeCBwYXRjaGVz
IGFyZSBzdW5rIGhlcmU6DQogICBxZ2EvY2hhbm5lbC1wb3NpeDogUGx1ZyBtZW1vcnkgbGVhayBp
biBnYV9jaGFubmVsX3dyaXRlX2FsbCgpDQogICBlbGYyZG1wL3FlbXVfZWxmOiBQbHVnIG1lbWxl
YWsgaW4gUUVNVV9FbGZfaW5pdA0KICAgZWxmMmRtcC9wZGI6IFBsdWcgbWVtbGVhayBpbiBwZGJf
aW5pdF9mcm9tX2ZpbGUNCiAgIG1pZ3JhdGlvbi9jb2xvOiBQbHVnIG1lbWxlYWtzIGluIGNvbG9f
cHJvY2Vzc19pbmNvbWluZ190aHJlYWQNCiAgIGJsb2NrZGV2OiBGaXggYSBtZW1sZWFrIGluIGRy
aXZlX2JhY2t1cF9wcmVwYXJlKCkNCiAgIGJsb2NrL2ZpbGUtcG9zaXg6IGZpeCBhIHBvc3NpYmxl
IHVuZGVmaW5lZCBiZWhhdmlvcg0KDQpUaGFua3MsDQpDaGVuIFF1bg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENoZW5xdW4gKGt1aG4pDQo+IFNlbnQ6IEZyaWRheSwg
T2N0b2JlciAzMCwgMjAyMCA2OjIzIFBNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFl
bXUtdHJpdmlhbEBub25nbnUub3JnDQo+IENjOiBQYW5uZW5neXVhbiA8cGFubmVuZ3l1YW5AaHVh
d2VpLmNvbT47IGx2aXZpZXJAcmVkaGF0LmNvbTsNCj4gWmhhbmdoYWlsaWFuZyA8emhhbmcuemhh
bmdoYWlsaWFuZ0BodWF3ZWkuY29tPjsgZ2FucWl4aW4NCj4gPGdhbnFpeGluQGh1YXdlaS5jb20+
DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggUkVTRU5EIHYyIDAvN10gc29tZSBtZW1sZWFrIHRyaXZp
YWwgcGF0Y2hzDQo+IA0KPiBQaW5nIQ0KPiANCj4gSGkgYWxsLA0KPiAgIFRoZSBwYXRjaGUyIH43
IGhhdmUgYmVlbiByZXZpZXdlZCBmb3Igc29tZSB0aW1lLg0KPiBDb3VsZCBzb21lb25lIHBsZWFz
ZSBwaWNrIGl0IHVwo78NCj4gDQo+IFRoYW5rcywNCj4gQ2hlbiBRdW4NCj4gDQo+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBDaGVucXVuIChrdWhuKQ0KPiA+IFNlbnQ6
IEZyaWRheSwgT2N0b2JlciAyMywgMjAyMCAyOjEyIFBNDQo+ID4gVG86IHFlbXUtZGV2ZWxAbm9u
Z251Lm9yZzsgcWVtdS10cml2aWFsQG5vbmdudS5vcmcNCj4gPiBDYzogUGFubmVuZ3l1YW4gPHBh
bm5lbmd5dWFuQGh1YXdlaS5jb20+OyBsdml2aWVyQHJlZGhhdC5jb207DQo+ID4gWmhhbmdoYWls
aWFuZyA8emhhbmcuemhhbmdoYWlsaWFuZ0BodWF3ZWkuY29tPjsgZ2FucWl4aW4NCj4gPiA8Z2Fu
cWl4aW5AaHVhd2VpLmNvbT47IENoZW5xdW4gKGt1aG4pIDxrdWhuLmNoZW5xdW5AaHVhd2VpLmNv
bT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggUkVTRU5EIHYyIDAvN10gc29tZSBtZW1sZWFrIHRyaXZp
YWwgcGF0Y2hzDQo+ID4NCj4gPiBIaSBhbGwsDQo+ID4NCj4gPiAgIEhlcmUgYXJlIHNvbWUgbWVt
b3J5IGxlYWsgcGF0Y2hlcyByZXBvcnRlZCBieSBFdWxlclJvYm90Lg0KPiA+IFNvbWUgcGF0Y2gg
c3VibWlzc2lvbnMgaGF2ZSBiZWVuIHVuYXR0ZW5kZWQgZm9yIGEgd2hpbGUgYW5kIEkgcmVzZW5k
DQo+IHRoZW0uDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gQ2hlbiBRdW4NCj4gPg0KPiA+DQo+ID4g
Q2hlbiBRdW4gKDEpOg0KPiA+ICAgdGVzdHMvbWlncmF0aW9uOiBmaXggbWVtbGVhayBpbiB3YWl0
X2NvbW1hbmQvd2FpdF9jb21tYW5kX2ZkDQo+ID4NCj4gPiBQYW4gTmVuZ3l1YW4gKDYpOg0KPiA+
ICAgcWdhL2NoYW5uZWwtcG9zaXg6IFBsdWcgbWVtb3J5IGxlYWsgaW4gZ2FfY2hhbm5lbF93cml0
ZV9hbGwoKQ0KPiA+ICAgZWxmMmRtcC9xZW11X2VsZjogUGx1ZyBtZW1sZWFrIGluIFFFTVVfRWxm
X2luaXQNCj4gPiAgIGVsZjJkbXAvcGRiOiBQbHVnIG1lbWxlYWsgaW4gcGRiX2luaXRfZnJvbV9m
aWxlDQo+ID4gICBtaWdyYXRpb24vY29sbzogUGx1ZyBtZW1sZWFrcyBpbiBjb2xvX3Byb2Nlc3Nf
aW5jb21pbmdfdGhyZWFkDQo+ID4gICBibG9ja2RldjogRml4IGEgbWVtbGVhayBpbiBkcml2ZV9i
YWNrdXBfcHJlcGFyZSgpDQo+ID4gICBibG9jay9maWxlLXBvc2l4OiBmaXggYSBwb3NzaWJsZSB1
bmRlZmluZWQgYmVoYXZpb3INCj4gPg0KPiA+ICBibG9jay9maWxlLXBvc2l4LmMgICAgICAgICAg
ICAgIHwgIDIgKy0NCj4gPiAgYmxvY2tkZXYuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxICsN
Cj4gPiAgY29udHJpYi9lbGYyZG1wL3BkYi5jICAgICAgICAgICB8ICAxICsNCj4gPiAgY29udHJp
Yi9lbGYyZG1wL3FlbXVfZWxmLmMgICAgICB8ICAxICsNCj4gPiAgbWlncmF0aW9uL2NvbG8uYyAg
ICAgICAgICAgICAgICB8ICA1ICsrKystDQo+ID4gIHFnYS9jaGFubmVsLXBvc2l4LmMgICAgICAg
ICAgICAgfCAgNiArKysrKy0NCj4gPiAgdGVzdHMvcXRlc3QvbWlncmF0aW9uLWhlbHBlcnMuYyB8
IDE2ICsrKysrKysrKysrKy0tLS0NCj4gPiAgNyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gLS0NCj4gPiAyLjIzLjANCg0K

