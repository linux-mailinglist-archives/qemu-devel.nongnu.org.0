Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A63C8A1D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:51:52 +0200 (CEST)
Received: from localhost ([::1]:42912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3j30-0000t1-WD
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1m3j1L-0006t1-Lr
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:50:07 -0400
Received: from mx1.tachyum.com ([66.160.133.170]:37117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1m3j1J-00065x-H0
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:50:07 -0400
Received: by mx1.tachyum.com (Postfix, from userid 1000)
 id EE6B9100D47D; Wed, 14 Jul 2021 10:50:03 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (thq-ex1.tachyum.com [10.7.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.tachyum.com (Postfix) with ESMTPS id B1EAC10057C1;
 Wed, 14 Jul 2021 10:50:01 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (10.7.1.6) by THQ-EX1.tachyum.com
 (10.7.1.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 14 Jul
 2021 10:50:01 -0700
Received: from THQ-EX1.tachyum.com ([10.7.1.6]) by THQ-EX1.tachyum.com
 ([10.7.1.6]) with mapi id 15.01.2176.014; Wed, 14 Jul 2021 10:50:01 -0700
From: Michael Morrell <mmorrell@tachyum.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Thread-Topic: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Thread-Index: AQHXUq7C6V3VKBa6hEShFdzfX5jx76r5KqnAgAHh3oCAR+zssIAAeSEA//+ZLVA=
Date: Wed, 14 Jul 2021 17:50:01 +0000
Message-ID: <a24bef3b7c18448bab9f5b5fe369630f@tachyum.com>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-4-richard.henderson@linaro.org>
 <44a76e8c6504461cbd4dc5752f0d443b@tachyum.com>
 <c46f86e5-ab9e-1f64-f01d-7ec98413f1c5@linaro.org>
 <eca2d26624004ddea64c11b725c5f163@tachyum.com>
 <e6cb4333-fd32-bc64-0f7a-dc9ffd10a535@linaro.org>
In-Reply-To: <e6cb4333-fd32-bc64-0f7a-dc9ffd10a535@linaro.org>
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

T0ssIHRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4gIEkgYWxzbyBhcHByZWNpYXRlIHlvdSBsb29raW5n
IGF0IHRoZSBOYU4gaXNzdWUuDQoNCiAgIE1pY2hhZWwNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPiANClNlbnQ6IFdlZG5lc2RheSwgSnVseSAxNCwgMjAyMSA5OjU3IEFNDQpUbzogTWljaGFl
bCBNb3JyZWxsIDxtbW9ycmVsbEB0YWNoeXVtLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0K
U3ViamVjdDogUmU6IFtQQVRDSCAwMy8xMV0gc29mdGZsb2F0OiBJbnRyb2R1Y2UgZmxvYXRfZmxh
Z19pbm9ybV9kZW5vcm1hbA0KDQpPbiA3LzE0LzIxIDk6NDQgQU0sIE1pY2hhZWwgTW9ycmVsbCB3
cm90ZToNCj4gSnVzdCBjdXJpb3VzLiAgV2hhdCdzIHRoZSBleHBlY3RlZCB0aW1lbGluZSB0byBn
ZXQgdGhlc2UgZGVub3JtYWwgcGF0Y2hlcyBpbiB0aGUgdHJlZT8NCg0KTmV4dCBkZXZlbG9wbWVu
dCBjeWNsZSwgYXQgbWluaW11bS4gIEkgbmVlZCB0byBmaXggdGhlIHByb2JsZW1zIHZzIE5hTnMg
dGhhdCB5b3UgaWRlbnRpZmllZC4NCg0KDQpyfg0K

