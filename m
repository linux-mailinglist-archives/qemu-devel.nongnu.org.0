Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F57D3F914C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 02:24:20 +0200 (CEST)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJPfK-00052R-0S
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 20:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mJPeG-0004By-3B; Thu, 26 Aug 2021 20:23:08 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:58825
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mJPeD-00067S-Cw; Thu, 26 Aug 2021 20:23:07 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1630023777; h=from:subject:to:date:message-id;
 bh=T2bYRujPzoZZo6wuM1ahLGx0S0bYG7eT3R6vXxL/DZ8=;
 b=BXpHnPSOVLgkRoT6o3rpKNQSIA+A5QCPL7UIM1jZ07V1xrwsj2Hg5IL5iRVRpbWxrlHfodDKX1h
 LOfBAkaTJcehcjNVdBm+U4UZEtg8PxAht+POZq194fwJNtpUuGgTGzaa3vUBVmdpWxgeYG4JKH35X
 ZEtwU/ovHRGM9d4sJYM=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Fri, 27 Aug 2021 08:22:54 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
Thread-Topic: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
Thread-Index: AdeVbB3S+4i7nlcHTb+Dg8IlAhdEUv//4wWA//94u7CAAI29AP/5QjJAgBCcG4D//u5WQA==
Date: Fri, 27 Aug 2021 00:22:53 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142FE59B@SHASXM03.verisilicon.com>
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
 <CAFEAcA-L-9AjGGLCynbDbF=apQe4J_CrWE7RFKddHiD1L1qKHg@mail.gmail.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5A05@SHASXM03.verisilicon.com>
 <CAFEAcA_g59GdK+X366xkWj+znz8B_TTufBMvgvND9TS+dnjEdA@mail.gmail.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B01142FAC4C@SHASXM03.verisilicon.com>
 <CAFEAcA8imTqu1YGfWaOw2-9GUZh_X3rRoUbbFNJXfX4c7H-uaQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8imTqu1YGfWaOw2-9GUZh_X3rRoUbbFNJXfX4c7H-uaQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.182]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--19.083300-0.000000-31
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
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCBb
bWFpbHRvOnBldGVyLm1heWRlbGxAbGluYXJvLm9yZ10NCj4gU2VudDogVGh1cnNkYXksIEF1Z3Vz
dCAyNiwgMjAyMSAxMTo1NyBQTQ0KPiBUbzogTGksIENodW5taW5nDQo+IENjOiBlcmljLmF1Z2Vy
QHJlZGhhdC5jb207IExpdSwgUmVud2VpOyBxZW11LWFybUBub25nbnUub3JnOyBXZW4sDQo+IEpp
YW54aWFuOyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gaHcv
YXJtL3NtbXV2MzogU3VwcG9ydCBub24tUENJL1BDSWUgZGV2aWNlcw0KPiBjb25uZWN0aW9uDQo+
IA0KPiBPbiBUdWUsIDI0IEF1ZyAyMDIxIGF0IDA5OjIyLCBMaSwgQ2h1bm1pbmcNCj4gPENodW5t
aW5nLkxpQHZlcmlzaWxpY29uLmNvbT4gd3JvdGU6DQo+ID4gU29ycnkgZm9yIGludGVycnVwdCB5
b3UuDQo+ID4gQ291bGQgeW91IGhlbHAgdG8gY2hlY2sgd2h5IG15IHNlcmllcyBwYXRjaCBjYW5u
b3QgYmUgbGlzdGVkIGJ5DQo+IGh0dHBzOi8vcGF0Y2hldy5vcmcvPw0KPiA+IEkgc3BsaXQgdGhl
IHBhdGNoIGludG8gNCBjb21taXRzIHdpdGggMSBjb3ZlcmxldHRlciBhbmQgc2VuZCB0aGVtIG91
dA0KPiB3aXRoIHY0IHRhZy4NCj4gPiBJIGNhbiBzZWUgYWxsIDUgZW1haWxzIGluIGh0dHBzOi8v
d3d3Lm1haWwtYXJjaGl2ZS5jb20vcWVtdS0NCj4gZGV2ZWxAbm9uZ251Lm9yZy8NCj4gPiBCdXQN
Cj4gaHR0cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VLzQ5Qzc5QjcwMEI1RDhGNDVCOEVGMDg2MUI0RUYz
QjNCMDExNDJGQUJENkBTSEENCj4gU1hNMDMudmVyaXNpbGljb24uY29tLyMNCj4gPiBzaG93ICIg
T25seSAwIHBhdGNoZXMgcmVjZWl2ZWQhICIuDQo+ID4gSXQgaXMgZ3JlYXQgaGVscGZ1bCBJZiB5
b3UgY2FuIGhlbHAgdG8gY2hlY2sgYW5kIHRlbGwgbWUgd2hhdCBtaXN0YWtlDQo+IEkgbWFkZS4N
Cj4gPiBUaGFua3MgdmVyeSBtdWNoIQ0KPiANCj4gSSBndWVzcyB5b3UgZmlndXJlZCBvdXQgdGhl
IHByb2JsZW0gYWxyZWFkeSwgYmVjYXVzZSB2NSBoYXMgdGhlbSBhbGw6DQo+IGh0dHBzOi8vcGF0
Y2hldy5vcmcvUUVNVS8xNjI5ODc4OTIyLTE3MzI3MC0xLWdpdC1zZW5kLWVtYWlsLQ0KPiBjaHVu
bWluZ19saTEyMzRAMTYzLmNvbS8NCj4gQnV0IHRoZSBwcm9ibGVtIHdhcyB0aGF0IGZvciB2NCB0
aGUgcGF0Y2ggZW1haWxzIHdlcmUgbm90IHNlbnQgYXMNCj4gdGhyZWFkZWQgZW1haWxzIGZvbGxv
d2luZyB1cCB0byB0aGUgY292ZXIgbGV0dGVyICh0aGF0IGlzLCB0aGV5IHdlcmUNCj4gbWlzc2lu
ZyBhcHByb3ByaWF0ZSBSZWZlcmVuY2VzOiBoZWFkZXJzKS4NCj4gDQo+IC0tIFBNTQ0KDQpZZXMs
IGl0IGlzLiBUaGFua3MgZm9yIHlvdXIgaGVscC4gSSBmb3VuZCB0aGUgcHJvYmxlbSBhbmQgZml4
ZWQgaXQgaW4gdjUuDQpQbGVhc2UgaGVscCB0byBjaGVjayB0aGUgdjUgcGF0Y2gsIGxvb2tpbmcg
Zm9yd2FyZCB0byB5b3VyIHJldmlldyBmZWVkYmFjay4NCg0KQ2h1bm1pbmcNCg==

