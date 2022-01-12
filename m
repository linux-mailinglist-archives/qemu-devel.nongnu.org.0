Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EB348BB99
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:04:50 +0100 (CET)
Received: from localhost ([::1]:59980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7R8D-0001hq-Vh
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1n7R5v-00010U-II
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:02:27 -0500
Received: from mxb.tachyum.com ([66.160.133.170]:15964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1n7R5u-00012I-0Q
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:02:27 -0500
X-Virus-Scanned: by SpamTitan at tachyum.com
Authentication-Results: mxb.tachyum.com;
        x-trusted-ip=pass
Received: from THQ-EX1.tachyum.com (unknown [10.7.1.6])
 by mxb.tachyum.com (Postfix) with ESMTPS id 095268B645F;
 Tue, 11 Jan 2022 16:02:07 -0800 (PST)
Received: from THQ-EX1.tachyum.com (10.7.1.6) by THQ-EX1.tachyum.com
 (10.7.1.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 11 Jan
 2022 16:02:12 -0800
Received: from THQ-EX1.tachyum.com ([10.7.1.6]) by THQ-EX1.tachyum.com
 ([10.7.1.6]) with mapi id 15.01.2308.020; Tue, 11 Jan 2022 16:02:12 -0800
From: Michael Morrell <mmorrell@tachyum.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Thread-Topic: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Thread-Index: AQHXUq7C6V3VKBa6hEShFdzfX5jx76r5KqnAgAHh3oCAR+zssIAAeSEA//+ZLVCBHN3QwA==
Date: Wed, 12 Jan 2022 00:02:12 +0000
Message-ID: <067604320712427399631eeab4f7cb65@tachyum.com>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-4-richard.henderson@linaro.org>
 <44a76e8c6504461cbd4dc5752f0d443b@tachyum.com>
 <c46f86e5-ab9e-1f64-f01d-7ec98413f1c5@linaro.org>
 <eca2d26624004ddea64c11b725c5f163@tachyum.com>
 <e6cb4333-fd32-bc64-0f7a-dc9ffd10a535@linaro.org>
 <a24bef3b7c18448bab9f5b5fe369630f@tachyum.com>
In-Reply-To: <a24bef3b7c18448bab9f5b5fe369630f@tachyum.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=66.160.133.170; envelope-from=mmorrell@tachyum.com;
 helo=mxb.tachyum.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmljaGFyZCwNCg0KSXQncyBiZWVuIDYgbW9udGhzIHNvIEkgdGhvdWdodCBJJ2QgY2hlY2sgaW4g
YWdhaW4uICAgRG8geW91IGhhdmUgYW4gZXN0aW1hdGUgb2Ygd2hlbiB0aGlzIHdpbGwgZ28gaW4/
DQoNCiAgIE1pY2hhZWwNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1pY2hh
ZWwgTW9ycmVsbCANClNlbnQ6IFdlZG5lc2RheSwgSnVseSAxNCwgMjAyMSAxMDo1MCBBTQ0KVG86
ICdSaWNoYXJkIEhlbmRlcnNvbicgPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+OyBxZW11
LWRldmVsQG5vbmdudS5vcmcNClN1YmplY3Q6IFJFOiBbUEFUQ0ggMDMvMTFdIHNvZnRmbG9hdDog
SW50cm9kdWNlIGZsb2F0X2ZsYWdfaW5vcm1fZGVub3JtYWwNCg0KT0ssIHRoYW5rcyBmb3IgdGhl
IHVwZGF0ZS4gIEkgYWxzbyBhcHByZWNpYXRlIHlvdSBsb29raW5nIGF0IHRoZSBOYU4gaXNzdWUu
DQoNCiAgIE1pY2hhZWwNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hh
cmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPiANClNlbnQ6IFdlZG5l
c2RheSwgSnVseSAxNCwgMjAyMSA5OjU3IEFNDQpUbzogTWljaGFlbCBNb3JyZWxsIDxtbW9ycmVs
bEB0YWNoeXVtLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KU3ViamVjdDogUmU6IFtQQVRD
SCAwMy8xMV0gc29mdGZsb2F0OiBJbnRyb2R1Y2UgZmxvYXRfZmxhZ19pbm9ybV9kZW5vcm1hbA0K
DQpPbiA3LzE0LzIxIDk6NDQgQU0sIE1pY2hhZWwgTW9ycmVsbCB3cm90ZToNCj4gSnVzdCBjdXJp
b3VzLiAgV2hhdCdzIHRoZSBleHBlY3RlZCB0aW1lbGluZSB0byBnZXQgdGhlc2UgZGVub3JtYWwg
cGF0Y2hlcyBpbiB0aGUgdHJlZT8NCg0KTmV4dCBkZXZlbG9wbWVudCBjeWNsZSwgYXQgbWluaW11
bS4gIEkgbmVlZCB0byBmaXggdGhlIHByb2JsZW1zIHZzIE5hTnMgdGhhdCB5b3UgaWRlbnRpZmll
ZC4NCg0KDQpyfg0K

