Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028F58AE9E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:06:07 +0200 (CEST)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK0lx-0001oD-D8
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oK0gQ-0005aj-9L; Fri, 05 Aug 2022 13:00:23 -0400
Received: from [200.168.210.66] (port=37684 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oK0gJ-0007hS-7v; Fri, 05 Aug 2022 13:00:18 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 5 Aug 2022 14:00:10 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 1AED7800358;
 Fri,  5 Aug 2022 14:00:09 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------GFi2thSDb0BE10ialGLC04fa"
Message-ID: <1b75ba38-de8a-fbcc-1d22-14dbffacc6c2@eldorado.org.br>
Date: Fri, 5 Aug 2022 14:00:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] Floating-point OE/UE exception bug
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-ppc@nongnu.org, richard.henderson@linaro.org, danielhb413@gmail.com, 
 qemu-devel@nongnu.org
References: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
 <87pmhemzh9.fsf@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <87pmhemzh9.fsf@linaro.org>
X-OriginalArrivalTime: 05 Aug 2022 17:00:10.0406 (UTC)
 FILETIME=[D274FC60:01D8A8EC]
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
--------------GFi2thSDb0BE10ialGLC04fa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAwNS8wOC8yMDIyIDEzOjIwLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+ICJMdWNhcyBN
YXRldXMgQ2FzdHJvKGFscW90ZWwpIjxsdWNhcy5hcmF1am9AZWxkb3JhZG8ub3JnLmJyPiAg
d3JpdGVzOg0KPg0KPj4gRnJvbTogIkx1Y2FzIE1hdGV1cyBDYXN0cm8gKGFscW90ZWwpIjxs
dWNhcy5hcmF1am9AZWxkb3JhZG8ub3JnLmJyPg0KPj4NCj4+IENoYW5nZXMgaW4gdjI6DQo+
PiAgICAgIC0gQ29tcGxldGVseSByZXdvcmtlZCB0aGUgc29sdXRpb246DQo+PiAgICAgICAg
ICAqIENyZWF0ZWQgcmVfYmlhcyBpbiBGbG9hdEZtdCwgaXQgaXMgMy80IG9mIHRoZSB0b3Rh
bCBleHBvbmVudA0KPj4gICAgICAgICAgICByYW5nZSBvZiBhIEZQIHR5cGUNCj4gSSB0aG91
Z2h0IHRoaXMgbWlnaHQgaGF2ZSBhbiBlZmZlY3Qgb24gdGhlIGVmZmljaWVuY3kgb2YgdGhl
IEZsb2F0Rm10DQo+IGV4dHJhY3Rpb24vcGFja2luZyBidXQgSSBjb3VsZG4ndCBzZWUgYW55
IHJlYWwgZGlmZmVyZW5jZSBpbiBmcGJlbmNoLiBJDQo+IGRvdWJ0IHRoZSBjb21waWxlciBj
YW4gZGVhZCBjb2RlIGl0IGF3YXkgaWYgbm90IHVzZWQgYnkgYSBmcm9udC1lbmQuDQo+DQo+
IEFueXdheSBoYXZlIGE6DQo+DQo+IFJldmlld2VkLWJ5OiBBbGV4IEJlbm7DqWU8YWxleC5i
ZW5uZWVAbGluYXJvLm9yZz4NCj4NCj4gZm9yIHRoZSBzZXJpZXMuDQo+DQo+PiAgICAgICAg
ICAqIEFkZGVkIHJlYmlhcyBib29scyB0aGF0IGRpY3RhdGVzIGlmIHRoZSByZXN1bHQgc2hv
dWxkIGhhdmUNCj4+ICAgICAgICAgICAgaXRzIGV4cG9uZW50IGFkZC9zdWJ0cmFjdCB0aGUg
cmVfYmlhcyB2YWx1ZSBpZiBhbg0KPj4gICAgICAgICAgICBvdmVyZmxvdy91bmRlcmZsb3cg
b2NjdXJzLg0KPj4gICAgICAgICAgKiBwcGNfc3RvcmVfZnBzY3Igc2V0cy91bnNldHMgcmVi
aWFzIGlmIE9FL1VFIGlzIHNldC91bnNldA0KPj4NCj4+IFRoZSBQb3dlcklTQSBkZWZpbmVz
IHRoYXQgaWYgYW4gb3ZlcmZsb3cgZXhjZXB0aW9uIGhhcHBlbiB3aXRoIEZQU0NSLk9FDQo+
PiBzZXQsIHRoZSBleHBvbmVudCBvZiB0aGUgaW50ZXJtZWRpYXRlIHJlc3VsdCBpcyBzdWJ0
cmFjdGVkIDE1MzYgaW4NCj4+IGRvdWJsZSBwcmVjaXNpb24gb3BlcmF0aW9ucyBhbmQgaXMg
YWRkZWQgMTUzNiBpbiBhbiB1bmRlcmZsb3cgZXhjZXB0aW9uLA0KPj4gY3VycmVudGx5IHRo
aXMgYmVoYXZpb3IgaXMgbm90IFFFTVUncyBiZWhhdmlvciwgdGhpcyBwYXRjaCBzZXJpZXMg
Zml4ZXMNCj4+IHRoYXQuDQo+Pg0KPj4gQ3VycmVudGx5IHRoZXJlJ3Mgbm8gdGVzdCBpbiB0
aGlzIHBhdGNoIHNlcmllcyBhcyB0aGVyZSdzIG5vIHdheSB0bw0KPj4gZGlzYWJsZSBNU1Iu
RkUwIGFuZCBNU1IuRkUxIGluIGxpbnV4IHVzZXIsIHNvIGFueSBvdmVyZmxvdy91bmRlcmZs
b3cNCj4+IGV4Y2VwdGlvbiB3aXRoIE9FL1VFIHNldCBjYXVzZXMgYSB0cmFwcGluZyBleGNl
cHRpb24uDQo+IENvdWxkIHlvdSBkbyBpdCB3aXRoIGEgc3lzdGVtIG1vZGUgdGVzdD8gUHJv
YmFibHkgb3ZlcmtpbGwgZm9yIHRoaXMNCj4gdGhvdWdoLiBJIHN1c3BlY3QgdHdlYWtpbmcg
dGVzdGZsb2F0IHdvdWxkIGJlIHRyaWNreS4NCg0KTWF0aGV1cyBjdXJyZW50bHkgaGFzIGEg
cGF0Y2ggdG8gZW5hYmxlIHByY3RsLCBpdCBzdGlsbCBuZWVkcyB0byBjaGFuZ2UgDQpzb21l
IHBsYWNlcyB0aGF0IGhhdmUgaGFyZGNvZGVkIHZhbHVlcyBmb3IgbGludXgtdXNlciANCiho
dHRwczovL2dpdGh1Yi5jb20vUFBDNjQvcWVtdS90cmVlL2FscW90ZWwtZmVyc3QtcHJjdGwt
cGF0Y2ggaGFzIA0KTWF0aGV1cycgcGF0Y2ggYW5kIGEgcGF0Y2ggdG8gcmVtb3ZlIHRoZSBp
ZmRlZiBmcm9tIGZwX2V4Y2VwdGlvbnNfZW5hYmxlZCkuDQoNCldpdGggdGhhdCBjaGFuZ2Ug
aXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGNyZWF0ZSBhIG5vcm1hbCB0ZXN0IGZvciB0aGlz
IA0KKEkgc2VudCBhIGJhc2ljIG9uZSBhbG9uZyB3aXRoIHYxLCANCk1lc3NhZ2UtSWQ9PDIw
MjIwODAzMTI0MzI0LjIzNTkzLTEtbHVjYXMuYXJhdWpvQGVsZG9yYWRvLm9yZy5icj4pIGJ1
aWx0IA0Kb24gdG9wIG9mIHRoYXQgYnJhbmNoLg0KDQpUaGFua3MsDQoNCj4+IEx1Y2FzIE1h
dGV1cyBDYXN0cm8gKGFscW90ZWwpICgyKToNCj4+ICAgIGZwdTogQWRkIHJlYmlhcyBib29s
LCB2YWx1ZSBhbmQgb3BlcmF0aW9uDQo+PiAgICB0YXJnZXQvcHBjOiBCdWdmaXggRlAgd2hl
biBPRS9VRSBhcmUgc2V0DQo+Pg0KPj4gICBmcHUvc29mdGZsb2F0LXBhcnRzLmMuaW5jICAg
ICB8IDIxICsrKysrKysrKysrKysrKysrKystLQ0KPj4gICBmcHUvc29mdGZsb2F0LmMgICAg
ICAgICAgICAgICB8ICAyICsrDQo+PiAgIGluY2x1ZGUvZnB1L3NvZnRmbG9hdC10eXBlcy5o
IHwgIDQgKysrKw0KPj4gICB0YXJnZXQvcHBjL2NwdS5jICAgICAgICAgICAgICB8ICAyICsr
DQo+PiAgIHRhcmdldC9wcGMvZnB1X2hlbHBlci5jICAgICAgIHwgIDIgLS0NCj4+ICAgNSBm
aWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPg0KPiAt
LQ0KPiBBbGV4IEJlbm7DqWUNCi0tIA0KTHVjYXMgTWF0ZXVzIE0uIEFyYXVqbyBlIENhc3Ry
bw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETyANCjxodHRwczovL3d3dy5lbGRv
cmFkby5vcmcuYnIvP3V0bV9jYW1wYWlnbj1hc3NpbmF0dXJhX2RlX2UtbWFpbCZ1dG1fbWVk
aXVtPWVtYWlsJnV0bV9zb3VyY2U9UkQrU3RhdGlvbj4NCkRlcGFydGFtZW50byBDb21wdXRh
w6fDo28gRW1iYXJjYWRhDQpBbmFsaXN0YSBkZSBTb2Z0d2FyZSBUcmFpbmVlDQpBdmlzbyBM
ZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFp
bWVyLmh0bWw+DQo=
--------------GFi2thSDb0BE10ialGLC04fa
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
    <div class=3D"moz-cite-prefix">On 05/08/2022 13:20, Alex Benn=C3=A9e =
wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:87pmhemzh9.fsf@linaro.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
"Lucas Mateus Castro(alqotel)" <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt=
;</a> writes:

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">From: "Lucas Mateus Castro=
 (alqotel)" <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lucas.arauj=
o@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>

Changes in v2:
    - Completely reworked the solution:
        * Created re_bias in FloatFmt, it is 3/4 of the total exponent
          range of a FP type
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I thought this might have an effect on the efficiency of the FloatFmt
extraction/packing but I couldn't see any real difference in fpbench. I
doubt the compiler can dead code it away if not used by a front-end.

Anyway have a:

Reviewed-by: Alex Benn=C3=A9e <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:alex.bennee@linaro.org">&lt;alex.bennee@linaro.org&gt;</a>

for the series.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">        * Added rebias boo=
ls that dictates if the result should have
          its exponent add/subtract the re_bias value if an
          overflow/underflow occurs.
        * ppc_store_fpscr sets/unsets rebias if OE/UE is set/unset

The PowerISA defines that if an overflow exception happen with FPSCR.OE
set, the exponent of the intermediate result is subtracted 1536 in
double precision operations and is added 1536 in an underflow exception,
currently this behavior is not QEMU's behavior, this patch series fixes
that.

Currently there's no test in this patch series as there's no way to
disable MSR.FE0 and MSR.FE1 in linux user, so any overflow/underflow
exception with OE/UE set causes a trapping exception.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Could you do it with a system mode test? Probably overkill for this
though. I suspect tweaking testfloat would be tricky.</pre>
    </blockquote>
    <p>Matheus currently has a patch to enable prctl, it still needs to
      change some places that have hardcoded values for linux-user
      (<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/PPC6=
4/qemu/tree/alqotel-ferst-prctl-patch">https://github.com/PPC64/qemu/tree=
/alqotel-ferst-prctl-patch</a> has
      Matheus' patch and a patch to remove the ifdef from
      fp_exceptions_enabled).</p>
    <p>With that change it should be possible to create a normal test
      for this (I sent a basic one along with v1,
      Message-Id=3D<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:2022=
0803124324.23593-1-lucas.araujo@eldorado.org.br">&lt;20220803124324.23593=
-1-lucas.araujo@eldorado.org.br&gt;</a>)
      built on top of that branch.</p>
    <p>Thanks,<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:87pmhemzh9.fsf@linaro.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Lucas Mateus Castro (alqotel) (2):
  fpu: Add rebias bool, value and operation
  target/ppc: Bugfix FP when OE/UE are set

 fpu/softfloat-parts.c.inc     | 21 +++++++++++++++++++--
 fpu/softfloat.c               |  2 ++
 include/fpu/softfloat-types.h |  4 ++++
 target/ppc/cpu.c              |  2 ++
 target/ppc/fpu_helper.c       |  2 --
 5 files changed, 27 insertions(+), 4 deletions(-)
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">

--
Alex Benn=C3=A9e
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

--------------GFi2thSDb0BE10ialGLC04fa--

