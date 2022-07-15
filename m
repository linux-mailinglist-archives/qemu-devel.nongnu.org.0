Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19AC5762E2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:38:37 +0200 (CEST)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCLWf-0002cP-0L
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oCLUI-0008Mu-GK; Fri, 15 Jul 2022 09:36:10 -0400
Received: from [200.168.210.66] (port=25321 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oCLUG-0004r8-CJ; Fri, 15 Jul 2022 09:36:10 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 15 Jul 2022 10:36:01 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 59DCF800181;
 Fri, 15 Jul 2022 10:36:01 -0300 (-03)
Message-ID: <30172818-0da0-ca4e-7920-a498e5ce027b@eldorado.org.br>
Date: Fri, 15 Jul 2022 10:36:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v3 0/3] Implement Power ISA 3.1B hash insns
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, farosas@linux.ibm.com
References: <20220713165458.58807-1-victor.colombo@eldorado.org.br>
 <72c6d73b-0869-ab1a-3c2c-1c0fa334f643@gmail.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <72c6d73b-0869-ab1a-3c2c-1c0fa334f643@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 15 Jul 2022 13:36:01.0816 (UTC)
 FILETIME=[D30DB980:01D8984F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

T24gMTUvMDcvMjAyMiAxMDoyMywgRGFuaWVsIEhlbnJpcXVlIEJhcmJvemEgd3JvdGU6DQo+
IE9uIDcvMTMvMjIgMTM6NTQsIFbDrWN0b3IgQ29sb21ibyB3cm90ZToNCj4+IFRoaXMgcGF0
Y2ggc2VyaWVzIGltcGxlbWVudHMgdGhlIDQgaW5zdHJ1Y3Rpb25zIGFkZGVkIGluIFBvd2Vy
IElTQQ0KPj4gMy4xQjoNCj4+DQo+PiAtIGhhc2hjaGsNCj4+IC0gaGFzaHN0DQo+PiAtIGhh
c2hjaGtwDQo+PiAtIGhhc2hzdHANCj4+DQo+PiBUbyBidWlsZCBpdCwgeW91IG5lZWQgdG8g
YXBwbHkgdGhlIGZvbGxvd2luZyBwYXRjaGVzIG9uIHRvcCBvZiBtYXN0ZXI6DQo+PiA8MjAy
MjA3MDExMzM1MDcuNzQwNjE5LTItbHVjYXMuY291dGluaG9AZWxkb3JhZG8ub3JnLmJyPg0K
Pj4gPDIwMjIwNzAxMTMzNTA3Ljc0MDYxOS0zLWx1Y2FzLmNvdXRpbmhvQGVsZG9yYWRvLm9y
Zy5icj4NCj4+IDwyMDIyMDcxMjE5Mzc0MS41OTEzNC0yLWxlYW5kcm8ubHVwb3JpQGVsZG9y
YWRvLm9yZy5icj4NCj4+IDwyMDIyMDcxMjE5Mzc0MS41OTEzNC0zLWxlYW5kcm8ubHVwb3Jp
QGVsZG9yYWRvLm9yZy5icj4NCj4+DQo+PiBXb3JraW5nIGJyYW5jaCBmb3IgZWFzZSBvZiB1
c2UgY2FuIGJlIGZvdW5kIGhlcmU6DQo+PiBodHRwczovL2dpdGh1Yi5jb20vUFBDNjQvcWVt
dS90cmVlL3ZjY29sb21iby1oYXNoLXRvLXNlbmQtdjMNCj4+DQo+PiBXaGF0IGRvIHlvdSB0
aGluayBhYm91dCB0aGUgY2hvaWNlIHRvIGltcGxlbWVudCB0aGUgaGFzaCBhbGdvcml0aG0N
Cj4+IGZyb20gdGhlIGdyb3VuZCB1cCwgZm9sbG93aW5nIHRoZSBTSU1PTi1saWtlIGFsZ29y
aXRobSBwcmVzZW50ZWQgaW4NCj4+IFBvd2VyIElTQT8gSUlVQywgdGhpcyBhbGdvcml0aG0g
aXMgbm90IHRoZSBzYW1lIGFzIHRoZSBvcmlnaW5hbFsxXS4NCj4+IE90aGVyIG9wdGlvbnMg
d291bGQgYmUgdG8gdXNlIG90aGVyIGFsZ29yaXRobSBhbHJlYWR5IGltcGxlbWVudGVkDQo+
PiBpbiBRRU1VLCBvciBldmVuIG1ha2UgdGhpcyBpbnN0cnVjdGlvbiBhIG5vcCBmb3IgYWxs
IFBvd2VyIHZlcnNpb25zLg0KPj4NCj4+IEFsc28sIEkgd2FzIHRoaW5raW5nIGFib3V0IHVz
aW5nIHRoZSBjYWxsIHRvIHNwcl9yZWdpc3Rlcl9rdm0oKSBpbg0KPj4gaW5pdF9wcm9jX1BP
V0VSMTAgdG8gaW5pdGlhbGl6ZSB0aGUgcmVnaXN0ZXJzIHdpdGggYSByYW5kb20gdmFsdWUu
DQo+PiBJJ20gbm90IHN1cmUgd2hhdCBpcyB0aGUgYmVoYXZpb3IgaGVyZSwgSSB3b3VsZCBl
eHBlY3QgdGhhdCBpcyB0aGUgam9iDQo+PiBvZiB0aGUgT1MgdG8gc2V0IHRoZSByZWdzLCBi
dXQgbG9va3MgbGlrZSBLVk0gaXMgbm90IGV4cG9ydGluZyB0aGVtLA0KPj4gc28gdGhleSBh
cmUgYWx3YXlzIDAgKD8pLiBEb2VzIGFueW9uZSBoYXZlIGFueSBpbnNpZ2h0IG9uIHRoaXM/
DQo+IA0KPiBUaGlzIGhhcHBlbnMgYmVjYXVzZSBLVk0gb24gUE9XRVIxMCBpc24ndCBoYW5k
bGluZyB0aGVzZSByZWdpc3RlcnMNCj4gYXBwcm9wcmlhdGVseS4gV2UgYXJlIHByb2JhYmx5
IG1pc3Npbmcga2VybmVsL2t2bSBjb2RlIHRvIGRvIHNvLg0KPiANCj4gU2luY2UgS1ZNIG9u
IFBPV0VSMTAgaXMgb24gYW4gdW5jZXJ0YWluIHNwb3QgYXQgdGhpcyBtb21lbnQgSSB3b3Vs
ZG4ndA0KPiB3b3JyeSB0b28gbXVjaCBhYm91dCBpdC4gTWFraW5nIHRoZSByZWdzIHJlYWQv
d3JpdGUgd29yayBpbiBUQ0cgaXMgZ29vZA0KPiBlbm91Z2ggZm9yIG5vdy4NCj4gDQo+IA0K
PiBEYW5pZWwNCg0KSGVsbG8gRGFuaWVsLA0KDQpUaGFua3MgZm9yIHRha2luZyBhIGxvb2sg
YXQgdGhpcy4gSSBhZ3JlZSB0aGF0IGluIHRoaXMgY2FzZSBpdCBpcyBiZXR0ZXINCnRvIG1h
a2UgaXQgd29yayBpbiBUQ0cgYW5kIGRyb3AgdGhlIEtWTSBwYXJ0IGZyb20gdGhpcyBwYXRj
aCBzZXQNCkknbGwgd29yayBvbiBpdCBub3cNCg0KVGhhbmtzIQ0KDQo+IA0KPj4NCj4+IHYx
LT52MjoNCj4+IC0gU3BsaXQgdGhlIHBhdGNoIGluIDINCj4+IC0gUmViYXNlIHRvIG1hc3Rl
cg0KPj4NCj4+IHYyLT52MzoNCj4+IC0gU3BsaXQgcGF0Y2hlcyBpbiAzDQo+PiDCoMKgwqDC
oCAtIHRoZSBuZXcgcGF0Y2ggKHBhdGNoIDEpIGlzIHNlcGFyYXRpbmcgdGhlIGt2bSBoZWFk
ZXINCj4+IMKgwqDCoMKgwqDCoCBjaGFuZ2VzIFtDb3JuZWxpYV0NCj4+DQo+PiBbMV0gaHR0
cHM6Ly9lcHJpbnQuaWFjci5vcmcvMjAxMy80MDQucGRmDQo+Pg0KPj4gVsOtY3RvciBDb2xv
bWJvICgzKToNCj4+IMKgwqAgbGludXgtaGVhZGVycy9hc20tcG93ZXJwYy9rdm0uaDogQWRk
IEhBU0hLRVlSIGFuZCBIQVNIUEtFWVIgaW4gaGVhZGVycw0KPj4gwqDCoCB0YXJnZXQvcHBj
OiBJbXBsZW1lbnQgaGFzaHN0IGFuZCBoYXNoY2hrDQo+PiDCoMKgIHRhcmdldC9wcGM6IElt
cGxlbWVudCBoYXNoc3RwIGFuZCBoYXNoY2hrcA0KPj4NCj4+IMKgIGxpbnV4LWhlYWRlcnMv
YXNtLXBvd2VycGMva3ZtLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsNCj4+IMKg
IHRhcmdldC9wcGMvY3B1LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAyICsNCj4+IMKgIHRhcmdldC9wcGMvY3B1X2luaXQuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArKw0KPj4g
wqAgdGFyZ2V0L3BwYy9leGNwX2hlbHBlci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgODIgKysrKysrKysrKysrKysrKysrKysrKw0KPj4gwqAgdGFyZ2V0L3Bw
Yy9oZWxwZXIuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDQgKysNCj4+IMKgIHRhcmdldC9wcGMvaW5zbjMyLmRlY29kZcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEwICsrKw0KPj4gwqAgdGFyZ2V0L3BwYy90
cmFuc2xhdGUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDUgKysNCj4+IMKgIHRhcmdldC9wcGMvdHJhbnNsYXRlL2ZpeGVkcG9pbnQtaW1wbC5jLmlu
YyB8IDM0ICsrKysrKysrKw0KPj4gwqAgOCBmaWxlcyBjaGFuZ2VkLCAxNDcgaW5zZXJ0aW9u
cygrKQ0KPj4NCg0KDQotLSANClbDrWN0b3IgQ29yYSBDb2xvbWJvDQpJbnN0aXR1dG8gZGUg
UGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8v
d3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

