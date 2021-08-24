Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832023F59CE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:24:38 +0200 (CEST)
Received: from localhost ([::1]:57162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIRjO-00053J-3n
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRgv-0003GX-UN; Tue, 24 Aug 2021 04:21:53 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:52531
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRgr-0003CY-Cv; Tue, 24 Aug 2021 04:21:53 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629793295; h=from:subject:to:date:message-id;
 bh=YA9K4KG3O0sFUXorCymJMEOzOVVGDhjZCZcto0AQm6E=;
 b=XscW0vbvdFWty/3GQZR3p5Lh42IVCDh7FwO9SgeimrLHbwm7Tz2GpN5WJl4Jv3dU4c7t5QAELl0
 nOZPmc/yrp0FQ2F0q9RMdACfBiCPE55Sbn0s7LWz0nC2d9yYQufUdiHu8ASnY3MqjovlhHcrWawSx
 4E9vus4nis/FSBsYcWE=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Tue, 24 Aug 2021 16:21:33 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
Thread-Topic: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
Thread-Index: AdeVbB3S+4i7nlcHTb+Dg8IlAhdEUv//4wWA//94u7CAAI29AP/5QjJA
Date: Tue, 24 Aug 2021 08:21:33 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142FAC4C@SHASXM03.verisilicon.com>
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
 <CAFEAcA-L-9AjGGLCynbDbF=apQe4J_CrWE7RFKddHiD1L1qKHg@mail.gmail.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5A05@SHASXM03.verisilicon.com>
 <CAFEAcA_g59GdK+X366xkWj+znz8B_TTufBMvgvND9TS+dnjEdA@mail.gmail.com>
In-Reply-To: <CAFEAcA_g59GdK+X366xkWj+znz8B_TTufBMvgvND9TS+dnjEdA@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.182]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--25.693700-0.000000-31
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCBb
bWFpbHRvOnBldGVyLm1heWRlbGxAbGluYXJvLm9yZ10NCj4gU2VudDogRnJpZGF5LCBBdWd1c3Qg
MjAsIDIwMjEgNToxNSBQTQ0KPiBUbzogTGksIENodW5taW5nDQo+IENjOiBlcmljLmF1Z2VyQHJl
ZGhhdC5jb207IHFlbXUtYXJtQG5vbmdudS5vcmc7IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsNCj4g
V2VuLCBKaWFueGlhbjsgTGl1LCBSZW53ZWkNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gaHcvYXJt
L3NtbXV2MzogU3VwcG9ydCBub24tUENJL1BDSWUgZGV2aWNlcw0KPiBjb25uZWN0aW9uDQo+IA0K
PiBPbiBGcmksIDIwIEF1ZyAyMDIxIGF0IDEwOjA0LCBMaSwgQ2h1bm1pbmcNCj4gPENodW5taW5n
LkxpQHZlcmlzaWxpY29uLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiA+IE9uIEZyaSwgMjAgQXVnIDIw
MjEgYXQgMDM6MzYsIExpLCBDaHVubWluZw0KPiA+ID4gPENodW5taW5nLkxpQHZlcmlzaWxpY29u
LmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBjdXJyZW50IFNNTVUgVjMgZGV2aWNl
IG1vZGVsIG9ubHkgc3VwcG9ydCBQQ0kvUENJZSBkZXZpY2VzLA0KPiA+ID4gPiBzbyB3ZSB1cGRh
dGUgaXQgdG8gc3VwcG9ydCBub24tUENJL1BDSWUgZGV2aWNlcy4NCj4gPiA+ID4NCj4gPiA+ID4g
ICAgIGh3L2FybS9zbW11djM6DQo+ID4gPiA+ICAgICAgICAgLiBDcmVhdGUgSU9NTVUgbWVtb3J5
IHJlZ2lvbnMgZm9yIG5vbi1QQ0kvUENJZSBkZXZpY2VzDQo+IGJhc2VkDQo+ID4gPiBvbiB0aGVp
ciBTSUQNCj4gPiA+ID4gICAgICAgICAuIEFkZCBzaWQtbWFwIHByb3BlcnR5IHRvIHN0b3JlIG5v
bi1QQ0kvUENJZSBkZXZpY2VzIFNJRA0KPiA+ID4gPiAgICAgICAgIC4gVXBkYXRlIGltcGxlbWVu
dGF0aW9uIG9mIENGR0kgY29tbWFuZHMgYmFzZWQgb24gZGV2aWNlDQo+IFNJRA0KPiA+ID4gPiAg
ICAgaHcvYXJtL3NtbXUtY29tbW9uOg0KPiA+ID4gPiAgICAgICAgIC4gRGlmZmVyZW50aWF0ZSBQ
Q0kvUENJZSBhbmQgbm9uLVBDSS9QQ0llIGRldmljZXMgU0lEDQo+IGdldHRpbmcNCj4gPiA+IHN0
cmF0ZWd5DQo+ID4gPiA+ICAgICBody9hcm0vdmlydDoNCj4gPiA+ID4gICAgICAgICAuIEFkZCBQ
TDMzMCBETUEgY29udHJvbGxlciBhbmQgY29ubmVjdCB3aXRoIFNNTVV2MyBmb3INCj4gPiA+IHRl
c3RpbmcNCj4gPiA+ID4gICAgICAgICAuIEFkZCBzbW11djNfc2lkbWFwIGZvciBub24tUENJL1BD
SWUgZGV2aWNlcyBTSUQgc2V0dGluZw0KPiA+ID4NCj4gPiA+IFBsZWFzZSBkb24ndCB0cnkgdG8g
ZG8gYWxsIHRoZXNlIHRoaW5ncyBpbiBvbmUgYmlnIHBhdGNoIC0tDQo+ID4gPiBwdXQgdG9nZXRo
ZXIgYSBwYXRjaHNlcmllcyB3aXRoIHNldmVyYWwgc21hbGxlciBwYXRjaGVzLA0KPiA+ID4gZWFj
aCBvZiB3aGljaCBkb2VzIG9uZSBzZWxmLWNvbnRhaW5lZCB0aGluZy4NCj4gPiA+DQo+ID4gICBH
b3QgaXQuIFRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4NCj4gPiAgIExldCBtZSB0cnkgdG8gc3Bs
aXQgdGhlbSBpbnRvIHNldmVyYWwgc21hbGxlciBwYXRjaGVzLg0KPiA+ICAgQnV0IGFsbCB0aGVz
ZSB1cGRhdGVzIHdvcmsgZm9yIDEgdGhpbmcuIFRoZXkgYXJlIGRlcGVuZCBvbiBlYWNoDQo+IG90
aGVyLg0KPiANCj4gWWVzLCB0aGF0J3Mgd2h5IHlvdSBzZW5kIGEgc2luZ2xlIHBhdGNoICpzZXJp
ZXMqLCB3aGljaCBoYXMNCj4gYSBjb3ZlciBsZXR0ZXIgdGhhdCBleHBsYWlucyB0aGUgb3ZlcmFs
bCBwdXJwb3NlLiBUaGVuIGVhY2gNCj4gaW5kaXZpZHVhbCBwYXRjaCBpbiB0aGUgc2VyaWVzIGhh
cyBhIGNvbW1pdCBtZXNzYWdlIHRoYXQNCj4gZGVzY3JpYmVzIHdoYXQgdGhhdCBzcGVjaWZpYyBw
YXRjaCBpcyBkb2luZy4gQXMgZW1haWxzLCB0aGUNCj4gcGF0Y2hlcyBhcmUgYWxsIHNlbnQgYXMg
Zm9sbG93LXVwcyB0byB0aGUgY292ZXJsZXR0ZXIuDQo+ICJnaXQgZm9ybWF0LXBhdGNoIiBhbmQg
ImdpdCBzZW5kLWVtYWlsIiBzaG91bGQgaGFuZGxlIHRoaXMgZm9yIHlvdS4NCj4gDQoNClNvcnJ5
IGZvciBpbnRlcnJ1cHQgeW91LiANCkNvdWxkIHlvdSBoZWxwIHRvIGNoZWNrIHdoeSBteSBzZXJp
ZXMgcGF0Y2ggY2Fubm90IGJlIGxpc3RlZCBieSBodHRwczovL3BhdGNoZXcub3JnLz8NCkkgc3Bs
aXQgdGhlIHBhdGNoIGludG8gNCBjb21taXRzIHdpdGggMSBjb3ZlcmxldHRlciBhbmQgc2VuZCB0
aGVtIG91dCB3aXRoIHY0IHRhZy4NCkkgY2FuIHNlZSBhbGwgNSBlbWFpbHMgaW4gaHR0cHM6Ly93
d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvIA0KQnV0IGh0dHBzOi8v
cGF0Y2hldy5vcmcvUUVNVS80OUM3OUI3MDBCNUQ4RjQ1QjhFRjA4NjFCNEVGM0IzQjAxMTQyRkFC
RDZAU0hBU1hNMDMudmVyaXNpbGljb24uY29tLyMgDQpzaG93ICIgT25seSAwIHBhdGNoZXMgcmVj
ZWl2ZWQhICIuDQpJdCBpcyBncmVhdCBoZWxwZnVsIElmIHlvdSBjYW4gaGVscCB0byBjaGVjayBh
bmQgdGVsbCBtZSB3aGF0IG1pc3Rha2UgSSBtYWRlLg0KVGhhbmtzIHZlcnkgbXVjaCENCg0KPiBo
dHRwczovL3dpa2kucWVtdS5vcmcvQ29udHJpYnV0ZS9TdWJtaXRBUGF0Y2gjU3BsaXRfdXBfbG9u
Z19wYXRjaGVzDQo+IGhhcyBhIGxpdHRsZSBtb3JlIGRpc2N1c3Npb24gb2YgdGhpcy4NCj4gDQo+
ID4gPiBJZiB5b3UgaGF2ZSBhIHBhdGNoIHRoYXQgZGVwZW5kcyBvbiBhbm90aGVyLCBpdCdzIHVz
dWFsbHkgYmV0dGVyIHRvDQo+ID4gPiBzZW5kIHRoZW0gYXMgYSBwYXRjaHNlcmllcy4gSSB3YXMg
d29uZGVyaW5nIHdoYXQgdGhlIHJlYXNvbiBmb3INCj4gPiA+IHRoYXQgUEwzMzAgcGF0Y2ggd2Fz
Li4uDQo+IA0KPiA+ICAgSSBuZWVkIGEgbm9uLVBDSS9QQ0llIGRldmljZSB0byBkbyB0aGUgdmVy
aWZpY2F0aW9uLiBUaGUgb2xkIFBMMzMwDQo+IERNQSBjb250cm9sbGVyDQo+ID4gICBjYW5ub3Qg
Y29uZmlndXJlIGl0cyBtZW1vcnkgcmVnaW9uIG1hbnVhbGx5LiBTbyB3ZSB1cGRhdGUgaXQgYW5k
DQo+IHByb3ZpZGUgcGF0aC4NCj4gPiAgIFBMMzMwIHBhdGNoIHdhcyByZXZpZXdlZCBhbmQgd2ls
bCBiZSBtZXJnZWQgaW4gdGFyZ2V0LWFybS5uZXh0IGZvcg0KPiA2LjIuDQo+ID4gICBUaGUgdmly
dC5jIGNvbXBpbGUgd2lsbCBmYWlsIGlmIHRoZXJlIGlzIG5vIFBMMzMwIGRldmljZSBwYXRjaC4N
Cj4gDQo+IFllYWgsIEkgYWNjZXB0ZWQgaXQgYmVjYXVzZSBpdCBpcyBhIHNlbnNpYmxlIGNsZWFu
dXAgb24gaXRzIG93bjsNCj4gYnV0IGl0IHdvdWxkIGhhdmUgYmVlbiBhIGJpdCBlYXNpZXIgZm9y
IG1lIHRvIHVuZGVyc3RhbmQgd2h5IHlvdQ0KPiB3ZXJlIGRvaW5nIHRoYXQgaWYgSSdkIGhhZCB0
aGUgd2lkZXIgY29udGV4dC4NCj4gDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg==

