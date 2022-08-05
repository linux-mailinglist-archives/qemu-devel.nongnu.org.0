Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D3D58AE9F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:06:41 +0200 (CEST)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK0mU-0002qf-PJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oK0iR-0006lP-8d; Fri, 05 Aug 2022 13:02:31 -0400
Received: from [200.168.210.66] (port=65126 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oK0iP-00081a-56; Fri, 05 Aug 2022 13:02:26 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 5 Aug 2022 14:02:23 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id A44FB800358;
 Fri,  5 Aug 2022 14:02:22 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------0LCMf4oE0FVmfky8KbHWv8MF"
Message-ID: <9ba49347-2b16-4679-794a-7ec586fbeab6@eldorado.org.br>
Date: Fri, 5 Aug 2022 14:02:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] Floating-point OE/UE exception bug
Content-Language: en-US
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, danielhb413@gmail.com
References: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 05 Aug 2022 17:02:23.0054 (UTC)
 FILETIME=[218576E0:01D8A8ED]
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
--------------0LCMf4oE0FVmfky8KbHWv8MF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SXQncyBtaXNzaW5nIGZyb20gdGhlIHRpdGxlIGJ1dCB0aGlzIGlzIGEgdjIuDQoNCnYxIGlk
Og0KTWVzc2FnZS1JZDogPDIwMjIwODAzMTIyMjE3LjIwODQ3LTEtbHVjYXMuYXJhdWpvQGVs
ZG9yYWRvLm9yZy5icj4NCg0KT24gMDUvMDgvMjAyMiAxMToxNSwgTHVjYXMgTWF0ZXVzIENh
c3RybyhhbHFvdGVsKSB3cm90ZToNCj4gRnJvbTogIkx1Y2FzIE1hdGV1cyBDYXN0cm8gKGFs
cW90ZWwpIjxsdWNhcy5hcmF1am9AZWxkb3JhZG8ub3JnLmJyPg0KPg0KPiBDaGFuZ2VzIGlu
IHYyOg0KPiAgICAgIC0gQ29tcGxldGVseSByZXdvcmtlZCB0aGUgc29sdXRpb246DQo+ICAg
ICAgICAgICogQ3JlYXRlZCByZV9iaWFzIGluIEZsb2F0Rm10LCBpdCBpcyAzLzQgb2YgdGhl
IHRvdGFsIGV4cG9uZW50DQo+ICAgICAgICAgICAgcmFuZ2Ugb2YgYSBGUCB0eXBlDQo+ICAg
ICAgICAgICogQWRkZWQgcmViaWFzIGJvb2xzIHRoYXQgZGljdGF0ZXMgaWYgdGhlIHJlc3Vs
dCBzaG91bGQgaGF2ZQ0KPiAgICAgICAgICAgIGl0cyBleHBvbmVudCBhZGQvc3VidHJhY3Qg
dGhlIHJlX2JpYXMgdmFsdWUgaWYgYW4NCj4gICAgICAgICAgICBvdmVyZmxvdy91bmRlcmZs
b3cgb2NjdXJzLg0KPiAgICAgICAgICAqIHBwY19zdG9yZV9mcHNjciBzZXRzL3Vuc2V0cyBy
ZWJpYXMgaWYgT0UvVUUgaXMgc2V0L3Vuc2V0DQo+DQo+IFRoZSBQb3dlcklTQSBkZWZpbmVz
IHRoYXQgaWYgYW4gb3ZlcmZsb3cgZXhjZXB0aW9uIGhhcHBlbiB3aXRoIEZQU0NSLk9FDQo+
IHNldCwgdGhlIGV4cG9uZW50IG9mIHRoZSBpbnRlcm1lZGlhdGUgcmVzdWx0IGlzIHN1YnRy
YWN0ZWQgMTUzNiBpbg0KPiBkb3VibGUgcHJlY2lzaW9uIG9wZXJhdGlvbnMgYW5kIGlzIGFk
ZGVkIDE1MzYgaW4gYW4gdW5kZXJmbG93IGV4Y2VwdGlvbiwNCj4gY3VycmVudGx5IHRoaXMg
YmVoYXZpb3IgaXMgbm90IFFFTVUncyBiZWhhdmlvciwgdGhpcyBwYXRjaCBzZXJpZXMgZml4
ZXMNCj4gdGhhdC4NCj4NCj4gQ3VycmVudGx5IHRoZXJlJ3Mgbm8gdGVzdCBpbiB0aGlzIHBh
dGNoIHNlcmllcyBhcyB0aGVyZSdzIG5vIHdheSB0bw0KPiBkaXNhYmxlIE1TUi5GRTAgYW5k
IE1TUi5GRTEgaW4gbGludXggdXNlciwgc28gYW55IG92ZXJmbG93L3VuZGVyZmxvdw0KPiBl
eGNlcHRpb24gd2l0aCBPRS9VRSBzZXQgY2F1c2VzIGEgdHJhcHBpbmcgZXhjZXB0aW9uLg0K
Pg0KPiBMdWNhcyBNYXRldXMgQ2FzdHJvIChhbHFvdGVsKSAoMik6DQo+ICAgIGZwdTogQWRk
IHJlYmlhcyBib29sLCB2YWx1ZSBhbmQgb3BlcmF0aW9uDQo+ICAgIHRhcmdldC9wcGM6IEJ1
Z2ZpeCBGUCB3aGVuIE9FL1VFIGFyZSBzZXQNCj4NCj4gICBmcHUvc29mdGZsb2F0LXBhcnRz
LmMuaW5jICAgICB8IDIxICsrKysrKysrKysrKysrKysrKystLQ0KPiAgIGZwdS9zb2Z0Zmxv
YXQuYyAgICAgICAgICAgICAgIHwgIDIgKysNCj4gICBpbmNsdWRlL2ZwdS9zb2Z0ZmxvYXQt
dHlwZXMuaCB8ICA0ICsrKysNCj4gICB0YXJnZXQvcHBjL2NwdS5jICAgICAgICAgICAgICB8
ICAyICsrDQo+ICAgdGFyZ2V0L3BwYy9mcHVfaGVscGVyLmMgICAgICAgfCAgMiAtLQ0KPiAg
IDUgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4N
Ci0tIA0KTHVjYXMgTWF0ZXVzIE0uIEFyYXVqbyBlIENhc3Rybw0KSW5zdGl0dXRvIGRlIFBl
c3F1aXNhcyBFTERPUkFETyANCjxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvP3V0bV9j
YW1wYWlnbj1hc3NpbmF0dXJhX2RlX2UtbWFpbCZ1dG1fbWVkaXVtPWVtYWlsJnV0bV9zb3Vy
Y2U9UkQrU3RhdGlvbj4NCkRlcGFydGFtZW50byBDb21wdXRhw6fDo28gRW1iYXJjYWRhDQpB
bmFsaXN0YSBkZSBTb2Z0d2FyZSBUcmFpbmVlDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIg
PGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=
--------------0LCMf4oE0FVmfky8KbHWv8MF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>It's missing from the title but this is a v2.</p>
    <p>v1 id:<br>
      Message-Id:
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:20220803122217.20=
847-1-lucas.araujo@eldorado.org.br">&lt;20220803122217.20847-1-lucas.arau=
jo@eldorado.org.br&gt;</a><br>
    </p>
    <div class=3D"moz-cite-prefix">On 05/08/2022 11:15, Lucas Mateus
      Castro(alqotel) wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20220805141522.412864-1-lucas.araujo@eldorado.org.br">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: "Lucas Mateus Castro (=
alqotel)" <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lucas.araujo@=
eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>

Changes in v2:
    - Completely reworked the solution:
        * Created re_bias in FloatFmt, it is 3/4 of the total exponent
          range of a FP type
        * Added rebias bools that dictates if the result should have
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

--------------0LCMf4oE0FVmfky8KbHWv8MF--

