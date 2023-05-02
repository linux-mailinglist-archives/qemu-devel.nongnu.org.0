Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF236F4655
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:50:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrJl-0007EF-Ej; Tue, 02 May 2023 10:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ptrJj-0007Dv-Gu; Tue, 02 May 2023 10:49:23 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ptrJh-0003Ex-JC; Tue, 02 May 2023 10:49:23 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 2 May 2023 11:02:03 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 922988001D8;
 Tue,  2 May 2023 11:02:02 -0300 (-03)
Message-ID: <a70dfb68-30ed-d764-2119-e5ad4deade7f@eldorado.org.br>
Date: Tue, 2 May 2023 11:02:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] tcg: ppc64: Fix mask generation for vextractdm
Content-Language: en-US
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, philmd@linaro.org,
 richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
Cc: john_platts@hotmail.com, qemu-devel@nongnu.org
References: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
 <168141245022.3026479.1619179446205380588.stgit@ltc-boston1.aus.stglabs.ibm.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <168141245022.3026479.1619179446205380588.stgit@ltc-boston1.aus.stglabs.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 02 May 2023 14:02:03.0144 (UTC)
 FILETIME=[ABE2B880:01D97CFE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCk9uIDEzLzA0LzIwMjMgMTY6MDEsIFNoaXZhcHJhc2FkIEcgQmhhdCB3cm90ZToNCg0K
PiBJbiBmdW5jdGlvbiBkb19leHRyYWN0bSgpIHRoZSBtYXNrIGlzIGNhbGN1bGF0ZWQgYXMN
Cj4gZHVwX2NvbnN0KDEgPDwgKGVsZW1lbnRfd2lkdGggLSAxKSkuICcxJyBiZWluZyBzaWdu
ZWQgaW50DQo+IHdvcmtzIGZpbmUgZm9yIE1PXzgsMTYsMzIuIEZvciBNT182NCwgb24gUFBD
NjQgaG9zdA0KPiB0aGlzIGVuZHMgdXAgYmVjb21pbmcgMCBvbiBjb21waWxhdGlvbi4gVGhl
IHZleHRyYWN0ZG0NCj4gdXNlcyBNT182NCwgYW5kIGl0IGVuZHMgdXAgaGF2aW5nIG1hc2sg
YXMgMC4NCj4gDQo+IEV4cGxpY2l0bHkgdXNlIDFVTEwgaW5zdGVhZCBvZiBzaWduZWQgaW50
IDEgbGlrZSBpdHMNCj4gdXNlZCBldmVyeXdoZXJlIGVsc2UuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBTaGl2YXByYXNhZCBHIEJoYXQgPHNiaGF0QGxpbnV4LmlibS5jb20+DQo+IC0tLQ0K
PiAgIHRhcmdldC9wcGMvdHJhbnNsYXRlL3ZteC1pbXBsLmMuaW5jIHwgICAgMiArLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3RhcmdldC9wcGMvdHJhbnNsYXRlL3ZteC1pbXBsLmMuaW5jIGIvdGFy
Z2V0L3BwYy90cmFuc2xhdGUvdm14LWltcGwuYy5pbmMNCj4gaW5kZXggMTEyMjMzYjU0MS4u
Yzg3MTJkZDdkOCAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L3BwYy90cmFuc2xhdGUvdm14LWlt
cGwuYy5pbmMNCj4gKysrIGIvdGFyZ2V0L3BwYy90cmFuc2xhdGUvdm14LWltcGwuYy5pbmMN
Cj4gQEAgLTIwNTgsNyArMjA1OCw3IEBAIHN0YXRpYyBib29sIHRyYW5zX1ZFWFBBTkRRTShE
aXNhc0NvbnRleHQgKmN0eCwgYXJnX1ZYX3RiICphKQ0KPiAgIHN0YXRpYyBib29sIGRvX3Zl
eHRyYWN0bShEaXNhc0NvbnRleHQgKmN0eCwgYXJnX1ZYX3RiICphLCB1bnNpZ25lZCB2ZWNl
KQ0KPiAgIHsNCj4gICAgICAgY29uc3QgdWludDY0X3QgZWxlbV93aWR0aCA9IDggPDwgdmVj
ZSwgZWxlbV9jb3VudF9oYWxmID0gOCA+PiB2ZWNlLA0KPiAtICAgICAgICAgICAgICAgICAg
IG1hc2sgPSBkdXBfY29uc3QodmVjZSwgMSA8PCAoZWxlbV93aWR0aCAtIDEpKTsNCj4gKyAg
ICAgICAgICAgICAgICAgICBtYXNrID0gZHVwX2NvbnN0KHZlY2UsIDFVTEwgPDwgKGVsZW1f
d2lkdGggLSAxKSk7DQo+ICAgICAgIHVpbnQ2NF90IGksIGo7DQo+ICAgICAgIFRDR3ZfaTY0
IGxvLCBoaSwgdDAsIHQxOw0KPiANCj4gDQo+IA0KDQpSZXZpZXdlZC1ieTogTHVjYXMgTWF0
ZXVzIENhc3RybyA8bHVjYXMuYXJhdWpvQGVsZG9yYWRvLm9yZy5icj4NCi0tIA0KTHVjYXMg
TWF0ZXVzIE0uIEFyYXVqbyBlIENhc3Rybw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERP
UkFETw0KPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici8/dXRtX2NhbXBhaWduPWFzc2lu
YXR1cmFfZGVfZS1tYWlsJnV0bV9tZWRpdW09ZW1haWwmdXRtX3NvdXJjZT1SRCtTdGF0aW9u
Pg0KRGVwYXJ0YW1lbnRvIENvbXB1dGHDp8OjbyBFbWJhcmNhZGENCkFuYWxpc3RhIGRlIFNv
ZnR3YXJlIEp1bmlvcg0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5l
bGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

