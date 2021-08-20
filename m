Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37DA3F28D9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 11:07:37 +0200 (CEST)
Received: from localhost ([::1]:34506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH0Uy-0006Qy-SO
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 05:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mH0S1-0002jW-AD; Fri, 20 Aug 2021 05:05:00 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:21578
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mH0Rx-0007QG-SY; Fri, 20 Aug 2021 05:04:32 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629450252; h=from:subject:to:date:message-id;
 bh=gWZZ+h5uyBg5NIhlcT59dFEEupqYcj7ieZf/JGDru78=;
 b=JfyRFlMm2iSGUiiu7vLSk9E9IQ2FuTk4jtItE4wOgj1/Y02mUdIDLE2SGaN85vOoiKB+csrio9u
 rNEV42sK2iuep7tUzW+vqFmlx1bDkCKxcgPYUbRzfRlI1CcATGhZqPDr2R1dKRwOlECCLUH47yqak
 rTZdtjsrPmQIWkCq4VI=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Fri, 20 Aug 2021 17:04:11 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
Thread-Topic: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
Thread-Index: AdeVbB3S+4i7nlcHTb+Dg8IlAhdEUv//4wWA//94u7A=
Date: Fri, 20 Aug 2021 09:04:10 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5A05@SHASXM03.verisilicon.com>
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
 <CAFEAcA-L-9AjGGLCynbDbF=apQe4J_CrWE7RFKddHiD1L1qKHg@mail.gmail.com>
In-Reply-To: <CAFEAcA-L-9AjGGLCynbDbF=apQe4J_CrWE7RFKddHiD1L1qKHg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.223]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--15.767100-0.000000-31
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
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBPbiBGcmksIDIwIEF1ZyAyMDIxIGF0IDAzOjM2LCBMaSwgQ2h1bm1pbmcNCj4gPENodW5taW5n
LkxpQHZlcmlzaWxpY29uLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGUgY3VycmVudCBTTU1VIFYz
IGRldmljZSBtb2RlbCBvbmx5IHN1cHBvcnQgUENJL1BDSWUgZGV2aWNlcywNCj4gPiBzbyB3ZSB1
cGRhdGUgaXQgdG8gc3VwcG9ydCBub24tUENJL1BDSWUgZGV2aWNlcy4NCj4gPg0KPiA+ICAgICBo
dy9hcm0vc21tdXYzOg0KPiA+ICAgICAgICAgLiBDcmVhdGUgSU9NTVUgbWVtb3J5IHJlZ2lvbnMg
Zm9yIG5vbi1QQ0kvUENJZSBkZXZpY2VzIGJhc2VkDQo+IG9uIHRoZWlyIFNJRA0KPiA+ICAgICAg
ICAgLiBBZGQgc2lkLW1hcCBwcm9wZXJ0eSB0byBzdG9yZSBub24tUENJL1BDSWUgZGV2aWNlcyBT
SUQNCj4gPiAgICAgICAgIC4gVXBkYXRlIGltcGxlbWVudGF0aW9uIG9mIENGR0kgY29tbWFuZHMg
YmFzZWQgb24gZGV2aWNlIFNJRA0KPiA+ICAgICBody9hcm0vc21tdS1jb21tb246DQo+ID4gICAg
ICAgICAuIERpZmZlcmVudGlhdGUgUENJL1BDSWUgYW5kIG5vbi1QQ0kvUENJZSBkZXZpY2VzIFNJ
RCBnZXR0aW5nDQo+IHN0cmF0ZWd5DQo+ID4gICAgIGh3L2FybS92aXJ0Og0KPiA+ICAgICAgICAg
LiBBZGQgUEwzMzAgRE1BIGNvbnRyb2xsZXIgYW5kIGNvbm5lY3Qgd2l0aCBTTU1VdjMgZm9yDQo+
IHRlc3RpbmcNCj4gPiAgICAgICAgIC4gQWRkIHNtbXV2M19zaWRtYXAgZm9yIG5vbi1QQ0kvUENJ
ZSBkZXZpY2VzIFNJRCBzZXR0aW5nDQo+IA0KPiBQbGVhc2UgZG9uJ3QgdHJ5IHRvIGRvIGFsbCB0
aGVzZSB0aGluZ3MgaW4gb25lIGJpZyBwYXRjaCAtLQ0KPiBwdXQgdG9nZXRoZXIgYSBwYXRjaHNl
cmllcyB3aXRoIHNldmVyYWwgc21hbGxlciBwYXRjaGVzLA0KPiBlYWNoIG9mIHdoaWNoIGRvZXMg
b25lIHNlbGYtY29udGFpbmVkIHRoaW5nLg0KPiANCiAgR290IGl0LiBUaGFua3MgZm9yIHlvdXIg
Y29tbWVudHMuDQogIExldCBtZSB0cnkgdG8gc3BsaXQgdGhlbSBpbnRvIHNldmVyYWwgc21hbGxl
ciBwYXRjaGVzLg0KICBCdXQgYWxsIHRoZXNlIHVwZGF0ZXMgd29yayBmb3IgMSB0aGluZy4gVGhl
eSBhcmUgZGVwZW5kIG9uIGVhY2ggb3RoZXIuDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IENodW5t
aW5nIExpIDxjaHVubWluZy5saUB2ZXJpc2lsaWNvbi5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
UmVud2VpIExpdSA8cmVud2VpLmxpdUB2ZXJpc2lsaWNvbi5jb20+DQo+ID4gLS0tDQo+ID4gVGhp
cyBwYXRjaCBkZXBlbmRzIG9uIFBMMzMwIG1lbW9yeSByZWdpb24gY29ubmVjdGlvbiBwYXRjaDoN
Cj4gPg0KPiBodHRwczovL3BhdGNoZXcub3JnL1FFTVUvNEMyM0MxN0I4RTg3RTc0RTkwNkEyNUEz
MjU0QTAzRjRGQTFGRUMzMUBTSEFTWA0KPiBNMDMudmVyaXNpbGljb24uY29tLw0KPiANCj4gSWYg
eW91IGhhdmUgYSBwYXRjaCB0aGF0IGRlcGVuZHMgb24gYW5vdGhlciwgaXQncyB1c3VhbGx5IGJl
dHRlciB0bw0KPiBzZW5kIHRoZW0gYXMgYSBwYXRjaHNlcmllcy4gSSB3YXMgd29uZGVyaW5nIHdo
YXQgdGhlIHJlYXNvbiBmb3INCj4gdGhhdCBQTDMzMCBwYXRjaCB3YXMuLi4NCiAgSSBuZWVkIGEg
bm9uLVBDSS9QQ0llIGRldmljZSB0byBkbyB0aGUgdmVyaWZpY2F0aW9uLiBUaGUgb2xkIFBMMzMw
IERNQSBjb250cm9sbGVyDQogIGNhbm5vdCBjb25maWd1cmUgaXRzIG1lbW9yeSByZWdpb24gbWFu
dWFsbHkuIFNvIHdlIHVwZGF0ZSBpdCBhbmQgcHJvdmlkZSBwYXRoLg0KICBQTDMzMCBwYXRjaCB3
YXMgcmV2aWV3ZWQgYW5kIHdpbGwgYmUgbWVyZ2VkIGluIHRhcmdldC1hcm0ubmV4dCBmb3IgNi4y
Lg0KICBUaGUgdmlydC5jIGNvbXBpbGUgd2lsbCBmYWlsIGlmIHRoZXJlIGlzIG5vIFBMMzMwIGRl
dmljZSBwYXRjaC4NCj4gDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg0KVGhhbmtzLg0KDQpDaHVubWlu
ZyBMaQ0K

