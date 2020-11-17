Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637162B662D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:03:45 +0100 (CET)
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1aC-0008R2-6k
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kf1Z9-0007un-Km; Tue, 17 Nov 2020 09:02:39 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kf1Z5-0006kE-On; Tue, 17 Nov 2020 09:02:39 -0500
Received: from dggemi402-hub.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Cb70r10BZz4yXv;
 Tue, 17 Nov 2020 22:02:04 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.162]) by
 dggemi402-hub.china.huawei.com ([10.3.17.135]) with mapi id 14.03.0487.000;
 Tue, 17 Nov 2020 22:02:14 +0800
From: ganqixin <ganqixin@huawei.com>
To: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: RE: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
Thread-Topic: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
Thread-Index: AQHWu/oT9bgTES9M/ECMau6tUXtsrqnKObYAgAASPwCAAgqNQA==
Date: Tue, 17 Nov 2020 14:02:14 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065C382C@DGGEMI525-MBS.china.huawei.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
In-Reply-To: <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=ganqixin@huawei.com;
 helo=szxga03-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 09:02:23
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMgSHV0aCBbbWFpbHRv
OnRodXRoQHJlZGhhdC5jb21dDQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMTYsIDIwMjAgMTA6
MzAgUE0NCj4gVG86IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+OyBn
YW5xaXhpbg0KPiA8Z2FucWl4aW5AaHVhd2VpLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsN
Cj4gcWVtdS10cml2aWFsQG5vbmdudS5vcmcNCj4gQ2M6IENoZW5xdW4gKGt1aG4pIDxrdWhuLmNo
ZW5xdW5AaHVhd2VpLmNvbT47IFpoYW5naGFpbGlhbmcNCj4gPHpoYW5nLnpoYW5naGFpbGlhbmdA
aHVhd2VpLmNvbT47IE1hcmt1cyBBcm1icnVzdGVyDQo+IDxhcm1icnVAcmVkaGF0LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCAxMy8xM10gYmNtMjgzNV9jcHJtYW46IHB1dCBzb21lIHBlcmlw
aGVyYWxzIG9mDQo+IGJjbTI4MzUgY3BybWFuIGludG8gdGhlICdtaXNjJyBjYXRlZ29yeQ0KPiAN
Cj4gT24gMTYvMTEvMjAyMCAxNC4yNSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+
ID4gSGkgR2FuLA0KPiA+DQo+ID4gT24gMTEvMTUvMjAgNzo0OSBQTSwgR2FuIFFpeGluIHdyb3Rl
Og0KPiA+PiBTb21lIHBlcmlwaGVyYWxzIG9mIGJjbTI4MzUgY3BybWFuIGhhdmUgbm8gY2F0ZWdv
cnksIHB1dCB0aGVtIGludG8gdGhlDQo+ICdtaXNjJw0KPiA+PiBjYXRlZ29yeS4NCj4gPj4NCj4g
Pj4gU2lnbmVkLW9mZi1ieTogR2FuIFFpeGluIDxnYW5xaXhpbkBodWF3ZWkuY29tPg0KPiA+PiAt
LS0NCj4gPj4gQ2M6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMODxpLDgsKpIDxmNGJ1Z0BhbXNhdC5v
cmc+DQo+ID4+IC0tLQ0KPiA+PiAgaHcvbWlzYy9iY20yODM1X2Nwcm1hbi5jIHwgNCArKysrDQo+
ID4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1n
aXQgYS9ody9taXNjL2JjbTI4MzVfY3BybWFuLmMgYi9ody9taXNjL2JjbTI4MzVfY3BybWFuLmMN
Cj4gPj4gaW5kZXggN2U0MTVhMDE3Yy4uYzYyOTU4YTk5ZSAxMDA2NDQNCj4gPj4gLS0tIGEvaHcv
bWlzYy9iY20yODM1X2Nwcm1hbi5jDQo+ID4+ICsrKyBiL2h3L21pc2MvYmNtMjgzNV9jcHJtYW4u
Yw0KPiA+PiBAQCAtMTM2LDYgKzEzNiw3IEBAIHN0YXRpYyB2b2lkIHBsbF9jbGFzc19pbml0KE9i
amVjdENsYXNzICprbGFzcywNCj4gPj4gdm9pZCAqZGF0YSkNCj4gPj4NCj4gPj4gICAgICBkYy0+
cmVzZXQgPSBwbGxfcmVzZXQ7DQo+ID4+ICAgICAgZGMtPnZtc2QgPSAmcGxsX3Ztc3RhdGU7DQo+
ID4+ICsgICAgc2V0X2JpdChERVZJQ0VfQ0FURUdPUllfTUlTQywgZGMtPmNhdGVnb3JpZXMpOw0K
PiA+DQo+ID4gV2VsbCwgdGhpcyBpcyBub3QgYW4gdXNhYmxlIGRldmljZSBidXQgYSBwYXJ0IG9m
IGEgYmlnZ2VyIGRldmljZSwgc28NCj4gPiBoZXJlIHdlIHdhbnQgdGhlIG9wcG9zaXRlOiBub3Qg
bGlzdCB0aGlzIGRldmljZSBpbiBhbnkgY2F0ZWdvcnkuDQo+ID4NCj4gPiBNYXliZSB3ZSBjb3Vs
ZCBhZGQgYSBERVZJQ0VfQ0FURUdPUllfQ09NUE9TSVRFIGZvciBhbGwgc3VjaCBRT00gdHlwZXMN
Cj4gPiBzbyBtYW5hZ2VtZW50IGFwcHMgY2FuIGZpbHRlciB0aGVtIG91dD8gKEFuZCBzbyB3ZSBh
cmUgc3VyZSBhbGwgUU9NIGlzDQo+ID4gY2xhc3NpZmllZCkuDQo+ID4NCj4gPiBUaG9tYXMsIHlv
dSBhbHJlYWR5IGRlYWx0IHdpdGggY2F0ZWdvcml6aW5nIGRldmljZXMgaW4gdGhlIHBhc3QsIHdo
YXQNCj4gPiBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcz8gV2hvIGVsc2UgY291bGQgaGVscD8gTWF5
YmUgYWRkIHNvbWVvbmUgZnJvbQ0KPiA+IGxpYnZpcnQgaW4gdGhlIHRocmVhZD8NCj4gDQo+IE15
IDAuMDIg4oKsIDogTWFyayB0aGUgZGV2aWNlIGFzIHVzZXJfY3JlYXRhYmxlID0gZmFsc2UgaWYg
aXQgY2FuIG5vdCByZWFsbHkgYmUgdXNlZA0KPiBieSB0aGUgdXNlciB3aXRoIHRoZSAtZGV2aWNl
IENMSSBwYXJhbWV0ZXIuIFRoZW4gaXQgYWxzbyBkb2VzIG5vdCBuZWVkIGENCj4gY2F0ZWdvcnku
IEkga25vdyBNYXJrdXMgd2lsbCBsaWtlbHkgaGF2ZSBhIGRpZmZlcmVudCBvcGluaW9uLCBidXQg
aW4gbXkgZXllcyBpdCdzDQo+IGp1c3QgdWdseSBpZiB3ZSBwcmVzZW50IGRldmljZXMgdG8gdGhl
IHVzZXJzIHRoYXQgdGhleSBjYW4gbm90IHVzZS4NCj4gKEJ5IHRoZSB3YXksIHRoaXMgZGV2aWNl
IGhlcmUgc2VlbXMgdG8gYmUgYSBkZWNlbmRhbnQgb2YNCj4gVFlQRV9TWVNfQlVTX0RFVklDRSAu
Li4gc2hvdWxkbid0IHRoZXNlIHNob3cgdXAgYXMgdXNlcl9jcmVhdGFibGUgPSBmYWxzZQ0KPiBh
dXRvbWF0aWNhbGx5PykNCg0KSSBhZ3JlZSwgYnV0IG1hcmtpbmcgdXNlcl9jcmVhdGFibGUgYXMg
ZmFsc2Ugc2VlbXMgdG8gbWFrZSBpdCBkZXZpYXRlIGZyb20gaXRzIG93biBtZWFuaW5nIChsaWtl
IG1hcmt1cyBzYWlkKS4NCklzIHRoZXJlIGFueSBvdGhlciB3YXkgdG8gYXZvaWQgcHJlc2VudGlu
ZyBkZXZpY2VzIHRvIHRoZSB1c2VycyBpbiAiLWRldmljZSBoZWxwIj8NCg0KVGhhbmtzLA0KR2Fu
IFFpeGluDQo=

