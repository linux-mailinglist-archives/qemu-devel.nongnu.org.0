Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996383AFA5F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 02:58:40 +0200 (CEST)
Received: from localhost ([::1]:42034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvUkR-0004Js-61
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 20:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lvUjM-0003df-Kh
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 20:57:32 -0400
Received: from mx1.tachyum.com ([66.160.133.170]:52286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lvUjJ-00027Z-Rq
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 20:57:32 -0400
Received: by mx1.tachyum.com (Postfix, from userid 1000)
 id 8B32E1005693; Mon, 21 Jun 2021 17:57:27 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (unknown [10.7.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.tachyum.com (Postfix) with ESMTPS id 85DAC100D44E;
 Mon, 21 Jun 2021 17:57:26 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (10.7.1.6) by THQ-EX1.tachyum.com
 (10.7.1.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 21 Jun
 2021 17:57:26 -0700
Received: from THQ-EX1.tachyum.com ([10.7.1.6]) by THQ-EX1.tachyum.com
 ([10.7.1.6]) with mapi id 15.01.2176.014; Mon, 21 Jun 2021 17:57:26 -0700
From: Michael Morrell <mmorrell@tachyum.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: Denormal input handling
Thread-Topic: Denormal input handling
Thread-Index: AddSVLVuQ70cTMk8SjeoZZpZvpdwcwUnLwIAAA+pMgAAC7w14A==
Date: Tue, 22 Jun 2021 00:57:26 +0000
Message-ID: <c1b992e063414da88b686e8f6e9642f2@tachyum.com>
References: <30eafc8be31446f9aecbc40f487467e1@tachyum.com>
 <c021f386dcfb49aca2ab0c01f66bccc2@tachyum.com>
 <08ba29ee-d5c0-8c61-0efc-4c03fe9da944@linaro.org>
In-Reply-To: <08ba29ee-d5c0-8c61-0efc-4c03fe9da944@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.100.197]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=66.160.133.170; envelope-from=mmorrell@tachyum.com;
 helo=mx1.tachyum.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmljaGFyZCwNCg0KSSB3YXMgdW5kZXIgdGhlIG1pc3Rha2VuIGltcHJlc3Npb24gdGhhdCB5b3Vy
IGNoYW5nZXMgaW4gdGhpcyBhcmVhIChzcGxpdHRpbmcgZmxvYXRfZmxhZ19pbnB1dF9kZW5vcm1h
bCBpbnRvIDIgZmxhZ3MpIHdlcmUgYWxyZWFkeSBjaGVja2VkIGluLCBidXQgSSBzZWUgbm93IHRo
YXQgaXMgbm90IHRoZSBjYXNlLiAgSSBzaG91bGQgcHJvYmFibHkgd2FpdCB1bnRpbCB0aGF0IGlz
IGRvbmUgYmVmb3JlIEkgdHJ5IHRvIGNsYWltIHRoZXJlIGFyZSBhZGRpdGlvbmFsIGlzc3VlcyBo
ZXJlLg0KDQogICAgTWljaGFlbA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
UmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+IA0KU2VudDog
TW9uZGF5LCBKdW5lIDIxLCAyMDIxIDQ6MzAgUE0NClRvOiBNaWNoYWVsIE1vcnJlbGwgPG1tb3Jy
ZWxsQHRhY2h5dW0uY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQpTdWJqZWN0OiBSZTogRGVu
b3JtYWwgaW5wdXQgaGFuZGxpbmcNCg0KT24gNi8yMS8yMSA0OjEzIFBNLCBNaWNoYWVsIE1vcnJl
bGwgd3JvdGU6DQo+IEkgaGF2ZSBhbm90aGVyIGNvdXBsZSBvZiB0aG91Z2h0cyBhcm91bmQgaW5w
dXQgZGVub3JtYWwgaGFuZGxpbmcuDQo+IA0KPiBUaGUgZmlyc3QgaXMgc3RyYWlnaHRmb3J3YXJk
LsKgIEkgbm90aWNlZCB0aGF0IHRoZSBBYXJjaDY0IHBvcnQgZG9lc24ndCANCj4gcmVwb3J0IGlu
cHV0IGRlbm9ybWFscyAoSSBjb3VsZCBub3QgZmluZCBhbnkgY29kZSB3aGljaCBzZXRzIHRoZSBJ
REMgDQo+IGJpdCBpbiB0aGUgRlBTUikuwqAgSSBmb3VuZCBjb2RlIGluIHRoZSBhcm0gKG5vdCBh
YXJjaDY0KSBwb3J0IHRoYXQgDQo+IHNldHMgb3RoZXIgYml0cyBsaWtlIElYQywgYnV0IG5vdGhp
bmcgZm9yIElEQy7CoMKgIElzIHRoYXQgc2ltcGx5IGJlY2F1c2Ugbm8gb25lIGhhcyBib3RoZXJl
ZCB0byBhZGQgdGhpcyBzdXBwb3J0Pw0KDQpJdCdzIGJlY2F1c2Ugd2UgZmFpbGVkIHRvIHVzZSBz
eW1ib2xpYyBjb25zdGFudHMuICBTZWUgdmZwX2V4Y2VwdGJpdHNfZnJvbV9ob3N0LiAgV2hpY2gN
CippcyogdXNlZCBmb3IgYm90aCBhYXJjaDY0IGFuZCBhcm0uDQoNCg0KPiBUaGUgc2Vjb25kIGNv
bmNlcm5zIHN1cHBvcnQgZm9yIGNhc2VzIHdoZXJlIG11bHRpcGxlIGV4Y2VwdGlvbiBjb25kaXRp
b25zIG9jY3VyLsKgwqAgSSBoYWQgDQo+IG9yaWdpbmFsbHkgdGhvdWdodCB0aGF0IGRlbm9ybWFs
IGlucHV0IGhhbmRsaW5nIHdvdWxkIGJlIG9ydGhvZ29uYWwgdG8gZXZlcnl0aGluZyBlbHNlIGFu
ZCANCj4gc28gYSBjYXNlIGxpa2UgInNOYU4gwqArIGRlbm9ybSIgd291bGQgc2V0IGJvdGggdGhl
IGludmFsaWQgYW5kIGlucHV0IGRlbm9ybWFsIGZsYWdzIG9yIA0KPiAiZGVub3JtIC8gMCIgd291
bGQgc2V0IGJvdGggaWRpdmRlIGJ5IHplcm8gYW5kIGlucHV0IGRlbm9ybWFsLCBidXQgSSBkb24n
dCB0aGluayB0aGF0IGlzIA0KPiB0cnVlIGZvciBhdCBsZWFzdCBzb21lIGFyY2hpdGVjdHVyZXMu
wqAgUGVyaGFwcyBzb21lIHNwZWNpYWxpemF0aW9uIGlzIG5lZWRlZCBoZXJlPw0KDQpJZiB5b3Un
dmUgZ290IGEgc3BlY2lmaWMgZXhhbXBsZSwgd2UgY2FuIGxvb2sgYXQgaXQuICBUaGVyZSdzIG5v
IHBvaW50IGFkZGluZyANCnNwZWNpYWxpemF0aW9uIHRoYXQgaXNuJ3QgZ29pbmcgdG8gYmUgdXNl
ZC4NCg0KDQpyfg0K

