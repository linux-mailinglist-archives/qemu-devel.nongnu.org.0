Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A21A57895E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:13:13 +0200 (CEST)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVF1-0000Gm-UD
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oDVAl-0004Zy-0E; Mon, 18 Jul 2022 14:08:47 -0400
Received: from [200.168.210.66] (port=14968 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oDVAi-0000qI-N7; Mon, 18 Jul 2022 14:08:46 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 18 Jul 2022 15:08:40 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 9B454800134;
 Mon, 18 Jul 2022 15:08:39 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------PLYFjQBET4j6SW1u0WLZFqGb"
Message-ID: <f0215b5b-6cf5-5ecc-7b8b-502fe827d83e@eldorado.org.br>
Date: Mon, 18 Jul 2022 15:08:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 1/3] target/ppc: Add HASHKEYR and HASHPKEYR SPRs
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, cohuck@redhat.com,
 farosas@linux.ibm.com
References: <20220715205439.161110-1-victor.colombo@eldorado.org.br>
 <20220715205439.161110-2-victor.colombo@eldorado.org.br>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <20220715205439.161110-2-victor.colombo@eldorado.org.br>
X-OriginalArrivalTime: 18 Jul 2022 18:08:40.0081 (UTC)
 FILETIME=[68942010:01D89AD1]
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
--------------PLYFjQBET4j6SW1u0WLZFqGb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUvMDcvMjAyMiAxNzo1NCwgVsOtY3RvciBDb2xvbWJvIHdyb3RlOg0KPiBBZGQgdGhl
IFNwZWNpYWwgUHVycG9zZSBSZWdpc3RlcnMgSEFTSEtFWVIgYW5kIEhBU0hQS0VZUiwgd2hp
Y2ggd2VyZQ0KPiBpbnRyb2R1Y2VkIGJ5IHRoZSBQb3dlciBJU0EgMy4xQi4gVGhleSBhcmUg
dXNlZCBieSB0aGUgbmV3IGluc3RydWN0aW9ucw0KPiBoYXNoY2hrKHApIGFuZCBoYXNoc3Qo
cCkuDQo+DQo+IFRoZSBJU0Egc3RhdGVzIHRoYXQgdGhlIE9wZXJhdGluZyBTeXN0ZW0gc2hv
dWxkIGdlbmVyYXRlIHRoZSB2YWx1ZSBmb3INCj4gdGhlc2UgcmVnaXN0ZXJzIHdoZW4gY3Jl
YXRpbmcgYSBwcm9jZXNzLCBzbyBpdCdzIGl0cyByZXNwb25zYWJpbGl0eSB0bw0KPiBkbyBz
by4gV2UgaW5pdGlhbGl6ZSBpdCB3aXRoIDAgZm9yIHFlbXUtc29mdG1tdSwgYW5kIHNldCBh
IHJhbmRvbSA2NA0KPiBiaXRzIHZhbHVlIGZvciBsaW51eC11c2VyLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBWw61jdG9yIENvbG9tYm88dmljdG9yLmNvbG9tYm9AZWxkb3JhZG8ub3JnLmJy
Pg0KPiAtLS0NCg0KUmV2aWV3ZWQtYnk6IEx1Y2FzIE1hdGV1cyBDYXN0cm8gPGx1Y2FzLmFy
YXVqb0BlbGRvcmFkby5vcmcuYnI+DQoNCj4NCj4gSXMgdGhlIHdheSBJIGRpZCB0aGUgcmFu
ZG9tIG51bWJlciBnZW5lcmF0aW9uIG9rPw0KPg0KPiAtLS0NCj4gICB0YXJnZXQvcHBjL2Nw
dS5oICAgICAgfCAgMiArKw0KPiAgIHRhcmdldC9wcGMvY3B1X2luaXQuYyB8IDI4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2Vy
dGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9wcGMvY3B1LmggYi90YXJnZXQv
cHBjL2NwdS5oDQo+IGluZGV4IGE0Yzg5M2NmYWQuLjQ1NTFkODFiNWYgMTAwNjQ0DQo+IC0t
LSBhL3RhcmdldC9wcGMvY3B1LmgNCj4gKysrIGIvdGFyZ2V0L3BwYy9jcHUuaA0KPiBAQCAt
MTY3Niw2ICsxNjc2LDggQEAgdm9pZCBwcGNfY29tcGF0X2FkZF9wcm9wZXJ0eShPYmplY3Qg
Km9iaiwgY29uc3QgY2hhciAqbmFtZSwNCj4gICAjZGVmaW5lIFNQUl9CT09LRV9HSVZPUjE0
ICAgICAoMHgxQkQpDQo+ICAgI2RlZmluZSBTUFJfVElSICAgICAgICAgICAgICAgKDB4MUJF
KQ0KPiAgICNkZWZpbmUgU1BSX1BUQ1IgICAgICAgICAgICAgICgweDFEMCkNCj4gKyNkZWZp
bmUgU1BSX0hBU0hLRVlSICAgICAgICAgICgweDFENCkNCj4gKyNkZWZpbmUgU1BSX0hBU0hQ
S0VZUiAgICAgICAgICgweDFENSkNCj4gICAjZGVmaW5lIFNQUl9CT09LRV9TUEVGU0NSICAg
ICAoMHgyMDApDQo+ICAgI2RlZmluZSBTUFJfRXh4eF9CQkVBUiAgICAgICAgKDB4MjAxKQ0K
PiAgICNkZWZpbmUgU1BSX0V4eHhfQkJUQVIgICAgICAgICgweDIwMikNCj4gZGlmZiAtLWdp
dCBhL3RhcmdldC9wcGMvY3B1X2luaXQuYyBiL3RhcmdldC9wcGMvY3B1X2luaXQuYw0KPiBp
bmRleCBkMTQ5M2E2NjBjLi4yOWM3NzUyNDgzIDEwMDY0NA0KPiAtLS0gYS90YXJnZXQvcHBj
L2NwdV9pbml0LmMNCj4gKysrIGIvdGFyZ2V0L3BwYy9jcHVfaW5pdC5jDQo+IEBAIC01NzAw
LDYgKzU3MDAsMzMgQEAgc3RhdGljIHZvaWQgcmVnaXN0ZXJfcG93ZXI5X21tdV9zcHJzKENQ
VVBQQ1N0YXRlICplbnYpDQo+ICAgI2VuZGlmDQo+ICAgfQ0KPg0KPiArc3RhdGljIHZvaWQg
cmVnaXN0ZXJfcG93ZXIxMF9oYXNoX3NwcnMoQ1BVUFBDU3RhdGUgKmVudikNCj4gK3sNCj4g
KyAgICAvKg0KPiArICAgICAqIGl0J3MgdGhlIE9TIHJlc3BvbnNhYmlsaXR5IHRvIGdlbmVy
YXRlIGEgcmFuZG9tIHZhbHVlIGZvciB0aGUgcmVnaXN0ZXJzDQo+ICsgICAgICogaW4gZWFj
aCBwcm9jZXNzJyBjb250ZXh0LiBTbywgaW5pdGlhbGl6ZSBpdCB3aXRoIDAgaGVyZS4NCj4g
KyAgICAgKi8NCj4gKyAgICB1aW50NjRfdCBoYXNoa2V5cl9pbml0aWFsX3ZhbHVlID0gMCwg
aGFzaHBrZXlyX2luaXRpYWxfdmFsdWUgPSAwOw0KPiArI2lmIGRlZmluZWQoQ09ORklHX1VT
RVJfT05MWSkNCj4gKyAgICAvKiBpbiBsaW51eC11c2VyLCBzZXR1cCB0aGUgaGFzaCByZWdp
c3RlciB3aXRoIGEgcmFuZG9tIHZhbHVlICovDQo+ICsgICAgR1JhbmQgKnJhbmQgPSBnX3Jh
bmRfbmV3KCk7DQo+ICsgICAgaGFzaGtleXJfaW5pdGlhbF92YWx1ZSA9DQo+ICsgICAgICAg
ICgodWludDY0X3QpZ19yYW5kX2ludChyYW5kKSA8PCAzMikgfCAodWludDY0X3QpZ19yYW5k
X2ludChyYW5kKTsNCj4gKyAgICBoYXNocGtleXJfaW5pdGlhbF92YWx1ZSA9DQo+ICsgICAg
ICAgICgodWludDY0X3QpZ19yYW5kX2ludChyYW5kKSA8PCAzMikgfCAodWludDY0X3QpZ19y
YW5kX2ludChyYW5kKTsNCj4gKyAgICBnX3JhbmRfZnJlZShyYW5kKTsNCj4gKyNlbmRpZg0K
PiArICAgIHNwcl9yZWdpc3RlcihlbnYsIFNQUl9IQVNIS0VZUiwgIkhBU0hLRVlSIiwNCj4g
KyAgICAgICAgICAgIFNQUl9OT0FDQ0VTUywgU1BSX05PQUNDRVNTLA0KPiArICAgICAgICAg
ICAgJnNwcl9yZWFkX2dlbmVyaWMsICZzcHJfd3JpdGVfZ2VuZXJpYywNCj4gKyAgICAgICAg
ICAgIGhhc2hrZXlyX2luaXRpYWxfdmFsdWUpOw0KPiArICAgIHNwcl9yZWdpc3Rlcl9odihl
bnYsIFNQUl9IQVNIUEtFWVIsICJIQVNIUEtFWVIiLA0KPiArICAgICAgICAgICAgU1BSX05P
QUNDRVNTLCBTUFJfTk9BQ0NFU1MsDQo+ICsgICAgICAgICAgICBTUFJfTk9BQ0NFU1MsIFNQ
Ul9OT0FDQ0VTUywNCj4gKyAgICAgICAgICAgICZzcHJfcmVhZF9nZW5lcmljLCAmc3ByX3dy
aXRlX2dlbmVyaWMsDQo+ICsgICAgICAgICAgICBoYXNocGtleXJfaW5pdGlhbF92YWx1ZSk7
DQo+ICt9DQo+ICsNCj4gICAvKg0KPiAgICAqIEluaXRpYWxpemUgUE1VIGNvdW50ZXIgb3Zl
cmZsb3cgdGltZXJzIGZvciBQb3dlcjggYW5kDQo+ICAgICogbmV3ZXIgUG93ZXIgY2hpcHMg
d2hlbiB1c2luZyBUQ0cuDQo+IEBAIC02NDg0LDYgKzY1MTEsNyBAQCBzdGF0aWMgdm9pZCBp
bml0X3Byb2NfUE9XRVIxMChDUFVQUENTdGF0ZSAqZW52KQ0KPiAgICAgICByZWdpc3Rlcl9w
b3dlcjhfYm9vazRfc3BycyhlbnYpOw0KPiAgICAgICByZWdpc3Rlcl9wb3dlcjhfcnByX3Nw
cnMoZW52KTsNCj4gICAgICAgcmVnaXN0ZXJfcG93ZXI5X21tdV9zcHJzKGVudik7DQo+ICsg
ICAgcmVnaXN0ZXJfcG93ZXIxMF9oYXNoX3NwcnMoZW52KTsNCj4NCj4gICAgICAgLyogRklY
TUU6IEZpbHRlciBmaWVsZHMgcHJvcGVybHkgYmFzZWQgb24gcHJpdmlsZWdlIGxldmVsICov
DQo+ICAgICAgIHNwcl9yZWdpc3Rlcl9rdm1faHYoZW52LCBTUFJfUFNTQ1IsICJQU1NDUiIs
IE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsDQo+IC0tDQo+IDIuMjUuMQ0KPg0KPg0KLS0gDQpM
dWNhcyBNYXRldXMgTS4gQXJhdWpvIGUgQ2FzdHJvDQpJbnN0aXR1dG8gZGUgUGVzcXVpc2Fz
IEVMRE9SQURPIA0KPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici8/dXRtX2NhbXBhaWdu
PWFzc2luYXR1cmFfZGVfZS1tYWlsJnV0bV9tZWRpdW09ZW1haWwmdXRtX3NvdXJjZT1SRCtT
dGF0aW9uPg0KRGVwYXJ0YW1lbnRvIENvbXB1dGHDp8OjbyBFbWJhcmNhZGENCkFuYWxpc3Rh
IGRlIFNvZnR3YXJlIFRyYWluZWUNCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6
Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==
--------------PLYFjQBET4j6SW1u0WLZFqGb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    On 15/07/2022 17:54, V=C3=ADctor Colombo wrote:<br>
    <blockquote type=3D"cite"
      cite=3D"mid:20220715205439.161110-2-victor.colombo@eldorado.org.br"=
>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Add the Special Purpose Registers HASHKEYR and HASHPKEYR, which were
introduced by the Power ISA 3.1B. They are used by the new instructions
hashchk(p) and hashst(p).

The ISA states that the Operating System should generate the value for
these registers when creating a process, so it's its responsability to
do so. We initialize it with 0 for qemu-softmmu, and set a random 64
bits value for linux-user.

Signed-off-by: V=C3=ADctor Colombo <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:victor.colombo@eldorado.org.br">&lt;victor.colombo@eldorado.o=
rg.br&gt;</a>
---</pre>
    </blockquote>
    <p>Reviewed-by: Lucas Mateus Castro
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lucas.araujo@eldo=
rado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a><br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20220715205439.161110-2-victor.colombo@eldorado.org.br"=
>
      <pre class=3D"moz-quote-pre" wrap=3D"">

Is the way I did the random number generation ok?

---
 target/ppc/cpu.h      |  2 ++
 target/ppc/cpu_init.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index a4c893cfad..4551d81b5f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1676,6 +1676,8 @@ void ppc_compat_add_property(Object *obj, const cha=
r *name,
 #define SPR_BOOKE_GIVOR14     (0x1BD)
 #define SPR_TIR               (0x1BE)
 #define SPR_PTCR              (0x1D0)
+#define SPR_HASHKEYR          (0x1D4)
+#define SPR_HASHPKEYR         (0x1D5)
 #define SPR_BOOKE_SPEFSCR     (0x200)
 #define SPR_Exxx_BBEAR        (0x201)
 #define SPR_Exxx_BBTAR        (0x202)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d1493a660c..29c7752483 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5700,6 +5700,33 @@ static void register_power9_mmu_sprs(CPUPPCState *=
env)
 #endif
 }

+static void register_power10_hash_sprs(CPUPPCState *env)
+{
+    /*
+     * it's the OS responsability to generate a random value for the reg=
isters
+     * in each process' context. So, initialize it with 0 here.
+     */
+    uint64_t hashkeyr_initial_value =3D 0, hashpkeyr_initial_value =3D 0=
;
+#if defined(CONFIG_USER_ONLY)
+    /* in linux-user, setup the hash register with a random value */
+    GRand *rand =3D g_rand_new();
+    hashkeyr_initial_value =3D
+        ((uint64_t)g_rand_int(rand) &lt;&lt; 32) | (uint64_t)g_rand_int(=
rand);
+    hashpkeyr_initial_value =3D
+        ((uint64_t)g_rand_int(rand) &lt;&lt; 32) | (uint64_t)g_rand_int(=
rand);
+    g_rand_free(rand);
+#endif
+    spr_register(env, SPR_HASHKEYR, "HASHKEYR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            &amp;spr_read_generic, &amp;spr_write_generic,
+            hashkeyr_initial_value);
+    spr_register_hv(env, SPR_HASHPKEYR, "HASHPKEYR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            SPR_NOACCESS, SPR_NOACCESS,
+            &amp;spr_read_generic, &amp;spr_write_generic,
+            hashpkeyr_initial_value);
+}
+
 /*
  * Initialize PMU counter overflow timers for Power8 and
  * newer Power chips when using TCG.
@@ -6484,6 +6511,7 @@ static void init_proc_POWER10(CPUPPCState *env)
     register_power8_book4_sprs(env);
     register_power8_rpr_sprs(env);
     register_power9_mmu_sprs(env);
+    register_power10_hash_sprs(env);

     /* FIXME: Filter fields properly based on privilege level */
     spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,=

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

--------------PLYFjQBET4j6SW1u0WLZFqGb--

