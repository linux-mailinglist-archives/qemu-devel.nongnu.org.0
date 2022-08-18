Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6274598893
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 18:20:06 +0200 (CEST)
Received: from localhost ([::1]:46932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOiFX-0005ri-Pv
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 12:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oOiA9-0000XI-OJ; Thu, 18 Aug 2022 12:14:29 -0400
Received: from [200.168.210.66] (port=2953 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oOiA7-0004eK-MD; Thu, 18 Aug 2022 12:14:29 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 18 Aug 2022 13:14:23 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 58B1D800131;
 Thu, 18 Aug 2022 13:14:23 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------JUrwKKy9k0k0oiRYJZpnvYQg"
Message-ID: <e301324f-819f-837f-edcf-c41929a89570@eldorado.org.br>
Date: Thu, 18 Aug 2022 13:14:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] tests/tcg/ppc64le: Added an overflow with OE=1 test
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Cc: danielhb413@gmail.com
References: <20220817165704.165291-1-lucas.araujo@eldorado.org.br>
 <b219c68d-76e2-dd95-7855-99a58b5e5e95@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <b219c68d-76e2-dd95-7855-99a58b5e5e95@linaro.org>
X-OriginalArrivalTime: 18 Aug 2022 16:14:23.0556 (UTC)
 FILETIME=[9493B040:01D8B31D]
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
--------------JUrwKKy9k0k0oiRYJZpnvYQg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAxOC8wOC8yMDIyIDEyOjMyLCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4gT24g
OC8xNy8yMiAwOTo1NywgTHVjYXMgTWF0ZXVzIENhc3RybyhhbHFvdGVsKSB3cm90ZToNCj4+
ICt2b2lkIHNpZ2ZwZV9oYW5kbGVyKGludCBzaWcsIHNpZ2luZm9fdCAqc2ksIHZvaWQgKnVj
b250ZXh0KQ0KPj4gK3sNCj4+ICvCoMKgwqAgdWludDY0X3QgdDsNCj4+ICvCoMKgwqAgdWlu
dDY0X3QgY2ggPSAweDVmY2ZmZmU0OTY1YTE3ZTB1bGw7DQo+PiArwqDCoMKgIGFzbSAoDQo+
PiArwqDCoMKgwqDCoMKgwqAgInN0ZmQgMiwgJTBcblx0Ig0KPj4gK8KgwqDCoMKgwqDCoMKg
IDogIj1tIih0KQ0KPj4gK8KgwqDCoMKgwqDCoMKgIDoNCj4+ICvCoMKgwqDCoMKgwqDCoCA6
ICJtZW1vcnkiLCAiZnIyIg0KPj4gK8KgwqDCoCApOw0KPg0KPiBObywgeW91IG5lZWQgdG8g
ZmV0Y2ggZjIgZnJvbSB1Y29udGV4dC7CoCBUaGVyZSdzIG5vIGd1YXJhbnRlZSBvZiBhbnkg
DQo+IHNwZWNpZmljIHZhbHVlcyBiZWluZw0KPiBwcmVzZW50IGluIHRoZSBzaWduYWwgaGFu
ZGxlciBvdGhlcndpc2UuDQpZZWFoLCBmb3Igc29tZSByZWFzb24gSSBjb21wbGV0ZWx5IGZv
cmdvdCBhYm91dCB0aGlzLCBteSBiYWQuIEknbGwgc2VuZCANCmEgc2Vjb25kIHZlcnNpb24g
Zml4aW5nIHRoaXMNCj4NCj4+ICvCoMKgwqAgcmV0dXJuIC0xOw0KPg0KPiBleGl0KC0xKSwg
d2hpY2ggcmV0dXJuIGZyb20gbWFpbiBlcXVhdGVzIHRvLCBoZWxwZnVsIG92ZXIgRVhJVF9G
QUlMVVJFLg0KPiBCdXQgaGVyZSBJJ2QgdGVuZCB0byBhYm9ydCgpLCBzaW5jZSBpdCByZWFs
bHkgc2hvdWxkbid0IGJlIHJlYWNoYWJsZS4NCkdvb2QgcG9pbnQsIEknbGwgY2hhbmdlIGlu
IHYyDQo+DQo+DQo+IHJ+DQotLSANCkx1Y2FzIE1hdGV1cyBNLiBBcmF1am8gZSBDYXN0cm8N
Ckluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8gDQo8aHR0cHM6Ly93d3cuZWxkb3Jh
ZG8ub3JnLmJyLz91dG1fY2FtcGFpZ249YXNzaW5hdHVyYV9kZV9lLW1haWwmdXRtX21lZGl1
bT1lbWFpbCZ1dG1fc291cmNlPVJEK1N0YXRpb24+DQpEZXBhcnRhbWVudG8gQ29tcHV0YcOn
w6NvIEVtYmFyY2FkYQ0KQW5hbGlzdGEgZGUgU29mdHdhcmUgVHJhaW5lZQ0KQXZpc28gTGVn
YWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1l
ci5odG1sPg0K
--------------JUrwKKy9k0k0oiRYJZpnvYQg
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
    <div class=3D"moz-cite-prefix">On 18/08/2022 12:32, Richard Henderson=

      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:b219c68d-76e2-dd95-7855-99a58b5e5e95@linaro.org">On
      8/17/22 09:57, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <blockquote type=3D"cite">+void sigfpe_handler(int sig, siginfo_t
        *si, void *ucontext)
        <br>
        +{
        <br>
        +=C2=A0=C2=A0=C2=A0 uint64_t t;
        <br>
        +=C2=A0=C2=A0=C2=A0 uint64_t ch =3D 0x5fcfffe4965a17e0ull;
        <br>
        +=C2=A0=C2=A0=C2=A0 asm (
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "stfd 2, %0\n\t"
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dm"(t)
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory", "fr2"
        <br>
        +=C2=A0=C2=A0=C2=A0 );
        <br>
      </blockquote>
      <br>
      No, you need to fetch f2 from ucontext.=C2=A0 There's no guarantee =
of
      any specific values being
      <br>
      present in the signal handler otherwise.
      <br>
    </blockquote>
    Yeah, for some reason I completely forgot about this, my bad. I'll
    send a second version fixing this<br>
    <blockquote type=3D"cite"
      cite=3D"mid:b219c68d-76e2-dd95-7855-99a58b5e5e95@linaro.org">
      <br>
      <blockquote type=3D"cite">+=C2=A0=C2=A0=C2=A0 return -1;
        <br>
      </blockquote>
      <br>
      exit(-1), which return from main equates to, helpful over
      EXIT_FAILURE.
      <br>
      But here I'd tend to abort(), since it really shouldn't be
      reachable.
      <br>
    </blockquote>
    Good point, I'll change in v2<br>
    <blockquote type=3D"cite"
      cite=3D"mid:b219c68d-76e2-dd95-7855-99a58b5e5e95@linaro.org">
      <br>
      <br>
      r~
      <br>
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

--------------JUrwKKy9k0k0oiRYJZpnvYQg--

