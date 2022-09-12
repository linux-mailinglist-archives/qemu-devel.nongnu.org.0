Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EB05B5A15
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 14:24:40 +0200 (CEST)
Received: from localhost ([::1]:48210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXiUO-0000eJ-V0
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 08:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oXiMu-0003vx-Mv; Mon, 12 Sep 2022 08:16:52 -0400
Received: from [200.168.210.66] (port=37017 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oXiMr-0003Sj-VD; Mon, 12 Sep 2022 08:16:51 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 12 Sep 2022 09:16:44 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 1B4B1800172;
 Mon, 12 Sep 2022 09:16:44 -0300 (-03)
Message-ID: <bca67f98-6e3f-20b7-d1b6-8ada0facf16d@eldorado.org.br>
Date: Mon, 12 Sep 2022 09:16:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/8] Patch series to set up a ppc64le CI
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
 <e8609bda-865f-42c8-9234-75b082ca9df0@gmail.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <e8609bda-865f-42c8-9234-75b082ca9df0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 12 Sep 2022 12:16:44.0382 (UTC)
 FILETIME=[85C627E0:01D8C6A1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.153,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCk9uIDA2LzA5LzIwMjIgMTY6NTIsIERhbmllbCBIZW5yaXF1ZSBCYXJib3phIHdyb3Rl
Og0KPiBMdWNhcywNCj4gDQo+IElmIHlvdSdyZSBzdGlsbCBpbnRlcmVzdGVkLCBwYXRjaGVz
IDEtNCBhcmUgd29ydGggcmUtc2VuZGluZyBpbiBzZXBhcmF0ZS4NCj4gWW91J2xsIG5lZWQg
dG8gYWRkcmVzcyBEYW5pZWwncyBjb21tZW50cyBvbiBwYXRjaCAxLiBUaGUgb3RoZXIgMyBw
YXRjaGVzDQo+IExHVE0uDQo+IA0KPiBQYXRjaGVzIDUtOCBjYW4gd2FpdC4gV2UncmUgbm90
IGNlcnRhaW4gYWJvdXQgVW5pY2FtcCdzIE1pbmljbG91ZA0KPiBhdmFpbGFiaWxpdHkgaW4g
dGhlIGZ1dHVyZSwgc28gdGhlcmUncyBubyBwb2ludCBpbiBzZXR0aW5nIHVwIG91ciBDSQ0K
PiBiYXNlZCBvbiBNaW5pY2xvdWQncyBzcGVjaWZpY3MuDQpPaywgYWxzbyBwYXRjaCA4IG5l
ZWRzIGEgZGlmZmVyZW50IGFwcHJvYWNoIGFzIHBvaW50ZWQgYnkgUGhpbGlwcGUgYW5kIA0K
RGFuaWVsLg0KSSdsbCBwcm9iYWJseSByZXNlbmQgMS00IHdpdGggdGhlIGZpeCBvbiBwYXRj
aCAxIHRvbW9ycm93Lg0KPiANCj4gDQo+IFRoYW5rcywNCj4gDQo+IERhbmllbA0KPiANCj4g
T24gNy8yNy8yMiAxMzozNiwgTHVjYXMgTWF0ZXVzIENhc3RybyhhbHFvdGVsKSB3cm90ZToN
Cj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbSB0byBtYWtlIGVhc2llciB0byBzZXQgdXAgYSBj
b21waWxhdGlvbiBhbmQgQ0kNCj4+IGVudmlyb25tZW50IGluIFBQQzY0IGFuZCBQUEM2NExF
IG1hY2hpbmVzLg0KPj4NCj4+IFRoZSBmaXJzdCAyIHBhdGNoZXMgaXMgYSBmaXggbm90IHJl
bGF0ZWQgdG8gcHBjNjQuDQo+PiBQYXRjaCAzIGFuZCA0IGFsc28gYWZmZWN0IHNvbWUgb3Ro
ZXIgYXJjaGl0ZWN0dXJlcy4NCj4+IFBhdGNoZXMgNSB0byA3IGFyZSBhZGRpbmcgUG93ZXIg
c3BlY2lmaWMgYWRkaXRpb25zLg0KPj4NCj4+IFBhdGNoIDggaXMgYSBSRkMgZm9yIGEgY3Vy
cmVudCB3YXkgdG8gcnVuIHRoZSBkb2NrZXIgdGVzdHMgaW4gUFBDNjRMRS4NCj4+DQo+PiBM
dWNhcyBNYXRldXMgQ2FzdHJvKGFscW90ZWwpICg4KToNCj4+IMKgwqAgdGVzdHMvZG9ja2Vy
OiBGaXggYWxwaW5lIGRvY2tlcmZpbGUNCj4+IMKgwqAgc2NyaXB0cy9jaS9zZXR1cDogbmlu
amEgbWlzc2luZyBmcm9tIGJ1aWxkLWVudmlyb25tZW50DQo+PiDCoMKgIHNjcmlwdHMvY2kv
c2V0dXA6IEZpeCBsaWJ4ZW4gcmVxdWlyZW1lbnRzDQo+PiDCoMKgIHNjcmlwdHMvY2kvc2V0
dXA6IHNwaWNlLXNlcnZlciBvbmx5IG9uIHg4NiBhYXJjaDY0DQo+PiDCoMKgIHNjcmlwdHMv
Y2kvc2V0dXA6IEFkZCBwcGM2NGxlIHRvIHZhcnMueW1sIHRlbXBsYXRlDQo+PiDCoMKgIHNj
cmlwdHMvY2kvc2V0dXA6IEFkZCBGZWRvcmEgdG8gYnVpbGQtZW52aXJvbm1lbnQueW1sDQo+
PiDCoMKgIHNjcmlwdHMvY2kvc2V0dXA6IEFkZGVkIGRlYmlhbiB0byBidWlsZC1lbnZpcm9u
bWVudC55bWwNCj4+IMKgwqAgdGVzdHMvZG9ja2VyOiBTZWxlY3RpdmUgbGluZSByZWFkaW5n
IGJ5IHB5dGhvbiBzY3JpcHQNCj4+DQo+PiDCoCBzY3JpcHRzL2NpL3NldHVwL2J1aWxkLWVu
dmlyb25tZW50LnltbCB8IDU0ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+PiDCoCBz
Y3JpcHRzL2NpL3NldHVwL3ZhcnMueW1sLnRlbXBsYXRlwqDCoMKgwqAgfMKgIDEgKw0KPj4g
wqAgdGVzdHMvZG9ja2VyL2RvY2tlci5wecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMTUgKysrKystLQ0KPj4gwqAgdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2FscGlu
ZS5kb2NrZXIgfMKgIDMgKysNCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pDQo+Pg0KDQotLSANCkx1Y2FzIE1hdGV1cyBNLiBBcmF1
am8gZSBDYXN0cm8NCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8NCjxodHRwczov
L3d3dy5lbGRvcmFkby5vcmcuYnIvP3V0bV9jYW1wYWlnbj1hc3NpbmF0dXJhX2RlX2UtbWFp
bCZ1dG1fbWVkaXVtPWVtYWlsJnV0bV9zb3VyY2U9UkQrU3RhdGlvbj4NCkRlcGFydGFtZW50
byBDb21wdXRhw6fDo28gRW1iYXJjYWRhDQpBbmFsaXN0YSBkZSBTb2Z0d2FyZSBUcmFpbmVl
DQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5i
ci9kaXNjbGFpbWVyLmh0bWw+DQo=

