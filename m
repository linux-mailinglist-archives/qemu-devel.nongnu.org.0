Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0FF3C88E5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:46:44 +0200 (CEST)
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3i1y-0005hz-O5
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1m3i0N-0004nK-Lb
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:45:03 -0400
Received: from mx2.tachyum.com ([50.229.46.110]:60917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1m3i0M-0003TD-2C
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:45:03 -0400
Received: by mx2.tachyum.com (Postfix, from userid 1000)
 id 2D39510055F4; Wed, 14 Jul 2021 09:45:00 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (thq-ex1.tachyum.com [10.7.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx2.tachyum.com (Postfix) with ESMTPS id 0247A10055EC;
 Wed, 14 Jul 2021 09:44:58 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (10.7.1.6) by THQ-EX1.tachyum.com
 (10.7.1.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 14 Jul
 2021 09:44:57 -0700
Received: from THQ-EX1.tachyum.com ([10.7.1.6]) by THQ-EX1.tachyum.com
 ([10.7.1.6]) with mapi id 15.01.2176.014; Wed, 14 Jul 2021 09:44:57 -0700
From: Michael Morrell <mmorrell@tachyum.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Thread-Topic: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Thread-Index: AQHXUq7C6V3VKBa6hEShFdzfX5jx76r5KqnAgAHh3oCAR+zssA==
Date: Wed, 14 Jul 2021 16:44:57 +0000
Message-ID: <eca2d26624004ddea64c11b725c5f163@tachyum.com>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-4-richard.henderson@linaro.org>
 <44a76e8c6504461cbd4dc5752f0d443b@tachyum.com>
 <c46f86e5-ab9e-1f64-f01d-7ec98413f1c5@linaro.org>
In-Reply-To: <c46f86e5-ab9e-1f64-f01d-7ec98413f1c5@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.100.197]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=50.229.46.110; envelope-from=mmorrell@tachyum.com;
 helo=mx2.tachyum.com
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

SnVzdCBjdXJpb3VzLiAgV2hhdCdzIHRoZSBleHBlY3RlZCB0aW1lbGluZSB0byBnZXQgdGhlc2Ug
ZGVub3JtYWwgcGF0Y2hlcyBpbiB0aGUgdHJlZT8NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3Jn
PiANClNlbnQ6IFNhdHVyZGF5LCBNYXkgMjksIDIwMjEgODoyMSBBTQ0KVG86IE1pY2hhZWwgTW9y
cmVsbCA8bW1vcnJlbGxAdGFjaHl1bS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCkNjOiBh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDAzLzExXSBzb2Z0Zmxv
YXQ6IEludHJvZHVjZSBmbG9hdF9mbGFnX2lub3JtX2Rlbm9ybWFsDQoNCk9uIDUvMjgvMjEgMTA6
NDEgQU0sIE1pY2hhZWwgTW9ycmVsbCB3cm90ZToNCj4gSSdtIHByb2JhYmx5IG1pc3Npbmcgc29t
ZXRoaW5nLCBidXQgd2h5IGRvIHdlIG5lZWQgYm90aCAiZmxvYXRfZmxhZ19pbm9ybV9kZW5vcm1h
bCIgYW5kICJmbG9hdF9mbGFnX2lmbHVzaF9kZW5vcm1hbCI/DQo+IA0KPiBDb3VsZG4ndCB0aGUg
Y29kZSB0aGF0IHNldHMgdGhlc2UgZmxhZ3Mgc2V0IGp1c3QgYSBzaW5nbGUgZmxhZyBmb3IgYWxs
IA0KPiBkZW5vcm1hbCBpbnB1dHMgYW5kIHRoZSBjb2RlIHRoYXQgY2hlY2tzIHRoZXNlIGZsYWdz
IGNoZWNrIHRoYXQgc2luZ2xlIGZsYWcgY29tYmluZWQgd2l0aCB0aGUgImZsdXNoX2lucHV0c190
b196ZXJvIiBmbGFnIHRvIGFjY29tcGxpc2ggd2hhdCB0aGUgdHdvIHNlcGFyYXRlICJpbnB1dCBk
ZW5vcm1hbCIgZmxhZ3MgZG8/DQoNClRoZSB0aGluZyB0aGF0IHlvdSdyZSBtaXNzaW5nIGlzIHRo
YXQgbWFueSBndWVzdHMgbGVhdmUgdGhlIGFjY3VtdWxhdGVkIHNvZnRmbG9hdCBleGNlcHRpb25z
IGluIHRoZSBmbG9hdF9zdGF0dXMgc3RydWN0dXJlIHVudGlsIHRoZSBndWVzdCBGUFNDUiByZWdp
c3RlciBpcyByZWFkLiBVbmxlc3MgdGhlIGd1ZXN0IG5lZWRzIHRvIHJhaXNlIGFuIGV4Y2VwdGlv
biBpbW1lZGlhdGVseSwgdGhlcmUncyBubyByZWFzb24gdG8gZG8gb3RoZXJ3aXNlLg0KDQpXaXRo
IHRoaXMgc2V0dXAsIHlvdSBoYXZlIG5vIHRlbXBvcmFsIGNvbm5lY3Rpb24gYmV0d2VlbiAiYW55
IGRlbm9ybWFsIiBhbmQgImZsdXNoLXRvLXplcm8gaXMgc2V0IiwgdGh1cyB0d28gZmxhZ3MuDQoN
Cg0Kcn4NCg==

