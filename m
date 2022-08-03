Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45FA589262
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 20:48:02 +0200 (CEST)
Received: from localhost ([::1]:48288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJJPU-00068z-Ux
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 14:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJJKG-0003X8-78; Wed, 03 Aug 2022 14:42:37 -0400
Received: from [200.168.210.66] (port=48717 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJJKC-0005hA-JY; Wed, 03 Aug 2022 14:42:34 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 3 Aug 2022 15:42:28 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id AC3E38001D1;
 Wed,  3 Aug 2022 15:42:27 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------2NKEAH542shBJedS9fF9ixOC"
Message-ID: <59494d8e-1ef5-0c0c-0cf4-38a4e55c3366@eldorado.org.br>
Date: Wed, 3 Aug 2022 15:42:27 -0300
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
 <077f61c4-8853-0b32-b9b2-9721bcf107cb@eldorado.org.br>
 <8857690e-2e0c-a67b-f654-972ac5b24e48@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <8857690e-2e0c-a67b-f654-972ac5b24e48@linaro.org>
X-OriginalArrivalTime: 03 Aug 2022 18:42:28.0002 (UTC)
 FILETIME=[C7EC5020:01D8A768]
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
--------------2NKEAH542shBJedS9fF9ixOC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAwMy8wOC8yMDIyIDE1OjE2LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4NCj4g
T24gOC8zLzIyIDEwOjQ1LCBMdWNhcyBNYXRldXMgTWFydGlucyBBcmF1am8gZSBDYXN0cm8g
d3JvdGU6DQo+Pg0KPj4gT24gMDMvMDgvMjAyMiAxMzoxOCwgUmljaGFyZCBIZW5kZXJzb24g
d3JvdGU6DQo+Pj4NCj4+PiBPbiA4LzMvMjIgMDU6MjIsIEx1Y2FzIE1hdGV1cyBDYXN0cm8o
YWxxb3RlbCkgd3JvdGU6DQo+Pj4+IEZyb206ICJMdWNhcyBNYXRldXMgQ2FzdHJvIChhbHFv
dGVsKSIgPGx1Y2FzLmFyYXVqb0BlbGRvcmFkby5vcmcuYnI+DQo+Pj4+DQo+Pj4+IEFzIG1l
bnRpb25lZCBpbiB0aGUgZnVuY3Rpb25zIGZsb2F0X292ZXJmbG93X2V4Y3AgYW5kDQo+Pj4+
IGZsb2F0X3VuZGVyZmxvd19leGNwLCB0aGUgcmVzdWx0IHNob3VsZCBiZSBhZGp1c3RlZCBh
cyBtZW50aW9uZWQgaW4gDQo+Pj4+IHRoZQ0KPj4+PiBJU0EgKHN1YnRyYWN0ZWQgMTkyLzE1
MzYgZnJvbSB0aGUgZXhwb25lbnQgb2YgdGhlIGludGVybWVkaWF0ZSANCj4+Pj4gcmVzdWx0
IGlmDQo+Pj4+IGFuIG92ZXJmbG93IG9jY3VycyB3aXRoIE9FIHNldCBhbmQgYWRkZWQgMTky
LzE1MzYgdG8gdGhlIGV4cG9uZW50IA0KPj4+PiBvZiB0aGUNCj4+Pj4gaW50ZXJtZWRpYXRl
IHJlc3VsdCBpZiBhbiB1bmRlcmZsb3cgb2NjdXJzIHdpdGggVUUgc2V0KSwgYnV0IGF0IHRo
b3NlDQo+Pj4+IGZ1bmN0aW9ucyB0aGUgcmVzdWx0IGhhcyBhbHJlYWR5IGJlZW4gcm91bmRl
ZCBzbyBpdCBpcyBub3QgcG9zc2libGUgdG8NCj4+Pj4gYWRkL3N1YnRyYWN0IGZyb20gdGhl
IGludGVybWVkaWF0ZSByZXN1bHQgYW55bW9yZS4NCj4+Pj4NCj4+Pj4gVGhpcyBwYXRjaCBj
cmVhdGVzIGEgbmV3IGZ1bmN0aW9uIHRoYXQgcmVjZWl2ZXMgdGhlIHZhbHVlIHRoYXQgDQo+
Pj4+IHNob3VsZCBiZQ0KPj4+PiBzdWJ0cmFjdGVkL2FkZGVkIGZyb20gdGhlIGV4cG9uZW50
IGlmIGFuIG92ZXJmbG93L3VuZGVyZmxvdyANCj4+Pj4gaGFwcGVucywgdG8NCj4+Pj4gbm90
IGxlYXZlIHNvbWUgYXJiaXRyYXJ5IG51bWJlcnMgZnJvbSB0aGUgUG93ZXJJU0EgaW4gdGhl
IG1pZGRsZSBvZiANCj4+Pj4gdGhlDQo+Pj4+IEZQVSBjb2RlLiBJZiB0aGVzZSBudW1iZXJz
IGFyZSAwIHRoZSBuZXcgZnVuY3Rpb25zIGp1c3QgY2FsbCB0aGUgb2xkDQo+Pj4+IG9uZXMu
DQo+Pj4+DQo+Pj4+IEkgdXNlZCAyIHZhbHVlcyBoZXJlIGZvciBvdmVyZmxvdyBhbmQgdW5k
ZXJmbG93LCBtYXliZSBpdCdkIGJlIA0KPj4+PiBiZXR0ZXIgdG8NCj4+Pj4ganVzdCB1c2Ug
dGhlIHNhbWUgb25lcywgYW55IHRob3VnaHRzPw0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBMdWNhcyBNYXRldXMgQ2FzdHJvIChhbHFvdGVsKSANCj4+Pj4gPGx1Y2FzLmFyYXVqb0Bl
bGRvcmFkby5vcmcuYnI+DQo+Pj4+IC0tLQ0KPj4+PiBBbiBhbHRlcm5hdGl2ZSBJJ3ZlIHRo
b3VnaHQgd2FzIHRvIGFsd2F5cyByZXR1cm4gdGhlIHZhbHVlIGFkanVzdGVkIA0KPj4+PiBp
ZiBhDQo+Pj4+IG92ZXJmbG93IG9yIHVuZGVyZmxvdyBvY2N1cnMgYW5kIGluIGZsb2F0X3Vu
ZGVyZmxvd19leGNwIGFuZA0KPj4+PiBmbG9hdF9vdmVyZmxvd19leGNwIGFkanVzdCBpdCB0
byBpbmYvZGVuLzAgaWYgT0UvVUUgaXMgMCwgYnV0IEkgZGlkbid0DQo+Pj4+IHNhdyBtYW55
IGFkdmFudGFnZXMgdG8gdGhhdCBhcHByb2FjaC4NCj4+Pj4gLS0tDQo+Pj4+IMKgIGZwdS9z
b2Z0ZmxvYXQuY8KgwqDCoMKgwqDCoMKgwqAgfCA3NSANCj4+Pj4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4gwqAgaW5jbHVkZS9mcHUvc29mdGZs
b2F0LmggfMKgIDIgKysNCj4+Pj4gwqAgdGFyZ2V0L3BwYy9mcHVfaGVscGVyLmMgfCAxMCAr
KysrLS0NCj4+Pj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZnB1L3NvZnRmbG9hdC5jIGIv
ZnB1L3NvZnRmbG9hdC5jDQo+Pj4+IGluZGV4IDRhODcxZWYyYTEuLmE0MDcxMjlkY2IgMTAw
NjQ0DQo+Pj4+IC0tLSBhL2ZwdS9zb2Z0ZmxvYXQuYw0KPj4+PiArKysgYi9mcHUvc29mdGZs
b2F0LmMNCj4+Pj4gQEAgLTI2OCw2ICsyNjgsOCBAQCB0eXBlZGVmIGJvb2wgKCpmNjRfY2hl
Y2tfZm4pKHVuaW9uX2Zsb2F0NjQgYSwgDQo+Pj4+IHVuaW9uX2Zsb2F0NjQgYik7DQo+Pj4+
DQo+Pj4+IMKgIHR5cGVkZWYgZmxvYXQzMiAoKnNvZnRfZjMyX29wMl9mbikoZmxvYXQzMiBh
LCBmbG9hdDMyIGIsIA0KPj4+PiBmbG9hdF9zdGF0dXMgKnMpOw0KPj4+PiDCoCB0eXBlZGVm
IGZsb2F0NjQgKCpzb2Z0X2Y2NF9vcDJfZm4pKGZsb2F0NjQgYSwgZmxvYXQ2NCBiLCANCj4+
Pj4gZmxvYXRfc3RhdHVzICpzKTsNCj4+Pj4gK3R5cGVkZWYgZmxvYXQ2NCAoKnNvZnRfZjY0
X29wMl9pbnQyX2ZuKShmbG9hdDY0IGEsIGZsb2F0NjQgYiwgaW50IA0KPj4+PiBjLCBpbnQg
ZCwNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbG9hdF9zdGF0dXMgKnMpOw0K
Pj4+PiDCoCB0eXBlZGVmIGZsb2F0wqDCoCAoKmhhcmRfZjMyX29wMl9mbikoZmxvYXQgYSwg
ZmxvYXQgYik7DQo+Pj4+IMKgIHR5cGVkZWYgZG91YmxlwqAgKCpoYXJkX2Y2NF9vcDJfZm4p
KGRvdWJsZSBhLCBkb3VibGUgYik7DQo+Pj4+DQo+Pj4+IEBAIC00MDEsNiArNDAzLDE5IEBA
IGZsb2F0NjRfZ2VuMihmbG9hdDY0IHhhLCBmbG9hdDY0IHhiLCANCj4+Pj4gZmxvYXRfc3Rh
dHVzICpzLA0KPj4+PiDCoMKgwqDCoMKgIHJldHVybiBzb2Z0KHVhLnMsIHViLnMsIHMpOw0K
Pj4+PiDCoCB9DQo+Pj4+DQo+Pj4+ICtzdGF0aWMgaW5saW5lIGZsb2F0NjQNCj4+Pj4gK2Zs
b2F0NjRfZ2VuMl9leGNwKGZsb2F0NjQgeGEsIGZsb2F0NjQgeGIsIGludCB4YywgaW50IHhk
LCANCj4+Pj4gZmxvYXRfc3RhdHVzICpzLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBoYXJkX2Y2NF9vcDJfZm4gaGFyZCwgc29mdF9mNjRfb3AyX2ZuIHNv
ZnQsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNvZnRfZjY0
X29wMl9pbnQyX2ZuIHNvZnRfZXhjcCwgZjY0X2NoZWNrX2ZuIHByZSwNCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjY0X2NoZWNrX2ZuIHBvc3QpDQo+Pj4+
ICt7DQo+Pj4+ICvCoMKgwqAgaWYgKHhjIHx8IHhkKSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gc29mdF9leGNwKHhhLCB4YiwgeGMsIHhkLCBzKTsNCj4+Pj4gK8KgwqDCoCB9
IGVsc2Ugew0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZsb2F0NjRfZ2VuMih4YSwg
eGIsIHMsIGhhcmQsIHNvZnQsIHByZSwgcG9zdCk7DQo+Pj4+ICvCoMKgwqAgfQ0KPj4+PiAr
fQ0KPj4+PiArDQo+Pj4+IMKgIC8qDQo+Pj4+IMKgwqAgKiBDbGFzc2lmeSBhIGZsb2F0aW5n
IHBvaW50IG51bWJlci4gRXZlcnl0aGluZyBhYm92ZSANCj4+Pj4gZmxvYXRfY2xhc3NfcW5h
bg0KPj4+PiDCoMKgICogaXMgYSBOYU4gc28gY2xzID49IGZsb2F0X2NsYXNzX3FuYW4gaXMg
YW55IE5hTi4NCj4+Pj4gQEAgLTE5MjksNiArMTk0NCwzOSBAQCBzdGF0aWMgZG91YmxlIGhh
cmRfZjY0X3N1Yihkb3VibGUgYSwgZG91YmxlIGIpDQo+Pj4+IMKgwqDCoMKgwqAgcmV0dXJu
IGEgLSBiOw0KPj4+PiDCoCB9DQo+Pj4+DQo+Pj4+ICtzdGF0aWMgZmxvYXQ2NCBRRU1VX1NP
RlRGTE9BVF9BVFRSDQo+Pj4+ICtzb2Z0X2Y2NF9hZGRzdWJfZXhjcF9lbihmbG9hdDY0IGEs
IGZsb2F0NjQgYiwgaW50IG9lX3N1YiwgaW50IHVlX3N1bSwNCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmxvYXRfc3RhdHVzICpzdGF0
dXMsIGJvb2wgc3VidHJhY3QpDQo+Pj4+ICt7DQo+Pj4+ICvCoMKgwqAgRmxvYXRQYXJ0czY0
IHBhLCBwYiwgKnByOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgZmxvYXQ2NF91bnBhY2tfY2Fu
b25pY2FsKCZwYSwgYSwgc3RhdHVzKTsNCj4+Pj4gK8KgwqDCoCBmbG9hdDY0X3VucGFja19j
YW5vbmljYWwoJnBiLCBiLCBzdGF0dXMpOw0KPj4+PiArwqDCoMKgIHByID0gcGFydHNfYWRk
c3ViKCZwYSwgJnBiLCBzdGF0dXMsIHN1YnRyYWN0KTsNCj4+Pj4gKw0KPj4+PiArwqDCoMKg
IGlmICh1bmxpa2VseShvZV9zdWIgJiYgKHByLT5leHAgPiAxMDIzKSkpIHsNCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHByLT5leHAgLT0gb2Vfc3ViOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAg
ZmxvYXRfcmFpc2UoZmxvYXRfZmxhZ19vdmVyZmxvdywgc3RhdHVzKTsNCj4+Pj4gK8KgwqDC
oCB9IGVsc2UgaWYgKHVubGlrZWx5KHVlX3N1bSAmJiAocHItPmV4cCA8IC0xMDIyKSkpIHsN
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHByLT5leHAgKz0gdWVfc3VtOw0KPj4+PiArwqDCoMKg
wqDCoMKgwqAgZmxvYXRfcmFpc2UoZmxvYXRfZmxhZ191bmRlcmZsb3csIHN0YXR1cyk7DQo+
Pj4+ICvCoMKgwqAgfQ0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgcmV0dXJuIGZsb2F0NjRfcm91
bmRfcGFja19jYW5vbmljYWwocHIsIHN0YXR1cyk7DQo+Pj4NCj4+PiBUaGlzIGlzIGluY29y
cmVjdCwgYmVjYXVzZSB0aGUgZXhwb25lbnQgaXMgbm90IGZpeGVkIHVudGlsIHRoZSANCj4+
PiBtaWRkbGUgb2YNCj4+PiByb3VuZF9wYWNrX2Nhbm9uaWNhbC4NCj4+Pg0KPj4+IEkgdGhp
bmsgeW91IHNob3VsZCBub3QgYWRkIG5ldyBmdW5jdGlvbnMgbGlrZSB0aGlzLCB3aXRoIG5l
dyANCj4+PiBwYXJhbWV0ZXJzLCBidXQgaW5zdGVhZCBhZGQNCj4+PiBmaWVsZHMgdG8gZmxv
YXRfc3RhdHVzLCB3aGljaCB3b3VsZCB0aGVuIGJlIGNoZWNrZWQgYXQgdGhlIHBsYWNlcyAN
Cj4+PiBjdXJyZW50bHkgc2V0dGluZw0KPj4+IHVuZGVyZmxvdyBhbmQgb3ZlcmZsb3cuDQo+
Pg0KPj4gU28gYWRkIG92ZXJmbG93X2NvcnJlY3Rpb24gYW5kIHVuZGVyZmxvd19jb3JyZWN0
aW9uIGluIA0KPj4gJ3BhcnRzTih1bmNhbm9uX25vcm1hbCknIHNvIHRoYXQ6DQo+Pg0KPj4g
aWYgKGV4cCA+PSBleHBfbWF4KSB7DQo+PiDCoMKgwqDCoCBpZiAob3ZlcmZsb3dfY29ycmVj
dGlvbiAhPSAwKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIGV4cCAtPSBvdmVyZmxvd19jb3Jy
ZWN0aW9uOw0KPj4gwqDCoMKgwqAgfQ0KPj4gfQ0KPj4NCj4+IEFuZCB0aGUgZXF1aXZhbGVu
dCBmb3IgdW5kZXJmbG93LCBvciBhIGJvb2wgcHBjX292ZXJmbG93X2VuYWJsZSB0aGF0IA0K
Pj4gdXNlcyBhIGZpeGVkIHZhbHVlIGxpa2U6DQo+Pg0KPj4gaWYgKGV4cCA+PSBleHBfbWF4
KSB7DQo+PiDCoMKgwqDCoCBpZiAocHBjX292ZXJmbG93X2VuYWJsZSkgew0KPj4gwqDCoMKg
wqDCoMKgwqDCoCBleHAgLT0gKChmbXQtPmV4cF9iaWFzICsgMSkgKyAoZm10LT5leHBfYmlh
cyArIDEpLzIpOw0KPj4gwqDCoMKgwqAgfQ0KPj4gfQ0KPj4NCj4+IChhbmQgdGhlIGVxdWl2
YWxlbnQgZm9yIHVuZGVyZmxvdykgPw0KPg0KPiBTb21ldGhpbmcgbGlrZSB0aGF0Lg0KPg0K
PiBJIHdvdWxkIHN1Z2dlc3QgcHJlLWNvbXB1dGluZyB0aGF0IGFkanVzdG1lbnQgaW50byBm
bXQsIHZpYSBGTE9BVF9QQVJBTVMuDQo+IE5hbWluZyBpcyBhbHdheXMgaGFyZCwgYnV0IGhv
dyBhYm91dCBleHBfcmVfYmlhcz8NCj4NCj4gVGhlIGZsYWcocykgc2hvdWxkIG5vdCBjb250
YWluICJwcGMiIGluIHRoZSBuYW1lLsKgIEJ1dCBwZXJoYXBzDQo+DQo+IMKgIHMtPnJlYmlh
c19vdmVyZmxvdw0KPiDCoCBzLT5yZWJpYXNfdW5kZXJmbG93DQoNCnJlYmlhc18qIHNvdW5k
cyBnb29kIHRvIG1lLg0KDQpBbHNvIEkgaW1hZ2luZSB0aGF0IHRoZXNlIGJvb2xzIHdvdWxk
IGJlIHNldCBieSBtdGZzZiwgbXRmc2ZpLCBtdGZzYjAgDQphbmQgbXRmc2IxLCBpbiB3aGlj
aCBjYXNlIGl0J2QgbWFrZSB0aGVzZSBwYXRjaGVzIHNpZ25pZmljYW50bHkgc2hvcnRlci4g
DQpJJ2xsIHNlbmQgYSB2MiB3aXRoIHRoZXNlIGNoYW5nZXMNCg0KPg0KPg0KPg0KPiByfg0K
LS0gDQpMdWNhcyBNYXRldXMgTS4gQXJhdWpvIGUgQ2FzdHJvDQpJbnN0aXR1dG8gZGUgUGVz
cXVpc2FzIEVMRE9SQURPIA0KPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici8/dXRtX2Nh
bXBhaWduPWFzc2luYXR1cmFfZGVfZS1tYWlsJnV0bV9tZWRpdW09ZW1haWwmdXRtX3NvdXJj
ZT1SRCtTdGF0aW9uPg0KRGVwYXJ0YW1lbnRvIENvbXB1dGHDp8OjbyBFbWJhcmNhZGENCkFu
YWxpc3RhIGRlIFNvZnR3YXJlIFRyYWluZWUNCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8
aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==
--------------2NKEAH542shBJedS9fF9ixOC
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
    <div class=3D"moz-cite-prefix">On 03/08/2022 15:16, Richard Henderson=

      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:8857690e-2e0c-a67b-f654-972ac5b24e48@linaro.org"><br>
      On 8/3/22 10:45, Lucas Mateus Martins Araujo e Castro wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        On 03/08/2022 13:18, Richard Henderson wrote:
        <br>
        <blockquote type=3D"cite">
          <br>
          On 8/3/22 05:22, Lucas Mateus Castro(alqotel) wrote:
          <br>
          <blockquote type=3D"cite">From: "Lucas Mateus Castro (alqotel)"=

            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lucas.arauj=
o@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
            <br>
            <br>
            As mentioned in the functions float_overflow_excp and
            <br>
            float_underflow_excp, the result should be adjusted as
            mentioned in the
            <br>
            ISA (subtracted 192/1536 from the exponent of the
            intermediate result if
            <br>
            an overflow occurs with OE set and added 192/1536 to the
            exponent of the
            <br>
            intermediate result if an underflow occurs with UE set), but
            at those
            <br>
            functions the result has already been rounded so it is not
            possible to
            <br>
            add/subtract from the intermediate result anymore.
            <br>
            <br>
            This patch creates a new function that receives the value
            that should be
            <br>
            subtracted/added from the exponent if an overflow/underflow
            happens, to
            <br>
            not leave some arbitrary numbers from the PowerISA in the
            middle of the
            <br>
            FPU code. If these numbers are 0 the new functions just call
            the old
            <br>
            ones.
            <br>
            <br>
            I used 2 values here for overflow and underflow, maybe it'd
            be better to
            <br>
            just use the same ones, any thoughts?
            <br>
            <br>
            Signed-off-by: Lucas Mateus Castro (alqotel)
            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lucas.arauj=
o@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
            <br>
            ---
            <br>
            An alternative I've thought was to always return the value
            adjusted if a
            <br>
            overflow or underflow occurs and in float_underflow_excp and
            <br>
            float_overflow_excp adjust it to inf/den/0 if OE/UE is 0,
            but I didn't
            <br>
            saw many advantages to that approach.
            <br>
            ---
            <br>
            =C2=A0 fpu/softfloat.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 75
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
            @@ -268,6 +268,8 @@ typedef bool
            (*f64_check_fn)(union_float64 a, union_float64 b);
            <br>
            <br>
            =C2=A0 typedef float32 (*soft_f32_op2_fn)(float32 a, float32 =
b,
            float_status *s);
            <br>
            =C2=A0 typedef float64 (*soft_f64_op2_fn)(float64 a, float64 =
b,
            float_status *s);
            <br>
            +typedef float64 (*soft_f64_op2_int2_fn)(float64 a, float64
            b, int c, int d,
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 float_status *s);
            <br>
            =C2=A0 typedef float=C2=A0=C2=A0 (*hard_f32_op2_fn)(float a, =
float b);
            <br>
            =C2=A0 typedef double=C2=A0 (*hard_f64_op2_fn)(double a, doub=
le b);
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
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hard_f64_op2_fn hard, soft_f64=
_op2_fn
            soft,
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soft_f64_op2_int2_fn soft_excp=
,
            f64_check_fn pre,
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f64_check_fn post)
            <br>
            +{
            <br>
            +=C2=A0=C2=A0=C2=A0 if (xc || xd) {
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return soft_excp(=
xa, xb, xc, xd, s);
            <br>
            +=C2=A0=C2=A0=C2=A0 } else {
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return float64_ge=
n2(xa, xb, s, hard, soft, pre,
            post);
            <br>
            +=C2=A0=C2=A0=C2=A0 }
            <br>
            +}
            <br>
            +
            <br>
            =C2=A0 /*
            <br>
            =C2=A0=C2=A0 * Classify a floating point number. Everything a=
bove
            float_class_qnan
            <br>
            =C2=A0=C2=A0 * is a NaN so cls &gt;=3D float_class_qnan is an=
y NaN.
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
            +soft_f64_addsub_excp_en(float64 a, float64 b, int oe_sub,
            int ue_sum,
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 float_status *status, bool
            subtract)
            <br>
            +{
            <br>
            +=C2=A0=C2=A0=C2=A0 FloatParts64 pa, pb, *pr;
            <br>
            +
            <br>
            +=C2=A0=C2=A0=C2=A0 float64_unpack_canonical(&amp;pa, a, stat=
us);
            <br>
            +=C2=A0=C2=A0=C2=A0 float64_unpack_canonical(&amp;pb, b, stat=
us);
            <br>
            +=C2=A0=C2=A0=C2=A0 pr =3D parts_addsub(&amp;pa, &amp;pb, sta=
tus, subtract);
            <br>
            +
            <br>
            +=C2=A0=C2=A0=C2=A0 if (unlikely(oe_sub &amp;&amp; (pr-&gt;ex=
p &gt; 1023)))
            {
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr-&gt;exp -=3D o=
e_sub;
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 float_raise(float=
_flag_overflow, status);
            <br>
            +=C2=A0=C2=A0=C2=A0 } else if (unlikely(ue_sum &amp;&amp; (pr=
-&gt;exp &lt;
            -1022))) {
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr-&gt;exp +=3D u=
e_sum;
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 float_raise(float=
_flag_underflow, status);
            <br>
            +=C2=A0=C2=A0=C2=A0 }
            <br>
            +
            <br>
            +=C2=A0=C2=A0=C2=A0 return float64_round_pack_canonical(pr, s=
tatus);
            <br>
          </blockquote>
          <br>
          This is incorrect, because the exponent is not fixed until the
          middle of
          <br>
          round_pack_canonical.
          <br>
          <br>
          I think you should not add new functions like this, with new
          parameters, but instead add
          <br>
          fields to float_status, which would then be checked at the
          places currently setting
          <br>
          underflow and overflow.
          <br>
        </blockquote>
        <br>
        So add overflow_correction and underflow_correction in
        'partsN(uncanon_normal)' so that:
        <br>
        <br>
        if (exp &gt;=3D exp_max) {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 if (overflow_correction !=3D 0) {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exp -=3D overflo=
w_correction;
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 }
        <br>
        }
        <br>
        <br>
        And the equivalent for underflow, or a bool ppc_overflow_enable
        that uses a fixed value like:
        <br>
        <br>
        if (exp &gt;=3D exp_max) {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 if (ppc_overflow_enable) {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exp -=3D ((fmt-&=
gt;exp_bias + 1) + (fmt-&gt;exp_bias +
        1)/2);
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 }
        <br>
        }
        <br>
        <br>
        (and the equivalent for underflow) ?
        <br>
      </blockquote>
      <br>
      Something like that.
      <br>
      <br>
      I would suggest pre-computing that adjustment into fmt, via
      FLOAT_PARAMS.
      <br>
      Naming is always hard, but how about exp_re_bias?
      <br>
      <br>
      The flag(s) should not contain "ppc" in the name.=C2=A0 But perhaps=

      <br>
      <br>
      =C2=A0 s-&gt;rebias_overflow
      <br>
      =C2=A0 s-&gt;rebias_underflow</blockquote>
    <p>rebias_* sounds good to me.</p>
    <p>Also I imagine that these bools would be set by mtfsf, mtfsfi,
      mtfsb0 and mtfsb1, in which case it'd make these patches
      significantly shorter. I'll send a v2 with these changes<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:8857690e-2e0c-a67b-f654-972ac5b24e48@linaro.org">
      <br>
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

--------------2NKEAH542shBJedS9fF9ixOC--

