Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F68582FA8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:29:09 +0200 (CEST)
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkqK-0002Eh-Bd
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oGkkZ-0007zd-AO; Wed, 27 Jul 2022 13:23:11 -0400
Received: from [200.168.210.66] (port=18806 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oGkkW-0006Ni-Rg; Wed, 27 Jul 2022 13:23:11 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 27 Jul 2022 14:23:02 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 0AFBC800058;
 Wed, 27 Jul 2022 14:23:02 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------09vZSQTe7uXpMqNqwjCnCXaN"
Message-ID: <9c00e4db-9948-ba7e-1ede-17d7a4edf8c7@eldorado.org.br>
Date: Wed, 27 Jul 2022 14:23:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/8] tests/docker: Fix alpine dockerfile
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
 <20220727163632.59806-2-lucas.araujo@eldorado.org.br>
 <YuFw35zxNXM0iGuk@redhat.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <YuFw35zxNXM0iGuk@redhat.com>
X-OriginalArrivalTime: 27 Jul 2022 17:23:02.0257 (UTC)
 FILETIME=[866D1610:01D8A1DD]
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
--------------09vZSQTe7uXpMqNqwjCnCXaN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAyNy8wNy8yMDIyIDE0OjA5LCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdyb3RlOg0KDQo+
IE9uIFdlZCwgSnVsIDI3LCAyMDIyIGF0IDAxOjM2OjI1UE0gLTAzMDAsIEx1Y2FzIE1hdGV1
cyBDYXN0cm8oYWxxb3RlbCkgd3JvdGU6DQo+PiBDdXJyZW50bHkgdGhlIHJ1biBzY3JpcHQg
dXNlcyAncmVhZGxpbmsgLWUnIGJ1dCB0aGUgaW1hZ2Ugb25seSBoYXMgdGhlDQo+PiBidXN5
Ym94IHJlYWRsaW5rLCB0aGlzIGNvbW1pdCBhZGQgdGhlIGNvcmV1dGlscyBwYWNrYWdlIHdo
aWNoDQo+PiBjb250YWlucyB0aGUgcmVhZGxpbmsgd2l0aCB0aGUgJy1lJyBvcHRpb24uDQo+
IFVzZSBvZiAncmVhZGxpbmsnIGlzIGRpc2NvdXJhZ2VkIGluIGZhdm91ciBvZiAncmVhbHBh
dGgnLiBBRkFJQ1QsIHdlDQo+IGNhbiBqdXN0IGRvIHRoYXQgY2hhbmdlIGFuZCBub3QgbmVl
ZCB0aGUgJy1lJyBmbGFnIGFueXdheS4NClNvIGEgcGF0Y2gganVzdCBjaGFuZ2luZw0KLUJB
U0U9IiQoZGlybmFtZSAkKHJlYWRsaW5rIC1lICQwKSkiDQorQkFTRT0iJChkaXJuYW1lICQo
cmVhbHBhdGggJDApKSINCg0KT2ssIEknbGwgc2VuZCBpdCB3aXRoIHYyLg0KDQo+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBMdWNhcyBNYXRldXMgQ2FzdHJvKGFscW90ZWwpPGx1Y2FzLmFyYXVq
b0BlbGRvcmFkby5vcmcuYnI+DQo+PiAtLS0NCj4+ICAgdGVzdHMvZG9ja2VyL2RvY2tlcmZp
bGVzL2FscGluZS5kb2NrZXIgfCAxICsNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2RvY2tlci9kb2NrZXJmaWxlcy9h
bHBpbmUuZG9ja2VyIGIvdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2FscGluZS5kb2NrZXIN
Cj4+IGluZGV4IDNmNGMwZjk1Y2IuLjI5NDNhOTk3MzAgMTAwNjQ0DQo+PiAtLS0gYS90ZXN0
cy9kb2NrZXIvZG9ja2VyZmlsZXMvYWxwaW5lLmRvY2tlcg0KPj4gKysrIGIvdGVzdHMvZG9j
a2VyL2RvY2tlcmZpbGVzL2FscGluZS5kb2NrZXINCj4+IEBAIC0yMSw2ICsyMSw3IEBAIFJV
TiBhcGsgdXBkYXRlICYmIFwNCj4+ICAgICAgICAgICBjZHJraXQgXA0KPj4gICAgICAgICAg
IGNlcGgtZGV2IFwNCj4+ICAgICAgICAgICBjbGFuZyBcDQo+PiArICAgICAgICBjb3JldXRp
bHMgXA0KPj4gICAgICAgICAgIGN0YWdzIFwNCj4+ICAgICAgICAgICBjdXJsLWRldiBcDQo+
PiAgICAgICAgICAgY3lydXMtc2FzbC1kZXYgXA0KPiBUaGlzIGZpbGUgY29udGVudHMgaXMg
YXV0b2dlbmVyYXRlZCwgc28gZWRpdHRpbmcgaXQgbWFudWFsbHkgaXMNCj4gd3JvbmcgYW5k
IGNoYW5nZXMgd2lsbCBiZSBsb3N0Lg0KDQpUcnVlLCB0aGF0IHdhcyBvbmUgb2YgdGhlIHJl
YXNvbnMgSSBoYWQgcHJvYmxlbXMgd2l0aCBwYXRjaCA4IChpdCANCmNoYW5nZXMgdGhlIGRv
Y2tlcmZpbGVzIGRpcmVjdGx5KSBidXQgZm9yZ290IHRoYXQgaXQnZCBhcHBseSBoZXJlIGFz
IHdlbGwuDQoNClRoYW5rcywNCi0tIA0KTHVjYXMgTWF0ZXVzIE0uIEFyYXVqbyBlIENhc3Ry
bw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETyANCjxodHRwczovL3d3dy5lbGRv
cmFkby5vcmcuYnIvP3V0bV9jYW1wYWlnbj1hc3NpbmF0dXJhX2RlX2UtbWFpbCZ1dG1fbWVk
aXVtPWVtYWlsJnV0bV9zb3VyY2U9UkQrU3RhdGlvbj4NCkRlcGFydGFtZW50byBDb21wdXRh
w6fDo28gRW1iYXJjYWRhDQpBbmFsaXN0YSBkZSBTb2Z0d2FyZSBUcmFpbmVlDQpBdmlzbyBM
ZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFp
bWVyLmh0bWw+DQo=
--------------09vZSQTe7uXpMqNqwjCnCXaN
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
    <div class=3D"moz-cite-prefix">On 27/07/2022 14:09, Daniel P. Berrang=
=C3=A9
      wrote:<br>
    </div>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:YuFw35zxNXM0iGuk@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
On Wed, Jul 27, 2022 at 01:36:25PM -0300, Lucas Mateus Castro(alqotel) wr=
ote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Currently the run script u=
ses 'readlink -e' but the image only has the
busybox readlink, this commit add the coreutils package which
contains the readlink with the '-e' option.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Use of 'readlink' is discouraged in favour of 'realpath'. AFAICT, we
can just do that change and not need the '-e' flag anyway.</pre>
    </blockquote>
    So a patch just changing<br>
    -BASE=3D"$(dirname $(readlink -e $0))"<br>
    +BASE=3D"$(dirname $(realpath $0))"<br>
    <p>Ok, I'll send it with v2.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:YuFw35zxNXM0iGuk@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Signed-off-by: Lucas Mateus Castro(alqotel) <a class=3D"moz-txt-link-rfc2=
396E" href=3D"mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldor=
ado.org.br&gt;</a>
---
 tests/docker/dockerfiles/alpine.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/docker=
files/alpine.docker
index 3f4c0f95cb..2943a99730 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -21,6 +21,7 @@ RUN apk update &amp;&amp; \
         cdrkit \
         ceph-dev \
         clang \
+        coreutils \
         ctags \
         curl-dev \
         cyrus-sasl-dev \
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
This file contents is autogenerated, so editting it manually is
wrong and changes will be lost.</pre>
    </blockquote>
    <p>True, that was one of the reasons I had problems with patch 8 (it
      changes the dockerfiles directly) but forgot that it'd apply here
      as well.
    </p>
    Thanks,<br>
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

--------------09vZSQTe7uXpMqNqwjCnCXaN--

