Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1833F27C1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 09:44:21 +0200 (CEST)
Received: from localhost ([::1]:50878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGzCO-000109-Bk
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 03:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mGzBF-0008WT-3c; Fri, 20 Aug 2021 03:43:09 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:63913
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mGzB9-0005OU-QG; Fri, 20 Aug 2021 03:43:08 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629445368; h=from:subject:to:date:message-id;
 bh=nacSjGUPPeavvoybObhldcf+5CeV7NOJA0eGx74jviM=;
 b=ZpMngTMeP0qTIE+HO2HB0V4gjb1ErsM/TOwRKZJ7Jis33hLAgNSZKXpRHNLAsrhJ6RN0XXb04KM
 PftoYqK+u6tKKgVEwzdG2USs3xLTT9oyyzQUC2uVoYQz+4x5WwtjBfyl3yPPkRKSbMsHGoRo1fuAw
 Iz9XzZAgL2fv7bLPp2M=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Fri, 20 Aug 2021 15:42:47 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
Subject: RE: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
Thread-Topic: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
Thread-Index: AdeVbB3S+4i7nlcHTb+Dg8IlAhdEUv//zOUA//94+DA=
Date: Fri, 20 Aug 2021 07:42:46 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F59C5@SHASXM03.verisilicon.com>
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
 <b212add7-f36b-98ce-ccf5-c5209afea3b6@redhat.com>
In-Reply-To: <b212add7-f36b-98ce-ccf5-c5209afea3b6@redhat.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.46.68]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--11.794200-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IE9uIDgvMjAvMjEgNDozNiBBTSwgTGksIENodW5taW5nIHdyb3RlOg0KPiA+IFRoZSBjdXJy
ZW50IFNNTVUgVjMgZGV2aWNlIG1vZGVsIG9ubHkgc3VwcG9ydCBQQ0kvUENJZSBkZXZpY2VzLA0K
PiA+IHNvIHdlIHVwZGF0ZSBpdCB0byBzdXBwb3J0IG5vbi1QQ0kvUENJZSBkZXZpY2VzLg0KPiA+
DQo+ID4gICAgIGh3L2FybS9zbW11djM6DQo+ID4gICAgICAgICAuIENyZWF0ZSBJT01NVSBtZW1v
cnkgcmVnaW9ucyBmb3Igbm9uLVBDSS9QQ0llIGRldmljZXMgYmFzZWQNCj4gb24gdGhlaXIgU0lE
DQo+ID4gICAgICAgICAuIEFkZCBzaWQtbWFwIHByb3BlcnR5IHRvIHN0b3JlIG5vbi1QQ0kvUENJ
ZSBkZXZpY2VzIFNJRA0KPiA+ICAgICAgICAgLiBVcGRhdGUgaW1wbGVtZW50YXRpb24gb2YgQ0ZH
SSBjb21tYW5kcyBiYXNlZCBvbiBkZXZpY2UgU0lEDQo+ID4gICAgIGh3L2FybS9zbW11LWNvbW1v
bjoNCj4gPiAgICAgICAgIC4gRGlmZmVyZW50aWF0ZSBQQ0kvUENJZSBhbmQgbm9uLVBDSS9QQ0ll
IGRldmljZXMgU0lEIGdldHRpbmcNCj4gc3RyYXRlZ3kNCj4gPiAgICAgaHcvYXJtL3ZpcnQ6DQo+
ID4gICAgICAgICAuIEFkZCBQTDMzMCBETUEgY29udHJvbGxlciBhbmQgY29ubmVjdCB3aXRoIFNN
TVV2MyBmb3INCj4gdGVzdGluZw0KPiA+ICAgICAgICAgLiBBZGQgc21tdXYzX3NpZG1hcCBmb3Ig
bm9uLVBDSS9QQ0llIGRldmljZXMgU0lEIHNldHRpbmcNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IENodW5taW5nIExpIDxjaHVubWluZy5saUB2ZXJpc2lsaWNvbi5jb20+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogUmVud2VpIExpdSA8cmVud2VpLmxpdUB2ZXJpc2lsaWNvbi5jb20+DQo+ID4gLS0tDQo+
ID4gVGhpcyBwYXRjaCBkZXBlbmRzIG9uIFBMMzMwIG1lbW9yeSByZWdpb24gY29ubmVjdGlvbiBw
YXRjaDoNCj4gPg0KPiBodHRwczovL3BhdGNoZXcub3JnL1FFTVUvNEMyM0MxN0I4RTg3RTc0RTkw
NkEyNUEzMjU0QTAzRjRGQTFGRUMzMUBTSEFTWA0KPiBNMDMudmVyaXNpbGljb24uY29tLw0KPiA+
DQo+ID4gIGh3L2FybS9zbW11djMuYyAgICAgICAgICAgICAgfCAgNzUgKysrKysrKysrKysrKysr
KysrLS0tLS0tDQo+ID4gIGh3L2FybS92aXJ0LmMgICAgICAgICAgICAgICAgfCAxMTANCj4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgaW5jbHVkZS9ody9hcm0vc21t
dS1jb21tb24uaCB8ICAxMiArKystDQo+ID4gIGluY2x1ZGUvaHcvYXJtL3NtbXV2My5oICAgICAg
fCAgIDIgKw0KPiA+ICBpbmNsdWRlL2h3L2FybS92aXJ0LmggICAgICAgIHwgICAzICsNCj4gPiAg
NSBmaWxlcyBjaGFuZ2VkLCAxODEgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL3NtbXV2My5jIGIvaHcvYXJtL3NtbXV2My5jDQo+ID4g
aW5kZXggMDFiNjBiZWU0Li5jNGRhMDVkOGIgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvYXJtL3NtbXV2
My5jDQo+ID4gKysrIGIvaHcvYXJtL3NtbXV2My5jDQo+ID4gQEAgLTMyLDYgKzMyLDcgQEANCj4g
PiAgI2luY2x1ZGUgImh3L2FybS9zbW11djMuaCINCj4gPiAgI2luY2x1ZGUgInNtbXV2My1pbnRl
cm5hbC5oIg0KPiA+ICAjaW5jbHVkZSAic21tdS1pbnRlcm5hbC5oIg0KPiA+ICsjaW5jbHVkZSAi
aHcvcWRldi1wcm9wZXJ0aWVzLmgiDQo+ID4NCj4gPiAgLyoqDQo+ID4gICAqIHNtbXV2M190cmln
Z2VyX2lycSAtIHB1bHNlIEBpcnEgaWYgZW5hYmxlZCBhbmQgdXBkYXRlDQo+ID4gQEAgLTYxMiw3
ICs2MTMsNyBAQCBzdGF0aWMgU01NVVRyYW5zQ2ZnICpzbW11djNfZ2V0X2NvbmZpZyhTTU1VRGV2
aWNlDQo+ICpzZGV2LCBTTU1VRXZlbnRJbmZvICpldmVudCkNCj4gPiAgICAgIHJldHVybiBjZmc7
DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgdm9pZCBzbW11djNfZmx1c2hfY29uZmlnKFNNTVVE
ZXZpY2UgKnNkZXYpDQo+ID4gK3N0YXRpYyB2b2lkIF9fYXR0cmlidXRlX18oKHVudXNlZCkpIHNt
bXV2M19mbHVzaF9jb25maWcoU01NVURldmljZQ0KPiAqc2RldikNCj4gPiAgew0KPiANCj4gV2h5
IGtlZXAgdGhpcyBmdW5jdGlvbiBpZiB1bnVzZWQ/DQoic21tdXYzX2ZsdXNoX2NvbmZpZyIgaXMg
dXNlbGVzcyBhZnRlciBvdXIgbW9kaWZpY2F0aW9uLiBUaGUgbW9kaWZpY2F0aW9uIGlzIHZlcmlm
aWVkIGJ5IFBMMzMwIERNQSBhbmQgUENJZSBuZXR3b3JrLg0KQnV0IHdlIGFyZSBub3Qgc3VyZSBp
ZiBpdCBoYXMgcG90ZW50aWFsIHJpc2suIFNvIHdlIGhvcGUgbWFpbnRhaW5lciBjYW4gaGVscCB0
byBjaGVjaywgdGhlbiB3ZSBjYW4gcmVtb3ZlIGl0Lg0K

