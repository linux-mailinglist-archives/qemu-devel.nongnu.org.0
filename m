Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7725457898B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:29:10 +0200 (CEST)
Received: from localhost ([::1]:34650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVUT-00042h-9E
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oDVQD-0007bs-C1; Mon, 18 Jul 2022 14:24:50 -0400
Received: from [200.168.210.66] (port=26684 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oDVQA-00043g-K9; Mon, 18 Jul 2022 14:24:44 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 18 Jul 2022 15:23:50 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 1302C800134;
 Mon, 18 Jul 2022 15:23:49 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------IF9e9MDZi0ZnEjMB3oe47Bmw"
Message-ID: <5e506e94-53b8-8e70-53d9-8ef4f3119d8f@eldorado.org.br>
Date: Mon, 18 Jul 2022 15:23:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 3/3] target/ppc: Implement hashstp and hashchkp
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, cohuck@redhat.com,
 farosas@linux.ibm.com
References: <20220715205439.161110-1-victor.colombo@eldorado.org.br>
 <20220715205439.161110-4-victor.colombo@eldorado.org.br>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <20220715205439.161110-4-victor.colombo@eldorado.org.br>
X-OriginalArrivalTime: 18 Jul 2022 18:23:50.0380 (UTC)
 FILETIME=[8728BAC0:01D89AD3]
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
--------------IF9e9MDZi0ZnEjMB3oe47Bmw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UmV2aWV3ZWQtYnk6IEx1Y2FzIE1hdGV1cyBDYXN0cm8gPGx1Y2FzLmFyYXVqb0BlbGRvcmFk
by5vcmcuYnI+DQoNCk9uIDE1LzA3LzIwMjIgMTc6NTQsIFbDrWN0b3IgQ29sb21ibyB3cm90
ZToNCj4gSW1wbGVtZW50YXRpb24gZm9yIGluc3RydWN0aW9ucyBoYXNoc3RwIGFuZCBoYXNo
Y2hrcCwgdGhlIHByaXZpbGVnZWQNCj4gdmVyc2lvbnMgb2YgaGFzaHN0IGFuZCBoYXNoY2hr
LCB3aGljaCB3ZXJlIGFkZGVkIGluIFBvd2VyIElTQSAzLjFCLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBWw61jdG9yIENvbG9tYm88dmljdG9yLmNvbG9tYm9AZWxkb3JhZG8ub3JnLmJyPg0K
PiAtLS0NCj4gICB0YXJnZXQvcHBjL2V4Y3BfaGVscGVyLmMgICAgICAgICAgICAgICAgICAg
fCAyICsrDQo+ICAgdGFyZ2V0L3BwYy9oZWxwZXIuaCAgICAgICAgICAgICAgICAgICAgICAg
IHwgMiArKw0KPiAgIHRhcmdldC9wcGMvaW5zbjMyLmRlY29kZSAgICAgICAgICAgICAgICAg
ICB8IDIgKysNCj4gICB0YXJnZXQvcHBjL3RyYW5zbGF0ZS9maXhlZHBvaW50LWltcGwuYy5p
bmMgfCAyICsrDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4NCj4g
ZGlmZiAtLWdpdCBhL3RhcmdldC9wcGMvZXhjcF9oZWxwZXIuYyBiL3RhcmdldC9wcGMvZXhj
cF9oZWxwZXIuYw0KPiBpbmRleCBmYTVhNzM3ZTIyLi44NDdlZmY5MjEzIDEwMDY0NA0KPiAt
LS0gYS90YXJnZXQvcHBjL2V4Y3BfaGVscGVyLmMNCj4gKysrIGIvdGFyZ2V0L3BwYy9leGNw
X2hlbHBlci5jDQo+IEBAIC0yMjU1LDYgKzIyNTUsOCBAQCB2b2lkIGhlbHBlcl8jI29wKENQ
VVBQQ1N0YXRlICplbnYsIHRhcmdldF91bG9uZyBlYSwgdGFyZ2V0X3Vsb25nIHJhLCAgICAg
ICAgICBcDQo+DQo+ICAgSEVMUEVSX0hBU0goSEFTSFNULCBlbnYtPnNwcltTUFJfSEFTSEtF
WVJdLCB0cnVlKQ0KPiAgIEhFTFBFUl9IQVNIKEhBU0hDSEssIGVudi0+c3ByW1NQUl9IQVNI
S0VZUl0sIGZhbHNlKQ0KPiArSEVMUEVSX0hBU0goSEFTSFNUUCwgZW52LT5zcHJbU1BSX0hB
U0hQS0VZUl0sIHRydWUpDQo+ICtIRUxQRVJfSEFTSChIQVNIQ0hLUCwgZW52LT5zcHJbU1BS
X0hBU0hQS0VZUl0sIGZhbHNlKQ0KPg0KPiAgICNpZiAhZGVmaW5lZChDT05GSUdfVVNFUl9P
TkxZKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3BwYy9oZWxwZXIuaCBiL3RhcmdldC9w
cGMvaGVscGVyLmgNCj4gaW5kZXggNTgxN2FmNjMyYi4uMTIyYjJlOTM1OSAxMDA2NDQNCj4g
LS0tIGEvdGFyZ2V0L3BwYy9oZWxwZXIuaA0KPiArKysgYi90YXJnZXQvcHBjL2hlbHBlci5o
DQo+IEBAIC02LDYgKzYsOCBAQCBERUZfSEVMUEVSX0ZMQUdTXzQodGQsIFRDR19DQUxMX05P
X1dHLCB2b2lkLCBlbnYsIHRsLCB0bCwgaTMyKQ0KPiAgICNlbmRpZg0KPiAgIERFRl9IRUxQ
RVJfNChIQVNIU1QsIHZvaWQsIGVudiwgdGwsIHRsLCB0bCkNCj4gICBERUZfSEVMUEVSXzQo
SEFTSENISywgdm9pZCwgZW52LCB0bCwgdGwsIHRsKQ0KPiArREVGX0hFTFBFUl80KEhBU0hT
VFAsIHZvaWQsIGVudiwgdGwsIHRsLCB0bCkNCj4gK0RFRl9IRUxQRVJfNChIQVNIQ0hLUCwg
dm9pZCwgZW52LCB0bCwgdGwsIHRsKQ0KPiAgICNpZiAhZGVmaW5lZChDT05GSUdfVVNFUl9P
TkxZKQ0KPiAgIERFRl9IRUxQRVJfMihzdG9yZV9tc3IsIHZvaWQsIGVudiwgdGwpDQo+ICAg
REVGX0hFTFBFUl8xKHJmaSwgdm9pZCwgZW52KQ0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Bw
Yy9pbnNuMzIuZGVjb2RlIGIvdGFyZ2V0L3BwYy9pbnNuMzIuZGVjb2RlDQo+IGluZGV4IDU0
NDUxNDU2NWMuLmRhMDg5NjBmY2EgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9wcGMvaW5zbjMy
LmRlY29kZQ0KPiArKysgYi90YXJnZXQvcHBjL2luc24zMi5kZWNvZGUNCj4gQEAgLTMzMCw2
ICszMzAsOCBAQCBQRVhURCAgICAgICAgICAgMDExMTExIC4uLi4uIC4uLi4uIC4uLi4uIDAw
MTAxMTExMDAgLSAgIEBYDQo+DQo+ICAgSEFTSFNUICAgICAgICAgIDAxMTExMSAuLi4uLiAu
Li4uLiAuLi4uLiAxMDExMDEwMDEwIC4gICBAWF9EVw0KPiAgIEhBU0hDSEsgICAgICAgICAw
MTExMTEgLi4uLi4gLi4uLi4gLi4uLi4gMTAxMTExMDAxMCAuICAgQFhfRFcNCj4gK0hBU0hT
VFAgICAgICAgICAwMTExMTEgLi4uLi4gLi4uLi4gLi4uLi4gMTAxMDAxMDAxMCAuICAgQFhf
RFcNCj4gK0hBU0hDSEtQICAgICAgICAwMTExMTEgLi4uLi4gLi4uLi4gLi4uLi4gMTAxMDEx
MDAxMCAuICAgQFhfRFcNCj4NCj4gICAjIyBCQ0QgQXNzaXN0DQo+DQo+IGRpZmYgLS1naXQg
YS90YXJnZXQvcHBjL3RyYW5zbGF0ZS9maXhlZHBvaW50LWltcGwuYy5pbmMgYi90YXJnZXQv
cHBjL3RyYW5zbGF0ZS9maXhlZHBvaW50LWltcGwuYy5pbmMNCj4gaW5kZXggNDFjMDZkZThh
Mi4uMWJhNTZjYmVkNSAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L3BwYy90cmFuc2xhdGUvZml4
ZWRwb2ludC1pbXBsLmMuaW5jDQo+ICsrKyBiL3RhcmdldC9wcGMvdHJhbnNsYXRlL2ZpeGVk
cG9pbnQtaW1wbC5jLmluYw0KPiBAQCAtNTcyLDMgKzU3Miw1IEBAIHN0YXRpYyBib29sIGRv
X2hhc2goRGlzYXNDb250ZXh0ICpjdHgsIGFyZ19YICphLCBib29sIHByaXYsDQo+DQo+ICAg
VFJBTlMoSEFTSFNULCBkb19oYXNoLCBmYWxzZSwgZ2VuX2hlbHBlcl9IQVNIU1QpDQo+ICAg
VFJBTlMoSEFTSENISywgZG9faGFzaCwgZmFsc2UsIGdlbl9oZWxwZXJfSEFTSENISykNCj4g
K1RSQU5TKEhBU0hTVFAsIGRvX2hhc2gsIHRydWUsIGdlbl9oZWxwZXJfSEFTSFNUUCkNCj4g
K1RSQU5TKEhBU0hDSEtQLCBkb19oYXNoLCB0cnVlLCBnZW5faGVscGVyX0hBU0hDSEtQKQ0K
PiAtLQ0KPiAyLjI1LjENCj4NCj4NCi0tIA0KTHVjYXMgTWF0ZXVzIE0uIEFyYXVqbyBlIENh
c3Rybw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETyANCjxodHRwczovL3d3dy5l
bGRvcmFkby5vcmcuYnIvP3V0bV9jYW1wYWlnbj1hc3NpbmF0dXJhX2RlX2UtbWFpbCZ1dG1f
bWVkaXVtPWVtYWlsJnV0bV9zb3VyY2U9UkQrU3RhdGlvbj4NCkRlcGFydGFtZW50byBDb21w
dXRhw6fDo28gRW1iYXJjYWRhDQpBbmFsaXN0YSBkZSBTb2Z0d2FyZSBUcmFpbmVlDQpBdmlz
byBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNj
bGFpbWVyLmh0bWw+DQo=
--------------IF9e9MDZi0ZnEjMB3oe47Bmw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Reviewed-by: Lucas Mateus Castro <a
        class=3D"moz-txt-link-rfc2396E"
        href=3D"mailto:lucas.araujo@eldorado.org.br">
        &lt;lucas.araujo@eldorado.org.br&gt;</a></p>
    <div class=3D"moz-cite-prefix">On 15/07/2022 17:54, V=C3=ADctor Colom=
bo
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20220715205439.161110-4-victor.colombo@eldorado.org.br"=
>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Implementation for instructions hashstp and hashchkp, the privileged
versions of hashst and hashchk, which were added in Power ISA 3.1B.

Signed-off-by: V=C3=ADctor Colombo <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:victor.colombo@eldorado.org.br">&lt;victor.colombo@eldorado.o=
rg.br&gt;</a>
---
 target/ppc/excp_helper.c                   | 2 ++
 target/ppc/helper.h                        | 2 ++
 target/ppc/insn32.decode                   | 2 ++
 target/ppc/translate/fixedpoint-impl.c.inc | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index fa5a737e22..847eff9213 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2255,6 +2255,8 @@ void helper_##op(CPUPPCState *env, target_ulong ea,=
 target_ulong ra,          \

 HELPER_HASH(HASHST, env-&gt;spr[SPR_HASHKEYR], true)
 HELPER_HASH(HASHCHK, env-&gt;spr[SPR_HASHKEYR], false)
+HELPER_HASH(HASHSTP, env-&gt;spr[SPR_HASHPKEYR], true)
+HELPER_HASH(HASHCHKP, env-&gt;spr[SPR_HASHPKEYR], false)

 #if !defined(CONFIG_USER_ONLY)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 5817af632b..122b2e9359 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -6,6 +6,8 @@ DEF_HELPER_FLAGS_4(td, TCG_CALL_NO_WG, void, env, tl, tl,=
 i32)
 #endif
 DEF_HELPER_4(HASHST, void, env, tl, tl, tl)
 DEF_HELPER_4(HASHCHK, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHSTP, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHCHKP, void, env, tl, tl, tl)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(store_msr, void, env, tl)
 DEF_HELPER_1(rfi, void, env)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 544514565c..da08960fca 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -330,6 +330,8 @@ PEXTD           011111 ..... ..... ..... 0010111100 -=
   @X

 HASHST          011111 ..... ..... ..... 1011010010 .   @X_DW
 HASHCHK         011111 ..... ..... ..... 1011110010 .   @X_DW
+HASHSTP         011111 ..... ..... ..... 1010010010 .   @X_DW
+HASHCHKP        011111 ..... ..... ..... 1010110010 .   @X_DW

 ## BCD Assist

diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
index 41c06de8a2..1ba56cbed5 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -572,3 +572,5 @@ static bool do_hash(DisasContext *ctx, arg_X *a, bool=
 priv,

 TRANS(HASHST, do_hash, false, gen_helper_HASHST)
 TRANS(HASHCHK, do_hash, false, gen_helper_HASHCHK)
+TRANS(HASHSTP, do_hash, true, gen_helper_HASHSTP)
+TRANS(HASHCHKP, do_hash, true, gen_helper_HASHCHKP)
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

--------------IF9e9MDZi0ZnEjMB3oe47Bmw--

