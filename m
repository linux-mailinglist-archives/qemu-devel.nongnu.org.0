Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147D5A2A2D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:58:44 +0200 (CEST)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRanD-0005lg-Hl
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.sebelev@auriga.com>)
 id 1oRUIn-00087v-GF
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:02:53 -0400
Received: from hq-ms.auriga.com ([82.97.202.32]:7750 helo=hq-ms.auriga.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.sebelev@auriga.com>)
 id 1oRUIj-0005RE-Hq
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:02:52 -0400
Received: from HQ-MS1.office.auriga.msk (82.97.202.32) by
 hq-ms1.office.auriga.msk (82.97.202.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 26 Aug 2022 10:51:21 +0300
Received: from HQ-MS1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e]) by
 hq-ms1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e%4]) with mapi id
 15.02.1118.012; Fri, 26 Aug 2022 10:51:20 +0300
From: "Sebelev, Vladimir" <vladimir.sebelev@auriga.com>
To: Peter Maydell <peter.maydell@linaro.org>, Drap Anton <drapas86@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Drap, Anton"
 <anton.drap@auriga.com>, "Daniel P. Berrange" <berrange@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
Subject: RE: [PATCH v3] Loading new machines and devices from external modules
Thread-Topic: [PATCH v3] Loading new machines and devices from external modules
Thread-Index: AQHYtgRWsjhnh+cgOUSLR6biyi6pBq26czKAgAZgEdA=
Date: Fri, 26 Aug 2022 07:51:20 +0000
Message-ID: <8b584a6fb2cf48c6ac28a9d6ea488dcf@auriga.com>
References: <20220822085041.127776-1-anton.drap@auriga.com>
 <CAFEAcA-C87Qgyvc_yqtiecA9EBE50J9CZgQY5FiAqDm+pQx67Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-C87Qgyvc_yqtiecA9EBE50J9CZgQY5FiAqDm+pQx67Q@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.87.156.138]
x-tm-as-product-ver: SMEX-14.0.0.1158-9.0.1002-27100.002
x-tm-as-result: No-10--5.781200-8.000000
x-tmase-matchedrid: 6otD/cJAac2CrAvdroZEJqzSsZt54aj7eLLCA0PD7aija+N6eKiRn172
 1f1Z1L9KM90yViNIbDWNOrKja3myFo92uekb9JH9BApSYI86Y6hD/ZSMhIVBcMfJHK1iOyXwnM3
 3fC3tlVL96IKVwMcR73VyBEksQF0cDytg73Zv02ZBCnVJVKypgPZqI0nPzd0HZRL+gCLSlhcIyZ
 Ynq1RP5161PZtF3q6LmMW/FIwysoOS6ZREE84qAt5x7RpGJf1aaEANKbBJN10EpmTf3u8rpWsVM
 gb+0+QTbFs4DQ4Ip3nVGk64c676ZuqXDbz6Gdxnq5uw61JZjZBftuJwrFEhTY2j49Ftap9Eymsk
 /wUE4hoMFsa+1wyh/D18o4csYLMp8/rt5k9oWen2jSvAPFRO1rs5P4d7A+5U/UOim++UcLY=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--5.781200-8.000000
x-tmase-version: SMEX-14.0.0.1158-9.0.1002-27100.002
x-tm-snts-smtp: 46EC3A6DE5B850449ACCEB884652E5165CC7850D77FE4F08E289F882A11C88772000:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=82.97.202.32;
 envelope-from=vladimir.sebelev@auriga.com; helo=hq-ms.auriga.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 26 Aug 2022 10:40:29 -0400
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

SGkgUGV0ZXIsDQoNCkFudG9uIHByZXZpb3VzbHkgc2VudCBleHBsYW5hdGlvbiBvZiBvdXIgcG9z
aXRpb24uIE5vYm9keSBjb21tZW50ZWQuIENvdWxkIHlvdSBwbGVhc2UgY29tbWVudCBvbiBpdD8g
SXQncyBuZWNlc3NhcnkgZm9yIHVzIHRvIGJldHRlciB1bmRlcnN0YW5kIHlvdXIgcG9zaXRpb24u
IEZyb20gb3VyIHBvaW50IG9mIHZpZXcgdGVjaG5pY2FsIGJhbiBvZiBleHRlcm5hbCBtb2R1bGVz
IGxvYWRpbmcgZG9lc24ndCBzb2x2ZSBhbnkgb2YgbWVudGlvbmVkIHByb2JsZW1zLCBidXQgbWFr
ZXMgVlAgZGV2ZWxvcGVyIGxpZmUgaGFyZGVyLg0KDQpCZXN0IFJlZ2FyZHMsDQpWbGFkaW1pcg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnPiANClNlbnQ6IE1vbmRheSwgQXVndXN0IDIyLCAyMDIyIDEyOjIz
IFBNDQpUbzogRHJhcCBBbnRvbiA8ZHJhcGFzODZAZ21haWwuY29tPg0KQ2M6IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgU2ViZWxldiwgVmxhZGltaXIgPHZsYWRpbWlyLnNlYmVsZXZAYXVyaWdhLmNv
bT47IERyYXAsIEFudG9uIDxhbnRvbi5kcmFwQGF1cmlnYS5jb20+OyBEYW5pZWwgUC4gQmVycmFu
Z2UgPGJlcnJhbmdlQHJlZGhhdC5jb20+OyBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhh
dC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBMb2FkaW5nIG5ldyBtYWNoaW5lcyBhbmQg
ZGV2aWNlcyBmcm9tIGV4dGVybmFsIG1vZHVsZXMNCg0KT24gTW9uLCAyMiBBdWcgMjAyMiBhdCAw
OTo1MywgRHJhcCBBbnRvbiA8ZHJhcGFzODZAZ21haWwuY29tPiB3cm90ZToNCj4NCj4gRnJvbTog
IkRyYXAsIEFudG9uIiA8YW50b24uZHJhcEBhdXJpZ2EuY29tPg0KDQo+ICAgICBUaGlzIHBhdGNo
IGlzIHRvIGFkZCB0d28gcGFyYW1ldGVycyBgYWRkX21hY2hpbmVgIGFuZCBgYWRkX21vZGluZm9g
Lg0KPiBgYWRkX21hY2hpbmVgIGlzIHRvIGFkZCBtYWNoaW5lcyBmcm9tIGV4dGVybmFsIG1vZHVs
ZXMuDQo+IGBhZGRfbW9kaW5mb2AgaXMgdG8gYWRkIGRldmljZXMgZnJvbSBleHRlcm5hbCBtb2R1
bGVzLCBuZWVkZWQgZm9yIGEgDQo+IG5ldyBtYWNoaW5lLCBmb3IgZXhhbXBsZS4NCj4gQWRkaXRp
b25hbCwgJ2FyY2gnIHBhcmFtZXRlciBvZiBRZW11TW9kaW5mbyBpcyBjaGFuZ2VkIHRvIGEgbGlz
dC4NCg0KSSBkb24ndCB0aGluayB0aGVyZSdzIG11Y2ggcG9pbnQgaW4geW91ciBjb250aW51aW5n
IHRvIHBvc3QgdmVyc2lvbnMgb2YgdGhpcyBwYXRjaHNldCwgYmVjYXVzZSB0aGUgYW5zd2VyIHJl
bWFpbnMgIndlIGRvbid0IHdhbnQgdG8gZG8gdGhpcywgYXMgYSBwb2xpY3kgYW5kIGRlc2lnbiBk
ZWNpc2lvbiIuIFVudGlsIGFuZCB1bmxlc3MgeW91IHBlcnN1YWRlIHVzIHRoYXQgaXQncyBhIGdv
b2QgaWRlYSB0byBjaGFuZ2UgdGhhdCBkZWNpc2lvbiwgdGltZSBzcGVudCBvbiBjb2RlIGNoYW5n
ZXMgZG9lc24ndCBzZWVtIGxpa2UgYSBnb29kIHVzZSBvZiBlZmZvcnQgdG8gbWUuDQoNCnRoYW5r
cw0KLS0gUE1NDQo=

