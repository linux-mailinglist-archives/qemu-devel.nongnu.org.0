Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9A0607E95
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 21:02:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxBP-0005zg-7r; Fri, 21 Oct 2022 14:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1olv3K-00010l-Mr
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:39:22 -0400
Received: from usmailhost21.kioxia.com ([12.0.68.226]
 helo=SJSMAIL01.us.kioxia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1olv3I-0004og-HZ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:39:21 -0400
Received: from SJSMAIL01.us.kioxia.com (10.90.133.90) by
 SJSMAIL01.us.kioxia.com (10.90.133.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 21 Oct 2022 09:39:16 -0700
Received: from SJSMAIL01.us.kioxia.com ([::1]) by SJSMAIL01.us.kioxia.com
 ([fe80::213a:a308:b836:4a06%3]) with mapi id 15.01.2375.032; Fri, 21 Oct 2022
 09:39:16 -0700
From: Clay Mayers <Clay.Mayers@kioxia.com>
To: Klaus Jensen <its@irrelevant.dk>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Keith Busch
 <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?utf-8?B?UGhsaXBwZSBNYXRoaWV1LURhdWTDqQ==?= <f4bug@amsat.org>
Subject: RE: [PATCH 4/4] hw/block/nvme: add zone descriptor changed AEN
Thread-Topic: [PATCH 4/4] hw/block/nvme: add zone descriptor changed AEN
Thread-Index: AQHY5OYcPLHAptvadkGcKRcXf014/64Y29aAgAAsLNA=
Date: Fri, 21 Oct 2022 16:39:15 +0000
Message-ID: <05759d4720ae493d881c254bc19d3e30@kioxia.com>
References: <20221021001835.942642-1-clay.mayers@kioxia.com>
 <20221021001835.942642-5-clay.mayers@kioxia.com>
 <Y1I/F1Q6IjL5rLRH@cormorant.local>
In-Reply-To: <Y1I/F1Q6IjL5rLRH@cormorant.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.93.77.43]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=12.0.68.226; envelope-from=Clay.Mayers@kioxia.com;
 helo=SJSMAIL01.us.kioxia.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PiBGcm9tOiBLbGF1cyBKZW5zZW4gPGl0c0BpcnJlbGV2YW50LmRrPg0KPiBTZW50OiBUaHVyc2Rh
eSwgT2N0b2JlciAyMCwgMjAyMiAxMTo0MSBQTQ0KPiANCj4gT24gT2N0IDIwIDE3OjE4LCBjbGF5
Lm1heWVyc0BraW94aWEuY29tIHdyb3RlOg0KPiA+IEZyb206IENsYXkgTWF5ZXJzIDxjbGF5Lm1h
eWVyc0BraW94aWEuY29tPg0KPiA+DQo+ID4gSWYgYSBuYW1lc3BhY2UncyBwYXJhbS56b25lZC5m
aW5pc2hfdGltZSBpcyBub24temVybywNCj4gPiBjb250cm9sbGVycyByZWdpc3RlciB3aXRoIHRo
ZSBuYW1lc3BhY2UgdG8gYmUgbm90aWZpZWQNCj4gPiB3aGVuIGVudHJpZXMgYXJlIGFkZGVkIHRv
IGl0cyB6b25lLWRlc2NyaXB0b3ItY2hhbmdlZA0KPiA+IGxvZyBwYWdlLiAgSWYgdGhlIHpvbmUt
ZGVzY3JpcHRvci1jaGFuZ2VkIGFlbiBpcyBlbmFibGVkLA0KPiA+IHRoaXMgd2lsbCBjYXVzZSBh
biBBRU4gdG8gYmUgc2VudCBmcm9tIHRoYXQgY29udHJvbGxlci4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IENsYXkgTWF5ZXJzIDxjbGF5Lm1heWVyc0BraW94aWEuY29tPg0KPiA+IC0tLQ0KPiA+
ICBody9udm1lL2N0cmwuYyAgICAgICB8IDYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystDQo+ID4gIGh3L252bWUvbnMuYyAgICAgICAgIHwgIDEgKw0KPiA+ICBo
dy9udm1lL252bWUuaCAgICAgICB8ICA5ICsrKysrKysNCj4gPiAgaW5jbHVkZS9ibG9jay9udm1l
LmggfCAgMiArKw0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gPg0KPiANCj4gSWYgdGhlIGNvbnRyb2xsZXIgaXMgaG90cGx1Z2dlZCAoZGV2
aWNlX2RlbCdlZCksIHlvdSBuZWVkIHRvIHJlbW92ZSB0aGUNCj4gY29udHJvbGxlciBmcm9tIHRo
ZSB3YXRjaCBsaXN0IGFzIHdlbGwuIEkgdGhpbmsgaW4gbnZtZV9leGl0KCkuDQo+IA0KPiBPdGhl
cndpc2UsIGxvb2tzIGdvb2QhDQoNClRoYW5rcyBmb3IgdGhlIHF1aWNrIGFuZCB1c2VmdWwgcmV2
aWV3LiAgQWRkaW5nIHRoZSB3YXRjaCBsaXN0IHdhcyANCmEgc2lnbmlmaWNhbnQgZGVzaWduIGNo
YW5nZSBhbmQgSSB3YXNuJ3QgY2VydGFpbiBpdCB3YXMgaW4gdGhlDQpzcGlyaXQgb2YgdGhlIGV4
aXN0aW5nIGNvZGUuICBUaGUgbG9naWMgc3BsaXQgYmV0d2VlbiBjdHJsL25zIHdhcyB0bw0KaGFu
ZGxlIHNoYXJlZCBuYW1lc3BhY2VzIGFzIHNtb290aGx5IGFzIHBvc3NpYmxlLg0KDQo=

