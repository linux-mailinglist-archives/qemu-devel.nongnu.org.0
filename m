Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789685891CD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:53:09 +0200 (CEST)
Received: from localhost ([::1]:53260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJIYO-0003Ic-J0
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJIRH-0004f5-JV; Wed, 03 Aug 2022 13:45:50 -0400
Received: from [200.168.210.66] (port=57580 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJIRC-0001kL-Rs; Wed, 03 Aug 2022 13:45:46 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 3 Aug 2022 14:45:38 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 057878001D1;
 Wed,  3 Aug 2022 14:45:38 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------4OtJXnS3vFx7cjiudmZuzSwn"
Message-ID: <077f61c4-8853-0b32-b9b2-9721bcf107cb@eldorado.org.br>
Date: Wed, 3 Aug 2022 14:45:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 1/3] target/ppc: Bugfix fadd/fsub result with OE/UE set
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
Cc: danielhb413@gmail.com, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220803122217.20847-1-lucas.araujo@eldorado.org.br>
 <20220803122217.20847-2-lucas.araujo@eldorado.org.br>
 <855034e1-2dd3-4b68-3c60-9fd2345b3b55@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <855034e1-2dd3-4b68-3c60-9fd2345b3b55@linaro.org>
X-OriginalArrivalTime: 03 Aug 2022 17:45:38.0235 (UTC)
 FILETIME=[D78B28B0:01D8A760]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This is a multi-part message in MIME format.
--------------4OtJXnS3vFx7cjiudmZuzSwn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAwMy8wOC8yMDIyIDEzOjE4LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4NCj4g
T24gOC8zLzIyIDA1OjIyLCBMdWNhcyBNYXRldXMgQ2FzdHJvKGFscW90ZWwpIHdyb3RlOg0K
Pj4gRnJvbTogIkx1Y2FzIE1hdGV1cyBDYXN0cm8gKGFscW90ZWwpIiA8bHVjYXMuYXJhdWpv
QGVsZG9yYWRvLm9yZy5icj4NCj4+DQo+PiBBcyBtZW50aW9uZWQgaW4gdGhlIGZ1bmN0aW9u
cyBmbG9hdF9vdmVyZmxvd19leGNwIGFuZA0KPj4gZmxvYXRfdW5kZXJmbG93X2V4Y3AsIHRo
ZSByZXN1bHQgc2hvdWxkIGJlIGFkanVzdGVkIGFzIG1lbnRpb25lZCBpbiB0aGUNCj4+IElT
QSAoc3VidHJhY3RlZCAxOTIvMTUzNiBmcm9tIHRoZSBleHBvbmVudCBvZiB0aGUgaW50ZXJt
ZWRpYXRlIHJlc3VsdCBpZg0KPj4gYW4gb3ZlcmZsb3cgb2NjdXJzIHdpdGggT0Ugc2V0IGFu
ZCBhZGRlZCAxOTIvMTUzNiB0byB0aGUgZXhwb25lbnQgb2YgdGhlDQo+PiBpbnRlcm1lZGlh
dGUgcmVzdWx0IGlmIGFuIHVuZGVyZmxvdyBvY2N1cnMgd2l0aCBVRSBzZXQpLCBidXQgYXQg
dGhvc2UNCj4+IGZ1bmN0aW9ucyB0aGUgcmVzdWx0IGhhcyBhbHJlYWR5IGJlZW4gcm91bmRl
ZCBzbyBpdCBpcyBub3QgcG9zc2libGUgdG8NCj4+IGFkZC9zdWJ0cmFjdCBmcm9tIHRoZSBp
bnRlcm1lZGlhdGUgcmVzdWx0IGFueW1vcmUuDQo+Pg0KPj4gVGhpcyBwYXRjaCBjcmVhdGVz
IGEgbmV3IGZ1bmN0aW9uIHRoYXQgcmVjZWl2ZXMgdGhlIHZhbHVlIHRoYXQgc2hvdWxkIGJl
DQo+PiBzdWJ0cmFjdGVkL2FkZGVkIGZyb20gdGhlIGV4cG9uZW50IGlmIGFuIG92ZXJmbG93
L3VuZGVyZmxvdyBoYXBwZW5zLCB0bw0KPj4gbm90IGxlYXZlIHNvbWUgYXJiaXRyYXJ5IG51
bWJlcnMgZnJvbSB0aGUgUG93ZXJJU0EgaW4gdGhlIG1pZGRsZSBvZiB0aGUNCj4+IEZQVSBj
b2RlLiBJZiB0aGVzZSBudW1iZXJzIGFyZSAwIHRoZSBuZXcgZnVuY3Rpb25zIGp1c3QgY2Fs
bCB0aGUgb2xkDQo+PiBvbmVzLg0KPj4NCj4+IEkgdXNlZCAyIHZhbHVlcyBoZXJlIGZvciBv
dmVyZmxvdyBhbmQgdW5kZXJmbG93LCBtYXliZSBpdCdkIGJlIGJldHRlciB0bw0KPj4ganVz
dCB1c2UgdGhlIHNhbWUgb25lcywgYW55IHRob3VnaHRzPw0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IEx1Y2FzIE1hdGV1cyBDYXN0cm8gKGFscW90ZWwpIA0KPj4gPGx1Y2FzLmFyYXVqb0Bl
bGRvcmFkby5vcmcuYnI+DQo+PiAtLS0NCj4+IEFuIGFsdGVybmF0aXZlIEkndmUgdGhvdWdo
dCB3YXMgdG8gYWx3YXlzIHJldHVybiB0aGUgdmFsdWUgYWRqdXN0ZWQgaWYgYQ0KPj4gb3Zl
cmZsb3cgb3IgdW5kZXJmbG93IG9jY3VycyBhbmQgaW4gZmxvYXRfdW5kZXJmbG93X2V4Y3Ag
YW5kDQo+PiBmbG9hdF9vdmVyZmxvd19leGNwIGFkanVzdCBpdCB0byBpbmYvZGVuLzAgaWYg
T0UvVUUgaXMgMCwgYnV0IEkgZGlkbid0DQo+PiBzYXcgbWFueSBhZHZhbnRhZ2VzIHRvIHRo
YXQgYXBwcm9hY2guDQo+PiAtLS0NCj4+IMKgIGZwdS9zb2Z0ZmxvYXQuY8KgwqDCoMKgwqDC
oMKgwqAgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4gwqAgaW5jbHVkZS9mcHUvc29mdGZsb2F0LmggfMKgIDIgKysNCj4+IMKgIHRhcmdldC9w
cGMvZnB1X2hlbHBlci5jIHwgMTAgKysrKy0tDQo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDg1
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Zw
dS9zb2Z0ZmxvYXQuYyBiL2ZwdS9zb2Z0ZmxvYXQuYw0KPj4gaW5kZXggNGE4NzFlZjJhMS4u
YTQwNzEyOWRjYiAxMDA2NDQNCj4+IC0tLSBhL2ZwdS9zb2Z0ZmxvYXQuYw0KPj4gKysrIGIv
ZnB1L3NvZnRmbG9hdC5jDQo+PiBAQCAtMjY4LDYgKzI2OCw4IEBAIHR5cGVkZWYgYm9vbCAo
KmY2NF9jaGVja19mbikodW5pb25fZmxvYXQ2NCBhLCANCj4+IHVuaW9uX2Zsb2F0NjQgYik7
DQo+Pg0KPj4gwqAgdHlwZWRlZiBmbG9hdDMyICgqc29mdF9mMzJfb3AyX2ZuKShmbG9hdDMy
IGEsIGZsb2F0MzIgYiwgDQo+PiBmbG9hdF9zdGF0dXMgKnMpOw0KPj4gwqAgdHlwZWRlZiBm
bG9hdDY0ICgqc29mdF9mNjRfb3AyX2ZuKShmbG9hdDY0IGEsIGZsb2F0NjQgYiwgDQo+PiBm
bG9hdF9zdGF0dXMgKnMpOw0KPj4gK3R5cGVkZWYgZmxvYXQ2NCAoKnNvZnRfZjY0X29wMl9p
bnQyX2ZuKShmbG9hdDY0IGEsIGZsb2F0NjQgYiwgaW50IGMsIA0KPj4gaW50IGQsDQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZsb2F0X3N0YXR1cyAqcyk7DQo+PiDCoCB0eXBl
ZGVmIGZsb2F0wqDCoCAoKmhhcmRfZjMyX29wMl9mbikoZmxvYXQgYSwgZmxvYXQgYik7DQo+
PiDCoCB0eXBlZGVmIGRvdWJsZcKgICgqaGFyZF9mNjRfb3AyX2ZuKShkb3VibGUgYSwgZG91
YmxlIGIpOw0KPj4NCj4+IEBAIC00MDEsNiArNDAzLDE5IEBAIGZsb2F0NjRfZ2VuMihmbG9h
dDY0IHhhLCBmbG9hdDY0IHhiLCANCj4+IGZsb2F0X3N0YXR1cyAqcywNCj4+IMKgwqDCoMKg
wqAgcmV0dXJuIHNvZnQodWEucywgdWIucywgcyk7DQo+PiDCoCB9DQo+Pg0KPj4gK3N0YXRp
YyBpbmxpbmUgZmxvYXQ2NA0KPj4gK2Zsb2F0NjRfZ2VuMl9leGNwKGZsb2F0NjQgeGEsIGZs
b2F0NjQgeGIsIGludCB4YywgaW50IHhkLCANCj4+IGZsb2F0X3N0YXR1cyAqcywNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhhcmRfZjY0X29wMl9mbiBoYXJk
LCBzb2Z0X2Y2NF9vcDJfZm4gc29mdCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHNvZnRfZjY0X29wMl9pbnQyX2ZuIHNvZnRfZXhjcCwgZjY0X2NoZWNrX2Zu
IHByZSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGY2NF9jaGVj
a19mbiBwb3N0KQ0KPj4gK3sNCj4+ICvCoMKgwqAgaWYgKHhjIHx8IHhkKSB7DQo+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHNvZnRfZXhjcCh4YSwgeGIsIHhjLCB4ZCwgcyk7DQo+PiAr
wqDCoMKgIH0gZWxzZSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZsb2F0NjRfZ2Vu
Mih4YSwgeGIsIHMsIGhhcmQsIHNvZnQsIHByZSwgcG9zdCk7DQo+PiArwqDCoMKgIH0NCj4+
ICt9DQo+PiArDQo+PiDCoCAvKg0KPj4gwqDCoCAqIENsYXNzaWZ5IGEgZmxvYXRpbmcgcG9p
bnQgbnVtYmVyLiBFdmVyeXRoaW5nIGFib3ZlIGZsb2F0X2NsYXNzX3FuYW4NCj4+IMKgwqAg
KiBpcyBhIE5hTiBzbyBjbHMgPj0gZmxvYXRfY2xhc3NfcW5hbiBpcyBhbnkgTmFOLg0KPj4g
QEAgLTE5MjksNiArMTk0NCwzOSBAQCBzdGF0aWMgZG91YmxlIGhhcmRfZjY0X3N1Yihkb3Vi
bGUgYSwgZG91YmxlIGIpDQo+PiDCoMKgwqDCoMKgIHJldHVybiBhIC0gYjsNCj4+IMKgIH0N
Cj4+DQo+PiArc3RhdGljIGZsb2F0NjQgUUVNVV9TT0ZURkxPQVRfQVRUUg0KPj4gK3NvZnRf
ZjY0X2FkZHN1Yl9leGNwX2VuKGZsb2F0NjQgYSwgZmxvYXQ2NCBiLCBpbnQgb2Vfc3ViLCBp
bnQgdWVfc3VtLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZmxvYXRfc3RhdHVzICpzdGF0dXMsIGJvb2wgc3VidHJhY3QpDQo+PiArew0K
Pj4gK8KgwqDCoCBGbG9hdFBhcnRzNjQgcGEsIHBiLCAqcHI7DQo+PiArDQo+PiArwqDCoMKg
IGZsb2F0NjRfdW5wYWNrX2Nhbm9uaWNhbCgmcGEsIGEsIHN0YXR1cyk7DQo+PiArwqDCoMKg
IGZsb2F0NjRfdW5wYWNrX2Nhbm9uaWNhbCgmcGIsIGIsIHN0YXR1cyk7DQo+PiArwqDCoMKg
IHByID0gcGFydHNfYWRkc3ViKCZwYSwgJnBiLCBzdGF0dXMsIHN1YnRyYWN0KTsNCj4+ICsN
Cj4+ICvCoMKgwqAgaWYgKHVubGlrZWx5KG9lX3N1YiAmJiAocHItPmV4cCA+IDEwMjMpKSkg
ew0KPj4gK8KgwqDCoMKgwqDCoMKgIHByLT5leHAgLT0gb2Vfc3ViOw0KPj4gK8KgwqDCoMKg
wqDCoMKgIGZsb2F0X3JhaXNlKGZsb2F0X2ZsYWdfb3ZlcmZsb3csIHN0YXR1cyk7DQo+PiAr
wqDCoMKgIH0gZWxzZSBpZiAodW5saWtlbHkodWVfc3VtICYmIChwci0+ZXhwIDwgLTEwMjIp
KSkgew0KPj4gK8KgwqDCoMKgwqDCoMKgIHByLT5leHAgKz0gdWVfc3VtOw0KPj4gK8KgwqDC
oMKgwqDCoMKgIGZsb2F0X3JhaXNlKGZsb2F0X2ZsYWdfdW5kZXJmbG93LCBzdGF0dXMpOw0K
Pj4gK8KgwqDCoCB9DQo+PiArDQo+PiArwqDCoMKgIHJldHVybiBmbG9hdDY0X3JvdW5kX3Bh
Y2tfY2Fub25pY2FsKHByLCBzdGF0dXMpOw0KPg0KPiBUaGlzIGlzIGluY29ycmVjdCwgYmVj
YXVzZSB0aGUgZXhwb25lbnQgaXMgbm90IGZpeGVkIHVudGlsIHRoZSBtaWRkbGUgDQo+IG9m
IHJvdW5kX3BhY2tfY2Fub25pY2FsLg0KPg0KPiBJIHRoaW5rIHlvdSBzaG91bGQgbm90IGFk
ZCBuZXcgZnVuY3Rpb25zIGxpa2UgdGhpcywgd2l0aCBuZXcgDQo+IHBhcmFtZXRlcnMsIGJ1
dCBpbnN0ZWFkIGFkZA0KPiBmaWVsZHMgdG8gZmxvYXRfc3RhdHVzLCB3aGljaCB3b3VsZCB0
aGVuIGJlIGNoZWNrZWQgYXQgdGhlIHBsYWNlcyANCj4gY3VycmVudGx5IHNldHRpbmcNCj4g
dW5kZXJmbG93IGFuZCBvdmVyZmxvdy4NCg0KU28gYWRkIG92ZXJmbG93X2NvcnJlY3Rpb24g
YW5kIHVuZGVyZmxvd19jb3JyZWN0aW9uIGluIA0KJ3BhcnRzTih1bmNhbm9uX25vcm1hbCkn
IHNvIHRoYXQ6DQoNCmlmIChleHAgPj0gZXhwX21heCkgew0KIMKgwqDCoCBpZiAob3ZlcmZs
b3dfY29ycmVjdGlvbiAhPSAwKSB7DQogwqDCoMKgIMKgwqDCoCBleHAgLT0gb3ZlcmZsb3df
Y29ycmVjdGlvbjsNCiDCoMKgwqAgfQ0KfQ0KDQpBbmQgdGhlIGVxdWl2YWxlbnQgZm9yIHVu
ZGVyZmxvdywgb3IgYSBib29sIHBwY19vdmVyZmxvd19lbmFibGUgdGhhdCANCnVzZXMgYSBm
aXhlZCB2YWx1ZSBsaWtlOg0KDQppZiAoZXhwID49IGV4cF9tYXgpIHsNCiDCoMKgwqAgaWYg
KHBwY19vdmVyZmxvd19lbmFibGUpIHsNCiDCoMKgwqAgwqDCoMKgIGV4cCAtPSAoKGZtdC0+
ZXhwX2JpYXMgKyAxKSArIChmbXQtPmV4cF9iaWFzICsgMSkvMik7DQogwqDCoMKgIH0NCn0N
Cg0KKGFuZCB0aGUgZXF1aXZhbGVudCBmb3IgdW5kZXJmbG93KSA/DQoNCj4NCj4NCj4gcn4N
Ci0tIA0KTHVjYXMgTWF0ZXVzIE0uIEFyYXVqbyBlIENhc3Rybw0KSW5zdGl0dXRvIGRlIFBl
c3F1aXNhcyBFTERPUkFETyANCjxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvP3V0bV9j
YW1wYWlnbj1hc3NpbmF0dXJhX2RlX2UtbWFpbCZ1dG1fbWVkaXVtPWVtYWlsJnV0bV9zb3Vy
Y2U9UkQrU3RhdGlvbj4NCkRlcGFydGFtZW50byBDb21wdXRhw6fDo28gRW1iYXJjYWRhDQpB
bmFsaXN0YSBkZSBTb2Z0d2FyZSBUcmFpbmVlDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIg
PGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=
--------------4OtJXnS3vFx7cjiudmZuzSwn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 03/08/2022 13:18, Richard Henderson=

      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:855034e1-2dd3-4b68-3c60-9fd2345b3b55@linaro.org"><br>
      On 8/3/22 05:22, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <blockquote type=3D"cite">From: "Lucas Mateus Castro (alqotel)"
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lucas.araujo@el=
dorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
        <br>
        <br>
        As mentioned in the functions float_overflow_excp and
        <br>
        float_underflow_excp, the result should be adjusted as mentioned
        in the
        <br>
        ISA (subtracted 192/1536 from the exponent of the intermediate
        result if
        <br>
        an overflow occurs with OE set and added 192/1536 to the
        exponent of the
        <br>
        intermediate result if an underflow occurs with UE set), but at
        those
        <br>
        functions the result has already been rounded so it is not
        possible to
        <br>
        add/subtract from the intermediate result anymore.
        <br>
        <br>
        This patch creates a new function that receives the value that
        should be
        <br>
        subtracted/added from the exponent if an overflow/underflow
        happens, to
        <br>
        not leave some arbitrary numbers from the PowerISA in the middle
        of the
        <br>
        FPU code. If these numbers are 0 the new functions just call the
        old
        <br>
        ones.
        <br>
        <br>
        I used 2 values here for overflow and underflow, maybe it'd be
        better to
        <br>
        just use the same ones, any thoughts?
        <br>
        <br>
        Signed-off-by: Lucas Mateus Castro (alqotel)
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lucas.araujo@el=
dorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
        <br>
        ---
        <br>
        An alternative I've thought was to always return the value
        adjusted if a
        <br>
        overflow or underflow occurs and in float_underflow_excp and
        <br>
        float_overflow_excp adjust it to inf/den/0 if OE/UE is 0, but I
        didn't
        <br>
        saw many advantages to that approach.
        <br>
        ---
        <br>
        =C2=A0 fpu/softfloat.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 75
        +++++++++++++++++++++++++++++++++++++++++
        <br>
        =C2=A0 include/fpu/softfloat.h |=C2=A0 2 ++
        <br>
        =C2=A0 target/ppc/fpu_helper.c | 10 ++++--
        <br>
        =C2=A0 3 files changed, 85 insertions(+), 2 deletions(-)
        <br>
        <br>
        diff --git a/fpu/softfloat.c b/fpu/softfloat.c
        <br>
        index 4a871ef2a1..a407129dcb 100644
        <br>
        --- a/fpu/softfloat.c
        <br>
        +++ b/fpu/softfloat.c
        <br>
        @@ -268,6 +268,8 @@ typedef bool (*f64_check_fn)(union_float64
        a, union_float64 b);
        <br>
        <br>
        =C2=A0 typedef float32 (*soft_f32_op2_fn)(float32 a, float32 b,
        float_status *s);
        <br>
        =C2=A0 typedef float64 (*soft_f64_op2_fn)(float64 a, float64 b,
        float_status *s);
        <br>
        +typedef float64 (*soft_f64_op2_int2_fn)(float64 a, float64 b,
        int c, int d,
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 float_status *s);
        <br>
        =C2=A0 typedef float=C2=A0=C2=A0 (*hard_f32_op2_fn)(float a, floa=
t b);
        <br>
        =C2=A0 typedef double=C2=A0 (*hard_f64_op2_fn)(double a, double b=
);
        <br>
        <br>
        @@ -401,6 +403,19 @@ float64_gen2(float64 xa, float64 xb,
        float_status *s,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return soft(ua.s, ub.s, s);
        <br>
        =C2=A0 }
        <br>
        <br>
        +static inline float64
        <br>
        +float64_gen2_excp(float64 xa, float64 xb, int xc, int xd,
        float_status *s,
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hard_f64_op2_fn hard, soft_f64_op2_f=
n soft,
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soft_f64_op2_int2_fn soft_excp, f64_=
check_fn
        pre,
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f64_check_fn post)
        <br>
        +{
        <br>
        +=C2=A0=C2=A0=C2=A0 if (xc || xd) {
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return soft_excp(xa, =
xb, xc, xd, s);
        <br>
        +=C2=A0=C2=A0=C2=A0 } else {
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return float64_gen2(x=
a, xb, s, hard, soft, pre, post);
        <br>
        +=C2=A0=C2=A0=C2=A0 }
        <br>
        +}
        <br>
        +
        <br>
        =C2=A0 /*
        <br>
        =C2=A0=C2=A0 * Classify a floating point number. Everything above=

        float_class_qnan
        <br>
        =C2=A0=C2=A0 * is a NaN so cls &gt;=3D float_class_qnan is any Na=
N.
        <br>
        @@ -1929,6 +1944,39 @@ static double hard_f64_sub(double a,
        double b)
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return a - b;
        <br>
        =C2=A0 }
        <br>
        <br>
        +static float64 QEMU_SOFTFLOAT_ATTR
        <br>
        +soft_f64_addsub_excp_en(float64 a, float64 b, int oe_sub, int
        ue_sum,
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
float_status *status, bool subtract)
        <br>
        +{
        <br>
        +=C2=A0=C2=A0=C2=A0 FloatParts64 pa, pb, *pr;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 float64_unpack_canonical(&amp;pa, a, status);=

        <br>
        +=C2=A0=C2=A0=C2=A0 float64_unpack_canonical(&amp;pb, b, status);=

        <br>
        +=C2=A0=C2=A0=C2=A0 pr =3D parts_addsub(&amp;pa, &amp;pb, status,=
 subtract);
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 if (unlikely(oe_sub &amp;&amp; (pr-&gt;exp &g=
t; 1023))) {
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr-&gt;exp -=3D oe_su=
b;
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 float_raise(float_fla=
g_overflow, status);
        <br>
        +=C2=A0=C2=A0=C2=A0 } else if (unlikely(ue_sum &amp;&amp; (pr-&gt=
;exp &lt;
        -1022))) {
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr-&gt;exp +=3D ue_su=
m;
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 float_raise(float_fla=
g_underflow, status);
        <br>
        +=C2=A0=C2=A0=C2=A0 }
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 return float64_round_pack_canonical(pr, statu=
s);
        <br>
      </blockquote>
      <br>
      This is incorrect, because the exponent is not fixed until the
      middle of round_pack_canonical.
      <br>
      <br>
      I think you should not add new functions like this, with new
      parameters, but instead add
      <br>
      fields to float_status, which would then be checked at the places
      currently setting
      <br>
      underflow and overflow.
      <br>
    </blockquote>
    <p>So add overflow_correction and underflow_correction in
      'partsN(uncanon_normal)' so that:</p>
    if (exp &gt;=3D exp_max) {<br>
    =C2=A0=C2=A0=C2=A0 if (overflow_correction !=3D 0) {<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 exp -=3D overflow_correction;<b=
r>
    =C2=A0=C2=A0=C2=A0 }<br>
    }
    <p>And the equivalent for underflow, or a bool ppc_overflow_enable
      that uses a fixed value like:</p>
    <p>if (exp &gt;=3D exp_max) {<br>
      =C2=A0=C2=A0=C2=A0 if (ppc_overflow_enable) {<br>
      =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 exp -=3D ((fmt-&gt;exp_bias +=
 1) + (fmt-&gt;exp_bias +
      1)/2);<br>
      =C2=A0=C2=A0=C2=A0 }<br>
      } <br>
    </p>
    <p>(and the equivalent for underflow) ?<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:855034e1-2dd3-4b68-3c60-9fd2345b3b55@linaro.org">
      <br>
      <br>
      r~
      <br>
    </blockquote>
    <div class=3D"moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href=3D"https://www.eldorado.org.br/?utm_campaign=3Dassinatura_de_e-mail&=
amp;utm_medium=3Demail&amp;utm_source=3DRD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computa=C3=A7=C3=A3o Embarcada<br>
      Analista de Software Trainee<br>
      <a href=3D"https://www.eldorado.org.br/disclaimer.html">Aviso Legal=

        - Disclaimer</a></div>
  </body>
</html>

--------------4OtJXnS3vFx7cjiudmZuzSwn--

