Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565166F46C4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 17:06:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrZC-0004m8-H7; Tue, 02 May 2023 11:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ptrZ9-0004lr-KG; Tue, 02 May 2023 11:05:19 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ptrZ7-0001fp-1a; Tue, 02 May 2023 11:05:18 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 2 May 2023 12:05:12 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 3220A8001D8;
 Tue,  2 May 2023 12:05:11 -0300 (-03)
Message-ID: <df06eddb-a04a-483f-f5e4-394e5c9473c7@eldorado.org.br>
Date: Tue, 2 May 2023 12:05:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] tests: tcg: ppc64: Add tests for Vector Extract Mask
 Instructions
Content-Language: en-US
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, philmd@linaro.org,
 richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
Cc: john_platts@hotmail.com, qemu-devel@nongnu.org
References: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
 <168141246968.3026479.12755025628496245070.stgit@ltc-boston1.aus.stglabs.ibm.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <168141246968.3026479.12755025628496245070.stgit@ltc-boston1.aus.stglabs.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 02 May 2023 15:05:12.0159 (UTC)
 FILETIME=[7E5086F0:01D97D07]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCk9uIDEzLzA0LzIwMjMgMTY6MDEsIFNoaXZhcHJhc2FkIEcgQmhhdCB3cm90ZToNCg0K
PiBBZGQgdGVzdCBmb3IgdmV4dHJhY3RibSwgdmV4dHJhY3R3bSwgdmV4dHJhY3RkbSBhbmQg
dmV4dHJhY3RxbQ0KPiBpbnN0cnVjdGlvbnMuIFRlc3Qgd29ya3MgZm9yIGJvdGggcWVtdS1w
cGM2NCBhbmQgcWVtdS1wcGM2NGxlLg0KPiANCj4gQmFzZWQgb24gdGhlIHRlc3QgY2FzZSB3
cml0dGVuIGJ5IEpvaG4gUGxhdHRzIHBvc3RlZCBhdCBbMV0NCj4gDQo+IFJlZmVyZW5jZXM6
DQo+IFsxXTogaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vaXNzdWVz
LzE1MzYNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gUGxhdHRzIDxqb2huX3BsYXR0c0Bo
b3RtYWlsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogU2hpdmFwcmFzYWQgRyBCaGF0IDxzYmhh
dEBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICB0ZXN0cy90Y2cvcHBjNjQvTWFrZWZpbGUu
dGFyZ2V0IHwgICAgNiArKysrLQ0KPiAgIHRlc3RzL3RjZy9wcGM2NC92ZWN0b3IuYyAgICAg
ICAgfCAgIDUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy90Y2cvcHBjNjQvdmVjdG9yLmMNCj4gDQo+IGRp
ZmYgLS1naXQgYS90ZXN0cy90Y2cvcHBjNjQvTWFrZWZpbGUudGFyZ2V0IGIvdGVzdHMvdGNn
L3BwYzY0L01ha2VmaWxlLnRhcmdldA0KPiBpbmRleCBmMDgxZjFjNjgzLi40ZmQ1NDNjZTI4
IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy90Y2cvcHBjNjQvTWFrZWZpbGUudGFyZ2V0DQo+ICsr
KyBiL3Rlc3RzL3RjZy9wcGM2NC9NYWtlZmlsZS50YXJnZXQNCj4gQEAgLTIwLDcgKzIwLDcg
QEAgUFBDNjRfVEVTVFMgKz0gbXRmc2YNCj4gICBQUEM2NF9URVNUUyArPSBtZmZzY2UNCj4g
DQo+ICAgaWZuZXEgKCQoQ1JPU1NfQ0NfSEFTX1BPV0VSMTApLCkNCj4gLVBQQzY0X1RFU1RT
ICs9IGJ5dGVfcmV2ZXJzZSBzaGE1MTItdmVjdG9yDQo+ICtQUEM2NF9URVNUUyArPSBieXRl
X3JldmVyc2Ugc2hhNTEyLXZlY3RvciB2ZWN0b3INCj4gICBlbmRpZg0KPiAgIGJ5dGVfcmV2
ZXJzZTogQ0ZMQUdTICs9IC1tY3B1PXBvd2VyMTANCj4gICBydW4tYnl0ZV9yZXZlcnNlOiBR
RU1VX09QVFMrPS1jcHUgUE9XRVIxMA0KPiBAQCAtMzMsNiArMzMsMTAgQEAgc2hhNTEyLXZl
Y3Rvcjogc2hhNTEyLmMNCj4gICBydW4tc2hhNTEyLXZlY3RvcjogUUVNVV9PUFRTKz0tY3B1
IFBPV0VSMTANCj4gICBydW4tcGx1Z2luLXNoYTUxMi12ZWN0b3Itd2l0aC0lOiBRRU1VX09Q
VFMrPS1jcHUgUE9XRVIxMA0KPiANCj4gK3ZlY3RvcjogQ0ZMQUdTICs9IC1tY3B1PXBvd2Vy
MTANCj4gK3J1bi12ZWN0b3I6IFFFTVVfT1BUUyArPSAtY3B1IFBPV0VSMTANCj4gK3J1bi1w
bHVnaW4tdmVjdG9yLXdpdGgtJTogUUVNVV9PUFRTICs9IC1jcHUgUE9XRVIxMA0KPiArDQo+
ICAgUFBDNjRfVEVTVFMgKz0gc2lnbmFsX3NhdmVfcmVzdG9yZV94ZXINCj4gICBQUEM2NF9U
RVNUUyArPSB4eHNwbHR3DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL3BwYzY0L3Zl
Y3Rvci5jIGIvdGVzdHMvdGNnL3BwYzY0L3ZlY3Rvci5jDQo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLjNjYjJiODhjODcNCj4gLS0tIC9kZXYvbnVsbA0K
PiArKysgYi90ZXN0cy90Y2cvcHBjNjQvdmVjdG9yLmMNCj4gQEAgLTAsMCArMSw1MCBAQA0K
PiArI2luY2x1ZGUgPGFzc2VydC5oPg0KPiArI2luY2x1ZGUgPHN0ZGludC5oPg0KPiArDQo+
ICtpbnQgbWFpbih2b2lkKQ0KPiArew0KPiArICAgIHVuc2lnbmVkIGludCByZXN1bHRfd2k7
DQo+ICsgICAgdmVjdG9yIHVuc2lnbmVkIGNoYXIgdmJjX2JpX3NyYyA9IHsgMHhGRiwgMHhG
RiwgMCwgMHhGRiwgMHhGRiwgMHhGRiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAweEZGLCAweEZGLCAweEZGLCAweEZGLCAwLCAwLCAwLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIDB4RkYsIDB4RkZ9Ow0K
PiArICAgIHZlY3RvciB1bnNpZ25lZCBzaG9ydCB2YmNfaGlfc3JjID0geyAweEZGRkYsIDAs
IDAsIDB4RkZGRiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMCwgMCwgMHhGRkZGLCAweEZGRkZ9Ow0KPiArICAgIHZlY3RvciB1bnNpZ25lZCBpbnQg
dmJjX3dpX3NyYyA9IHswLCAwLCAweEZGRkZGRkZGLCAweEZGRkZGRkZGfTsNCj4gKyAgICB2
ZWN0b3IgdW5zaWduZWQgbG9uZyBsb25nIHZiY19kaV9zcmMgPSB7MHhGRkZGRkZGRkZGRkZG
RkZGLCAwfTsNCj4gKyAgICB2ZWN0b3IgX191aW50MTI4X3QgdmJjX3FpX3NyYzsNCj4gKw0K
PiArICAgIGFzbSgidmV4dHJhY3RibSAlMCwgJTEiIDogIj1yIiAocmVzdWx0X3dpKSA6ICJ2
IiAodmJjX2JpX3NyYykpOw0KPiArI2lmIF9fQllURV9PUkRFUl9fID09IF9fT1JERVJfQklH
X0VORElBTl9fDQo+ICsgICAgYXNzZXJ0KHJlc3VsdF93aSA9PSAwYjExMDExMTExMTEwMDAw
MTEpOw0KPiArI2Vsc2UNCj4gKyAgICBhc3NlcnQocmVzdWx0X3dpID09IDBiMTEwMDAwMTEx
MTExMTAxMSk7DQo+ICsjZW5kaWYNCj4gKw0KPiArICAgIGFzbSgidmV4dHJhY3RobSAlMCwg
JTEiIDogIj1yIiAocmVzdWx0X3dpKSA6ICJ2IiAodmJjX2hpX3NyYykpOw0KPiArI2lmIF9f
QllURV9PUkRFUl9fID09IF9fT1JERVJfQklHX0VORElBTl9fDQo+ICsgICAgYXNzZXJ0KHJl
c3VsdF93aSA9PSAwYjEwMDEwMDExKTsNCj4gKyNlbHNlDQo+ICsgICAgYXNzZXJ0KHJlc3Vs
dF93aSA9PSAwYjExMDAxMDAxKTsNCj4gKyNlbmRpZg0KPiArDQo+ICsgICAgYXNtKCJ2ZXh0
cmFjdHdtICUwLCAlMSIgOiAiPXIiIChyZXN1bHRfd2kpIDogInYiICh2YmNfd2lfc3JjKSk7
DQo+ICsjaWYgX19CWVRFX09SREVSX18gPT0gX19PUkRFUl9CSUdfRU5ESUFOX18NCj4gKyAg
ICBhc3NlcnQocmVzdWx0X3dpID09IDBiMDAxMSk7DQo+ICsjZWxzZQ0KPiArICAgIGFzc2Vy
dChyZXN1bHRfd2kgPT0gMGIxMTAwKTsNCj4gKyNlbmRpZg0KPiArDQo+ICsgICAgYXNtKCJ2
ZXh0cmFjdGRtICUwLCAlMSIgOiAiPXIiIChyZXN1bHRfd2kpIDogInYiICh2YmNfZGlfc3Jj
KSk7DQo+ICsjaWYgX19CWVRFX09SREVSX18gPT0gX19PUkRFUl9CSUdfRU5ESUFOX18NCj4g
KyAgICBhc3NlcnQocmVzdWx0X3dpID09IDBiMTApOw0KPiArI2Vsc2UNCj4gKyAgICBhc3Nl
cnQocmVzdWx0X3dpID09IDBiMDEpOw0KPiArI2VuZGlmDQo+ICsNCj4gKyAgICB2YmNfcWlf
c3JjWzBdID0gMHgxOw0KPiArICAgIHZiY19xaV9zcmNbMF0gPSB2YmNfcWlfc3JjWzBdIDw8
IDEyNzsNCj4gKyAgICBhc20oInZleHRyYWN0cW0gJTAsICUxIiA6ICI9ciIgKHJlc3VsdF93
aSkgOiAidiIgKHZiY19xaV9zcmMpKTsNCj4gKyAgICBhc3NlcnQocmVzdWx0X3dpID09IDBi
MSk7DQo+ICsNCj4gKyAgICByZXR1cm4gMDsNCj4gK30NCj4gDQo+IA0KDQpSZXZpZXdlZC1i
eTogTHVjYXMgTWF0ZXVzIENhc3RybyA8bHVjYXMuYXJhdWpvQGVsZG9yYWRvLm9yZy5icj4N
Ci0tIA0KTHVjYXMgTWF0ZXVzIE0uIEFyYXVqbyBlIENhc3Rybw0KSW5zdGl0dXRvIGRlIFBl
c3F1aXNhcyBFTERPUkFETw0KPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici8/dXRtX2Nh
bXBhaWduPWFzc2luYXR1cmFfZGVfZS1tYWlsJnV0bV9tZWRpdW09ZW1haWwmdXRtX3NvdXJj
ZT1SRCtTdGF0aW9uPg0KRGVwYXJ0YW1lbnRvIENvbXB1dGHDp8OjbyBFbWJhcmNhZGENCkFu
YWxpc3RhIGRlIFNvZnR3YXJlIEp1bmlvcg0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxo
dHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

