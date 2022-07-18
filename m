Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3785789A1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:36:56 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVbt-00022j-P2
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oDVQ9-0007bA-Kl; Mon, 18 Jul 2022 14:24:43 -0400
Received: from [200.168.210.66] (port=26684 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oDVQ6-00043g-It; Mon, 18 Jul 2022 14:24:41 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 18 Jul 2022 15:23:32 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id EDAC8800134;
 Mon, 18 Jul 2022 15:23:31 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------cYilBBLo1hhxS9ZlP63qlS02"
Message-ID: <f9142480-a543-e52e-d6de-68f3c9b3969a@eldorado.org.br>
Date: Mon, 18 Jul 2022 15:23:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/3] target/ppc: Implement hashst and hashchk
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, cohuck@redhat.com,
 farosas@linux.ibm.com
References: <20220715205439.161110-1-victor.colombo@eldorado.org.br>
 <20220715205439.161110-3-victor.colombo@eldorado.org.br>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <20220715205439.161110-3-victor.colombo@eldorado.org.br>
X-OriginalArrivalTime: 18 Jul 2022 18:23:32.0212 (UTC)
 FILETIME=[7C548340:01D89AD3]
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
--------------cYilBBLo1hhxS9ZlP63qlS02
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAxNS8wNy8yMDIyIDE3OjU0LCBWw61jdG9yIENvbG9tYm8gd3JvdGU6DQo+IEltcGxl
bWVudGF0aW9uIGZvciBpbnN0cnVjdGlvbnMgaGFzaHN0IGFuZCBoYXNoY2hrLCB3aGljaCB3
ZXJlIGFkZGVkDQo+IGluIFBvd2VyIElTQSAzLjFCLg0KPg0KPiBJdCB3YXMgZGVjaWRlZCB0
byBpbXBsZW1lbnQgdGhlIGhhc2ggYWxnb3JpdGhtIGZyb20gZ3JvdW5kIHVwIGluIHRoaXMN
Cj4gcGF0Y2ggZXhhY3RseSBhcyBkZXNjcmliZWQgaW4gUG93ZXIgSVNBLg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBWw61jdG9yIENvbG9tYm88dmljdG9yLmNvbG9tYm9AZWxkb3JhZG8ub3Jn
LmJyPg0KPiAtLS0NCj4gICB0YXJnZXQvcHBjL2V4Y3BfaGVscGVyLmMgICAgICAgICAgICAg
ICAgICAgfCA4MiArKysrKysrKysrKysrKysrKysrKysrDQo+ICAgdGFyZ2V0L3BwYy9oZWxw
ZXIuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKw0KPiAgIHRhcmdldC9wcGMvaW5z
bjMyLmRlY29kZSAgICAgICAgICAgICAgICAgICB8ICA4ICsrKw0KPiAgIHRhcmdldC9wcGMv
dHJhbnNsYXRlLmMgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrDQo+ICAgdGFyZ2V0L3Bw
Yy90cmFuc2xhdGUvZml4ZWRwb2ludC1pbXBsLmMuaW5jIHwgMzIgKysrKysrKysrDQo+ICAg
NSBmaWxlcyBjaGFuZ2VkLCAxMjkgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
dGFyZ2V0L3BwYy9leGNwX2hlbHBlci5jIGIvdGFyZ2V0L3BwYy9leGNwX2hlbHBlci5jDQo+
IGluZGV4IGNiNzUyYjE4NGEuLmZhNWE3MzdlMjIgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9w
cGMvZXhjcF9oZWxwZXIuYw0KPiArKysgYi90YXJnZXQvcHBjL2V4Y3BfaGVscGVyLmMNCj4g
QEAgLTIxNzQsNiArMjE3NCw4OCBAQCB2b2lkIGhlbHBlcl90ZChDUFVQUENTdGF0ZSAqZW52
LCB0YXJnZXRfdWxvbmcgYXJnMSwgdGFyZ2V0X3Vsb25nIGFyZzIsDQo+ICAgI2VuZGlmDQo+
ICAgI2VuZGlmDQo+DQo+ICtzdGF0aWMgdWludDMyX3QgaGVscGVyX1NJTU9OX0xJS0VfMzJf
NjQodWludDMyX3QgeCwgdWludDY0X3Qga2V5LCB1aW50MzJfdCBsYW5lKQ0KPiArew0KPiAr
ICAgIGNvbnN0IHVpbnQxNl90IGMgPSAweGZmZmM7DQo+ICsgICAgY29uc3QgdWludDY0X3Qg
ejAgPSAweGZhMjU2MWNkZjQ0YWMzOThVTEw7DQo+ICsgICAgdWludDE2X3QgeiA9IDAsIHRl
bXA7DQo+ICsgICAgdWludDE2X3Qga1szMl0sIGVmZl9rWzMyXSwgeGxlZnRbMzNdLCB4cmln
aHRbMzNdLCBmeGxlZnRbMzJdOw0KPiArDQo+ICsgICAgZm9yIChpbnQgaSA9IDM7IGkgPj0g
MDsgaS0tKSB7DQo+ICsgICAgICAgIGtbaV0gPSBrZXkgJiAweGZmZmY7DQo+ICsgICAgICAg
IGtleSA+Pj0gMTY7DQo+ICsgICAgfQ0KPiArICAgIHhsZWZ0WzBdID0geCAmIDB4ZmZmZjsN
Cj4gKyAgICB4cmlnaHRbMF0gPSAoeCA+PiAxNikgJiAweGZmZmY7DQo+ICsNCj4gKyAgICBm
b3IgKGludCBpID0gMDsgaSA8IDI4OyBpKyspIHsNCj4gKyAgICAgICAgeiA9ICh6MCA+PiAo
NjMgLSBpKSkgJiAxOw0KPiArICAgICAgICB0ZW1wID0gcm9yMTYoa1tpICsgM10sIDMpIF4g
a1tpICsgMV07DQo+ICsgICAgICAgIGtbaSArIDRdID0gYyBeIHogXiBrW2ldIF4gdGVtcCBe
IHJvcjE2KHRlbXAsIDEpOw0KPiArICAgIH0NCj4gKw0KPiArICAgIGZvciAoaW50IGkgPSAw
OyBpIDwgODsgaSsrKSB7DQo+ICsgICAgICAgIGVmZl9rWzQgKiBpICsgMF0gPSBrWzQgKiBp
ICsgKCgwICsgbGFuZSkgJSA0KV07DQo+ICsgICAgICAgIGVmZl9rWzQgKiBpICsgMV0gPSBr
WzQgKiBpICsgKCgxICsgbGFuZSkgJSA0KV07DQo+ICsgICAgICAgIGVmZl9rWzQgKiBpICsg
Ml0gPSBrWzQgKiBpICsgKCgyICsgbGFuZSkgJSA0KV07DQo+ICsgICAgICAgIGVmZl9rWzQg
KiBpICsgM10gPSBrWzQgKiBpICsgKCgzICsgbGFuZSkgJSA0KV07DQo+ICsgICAgfQ0KPiAr
DQo+ICsgICAgZm9yIChpbnQgaSA9IDA7IGkgPCAzMjsgaSsrKSB7DQo+ICsgICAgICAgIGZ4
bGVmdFtpXSA9IChyb2wxNih4bGVmdFtpXSwgMSkgJg0KPiArICAgICAgICAgICAgcm9sMTYo
eGxlZnRbaV0sIDgpKSBeIHJvbDE2KHhsZWZ0W2ldLCAyKTsNCj4gKyAgICAgICAgeGxlZnRb
aSArIDFdID0geHJpZ2h0W2ldIF4gZnhsZWZ0W2ldIF4gZWZmX2tbaV07DQo+ICsgICAgICAg
IHhyaWdodFtpICsgMV0gPSB4bGVmdFtpXTsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICByZXR1
cm4gKCgodWludDMyX3QpeHJpZ2h0WzMyXSkgPDwgMTYpIHwgeGxlZnRbMzJdOw0KPiArfQ0K
PiArDQo+ICtzdGF0aWMgdWludDY0X3QgaGFzaF9kaWdlc3QodWludDY0X3QgcmEsIHVpbnQ2
NF90IHJiLCB1aW50NjRfdCBrZXkpDQo+ICt7DQo+ICsgICAgdWludDY0X3Qgc3RhZ2UwX2gg
PSAwVUxMLCBzdGFnZTBfbCA9IDBVTEw7DQo+ICsgICAgdWludDY0X3Qgc3RhZ2UxX2gsIHN0
YWdlMV9sOw0KPiArDQo+ICsgICAgZm9yIChpbnQgaSA9IDA7IGkgPCA0OyBpKyspIHsNCj4g
KyAgICAgICAgc3RhZ2UwX2ggfD0gcm9yNjQocmIgJiAweGZmLCA4ICogKDIgKiBpICsgMSkp
Ow0KPiArICAgICAgICBzdGFnZTBfaCB8PSAoKHJhID4+IDMyKSAmIDB4ZmYpIDw8ICg4ICog
MiAqIGkpOw0KPiArICAgICAgICBzdGFnZTBfbCB8PSByb3I2NCgocmIgPj4gMzIpICYgMHhm
ZiwgOCAqICgyICogaSArIDEpKTsNCj4gKyAgICAgICAgc3RhZ2UwX2wgfD0gKHJhICYgMHhm
ZikgPDwgKDggKiAyICogaSk7DQo+ICsgICAgICAgIHJiID4+PSA4Ow0KPiArICAgICAgICBy
YSA+Pj0gODsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICBzdGFnZTFfaCA9ICh1aW50NjRfdClo
ZWxwZXJfU0lNT05fTElLRV8zMl82NChzdGFnZTBfaCA+PiAzMiwga2V5LCAwKSA8PCAzMjsN
Cj4gKyAgICBzdGFnZTFfaCB8PSBoZWxwZXJfU0lNT05fTElLRV8zMl82NChzdGFnZTBfaCwg
a2V5LCAxKTsNCj4gKyAgICBzdGFnZTFfbCA9ICh1aW50NjRfdCloZWxwZXJfU0lNT05fTElL
RV8zMl82NChzdGFnZTBfbCA+PiAzMiwga2V5LCAyKSA8PCAzMjsNCj4gKyAgICBzdGFnZTFf
bCB8PSBoZWxwZXJfU0lNT05fTElLRV8zMl82NChzdGFnZTBfbCwga2V5LCAzKTsNCj4gKw0K
PiArICAgIHJldHVybiBzdGFnZTFfaCBeIHN0YWdlMV9sOw0KPiArfQ0KPiArDQo+ICsjaW5j
bHVkZSAicWVtdS9ndWVzdC1yYW5kb20uaCINCj4gKw0KPiArI2RlZmluZSBIRUxQRVJfSEFT
SChvcCwga2V5LCBzdG9yZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXA0KPiArdm9pZCBoZWxwZXJfIyNvcChDUFVQUENTdGF0ZSAqZW52LCB0YXJnZXRf
dWxvbmcgZWEsIHRhcmdldF91bG9uZyByYSwgICAgICAgICAgXA0KPiArICAgICAgICAgICAg
ICAgICB0YXJnZXRfdWxvbmcgcmIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXA0KPiAreyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgIHVp
bnQ2NF90IGNhbGN1bGF0ZWRfaGFzaCA9IGhhc2hfZGlnZXN0KHJhLCByYiwga2V5KSwgbG9h
ZGVkX2hhc2g7ICAgICAgICAgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAr
ICAgIGlmIChzdG9yZSkgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgICAgICBjcHVfc3RxX2RhdGFfcmEo
ZW52LCBlYSwgY2FsY3VsYXRlZF9oYXNoLCBHRVRQQygpKTsgICAgICAgICAgICAgICAgICAg
XA0KPiArICAgIH0gZWxzZSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgICAgICBsb2FkZWRfaGFz
aCA9IGNwdV9sZHFfZGF0YV9yYShlbnYsIGVhLCBHRVRQQygpKTsgICAgICAgICAgICAgICAg
ICAgICAgXA0KPiArICAgICAgICBpZiAobG9hZGVkX2hhc2ggIT0gY2FsY3VsYXRlZF9oYXNo
KSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgICAgICAgICAg
LyogaGFzaGVzIGRvbid0IG1hdGNoLCB0cmFwICovICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXA0KPiArICAgICAgICAgICAgcmFpc2VfZXhjZXB0aW9uX2Vycl9yYShl
bnYsIFBPV0VSUENfRVhDUF9QUk9HUkFNLCAgICAgICAgICAgICAgICAgXA0KPiArICAgICAg
ICAgICAgICAgIFBPV0VSUENfRVhDUF9UUkFQLCBHRVRQQygpKTsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXA0KPiArICAgICAgICB9ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAr
ICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArfQ0KTWF5YmUgdGhpcyBtYWNybyBjb3Vs
ZCBiZSAyIHNlcGFyYXRlIGhlbHBlcnMgc28gaXQncyBlYXNpZXIgdG8gZGVidWcuDQoNClJl
dmlld2VkLWJ5OiBMdWNhcyBNYXRldXMgQ2FzdHJvIDxsdWNhcy5hcmF1am9AZWxkb3JhZG8u
b3JnLmJyPg0KDQo+ICsNCj4gK0hFTFBFUl9IQVNIKEhBU0hTVCwgZW52LT5zcHJbU1BSX0hB
U0hLRVlSXSwgdHJ1ZSkNCj4gK0hFTFBFUl9IQVNIKEhBU0hDSEssIGVudi0+c3ByW1NQUl9I
QVNIS0VZUl0sIGZhbHNlKQ0KPiArDQo+ICAgI2lmICFkZWZpbmVkKENPTkZJR19VU0VSX09O
TFkpDQo+DQo+ICAgI2lmZGVmIENPTkZJR19UQ0cNCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9w
cGMvaGVscGVyLmggYi90YXJnZXQvcHBjL2hlbHBlci5oDQo+IGluZGV4IDE1OWIzNTJmNmUu
LjU4MTdhZjYzMmIgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9wcGMvaGVscGVyLmgNCj4gKysr
IGIvdGFyZ2V0L3BwYy9oZWxwZXIuaA0KPiBAQCAtNCw2ICs0LDggQEAgREVGX0hFTFBFUl9G
TEFHU180KHR3LCBUQ0dfQ0FMTF9OT19XRywgdm9pZCwgZW52LCB0bCwgdGwsIGkzMikNCj4g
ICAjaWYgZGVmaW5lZChUQVJHRVRfUFBDNjQpDQo+ICAgREVGX0hFTFBFUl9GTEFHU180KHRk
LCBUQ0dfQ0FMTF9OT19XRywgdm9pZCwgZW52LCB0bCwgdGwsIGkzMikNCj4gICAjZW5kaWYN
Cj4gK0RFRl9IRUxQRVJfNChIQVNIU1QsIHZvaWQsIGVudiwgdGwsIHRsLCB0bCkNCj4gK0RF
Rl9IRUxQRVJfNChIQVNIQ0hLLCB2b2lkLCBlbnYsIHRsLCB0bCwgdGwpDQo+ICAgI2lmICFk
ZWZpbmVkKENPTkZJR19VU0VSX09OTFkpDQo+ICAgREVGX0hFTFBFUl8yKHN0b3JlX21zciwg
dm9pZCwgZW52LCB0bCkNCj4gICBERUZfSEVMUEVSXzEocmZpLCB2b2lkLCBlbnYpDQo+IGRp
ZmYgLS1naXQgYS90YXJnZXQvcHBjL2luc24zMi5kZWNvZGUgYi90YXJnZXQvcHBjL2luc24z
Mi5kZWNvZGUNCj4gaW5kZXggZWI0MWVmYzEwMC4uNTQ0NTE0NTY1YyAxMDA2NDQNCj4gLS0t
IGEvdGFyZ2V0L3BwYy9pbnNuMzIuZGVjb2RlDQo+ICsrKyBiL3RhcmdldC9wcGMvaW5zbjMy
LmRlY29kZQ0KPiBAQCAtMTcyLDYgKzE3Miw5IEBADQo+ICAgQFhfVFNYICAgICAgICAgIC4u
Li4uLiAuLi4uLiByYTo1IHJiOjUgLi4uLi4uLi4uLiAuICAgICAgICAgICAgICZYIHJ0PSV4
X3J0X3RzeA0KPiAgIEBYX1RTWFAgICAgICAgICAuLi4uLi4gLi4uLi4gcmE6NSByYjo1IC4u
Li4uLi4uLi4gLiAgICAgICAgICAgICAmWCBydD0lcnRfdHN4cA0KPg0KPiArJXhfZHcgICAg
ICAgICAgIDA6MSAyMTo1ICFmdW5jdGlvbj1kd19jb21wb3NlX2VhDQo+ICtAWF9EVyAgICAg
ICAgICAgLi4uLi4uIC4uLi4uIHJhOjUgcmI6NSAuLi4uLi4uLi4uIC4gICAgICAgICAgICAg
JlggcnQ9JXhfZHcNCj4gKw0KPiAgICZYX2ZydHBfdnJiICAgICBmcnRwIHZyYg0KPiAgIEBY
X2ZydHBfdnJiICAgICAuLi4uLi4gLi4uLjAgLi4uLi4gdnJiOjUgLi4uLi4uLi4uLiAuICAg
ICAgICAgICAmWF9mcnRwX3ZyYiBmcnRwPSV4X2ZydHANCj4NCj4gQEAgLTMyMyw2ICszMjYs
MTEgQEAgQ05UVFpETSAgICAgICAgIDAxMTExMSAuLi4uLiAuLi4uLiAuLi4uLiAxMDAwMTEx
MDExIC0gICBAWA0KPiAgIFBERVBEICAgICAgICAgICAwMTExMTEgLi4uLi4gLi4uLi4gLi4u
Li4gMDAxMDAxMTEwMCAtICAgQFgNCj4gICBQRVhURCAgICAgICAgICAgMDExMTExIC4uLi4u
IC4uLi4uIC4uLi4uIDAwMTAxMTExMDAgLSAgIEBYDQo+DQo+ICsjIEZpeGVkLVBvaW50IEhh
c2ggSW5zdHJ1Y3Rpb25zDQo+ICsNCj4gK0hBU0hTVCAgICAgICAgICAwMTExMTEgLi4uLi4g
Li4uLi4gLi4uLi4gMTAxMTAxMDAxMCAuICAgQFhfRFcNCj4gK0hBU0hDSEsgICAgICAgICAw
MTExMTEgLi4uLi4gLi4uLi4gLi4uLi4gMTAxMTExMDAxMCAuICAgQFhfRFcNCj4gKw0KPiAg
ICMjIEJDRCBBc3Npc3QNCj4NCj4gICBBRERHNlMgICAgICAgICAgMDExMTExIC4uLi4uIC4u
Li4uIC4uLi4uIC0gMDAxMDAxMDEwIC0gIEBYDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvcHBj
L3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L3BwYy90cmFuc2xhdGUuYw0KPiBpbmRleCA1YTE4ZWU1
NzdmLi4zYmRkM2U2ZTNlIDEwMDY0NA0KPiAtLS0gYS90YXJnZXQvcHBjL3RyYW5zbGF0ZS5j
DQo+ICsrKyBiL3RhcmdldC9wcGMvdHJhbnNsYXRlLmMNCj4gQEAgLTYzOTQsNiArNjM5NCwx
MSBAQCBzdGF0aWMgaW50IHRpbWVzXzE2KERpc2FzQ29udGV4dCAqY3R4LCBpbnQgeCkNCj4g
ICAgICAgcmV0dXJuIHggKiAxNjsNCj4gICB9DQo+DQo+ICtzdGF0aWMgaW50NjRfdCBkd19j
b21wb3NlX2VhKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgeCkNCj4gK3sNCj4gKyAgICByZXR1
cm4gZGVwb3NpdDY0KDB4ZmZmZmZmZmZmZmZmZmUwMCwgMywgNiwgeCk7DQo+ICt9DQo+ICsN
Cj4gICAvKg0KPiAgICAqIEhlbHBlcnMgZm9yIHRyYW5zXyogZnVuY3Rpb25zIHRvIGNoZWNr
IGZvciBzcGVjaWZpYyBpbnNucyBmbGFncy4NCj4gICAgKiBVc2UgdG9rZW4gcGFzdGluZyB0
byBlbnN1cmUgdGhhdCB3ZSB1c2UgdGhlIHByb3BlciBmbGFnIHdpdGggdGhlDQo+IGRpZmYg
LS1naXQgYS90YXJnZXQvcHBjL3RyYW5zbGF0ZS9maXhlZHBvaW50LWltcGwuYy5pbmMgYi90
YXJnZXQvcHBjL3RyYW5zbGF0ZS9maXhlZHBvaW50LWltcGwuYy5pbmMNCj4gaW5kZXggZGIx
NGQzYmViYy4uNDFjMDZkZThhMiAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L3BwYy90cmFuc2xh
dGUvZml4ZWRwb2ludC1pbXBsLmMuaW5jDQo+ICsrKyBiL3RhcmdldC9wcGMvdHJhbnNsYXRl
L2ZpeGVkcG9pbnQtaW1wbC5jLmluYw0KPiBAQCAtNTQwLDMgKzU0MCwzNSBAQCBzdGF0aWMg
Ym9vbCB0cmFuc19DQkNEVEQoRGlzYXNDb250ZXh0ICpjdHgsIGFyZ19YX3NhICphKQ0KPiAg
ICAgICBnZW5faGVscGVyX0NCQ0RURChjcHVfZ3ByW2EtPnJhXSwgY3B1X2dwclthLT5yc10p
Ow0KPiAgICAgICByZXR1cm4gdHJ1ZTsNCj4gICB9DQo+ICsNCj4gK3N0YXRpYyBib29sIGRv
X2hhc2goRGlzYXNDb250ZXh0ICpjdHgsIGFyZ19YICphLCBib29sIHByaXYsDQo+ICsgICAg
dm9pZCAoKmhlbHBlcikoVENHdl9wdHIsIFRDR3YsIFRDR3YsIFRDR3YpKQ0KPiArew0KPiAr
ICAgIFRDR3YgZWE7DQo+ICsNCj4gKyAgICBpZiAoIShjdHgtPmluc25zX2ZsYWdzMiAmIFBQ
QzJfSVNBMzEwKSkgew0KPiArICAgICAgICAvKiBpZiB2ZXJzaW9uIGlzIGJlZm9yZSB2My4x
LCB0aGlzIG9wZXJhdGlvbiBpcyBhIG5vcCAqLw0KPiArICAgICAgICByZXR1cm4gdHJ1ZTsN
Cj4gKyAgICB9DQo+ICsNCj4gKyAgICBpZiAocHJpdikgew0KPiArICAgICAgICAvKiBpZiBp
bnN0cnVjdGlvbiBpcyBwcml2aWxlZ2VkIGJ1dCB0aGUgY29udGV4dCBpcyBpbiB1c2VyIHNw
YWNlICovDQo+ICsgICAgICAgIFJFUVVJUkVfU1YoY3R4KTsNCj4gKyAgICB9DQo+ICsNCj4g
KyAgICBpZiAodW5saWtlbHkoYS0+cmEgPT0gMCkpIHsNCj4gKyAgICAgICAgLyogaWYgUkE9
MCwgdGhlIGluc3RydWN0aW9uIGZvcm0gaXMgaW52YWxpZCAqLw0KPiArICAgICAgICBnZW5f
aW52YWxpZChjdHgpOw0KPiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gKyAgICB9DQo+ICsN
Cj4gKyAgICBlYSA9IGRvX2VhX2NhbGMoY3R4LCBhLT5yYSwgdGNnX2NvbnN0YW50X3RsKGEt
PnJ0KSk7DQo+ICsgICAgaGVscGVyKGNwdV9lbnYsIGVhLCBjcHVfZ3ByW2EtPnJhXSwgY3B1
X2dwclthLT5yYl0pOw0KPiArDQo+ICsgICAgdGNnX3RlbXBfZnJlZShlYSk7DQo+ICsNCj4g
KyAgICByZXR1cm4gdHJ1ZTsNCj4gK30NCj4gKw0KPiArVFJBTlMoSEFTSFNULCBkb19oYXNo
LCBmYWxzZSwgZ2VuX2hlbHBlcl9IQVNIU1QpDQo+ICtUUkFOUyhIQVNIQ0hLLCBkb19oYXNo
LCBmYWxzZSwgZ2VuX2hlbHBlcl9IQVNIQ0hLKQ0KPiAtLQ0KPiAyLjI1LjENCj4NCj4NCi0t
IA0KTHVjYXMgTWF0ZXVzIE0uIEFyYXVqbyBlIENhc3Rybw0KSW5zdGl0dXRvIGRlIFBlc3F1
aXNhcyBFTERPUkFETyANCjxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvP3V0bV9jYW1w
YWlnbj1hc3NpbmF0dXJhX2RlX2UtbWFpbCZ1dG1fbWVkaXVtPWVtYWlsJnV0bV9zb3VyY2U9
UkQrU3RhdGlvbj4NCkRlcGFydGFtZW50byBDb21wdXRhw6fDo28gRW1iYXJjYWRhDQpBbmFs
aXN0YSBkZSBTb2Z0d2FyZSBUcmFpbmVlDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0
dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=
--------------cYilBBLo1hhxS9ZlP63qlS02
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
    <div class=3D"moz-cite-prefix">On 15/07/2022 17:54, V=C3=ADctor Colom=
bo
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20220715205439.161110-3-victor.colombo@eldorado.org.br"=
>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Implementation for instructions hashst and hashchk, which were added
in Power ISA 3.1B.

It was decided to implement the hash algorithm from ground up in this
patch exactly as described in Power ISA.

Signed-off-by: V=C3=ADctor Colombo <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:victor.colombo@eldorado.org.br">&lt;victor.colombo@eldorado.o=
rg.br&gt;</a>
---
 target/ppc/excp_helper.c                   | 82 ++++++++++++++++++++++
 target/ppc/helper.h                        |  2 +
 target/ppc/insn32.decode                   |  8 +++
 target/ppc/translate.c                     |  5 ++
 target/ppc/translate/fixedpoint-impl.c.inc | 32 +++++++++
 5 files changed, 129 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index cb752b184a..fa5a737e22 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2174,6 +2174,88 @@ void helper_td(CPUPPCState *env, target_ulong arg1=
, target_ulong arg2,
 #endif
 #endif

+static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uint32=
_t lane)
+{
+    const uint16_t c =3D 0xfffc;
+    const uint64_t z0 =3D 0xfa2561cdf44ac398ULL;
+    uint16_t z =3D 0, temp;
+    uint16_t k[32], eff_k[32], xleft[33], xright[33], fxleft[32];
+
+    for (int i =3D 3; i &gt;=3D 0; i--) {
+        k[i] =3D key &amp; 0xffff;
+        key &gt;&gt;=3D 16;
+    }
+    xleft[0] =3D x &amp; 0xffff;
+    xright[0] =3D (x &gt;&gt; 16) &amp; 0xffff;
+
+    for (int i =3D 0; i &lt; 28; i++) {
+        z =3D (z0 &gt;&gt; (63 - i)) &amp; 1;
+        temp =3D ror16(k[i + 3], 3) ^ k[i + 1];
+        k[i + 4] =3D c ^ z ^ k[i] ^ temp ^ ror16(temp, 1);
+    }
+
+    for (int i =3D 0; i &lt; 8; i++) {
+        eff_k[4 * i + 0] =3D k[4 * i + ((0 + lane) % 4)];
+        eff_k[4 * i + 1] =3D k[4 * i + ((1 + lane) % 4)];
+        eff_k[4 * i + 2] =3D k[4 * i + ((2 + lane) % 4)];
+        eff_k[4 * i + 3] =3D k[4 * i + ((3 + lane) % 4)];
+    }
+
+    for (int i =3D 0; i &lt; 32; i++) {
+        fxleft[i] =3D (rol16(xleft[i], 1) &amp;
+            rol16(xleft[i], 8)) ^ rol16(xleft[i], 2);
+        xleft[i + 1] =3D xright[i] ^ fxleft[i] ^ eff_k[i];
+        xright[i + 1] =3D xleft[i];
+    }
+
+    return (((uint32_t)xright[32]) &lt;&lt; 16) | xleft[32];
+}
+
+static uint64_t hash_digest(uint64_t ra, uint64_t rb, uint64_t key)
+{
+    uint64_t stage0_h =3D 0ULL, stage0_l =3D 0ULL;
+    uint64_t stage1_h, stage1_l;
+
+    for (int i =3D 0; i &lt; 4; i++) {
+        stage0_h |=3D ror64(rb &amp; 0xff, 8 * (2 * i + 1));
+        stage0_h |=3D ((ra &gt;&gt; 32) &amp; 0xff) &lt;&lt; (8 * 2 * i)=
;
+        stage0_l |=3D ror64((rb &gt;&gt; 32) &amp; 0xff, 8 * (2 * i + 1)=
);
+        stage0_l |=3D (ra &amp; 0xff) &lt;&lt; (8 * 2 * i);
+        rb &gt;&gt;=3D 8;
+        ra &gt;&gt;=3D 8;
+    }
+
+    stage1_h =3D (uint64_t)helper_SIMON_LIKE_32_64(stage0_h &gt;&gt; 32,=
 key, 0) &lt;&lt; 32;
+    stage1_h |=3D helper_SIMON_LIKE_32_64(stage0_h, key, 1);
+    stage1_l =3D (uint64_t)helper_SIMON_LIKE_32_64(stage0_l &gt;&gt; 32,=
 key, 2) &lt;&lt; 32;
+    stage1_l |=3D helper_SIMON_LIKE_32_64(stage0_l, key, 3);
+
+    return stage1_h ^ stage1_l;
+}
+
+#include "qemu/guest-random.h"
+
+#define HELPER_HASH(op, key, store)                                     =
      \
+void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,    =
      \
+                 target_ulong rb)                                       =
      \
+{                                                                       =
      \
+    uint64_t calculated_hash =3D hash_digest(ra, rb, key), loaded_hash; =
        \
+                                                                        =
      \
+    if (store) {                                                        =
      \
+        cpu_stq_data_ra(env, ea, calculated_hash, GETPC());             =
      \
+    } else {                                                            =
      \
+        loaded_hash =3D cpu_ldq_data_ra(env, ea, GETPC());              =
        \
+        if (loaded_hash !=3D calculated_hash) {                         =
        \
+            /* hashes don't match, trap */                              =
      \
+            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,           =
      \
+                POWERPC_EXCP_TRAP, GETPC());                            =
      \
+        }                                                               =
      \
+    }                                                                   =
      \
+}</pre>
    </blockquote>
    Maybe this macro could be 2 separate helpers so it's easier to
    debug.<br>
    <p>Reviewed-by: Lucas Mateus Castro <a
        class=3D"moz-txt-link-rfc2396E"
        href=3D"mailto:lucas.araujo@eldorado.org.br">
        &lt;lucas.araujo@eldorado.org.br&gt;</a></p>
    <blockquote type=3D"cite"
      cite=3D"mid:20220715205439.161110-3-victor.colombo@eldorado.org.br"=
>
      <pre class=3D"moz-quote-pre" wrap=3D"">
+
+HELPER_HASH(HASHST, env-&gt;spr[SPR_HASHKEYR], true)
+HELPER_HASH(HASHCHK, env-&gt;spr[SPR_HASHKEYR], false)
+
 #if !defined(CONFIG_USER_ONLY)

 #ifdef CONFIG_TCG
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 159b352f6e..5817af632b 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -4,6 +4,8 @@ DEF_HELPER_FLAGS_4(tw, TCG_CALL_NO_WG, void, env, tl, tl,=
 i32)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_4(td, TCG_CALL_NO_WG, void, env, tl, tl, i32)
 #endif
+DEF_HELPER_4(HASHST, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHCHK, void, env, tl, tl, tl)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(store_msr, void, env, tl)
 DEF_HELPER_1(rfi, void, env)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index eb41efc100..544514565c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -172,6 +172,9 @@
 @X_TSX          ...... ..... ra:5 rb:5 .......... .             &amp;X r=
t=3D%x_rt_tsx
 @X_TSXP         ...... ..... ra:5 rb:5 .......... .             &amp;X r=
t=3D%rt_tsxp

+%x_dw           0:1 21:5 !function=3Ddw_compose_ea
+@X_DW           ...... ..... ra:5 rb:5 .......... .             &amp;X r=
t=3D%x_dw
+
 &amp;X_frtp_vrb     frtp vrb
 @X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &amp;X_f=
rtp_vrb frtp=3D%x_frtp

@@ -323,6 +326,11 @@ CNTTZDM         011111 ..... ..... ..... 1000111011 =
-   @X
 PDEPD           011111 ..... ..... ..... 0010011100 -   @X
 PEXTD           011111 ..... ..... ..... 0010111100 -   @X

+# Fixed-Point Hash Instructions
+
+HASHST          011111 ..... ..... ..... 1011010010 .   @X_DW
+HASHCHK         011111 ..... ..... ..... 1011110010 .   @X_DW
+
 ## BCD Assist

 ADDG6S          011111 ..... ..... ..... - 001001010 -  @X
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5a18ee577f..3bdd3e6e3e 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6394,6 +6394,11 @@ static int times_16(DisasContext *ctx, int x)
     return x * 16;
 }

+static int64_t dw_compose_ea(DisasContext *ctx, int x)
+{
+    return deposit64(0xfffffffffffffe00, 3, 6, x);
+}
+
 /*
  * Helpers for trans_* functions to check for specific insns flags.
  * Use token pasting to ensure that we use the proper flag with the
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
index db14d3bebc..41c06de8a2 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -540,3 +540,35 @@ static bool trans_CBCDTD(DisasContext *ctx, arg_X_sa=
 *a)
     gen_helper_CBCDTD(cpu_gpr[a-&gt;ra], cpu_gpr[a-&gt;rs]);
     return true;
 }
+
+static bool do_hash(DisasContext *ctx, arg_X *a, bool priv,
+    void (*helper)(TCGv_ptr, TCGv, TCGv, TCGv))
+{
+    TCGv ea;
+
+    if (!(ctx-&gt;insns_flags2 &amp; PPC2_ISA310)) {
+        /* if version is before v3.1, this operation is a nop */
+        return true;
+    }
+
+    if (priv) {
+        /* if instruction is privileged but the context is in user space=
 */
+        REQUIRE_SV(ctx);
+    }
+
+    if (unlikely(a-&gt;ra =3D=3D 0)) {
+        /* if RA=3D0, the instruction form is invalid */
+        gen_invalid(ctx);
+        return true;
+    }
+
+    ea =3D do_ea_calc(ctx, a-&gt;ra, tcg_constant_tl(a-&gt;rt));
+    helper(cpu_env, ea, cpu_gpr[a-&gt;ra], cpu_gpr[a-&gt;rb]);
+
+    tcg_temp_free(ea);
+
+    return true;
+}
+
+TRANS(HASHST, do_hash, false, gen_helper_HASHST)
+TRANS(HASHCHK, do_hash, false, gen_helper_HASHCHK)
--
2.25.1


</pre>
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

--------------cYilBBLo1hhxS9ZlP63qlS02--

