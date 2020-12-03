Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0E22CD5A2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 13:41:29 +0100 (CET)
Received: from localhost ([::1]:38658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kknvM-0001PU-Uq
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 07:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kkntM-00005w-Lm
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:39:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:36512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kkntK-0004Gc-D1
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:39:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5782BAC2E;
 Thu,  3 Dec 2020 12:39:19 +0000 (UTC)
Subject: Re: help with a build-user and build-user-plugin failure
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <19955b4e-f33a-a672-e9c6-3efdd640906a@suse.de>
 <48353514-8dde-0f4b-193d-fa71737d7c80@amsat.org> <871rghixhb.fsf@linaro.org>
 <6efbff12-a10b-8e55-908b-f2233fc8001e@suse.de> <87sg8xgyj7.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0264d8b0-9b29-f97b-7c6f-a9394066a5e2@suse.de>
Date: Thu, 3 Dec 2020 13:39:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87sg8xgyj7.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgYWxsLA0KDQphbmQgdGhhbmtzIGZvciB0aGUgaGVscCwgYWZ0ZXIgYSBsb3Qgb2YgZmlk
ZGxpbmcgYW5kIGFwcGx5aW5nIHlvdXIgc3VnZ2VzdGlvbnMgKGFuZCBhIHJlYm9vdCAhPykN
Cm5vdyB0aGluZ3Mgd29yay4NCg0KVGhlIG9ubHkgdGhpbmcgSSBhbSBsZWZ0IHNlZWluZyAo
YWxzbyBvbiBtYXN0ZXIpIGlzIHdpdGggY2hlY2stdGNnOg0KDQoNClJlbW90ZSAnZycgcGFj
a2V0IHJlcGx5IGlzIHRvbyBsb25nIChleHBlY3RlZCAzMTIgYnl0ZXMsIGdvdCA1NjAgYnl0
ZXMpOiAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDQwMDA4MDA0MzEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDEwMDYzMDAwMDAwMDAwMDAxMDA2MzQwMDAwMDAwMDgyMDA5MjA3MDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwDQpUcmFjZWJh
Y2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6DQogIEZpbGUgIi9ob21lL2NsYXVkaW8vZ2l0
L3FlbXUvdGVzdHMvdGNnL211bHRpYXJjaC9nZGJzdHViL3NoYTEucHkiLCBsaW5lIDY4LCBp
biA8bW9kdWxlPg0KICAgIGlmIGdkYi5wYXJzZV9hbmRfZXZhbCgnJHBjJykgPT0gMDoNCmdk
Yi5lcnJvcjogTm8gcmVnaXN0ZXJzLg0KDQoNCmEgbnVtYmVyIG9mIHRpbWVzIGR1cmluZyB0
aGUgdGVzdC4NCg0KU2VlbXMgbm90IHRvIGJyZWFrIGFueXRoaW5nLCBidXQgSSB3b25kZXIg
aWYgaXQgaXMgZXhwZWN0ZWQgb3IgaXQgd291bGQgbmVlZCBzdXBwcmVzc2luZz8NCg0KVGhh
bmtzIGFnYWluLA0KDQpDbGF1ZGlvDQoNCg0KT24gMTEvMjUvMjAgNjowMiBQTSwgQWxleCBC
ZW5uw6llIHdyb3RlOg0KPiANCj4gQ2xhdWRpbyBGb250YW5hIDxjZm9udGFuYUBzdXNlLmRl
PiB3cml0ZXM6DQo+IA0KPj4gSGkgQWxleCwNCj4+DQo+PiBPbiAxMS8yNS8yMCAxMDo0MiBB
TSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPj4+DQo+Pj4gUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPGY0YnVnQGFtc2F0Lm9yZz4gd3JpdGVzOg0KPj4+DQo+Pj4+IE9uIDExLzI0LzIwIDEy
OjA0IFBNLCBDbGF1ZGlvIEZvbnRhbmEgd3JvdGU6DQo+Pj4+PiBIaSBBbGV4LA0KPj4+Pj4N
Cj4+Pj4+IEkgYW0gc2VlaW5nIGJ1aWxkIGZhaWx1cmVzIHdpdGggYnVpbGQtdXNlciBhbmQg
YnVpbGQtdXNlci1wbHVnaW46DQo+Pj4+Pg0KPj4+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2h3
LWNsYXVkaW8vcWVtdS8tL3BpcGVsaW5lcy8yMjAyNDU5OTgNCj4+Pj4+DQo+Pj4+PiBhbmQg
SSBhbSB0cnlpbmcgdG8gc3RhcnQgaW52ZXN0aWdhdGluZy4NCj4+Pj4+DQo+Pj4+PiBIb3cg
ZG8gSSByZXByb2R1Y2UgdGhpcyBsb2NhbGx5Pw0KPj4+Pj4NCj4+Pj4+IEkgYW0gdHJ5aW5n
IHRvIHJ1biBsb2NhbGx5IHRoZSBjaGVjay10Y2cgcnVsZSwgYnV0IEkgY2Fubm90IGdldCBp
dCB0byB3b3JrLg0KPj4+Pj4gSSBtYW5hZ2VkIHRvIHdvcmsgYXJvdW5kIHRoZSBwcm9ibGVt
IG9mIHN0YXRpYyBsaWJyYXJpZXMgKGRpc2FibGVkIHRoZW0pLA0KPj4+Pj4NCj4+Pj4+IGJ1
dCB0aGVuIEkgZ2V0Og0KPj4+Pj4NCj4+Pj4+ICAgQlVJTEQgICBUQ0cgdGVzdHMgZm9yIHg4
Nl82NC1saW51eC11c2VyDQo+Pj4+PiAgIEJVSUxEICAgeDg2XzY0LWxpbnV4LXVzZXIgZ3Vl
c3QtdGVzdHMgd2l0aCBjYw0KPj4+Pj4gL3Vzci9saWI2NC9nY2MveDg2XzY0LXN1c2UtbGlu
dXgvNy8uLi8uLi8uLi8uLi94ODZfNjQtc3VzZS1saW51eC9iaW4vbGQ6IC90bXAvY2NncXRB
TTkubzogaW4gZnVuY3Rpb24gYHRlc3RfZm9wcyc6DQo+Pj4+PiAvZGV2L3NobS9jZm9udGFu
YS9xZW11L3Rlc3RzL3RjZy9pMzg2L3Rlc3QtaTM4Ni5jOjc1OTogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0byBgZm1vZCcNCj4+Pj4+IC91c3IvbGliNjQvZ2NjL3g4Nl82NC1zdXNlLWxpbnV4
LzcvLi4vLi4vLi4vLi4veDg2XzY0LXN1c2UtbGludXgvYmluL2xkOiAvZGV2L3NobS9jZm9u
dGFuYS9xZW11L3Rlc3RzL3RjZy9pMzg2L3Rlc3QtaTM4Ni5jOjc2MDogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgc3FydCcNCj4+Pj4+IC91c3IvbGliNjQvZ2NjL3g4Nl82NC1zdXNlLWxp
bnV4LzcvLi4vLi4vLi4vLi4veDg2XzY0LXN1c2UtbGludXgvYmluL2xkOiAvZGV2L3NobS9j
Zm9udGFuYS9xZW11L3Rlc3RzL3RjZy9pMzg2L3Rlc3QtaTM4Ni5jOjc2MTogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgc2luJw0KPj4+Pj4gL3Vzci9saWI2NC9nY2MveDg2XzY0LXN1c2Ut
bGludXgvNy8uLi8uLi8uLi8uLi94ODZfNjQtc3VzZS1saW51eC9iaW4vbGQ6IC9kZXYvc2ht
L2Nmb250YW5hL3FlbXUvdGVzdHMvdGNnL2kzODYvdGVzdC1pMzg2LmM6NzYyOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBjb3MnDQo+Pj4+Pg0KPj4+Pj4gSGF2ZSB5b3Ugc2VlbiBpdCBi
ZWZvcmU/DQo+Pj4+PiBBbnkgc3VnZ2VzdGlvbnM/IEknbSBvbiBPcGVuU1VTRSBMZWFwIDE1
IFNQMi4NCj4+Pj4NCj4+Pj4gUmVsYXRlZCB0byAzZmMxYWFkMzg2NCAoImNvbmZpZ3VyZTog
cmVtb3ZlIHVubmVjZXNzYXJ5IGxpYm0gdGVzdCIpDQo+Pj4+ICsgdGNnIHRlc3RzIHN0aWxs
IG5vdCBwb3J0ZWQgdG8gTWVzb24/DQo+Pj4NCj4+PiBIbW0gc28gd2UgY2VydGFpbmx5IG5l
ZWQgbGlibSBmb3IgdGhlIHRlc3RjYXNlIGJ1dCBJIGd1ZXNzIHRoaXMgaXM+IGZhaWxpbmcg
d2l0aCBhIGxvY2FsIGNyb3NzIGNvbXBpbGVyIHJhdGhlciB0aGFuIGRvY2tlcj8gSSdtIG5v
dCBzdXJlIHRoZQ0KPj4+IGdsb2JhbCBmZWF0dXJlIHRlc3Qgc2hvdWxkIGJlIHJlbGV2YW50
IGZvciB0ZXN0Y2FzZXMuDQo+Pj4NCj4+DQo+PiBQcm9iYWJseSBpdCdzIG15IGF0dGVtcHQg
dG8gbWFrZSBpdCB3b3JrIHdpdGggbm9uLXN0YXRpYyBsaWJtIHRoYXQgZmFpbGVkIHRoZW4s
DQo+Pg0KPj4gaXMgaXQgc3VwcG9zZWQgdG8gd29yaz8NCj4+DQo+PiBJIHNlZSBtZW50aW9u
IG9mIEJVSUxEX1NUQVRJQyB0aGVyZSwgYnV0IGl0IGRvZXMgbm90IHNlZW0gdG8gYWN0dWFs
bHkgd29yayBmb3IgbWUuDQo+Pg0KPj4gSWYgSSB1c2Ugc3RhdGljIGxpYm0sIHRoZW4gaXQg
d29ya3MuDQo+PiBJZiBJIHVuaW5zdGFsbCBzdGF0aWMgbGlibSwgYW55IGF0dGVtcHQgdG8g
YnVpbGQgZmFpbHMsIHJlZ2FyZGxlc3Mgb2YNCj4+IHdoZXRoZXIgSSBwYXNzIEJVSUxEX1NU
QVRJQz0nbicgb3Igc28uDQo+IA0KPiBBbGwgdGhlIHRlc3QgY2FzZXMgdGhlbXNlbHZlcyBz
aG91bGQgYmUgYnVpbHQgYXMgc3RhdGljIGFsdGhvdWdoIEkgc2VlDQo+IHdlIGZhbGwgYmFj
ayBmb3IgdGhlIGNhc2Ugb2YgdXNpbmcgYSBsb2NhbCBjcm9zcyBjb21waWxlci4gVGhhdCBu
b3JtYWxseQ0KPiBvbmx5IGNvdmVycyB0aGUgY2FzZSB3aGVyZSB0aGUgaG9zdCBjb21waWxl
ciBjYW4gYWxzbyBidWlsZCBmb3IgMzIgYml0DQo+IGZvciB0ZXN0Y2FzZXMuDQo+IA0KPj4N
Cj4+IENpYW8gYW5kIHRoYW5rcywNCj4+DQo+PiBDTGF1ZGlvDQo+IA0KPiANCg0K

